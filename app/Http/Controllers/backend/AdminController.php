<?php

namespace App\Http\Controllers\backend;

use App\Models\Role;
use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\File;
use Auth;
use Hash;

class AdminController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Admins'];}
    public function index()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.admins.index', compact('data'));
    }
    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = Admin::find($id);
        }else{
            $data['title'] = 'Create';
        }
        $data['breadcrumb'] = $this->breadcrumb;
        $data['roles'] = Role::where('is_default','==', 0)->get();
        return view('backend.admins.create-edit',compact('data'));
    }
    public function store(Request $request)
    {
        $data = $request->all();
        $admin = Admin::where('email',$data['email'])->first();
        if($admin){
            return redirect()->back()->with('alert',['messageType'=>'danger','message'=>'This email is already exists!']);
        }
        $data['password'] = Hash::make($data['password']);
        $data['mobile'] = 'User';
        $data['mobile'] = '01839317038';
        Admin::create($data);
        return redirect()->route('admins.index')->with('alert',['messageType'=>'success','message'=>'User Inserted Successfully!']);
    }

    public function update(Request $request,$id)
    {
        $data = $request->all();

        $admin = Admin::find($id);
        
        if($data['password']){
            $data['password'] = Hash::make($data['password']);   
        }else{
            unset($data['password']);
        }
        unset($data['conpassword']);
    
        $admin->update($data);
        return redirect()->route('admins.index')->with('alert',['messageType'=>'success','message'=>'User Updated Successfully!']);
    }
    
    public function destroy($id)
    {
        $admin = Admin::find($id);
        $admin->update(['status'=>0]);
        return redirect()->back()->with('alert',['messageType'=>'success','message'=>'User Inactivated Successfully!']);
    }

    public function updateDetails(Request $request, $id=null)
    {
        if($request->isMethod('post'))
        {
            $data = $request->all();
            if(isset($data['image'])){
                $image = 'admin-'. time().'.'.$data['image']->getClientOriginalExtension();
                $data['image']->move(public_path('uploads/admin'), $image);
                $data['image'] = $image;
                if (Auth::guard('admin')->user()->image) {
                    $oldFile = public_path('uploads/admin/' . Auth::guard('admin')->user()->image);
                    if (!empty(Auth::guard('admin')->user()->image) && File::exists($oldFile)) {
                        File::delete($oldFile);
                    }
                }
            }
            Admin::find($id)->update($data);
            return redirect()->back()->with('alert',['messageType'=>'success','message'=>'Data Updated Successfully!']);
        }
        $data['adminType'] = Role::find(Auth::guard('admin')->user()->type)->role;
        $data['breadcrumb'] = ['title'=> 'Profile'];
        return view('backend.profile.profile',compact('data'));
    }
    public function updatePassword(Request $request, $id=null)
    {
        if($request->isMethod('post'))
        {
            $data = Admin::find($id)->update(['password'=>Hash::make($request->new_password)]);
            return response()->json(['is_updated'=> 1], 200);
        }
        $data['breadcrumb'] = ['title'=> 'Update Password'];
        return view('backend.update-password.update-password',compact('data'));
    }

    public function checkPassword(Request $request)
    {
        if(Hash::check($request->current_password, Auth::guard('admin')->user()->password)){
            $is_match = 1;
        }else{
            $is_match = 0;
        }
        return response()->json(['is_match'=> $is_match], 200);
    }

    public function login(Request $request){
        if (Auth::guard('admin')->check()) {
            return redirect()->route('dashboard.index');
        }
        if ($request->isMethod('post')) {
            
            $request->validate([
                'email' => 'required|email|max:255',
                'password' => 'required',
                // 'g-recaptcha-response' => 'required',
            ], [
                'email.email' => 'Please enter a valid email',
                'email.required' => 'Email is required',
                'password.required' => 'Password is required',
            ]);

            $credentials = $request->only('email', 'password');
            $credentials['status'] = 1;
            $remember = $request->filled('remember_me');
            if (Auth::guard('admin')->attempt($credentials, $remember)) {
                return redirect()->route('dashboard.index');
            } else {
                return redirect()->back()->withInput()->withErrors([
                    'email' => 'Invalid credentials or account not active.',
                ]);
            }
        }
        $admins = Admin::join('roles','roles.id','=','admins.type')->where('status',1)->select('admins.*','roles.role')->get();
        return view('backend.auth.login', compact('admins'));        
    }
    public function logout(Request $request){
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }

    
    public function allAdmins(Request $request)
    {
        $query = Admin::join('roles', 'roles.id', '=', 'admins.type')
                    ->where('roles.is_superadmin', 0)
                    ->select('admins.id', 'admins.name', 'roles.role', 'admins.mobile', 'admins.email', 'admins.status');
                    if(!$request->has('order')) $query = $query->orderBy('id','desc');
        return DataTables::of($query)->make(true);
    }

}
