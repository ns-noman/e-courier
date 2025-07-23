<?php

namespace App\Http\Controllers\backend;

use App\Models\Admin;
use App\Models\Agent;
use App\Models\Branch;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class AgentController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Agents'];}
    public function index()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        $data['agents'] = Agent::with(['branch'])->where('is_default', 0)->orderBy('id', 'desc')->get();
        return view('backend.branches.agents.index', compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Agent::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['branches'] = Branch::get();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.branches.agents.create-or-edit',compact('data'));
    }
    

    public function store(Request $request)
    {
        DB::beginTransaction();

        try {
            $data = $request->all();

            $admin = Admin::where('email', $data['email'])->first();
            $agent = Agent::where('email', $data['email'])->first();

            if ($admin || $agent) {
                DB::rollBack();
                return redirect()->back()->with('alert', [
                    'messageType' => 'warning',
                    'message' => 'This email already exists!'
                ]);
            }

            // Add created_by_id
            $data['created_by_id'] = $this->getUserId();

            // Create Agent
            $agent = Agent::create($data);

            // Create Admin from Agent
            $adminData = [
                'agent_id' => $agent->id,
                'branch_id' => $agent->branch_id,
                'name' => $data['name'],
                'email' => $data['email'],
                'mobile' => $data['contact'],
                'password' => Hash::make('12345'), // default password
                'type' => 3,
                'status' => 0,
            ];

            Admin::create($adminData);

            DB::commit();

            return redirect()->route('agents.index')->with('alert', [
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
        $agent = Agent::find($id);
        $agent->update($data);
        $admin = Admin::where('agent_id', $id)->first();
        $adminData = 
        [
            'branch_id' => $agent->branch_id,
            'name' => $data['name'],
            'email' => $data['email'],
            'mobile' => $data['contact'],
        ];
        if($admin){
            $admin->update($adminData);
        }
        return redirect()->route('agents.index')->with('alert',['messageType'=>'success','message'=>'Data Updated Successfully!']);
    }
}