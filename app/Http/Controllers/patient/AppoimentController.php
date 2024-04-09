<?php

namespace App\Http\Controllers\patient;

use App\Http\Controllers\Controller;
use App\Jobs\SendEmailJob;
use App\Models\Appoiment;
use App\Models\Category;
use App\Models\Doctor;
use App\Models\Patient;
use App\Models\Slot;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class AppoimentController extends Controller
{

    protected $date = '';

    public function __construct()
    {
        date_default_timezone_set('Asia/Kolkata');
        $this->date = Carbon::now();
    }

    public function list(Request $request)
    {
        $patient = Patient::where('user_id', Auth::user()->id)->first();
        if($request->ajax())
        {
            $data = Appoiment::where('patient_id', $patient->id)->with('doctor', 'patient')->orderBy('id','DESC');

                return DataTables::of($data)
                ->addIndexColumn()

                ->editColumn('date', function ($row)
                {
                    return date("d-m-Y", strtotime($row->date_time));
                })

                ->editColumn('slot', function ($row) {
                    return $row->slot->slot ?? '-';
                })

                ->addColumn('status', function($row){
                    if($row->status == 'pending')
                    {
                        $btn = '<div style="background: blue; display: inline-block; padding: 0px 5px; font-size: 14px; color: white; font-weight: 600; border-radius: 5px;">'.$row->status.'</div>';
                    }

                    if($row->status == 'approve')
                    {
                        $btn = '<div style="background: green; display: inline-block; padding: 0px 5px; font-size: 14px; color: white; font-weight: 600; border-radius: 5px;">'.$row->status.'</div>';
                    }

                    if($row->status == 'reject')
                    {
                        $btn = '<div style="background: red; display: inline-block; padding: 0px 5px; font-size: 14px; color: white; font-weight: 600; border-radius: 5px;">'.$row->status.'</div>';
                    }

                    return $btn;
                })

                ->addColumn('action', function($row){
                    $btn = '<a href="'.route('patient.appoiment.edit',['id'=>$row->id]).'"><button class="btn-sm btn-success">Edit</button></a>
                            <button onclick="Delete('.$row->id. ')" class="btn-sm btn-danger">Delete</button>
                            <a href="' . route('patient.prescription.add', ['appoiment_id' => $row->id]) . '"><button class="btn-sm btn-primary">Prescription</button></a>';
                    return $btn;
                })

                ->rawColumns(['action', 'status'])
                ->make(true);
        }
        return view('patient.appoiment.list');
    }

    public function add(Request $request)
    {

        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'doctor'  => 'required',
                'date_time'  => 'required',
                'slot'  => 'required'
            );

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }

            // $startdateTime = Carbon::create($request->date_time);
            // $enddateTime = Carbon::create($request->date_time)->subMinutes(30);

            // $checkSlot = Appoiment::where('date_time', '<=', $startdateTime)->where('date_time', '>=', $enddateTime)->first();
            // if($checkSlot)
            // {
            //     return response()->json(['status' => 401, 'error1' => ['date_time' => 'This Slot Is Allready Book']]);
            // }
            //VALIDATION END


            $patient = Patient::where('user_id', Auth::user()->id)->first();
            $patient->doctor_id = $request->doctor;
            $patient->save();

            $slot_check = Appoiment::where('doctor_id', $request->doctor)
                ->whereDate('date_time', $request->date_time)
                ->where('slot_id', $request->slot)
                ->first();

            if ($slot_check) {
                return response()->json(['status' => 401, 'error1' => ['slot' => 'This slot is Booked']]);
            }

            $form_data = new Appoiment();
            $form_data->category_id  = $request->category;
            $form_data->patient_id  = $patient->id;
            $form_data->doctor_id   = $request->doctor;
            $form_data->date_time   = $request->date_time;
            $form_data->slot_id   = $request->slot;
            $form_data->status   = 'pending';
            $form_data->save();

            $form_data->name = $form_data->patient->user->name ?? '';
            $form_data->email = $form_data->patient->user->email ?? '';
            $form_data->mail_type = 'appoiment';
            $details = $form_data->getAttributes();
            dispatch(new SendEmailJob($details));


            $redirect = route('patient.appoiment.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $category = Category::get();
        $slot = Slot::get();
        return view('patient.appoiment.add')->with(['category'=>$category, 'slot' => $slot]);
    }

    public function edit(Request $request, $id)
    {
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'doctor'  => 'required',
                'date_time'  => 'required',
                'slot'  => 'required'
            );

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {

                $error = json_decode($validator->errors());
                return response()->json(['status' => 401, 'error1' => $error]);
            }

            $startdateTime = Carbon::create($request->date_time);
            $enddateTime = Carbon::create($request->date_time)->subMinutes(30);

            // $cheeckAppoiment = Appoiment::where('date_time', '=', $startdateTime)->first();
            // if(empty($cheeckAppoiment))
            // {
            //     $checkSlot = Appoiment::where('date_time', '<=', $startdateTime)->where('date_time', '>=', $enddateTime)->first();
            //     if ($checkSlot) {
            //         return response()->json(['status' => 401, 'error1' => ['date_time' => 'This Slot Is Allready Book']]);
            //     }
            // }

            //VALIDATION END

            $patient = Patient::where('user_id', Auth::user()->id)->first();
            $patient->doctor_id = $request->doctor;
            $patient->save();



            $slot_check = Appoiment::where('doctor_id', $request->doctor)
                ->whereDate('date_time', $request->date_time)
                ->where('slot_id', $request->slot)
                ->first();


            if ($slot_check) {
                if ($slot_check->slot_id != $request->slot || $slot_check->patient_id != $patient->id || $slot_check->doctor_id != $request->doctor || $slot_check->date_time != $request->date_time) {
                    return response()->json(['status' => 401, 'error1' => ['slot' => 'This slot is Booked']]);
                }
            }

            $form_data = Appoiment::where('id',$request->id)->first();
            $form_data->category_id  = $request->category;
            $form_data->patient_id  = $patient->id;
            $form_data->doctor_id   = $request->doctor;
            $form_data->date_time   = $request->date_time;
            $form_data->slot_id   = $request->slot;
            $form_data->status   = 'pending';
            $form_data->save();


            $form_data->name = $form_data->patient->user->name ?? '';
            $form_data->email = $form_data->patient->user->email ?? '';
            $form_data->mail_type = 'appoiment';
            $details = $form_data->getAttributes();
            dispatch(new SendEmailJob($details));

            $redirect = route('patient.appoiment.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $data = Appoiment::where('id',$id)->first();
        if(empty($data))
        {
            return redirect()->back();
        }

        $category = Category::get();
        $slot = Slot::get();
        return view('patient.appoiment.edit')->with(['data' => $data, 'category' => $category ,'slot' => $slot]);
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

    public function change_category(Request $request)
    {
        if ($request->ajax())
        {
            $data = [];
            $doctor = Doctor::get();
            foreach ($doctor as $key => $value) {
                if(in_array($request->category,json_decode($value->category_id)))
                {
                    $data[] = array(
                        'id' => $value->id,
                        'name' => $value->user->name,
                    );
                }
            }
            return response()->json(['status' => 1, 'data' => $data]);
        }
    }
}
