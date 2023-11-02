<?php

namespace App\Http\Controllers\doctor;

use App\Http\Controllers\Controller;
use App\Models\Appoiment;
use App\Models\Doctor;
use App\Models\Patient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $doctor = Doctor::where('user_id', Auth::user()->id)->first();
        $patient = Patient::where('doctor_id', $doctor->id)->get()->count();
        $all = Appoiment::where('doctor_id', $doctor->id)->get()->count();
        $pending = Appoiment::where('doctor_id', $doctor->id)->where('status', 'pending')->get()->count();
        $approve = Appoiment::where('doctor_id', $doctor->id)->where('status', 'approve')->get()->count();
        $reject = Appoiment::where('doctor_id', $doctor->id)->where('status', 'reject')->get()->count();
        $data = array(
            'patient' => $patient,
            'all' => $all,
            'pending' => $pending,
            'approve' => $approve,
            'reject' => $reject,
        );
        return view('doctor.dashboard')->with($data);
    }

    public function test()
    {
        return view('doctor.test');
    }
}
