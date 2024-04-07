<?php

namespace App\Http\Controllers\admin;

use App\Helper\ImageManager;
use App\Http\Controllers\Controller;
use App\Jobs\SendEmailJob;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Str;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'user_name'  => 'required|exists:users,email',
                'password'  => 'required',
            );

            $validatorMesssages = array(
                'user_name.required'=>'Please Enter User Name.',
                'password.required'=>'Please Enter Password.',
            );

            $validator = Validator::make($request->all(), $rules, $validatorMesssages);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }
            //VALIDATION END

            $user = User::where('email', $request->user_name)->where('role', 'admin')->first();

            if(empty($user)) {
                return response()->json(['status' => 401,'error1' => ['user_name' => 'Email is Invalid.']]);
            }

            if(Auth::attempt(['email' => $request->user_name, 'password' => $request->password, 'role' => 'admin']))
            {
                $redirect = route('admin.dashboard');
                return response()->json(['status' => 1,'redirect' => $redirect]);
            }
            else{
                return response()->json(['status' => 401,'error1' => ['password' => 'Password Not valid']]);
            }
        }
        return view('admin.auth.login');
    }

    public function forgot_password(Request $request)
    {
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'email'  => 'required|exists:users,email',
            );

            $validatorMesssages = array(
                'email.required'=>'Please Enter Email.',
            );

            $validator = Validator::make($request->all(), $rules, $validatorMesssages);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }
            //VALIDATION END

            $token = Str::random(100);
            $user = User::where('email',$request->email)->first();
            $user->remember_token = $token;
            $user->save();

            $user->link = route('admin.reset_password').'/?'.$token;
            $user->mail_type = 'forgot_password';

            $details = $user->getAttributes();

            dispatch(new SendEmailJob($details));
            return response()->json(['status' => 1,'message' => 'Please Check Mail']);

        }
        return view('admin.auth.forgot_password');
    }

    public function reset_password(Request $request)
    {
        if($request->ajax())
        {
           //VALIDATION START
           $rules = array(
            'new_password'  => 'required',
            'conform_password'  => 'required|same:new_password',
            );

            $validatorMesssages = array(
                'new_password.required'=>'Please Enter New Password.',
                'conform_password.required'=>'Please Enter Conform Password.',
            );

            $validator = Validator::make($request->all(), $rules, $validatorMesssages);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }
            //VALIDATION END

            $token = explode('?', $request->url);
            // $token = explode('?', 'http://localhost:8080/parezelsus/public/reset_password?123132');

            if(count($token) > 1)
            {
                if(!empty($token[1]))
                {
                    $user = User::where('remember_token',$token[1])->first();
                    if(!empty($user))
                    {
                        $user->password = Hash::make($request->new_password);
                        $user->text_password = $request->new_password;
                        $user->remember_token = Null;
                        $user->save();

                        $redirect = route('admin.login');
                        return response()->json(['status' => 1,'redirect' => $redirect]);
                    }
                }
            }
            return response()->json(['status' => 401,'error1' => ['conform_password' => 'This link is Not Valid']]);
        }
        return view('admin.auth.reset_password');
    }

    public function profile(Request $request)
    {
        if($request->ajax())
        {
            $user = User::where('id',Auth::user()->id)->first();
            if($request->image)
            {
                $image = ImageManager::updateImage($user->image,$request->image,'profile/');
                $user->image = $image;
            }
            $user->name = $request->name;
            $user->email = $request->email;
            $user->mobile = $request->mobile;
            $user->save();

            $redirect = route('admin.profile');
            return response()->json(['status' => 1,'redirect' => $redirect]);

        }
        return view('admin.auth.profile');
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('admin.login');
    }
}
