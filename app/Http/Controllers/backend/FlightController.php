<?php

namespace App\Http\Controllers\backend;

use App\Models\Branch;
use App\Models\Flight;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class FlightController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Flight'];}
    public function index()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.flights.index', compact('data'));
    }
    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Flight::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['breadcrumb'] = $this->breadcrumb;
        $data['branches'] = Branch::where(['branch_type'=> 'Hub', 'status'=> 1])->select('id','title')->get();
        return view('backend.flights.create-or-edit',compact('data'));
    }
    
    public function store(Request $request)
    {
        $data = $request->all();
        Flight::create($data);
        return redirect()->route('flights.index')->with('alert',['messageType'=>'success','message'=>'Data Inserted Successfully!']);
    }

    public function update(Request $request,$id)
    {
        $data = $request->all();
        Flight::find($id)->update($data);
        return redirect()->route('flights.index')->with('alert',['messageType'=>'success','message'=>'Data Updated Successfully!']);
    }
    
 
    public function list(Request $request)
    {
        $select = 
        [
            'flights.id',
            'flights.hub_id',
            'branches.title as hub_name',
            'flights.flight_name',
            'flights.flight_code',
            'flights.status',
        ];
        $query = Flight::join('branches', 'branches.id', '=', 'flights.hub_id');
        if(!$request->has('order')) $query = $query->orderBy('id','desc');
        $query = $query->select($select);
        return DataTables::of($query)->make(true);
    }

}
