<?php

namespace App\Http\Controllers\doctor;

use App\Http\Controllers\Controller;
use App\Models\Appoiment;
use App\Models\Category;
use App\Models\Doctor;
use App\Models\Patient;
use App\Models\Prescription;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class PatientController extends Controller
{
    public function list(Request $request)
    {
        if($request->ajax())
        {
            $doctor = Doctor::where('user_id',Auth::user()->id)->first();
            $data = Patient::where('doctor_id', $doctor->id)->with('user', 'doctor')->orderBy('id','DESC');

                return DataTables::of($data)
                ->addIndexColumn()

                ->editColumn('name', function ($row)
                {
                    return $row->user->name ?? '-';
                })

                ->editColumn('mobile', function ($row)
                {
                    return $row->user->mobile ?? '-';
                })

                ->addColumn('action', function($row){
                    $btn = '<a href="'.route('doctor.patient.edit',['id'=>$row->id]).'"><button class="btn-sm btn-success">Edit</button></a>
                            <button onclick="Delete('.$row->id.')" class="btn-sm btn-danger">Delete</button>';
                    return $btn;
                })

                ->rawColumns(['action'])
                ->make(true);
        }
        return view('doctor.patient.list');
    }

    public function add(Request $request)
    {
        $doctor = Doctor::where('user_id', Auth::user()->id)->first();
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'name'  => 'required',
                'email'  => 'required',
                'mobile'  => 'required',
            );

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }

            // email validation
            $user = User::where(['email'=>$request->email,'role'=> 'patient'])->first();
            if($user)
            {
                return response()->json(['status' => 401, 'error1' => ['email' => 'This email is already register']]);
            }
            //VALIDATION END

            $password = str_pad(mt_rand(1,99999999), 8, '0', STR_PAD_LEFT);

            $user_data = new User();
            $user_data->name = $request->name;
            $user_data->email = $request->email;
            $user_data->mobile = $request->mobile;
            $user_data->password    =   Hash::make($password);
            $user_data->text_password   =   $password;
            $user_data->save();

            $form_data = new Patient();
            $form_data->user_id = $user_data->id;
            $form_data->doctor_id = $doctor->id;
            $form_data->save();

            $link = route('patient.login');
            $mailData = array(
                'link' => $link,
                'username' => $user_data->email,
                'password' => $user_data->text_password
            );

            try {
                $user_data['mail_name'] = env('MAIL_NAME');
                $user_data['mail_from'] = env('MAIL_FROM');
                $user_data['subject'] = 'Auth Details';

                Mail::send('admin.mail_template.sendauthdetail', ['data' => $mailData, 'message', $this], function ($message) use ($user_data) {
                    $message->from($user_data["mail_from"], $user_data["mail_name"])
                        ->to($user_data["email"])
                        ->subject($user_data["subject"]);
                });
            } catch (\Throwable $th) {
            }

            $redirect = route('doctor.patient.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }
        $category = Category::get();
        return view('doctor.patient.add')->with(['category' => $category]);
    }

    public function edit(Request $request, $id)
    {
        $doctor = Doctor::where('user_id', Auth::user()->id)->first();
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'name'  => 'required',
                'email'  => 'required',
                'mobile'  => 'required',
            );

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {

                $error = json_decode($validator->errors());
                return response()->json(['status' => 401, 'error1' => $error]);
            }
            //VALIDATION END

            $user_data = User::where('id',$request->user_id)->first();
            if($user_data->email != $request->email)
            {
                $user = User::where(['email' => $request->email, 'role' => 'patient'])->first();
                if ($user) {
                    return response()->json(['status' => 401, 'error1' => ['email' => 'This email is already register']]);
                }
            }

            $user_data->name = $request->name;
            $user_data->email = $request->email;
            $user_data->mobile = $request->mobile;
            $user_data->save();

            $form_data = Patient::where('id', $request->id)->first();
            $form_data->user_id = $user_data->id;
            $form_data->doctor_id = $doctor->id;
            $form_data->save();

            $redirect = route('doctor.patient.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $data = Patient::where('id',$id)->first();
        if(empty($data))
        {
            return redirect()->back();
        }

        return view('doctor.patient.edit')->with(['data' =>$data]);
    }

    public function delete(Request $request, $id)
    {
        $data = Patient::where('id',$id)->first();
        User::where('id',$data->user_id)->delete();

        Patient::where('id', $id)->delete();
        return response()->json(['status' => 1]);
    }
}
