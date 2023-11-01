<?php

namespace App\Http\Controllers\doctor;

use App\Http\Controllers\Controller;
use App\Models\Appoiment;
use App\Models\Category;
use App\Models\Doctor;
use App\Models\Patient;
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
            $data = Appoiment::where('doctor_id', $doctor->id)->with('doctor', 'patient')->orderBy('date_time','ASC');

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
                    return date("d-m-Y - h:i A", strtotime($row->date_time));
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
                'date_time'  => 'required'
            );

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }

            //VALIDATION END

            $form_data = new Appoiment();
            $form_data->patient_id  = $request->patient;
            $form_data->doctor_id   = $doctor->id;
            $form_data->date_time   = $request->date_time;
            $form_data->status   = 'pending';
            $form_data->save();

            $redirect = route('doctor.appoiment.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $patient = Patient::where('doctor_id',$doctor->id)->get();
        return view('doctor.appoiment.add')->with(['patient' => $patient]);
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

            $form_data = Appoiment::where('id',$request->id)->first();
            $form_data->patient_id  = $request->patient;
            $form_data->doctor_id   = $doctor->id;
            $form_data->date_time   = $request->date_time;
            $form_data->status   = 'pending';
            $form_data->save();

            $redirect = route('doctor.appoiment.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $data = Appoiment::where('id',$id)->first();
        if(empty($data))
        {
            return redirect()->back();
        }

        $patient = Patient::where('doctor_id',$doctor->id)->get();
        return view('doctor.appoiment.edit')->with(['data' => $data, 'patient' => $patient]);
    }

    public function delete(Request $request, $id)
    {
        $appoiment = Appoiment::where('id',$id)->first();
        $appoiment->destroy($id);
        return response()->json(['status' => 1]);
    }

    public function changestatus(Request $request)
    {
        Appoiment::where('id',$request->id)->update(['status'=>$request->status]);
        return response()->json(['status' => 1]);
    }
}
