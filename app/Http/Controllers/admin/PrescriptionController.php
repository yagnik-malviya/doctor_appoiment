<?php

namespace App\Http\Controllers\admin;

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

        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'prescription'  => 'required',
            );

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }

            //VALIDATION END
            $form_data = Prescription::where(['id'=>$request->id])->first();
            if(empty($form_data))
            {
                $form_data = new Prescription();
            }
            $form_data->appoiment_id = $request->appoiment_id;
            $form_data->text = $request->prescription;
            $form_data->save();

            $redirect = route('admin.appoiment.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $prescription = Prescription::where('appoiment_id', $request->appoiment_id)->first();

        return view('admin.prescription.add')->with(['data' => $prescription, 'appoiment_id'=>$request->appoiment_id]);
    }
}
