<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Appoiment;
use App\Models\Category;
use App\Models\Doctor;
use App\Models\Patient;
use App\Models\Prescription;
use App\Models\User;
use Illuminate\Http\Request;
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
            $data = Patient::with('user', 'doctor')->orderBy('id','DESC');

                return DataTables::of($data)
                ->addIndexColumn()

                ->editColumn('doctor_name', function ($row)
                {
                    return $row->doctor->user->name ?? '-';
                })

                ->editColumn('name', function ($row)
                {
                    return $row->user->name ?? '-';
                })

                ->editColumn('mobile', function ($row)
                {
                    return $row->user->mobile ?? '-';
                })

                ->addColumn('action', function($row){
                    $btn = '<a href="'.route('admin.patient.edit',['id'=>$row->id]).'"><button class="btn-sm btn-success">Edit</button></a>
                            <button onclick="Delete('.$row->id.')" class="btn-sm btn-danger">Delete</button>';
                    return $btn;
                })

                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.patient.list');
    }

    public function add(Request $request)
    {
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'doctor'  => 'required',
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
            $form_data->doctor_id = $request->doctor;
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

            $redirect = route('admin.patient.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }
        $category = Category::get();
        $doctor = Doctor::get();
        return view('admin.patient.add')->with(['category' => $category, 'doctor' => $doctor]);
    }

    public function edit(Request $request, $id)
    {
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'doctor'  => 'required',
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
            $form_data->doctor_id = $request->doctor;
            $form_data->save();

            $redirect = route('admin.patient.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $data = Patient::where('id',$id)->first();
        $doctor = Doctor::get();
        if(empty($data))
        {
            return redirect()->back();
        }

        return view('admin.patient.edit')->with(['data' =>$data, 'doctor' => $doctor]);
    }

    public function delete(Request $request, $id)
    {
        $data = Patient::where('id',$id)->first();
        User::where('id',$data->user_id)->delete();

        Patient::where('id', $id)->delete();
        return response()->json(['status' => 1]);
    }
}
