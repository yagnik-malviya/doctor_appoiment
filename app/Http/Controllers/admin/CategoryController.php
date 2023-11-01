<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class CategoryController extends Controller
{
    public function list(Request $request)
    {
        if($request->ajax())
        {
                $data = Category::orderBy('id','DESC')->select('*');
	                return DataTables::of($data)
	                ->addIndexColumn()

	                ->addColumn('action', function($row){
                        $btn = '<a href="'.route('admin.category.edit',['id'=>$row->id]).'"><button class="btn-sm btn-success">Edit</button></a>
                                <button onclick="Delete('.$row->id.')" class="btn-sm btn-danger">Delete</button>';
                        return $btn;
	                })

	                ->rawColumns(['action'])
	                ->make(true);
        }
        return view('admin.category.list');
    }

    public function add(Request $request)
    {
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'name'  => 'required',
            );

            $validatorMesssages = array(
                'name.required'=>'Please Enter Name.',
            );

            $validator = Validator::make($request->all(), $rules, $validatorMesssages);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }
            //VALIDATION END

            $form_data = new Category();
            $form_data->name = $request->name;
            $form_data->save();

            $redirect = route('admin.category.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }
        return view('admin.category.add');
    }

    public function edit(Request $request, $id)
    {
        if($request->ajax())
        {
            //VALIDATION START
            $rules = array(
                'name'  => 'required',
            );

            $validatorMesssages = array(
                'name.required'=>'Please Enter Name.',
            );

            $validator = Validator::make($request->all(), $rules, $validatorMesssages);

            if ($validator->fails()) {

                $error=json_decode($validator->errors());
                return response()->json(['status' => 401,'error1' => $error]);
            }
            //VALIDATION END

            $form_data = Category::where('id',$request->id)->first();
            $form_data->name = $request->name;
            $form_data->save();

            $redirect = route('admin.category.list');
			return response()->json(['status' => 1,'redirect' => $redirect]);
        }

        $data = Category::where('id',$id)->first();
        if(empty($data))
        {
            return redirect()->back();
        }

        return view('admin.category.edit')->with(['data' => $data]);
    }

    public function delete(Request $request, $id)
    {
        $form_data = Category::where('id',$id)->first();
        $form_data->destroy($id);
        return response()->json(['status' => 1]);
    }
}
