<?php

namespace App\Http\Controllers\doctor;

use App\Http\Controllers\Controller;
use App\Jobs\SendEmailJob;
use App\Models\Appoiment;
use App\Models\Category;
use App\Models\Doctor;
use App\Models\Patient;
use App\Models\Slot;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class AppoimentController extends Controller
{
    public function list(Request $request)
    {
        $doctor = Doctor::where('user_id', Auth::user()->id)->first();
        if($request->ajax())
        {
            $data = Appoiment::where('doctor_id', $doctor->id)->with('doctor', 'patient')->orderBy('id','DESC');

                return DataTables::of($data)
                ->addIndexColumn()

                ->editColumn('patient_name', function ($row)
                {
                    return $row->patient->user->name ?? '-';
                })

                ->editColumn('patient_mobile', function ($row)
                {
                    return $row->patient->user->mobile ?? '-';
                })

                ->editColumn('date', function ($row)
                {
                    return date("d-m-Y", strtotime($row->date_time));
                })

                ->editColumn('slot', function ($row) {
                    return $row->slot->slot ?? '-';
                })

                ->addColumn('status', function($row){
                    $btn = '<select name="patient" class="form-control patient" data_id="'.$row->id .'" onchange="changestatus(this)">
                                <option value="pending" ' . ($row->status == 'pending' ? 'selected' : '') . '>Pending</option>
                                <option value="approve" ' . ($row->status == 'approve' ? 'selected' : '') . '>Approve</option>
                                <option value="reject" ' . ($row->status == 'reject' ? 'selected' : '') . '>Reject</option>
                            <select/>';
                    return $btn;
                })

                ->addColumn('action', function($row){
                    $btn = '<a href="'.route('doctor.appoiment.edit',['id'=>$row->id]).'"><button class="btn-sm btn-success">Edit</button></a>
                            <button onclick="Delete('.$row->id. ')" class="btn-sm btn-danger">Delete</button>
                            <a href="' . route('doctor.prescription.add', ['appoiment_id' => $row->id]) . '"><button class="btn-sm btn-primary">Prescription</button></a>';
                    return $btn;
                })

                ->rawColumns(['action', 'status'])
                ->make(true);
        }
        return view('doctor.appoiment.list');
    }

    public function add(Request $request)
    {
        $doctor = Doctor::where('user_id', Auth::user()->id)->first();
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'patient'  => 'required',
                'date_time'  => 'required',
                'slot'  => 'required'
            );

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }

            //VALIDATION END

            $slot_check = Appoiment::where('doctor_id', $doctor->id)
            ->whereDate('date_time', $request->date_time)
            ->where('slot_id', $request->slot)
            ->first();

            if ($slot_check) {
                return response()->json(['status' => 401, 'error1' => ['slot' => 'This slot is Booked']]);
            }

            $form_data = new Appoiment();
            $form_data->patient_id  = $request->patient;
            $form_data->doctor_id   = $doctor->id;
            $form_data->date_time   = $request->date_time;
            $form_data->slot_id   = $request->slot;
            $form_data->status   = 'pending';
            $form_data->save();

            $form_data->name = $form_data->patient->user->name ?? '';
            $form_data->email = $form_data->patient->user->email ?? '';
            $form_data->mail_type = 'appoiment';
            $details = $form_data->getAttributes();
            dispatch(new SendEmailJob($details));

            $redirect = route('doctor.appoiment.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $patient = Patient::where('doctor_id',$doctor->id)->get();
        $slot = Slot::get();
        return view('doctor.appoiment.add')->with(['patient' => $patient, 'slot' => $slot]);
    }

    public function edit(Request $request, $id)
    {
        $doctor = Doctor::where('user_id', Auth::user()->id)->first();
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'patient'  => 'required',
                'date_time'  => 'required'
            );

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {

                $error = json_decode($validator->errors());
                return response()->json(['status' => 401, 'error1' => $error]);
            }
            //VALIDATION END


            $slot_check = Appoiment::where('doctor_id', $doctor->id)
            ->whereDate('date_time', $request->date_time)
            ->where('slot_id', $request->slot)
            ->first();

            if ($slot_check->slot_id != $request->slot || $slot_check->patient_id != $request->patient || $slot_check->doctor_id != $doctor->id || $slot_check->date_time != $request->date_time) {
                if ($slot_check) {
                    return response()->json(['status' => 401, 'error1' => ['slot' => 'This slot is Booked']]);
                }
            }

            $form_data = Appoiment::where('id',$request->id)->first();
            $form_data->patient_id  = $request->patient;
            $form_data->doctor_id   = $doctor->id;
            $form_data->date_time   = $request->date_time;
            $form_data->slot_id   = $request->slot;
            $form_data->status   = 'pending';
            $form_data->save();

            $form_data->name = $form_data->patient->user->name ?? '';
            $form_data->email = $form_data->patient->user->email ?? '';
            $form_data->mail_type = 'appoiment';
            $details = $form_data->getAttributes();
            dispatch(new SendEmailJob($details));

            $redirect = route('doctor.appoiment.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $data = Appoiment::where('id',$id)->first();
        if(empty($data))
        {
            return redirect()->back();
        }

        $patient = Patient::where('doctor_id',$doctor->id)->get();
        $slot = Slot::get();
        return view('doctor.appoiment.edit')->with(['data' => $data, 'patient' => $patient, 'slot' => $slot]);
    }

    public function delete(Request $request, $id)
    {
        $appoiment = Appoiment::where('id',$id)->first();
        $appoiment->name =  $appoiment->patient->user->name ?? '';
        $appoiment->email =  $appoiment->patient->user->email ?? '';
        $appoiment->mail_type = 'appoiment_remove';
        $details =  $appoiment->getAttributes();
        dispatch(new SendEmailJob($details));

        $appoiment->destroy($id);
        return response()->json(['status' => 1]);
    }

    public function changestatus(Request $request)
    {
        Appoiment::where('id',$request->id)->update(['status'=>$request->status]);
        $appoiment = Appoiment::where('id', $request->id)->first();
        $appoiment->name =  $appoiment->patient->user->name ?? '';
        $appoiment->email =  $appoiment->patient->user->email ?? '';
        $appoiment->mail_type = 'appoiment_status';
        $details =  $appoiment->getAttributes();
        dispatch(new SendEmailJob($details));
        return response()->json(['status' => 1]);
    }
}
