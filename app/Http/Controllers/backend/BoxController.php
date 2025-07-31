<?php

namespace App\Http\Controllers\backend;

use App\Models\Box;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class BoxController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Box'];}
    public function index()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.boxes.index', compact('data'));
    }
    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Box::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.boxes.create-or-edit',compact('data'));
    }
    public function store(Request $request)
    {
        $data = $request->all();
        Box::create($data);
        return redirect()->route('boxes.index')->with('alert',['messageType'=>'success','message'=>'Data Inserted Successfully!']);
    }

    public function update(Request $request,$id)
    {
        $data = $request->all();
        Box::find($id)->update($data);
        return redirect()->route('boxes.index')->with('alert',['messageType'=>'success','message'=>'Data Updated Successfully!']);
    }
    
 
    public function list(Request $request)
    {
        $query = Box::query();
        if(!$request->has('order')) $query = $query->orderBy('id','desc');
        return DataTables::of($query)->make(true);
    }

}
