<?php

namespace App\Http\Controllers\patient;

use App\Http\Controllers\Controller;
use App\Models\Patient;
use App\Models\Prescription;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class PrescriptionController extends Controller
{
    public function add(Request $request)
    {
        $prescription = Prescription::where('appoiment_id', $request->appoiment_id)->first();
        return view('patient.prescription.add')->with(['data' => $prescription, 'appoiment_id'=>$request->appoiment_id]);
    }
}
