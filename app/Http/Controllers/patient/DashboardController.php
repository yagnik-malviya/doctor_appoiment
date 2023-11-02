<?php

namespace App\Http\Controllers\patient;

use App\Http\Controllers\Controller;
use App\Models\Appoiment;
use App\Models\Patient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $patient = Patient::where('user_id',Auth::user()->id)->first();
        $all = Appoiment::where('patient_id',$patient->id)->get()->count();
        $pending = Appoiment::where('patient_id',$patient->id)->where('status','pending')->get()->count();
        $approve = Appoiment::where('patient_id',$patient->id)->where('status','approve')->get()->count();
        $reject = Appoiment::where('patient_id',$patient->id)->where('status','reject')->get()->count();
        $data = array(
            'all' => $all,
            'pending' => $pending,
            'approve' => $approve,
            'reject' => $reject,
        );

        return view('patient.dashboard')->with($data);
    }
}
