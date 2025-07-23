<?php

namespace App\Http\Controllers\backend;

use App\Models\Branch;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Auth;

class BranchController extends Controller
{    
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Branches'];}
    public function index()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.branches.branches.index', compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Branch::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['breadcrumb'] = $this->breadcrumb;

        $data['branches'] = Branch::with('children.children.children.children')->where('parent_id',0)->orderBy('title','asc')->get()->toArray();

        // dd($data['branches']);


        return view('backend.branches.branches.create-or-edit',compact('data'));
    }
    
    public function store(Request $request)
    {
        $data = $request->all();
        $data['created_at'] = $this->getUserId();
        Branch::create($data);
        return redirect()->route('branches.index')->with('alert',['messageType'=>'success','message'=>'Data Inserted Successfully!']);
    }


    public function update(Request $request, $id)
    {
        $data = $request->all();
        $data['updated_at'] = $this->getUserId();
        $branch = Branch::find($id);
        $branch->update($data);
        return redirect()->route('branches.index')->with('alert',['messageType'=>'success','message'=>'Data Updated Successfully!']);
    }
    
    public function destroy($id)
    {
        try {
            $branch = Branch::findOrFail($id);
            $branch->delete();
            return redirect()->back()->with('alert', [
                'messageType' => 'success',
                'message' => 'Category deleted successfully!'
            ]);
        } catch (\Exception $e) {
            return redirect()->back()->with('alert', [
                'messageType' => 'warning',
                'message' => $e->getMessage()
            ]);
        }
    }

    public function allBranches(Request $request)
    {
       $select = [
            'branches.id', // always good to include ID
            'branches.parent_id',
            'branches.branch_type',
            'branches.title',
            'branches.code',
            'branches.commission_percentage',
            'branches.phone',
            'branches.address',
            'branches.is_main_branch',
            'branches.status',
            'branches.created_by_id',
            'branches.updated_by_id',
            'parent_branches.title as parent_title',
        ];

        $query = Branch::leftJoin('branches as parent_branches', 'parent_branches.id', '=', 'branches.parent_id')
            ->select($select);

        // Apply default order if not ordered by frontend
        if (!$request->has('order')) {
            $query->orderBy('branches.updated_at', 'desc');
        }

        return DataTables::of($query)->make(true);

    }


}
