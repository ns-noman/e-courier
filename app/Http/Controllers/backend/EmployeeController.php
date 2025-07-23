<?php

namespace App\Http\Controllers\backend;

use App\Models\Employee;
use App\Models\Department;
use App\Models\Designation;
use App\Models\Admin;
use App\Models\Branch;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class EmployeeController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Employees'];}
    public function index()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        $data['employees'] = Employee::with(['department', 'branch', 'designation'])->where('is_default', 0)->orderBy('id', 'desc')->get();
        return view('backend.employees.employees.index', compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Employee::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['departments'] = Department::get();
        $data['branches'] = Branch::get();
        $data['designations'] = Designation::get();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.employees.employees.create-or-edit',compact('data'));
    }
    

    public function store(Request $request)
    {
        DB::beginTransaction();

        try {
            $data = $request->all();

            // Check if email already exists in either Admin or Employee
            $admin = Admin::where('email', $data['email'])->first();
            $employee = Employee::where('email', $data['email'])->first();

            if ($admin || $employee) {
                DB::rollBack();
                return redirect()->back()->with('alert', [
                    'messageType' => 'warning',
                    'message' => 'This email already exists!'
                ]);
            }

            // Add created_by_id
            $data['created_by_id'] = $this->getUserId();

            // Create Employee
            $employee = Employee::create($data);

            // Create Admin from Employee
            $adminData = [
                'employee_id' => $employee->id,
                'branch_id' => $employee->branch_id,
                'name' => $data['name'],
                'email' => $data['email'],
                'mobile' => $data['contact'],
                'password' => Hash::make('12345'), // default password
                'type' => 3,
                'status' => 0,
            ];

            Admin::create($adminData);

            DB::commit();

            return redirect()->route('employees.index')->with('alert', [
                'messageType' => 'success',
                'message' => 'Data Inserted Successfully!'
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('alert', [
                'messageType' => 'danger',
                'message' => 'Something went wrong! ' . $e->getMessage()
            ]);
        }
    }

    
    public function update(Request $request, $id)
    {
        $data = $request->all();
        $employee = Employee::find($id);

        $employee->update($data);
        $admin = Admin::where('employee_id', $id)->first();
        $adminData = 
        [
            'branch_id' => $employee->branch_id,
            'name' => $data['name'],
            'email' => $data['email'],
            'mobile' => $data['contact'],
        ];
        if($admin){
            $admin->update($adminData);
        }

        return redirect()->route('employees.index')->with('alert',['messageType'=>'success','message'=>'Data Updated Successfully!']);
    }

    public function destroy($id)
    {
        // if(!Item::where('unit_id',$unit->id)->count())
        //     return redirect()->back()->with('alert',['messageType'=>'warning','message'=>'Data Deletion Failed!']);
        // Employee::destroy($id);
        return redirect()->back()->with('alert',['messageType'=>'success','message'=>'Data Deleted Successfully!']);
    }
}