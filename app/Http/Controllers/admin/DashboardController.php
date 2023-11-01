<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Appoiment;
use App\Models\Doctor;
use App\Models\Patient;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $doctor = Doctor::get()->count();
        $patient = Patient::get()->count();
        $all = Appoiment::get()->count();
        $pending = Appoiment::where('status', 'pending')->get()->count();
        $approve = Appoiment::where('status', 'approve')->get()->count();
        $reject = Appoiment::where('status', 'reject')->get()->count();
        $data = array(
            'doctor' => $doctor,
            'patient' => $patient,
            'all' => $all,
            'pending' => $pending,
            'approve' => $approve,
            'reject' => $reject,
        );

        return view('admin.dashboard')->with($data);
    }

    public function test()
    {
        return view('admin.test');
    }
}
