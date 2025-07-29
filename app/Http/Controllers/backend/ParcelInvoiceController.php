<?php

namespace App\Http\Controllers\backend;

use App\Models\ParcelInvoiceDetails;
use App\Models\Flight;
use App\Models\BasicInfo;
use App\Models\ParcelItem;
use App\Models\ParcelInvoice;
use App\Models\Country;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class ParcelInvoiceController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Parcel Invoices'];}
    public function index()
    {
      
        $data['currency_symbol'] = BasicInfo::first()->currency_symbol;
        $data['paymentMethods'] = $this->paymentMethods();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.parcel-invoices.index', compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = ParcelInvoice::find($id);
            $data['parcelInvoiceDetails'] = ParcelInvoiceDetails::leftJoin('parcel_items','parcel_items.id','parcel_invoice_details.item_id')
                                    ->where('parcel_invoice_id',$id)
                                    ->select([
                                        'parcel_invoice_details.id',
                                        'parcel_invoice_details.parcel_invoice_id',
                                        'parcel_invoice_details.item_id',
                                        'parcel_items.name as item_name',
                                        'parcel_invoice_details.quantity',
                                        'parcel_invoice_details.unit_price',
                                    ])
                                    ->get()
                                    ->toArray();
        }else{
            $data['title'] = 'Create';
        }
        $data['paymentMethods'] = $this->paymentMethods();
        $data['currency_symbol'] = BasicInfo::first()->currency_symbol;
        $data['breadcrumb'] = $this->breadcrumb;
        $data['counties'] = Country::where('status', '=', 1)->get();
        $data['flights'] = Flight::where('status', '=', 1)->get();
        return view('backend.parcel-invoices.create-or-edit',compact('data'));
    }

    public function invoice($id, $print=null)
    {
        $data['breadcrumb'] = $this->breadcrumb;
        $data['print'] = $print;

         $select = [
            'parcel_invoices.id',
            'parcel_invoices.created_branch_id',
            'parcel_invoices.current_branch_id',
            'parcel_invoices.agent_id',
            'parcel_invoices.invoice_no',
            'parcel_invoices.date',
            'parcel_invoices.total_price',
            'parcel_invoices.vat_tax',
            'parcel_invoices.discount_method',
            'parcel_invoices.discount_rate',
            'parcel_invoices.discount',
            'parcel_invoices.total_payable',
            'parcel_invoices.paid_amount',
            'parcel_invoices.reference_number',
            'parcel_invoices.note',
            'creator_branches.title as creator_branch_title',
            'current_branches.title as current_branch_title',

            'parcel_invoices.sender_name',
            'parcel_invoices.sender_phone',
            'parcel_invoices.sender_post_code',
            'parcel_invoices.sender_address',
            
            'parcel_invoices.receiver_name',
            'parcel_invoices.receiver_phone',
            'parcel_invoices.receiver_post_code',
            'parcel_invoices.receiver_address',
            'parcel_invoices.receiver_country_id',
            'countries.country_name',

            'parcel_invoices.created_by_id',
            'admins.name as creator_name',
            'parcel_invoices.updated_by_id',
            'parcel_invoices.is_packed',
            'parcel_invoices.payment_status',
            'parcel_invoices.parcel_status',
        ];
        $selectDetails = 
        [
            'parcel_invoice_details.id',
            'parcel_invoice_details.parcel_invoice_id',
            'parcel_invoice_details.item_id',
            'parcel_items.name as item_name',
            'parcel_invoice_details.quantity',
            'parcel_invoice_details.unit_price',
        ];

        $data['basicInfo'] = BasicInfo::first()->toArray();

        $data['master'] = ParcelInvoice::join('admins', 'admins.id', '=', 'parcel_invoices.created_by_id')
                        ->join('branches as creator_branches', 'creator_branches.id', '=', 'parcel_invoices.created_branch_id')
                        ->leftJoin('branches as current_branches', 'current_branches.id', '=', 'parcel_invoices.current_branch_id')
                        ->join('countries', 'countries.id', '=', 'parcel_invoices.receiver_country_id')
                        ->where('parcel_invoices.id',$id)
                        ->select($select)->first()->toArray();


        $data['details'] = ParcelInvoiceDetails::leftJoin('parcel_items','parcel_items.id','parcel_invoice_details.item_id')
                            ->where('parcel_invoice_details.parcel_invoice_id',$id)
                            ->select($selectDetails)
                            ->get()
                            ->toArray();
        return view('backend.parcel-invoices.invoice',compact('data'));
    }
    public function storeNewItem(Request $request)
    {
        $item = ParcelItem::where(['name'=> strtolower($request->name)])->first();
        if(!$item){
            $item = ParcelItem::create(['name'=> strtolower($request->name)]);
        }
        $item->name = ucwords($item->name);
        return response()->json($item);
    }
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {

            $data = $request->all();
            $data['created_branch_id'] = $this->getUserInfo()->branch_id;
            $data['current_branch_id'] = $this->getUserInfo()->branch_id;
            $data['agent_id'] = $this->getUserInfo()->id;
            $data['invoice_no'] = $this->formatNumber(ParcelInvoice::latest()->limit(1)->max('invoice_no') + 1);;
            $data['created_by_id'] = $this->getUserInfo()->branch_id;
            $data['payment_status'] = 'paid';
            $data['parcel_status'] = 'pending';

            // $item_id = $data['item_id'];
            // $quantity = $data['quantity'];
            // $unit_price = $data['unit_price'];
            unset($data['item_id']);
            unset($data['quantity']);
            unset($data['unit_price']);
            $parcelInvoice = ParcelInvoice::create($data);

            // for ($i = 0; $i < count($item_id); $i++) {
            //     $parcelInvoiceDetails['parcel_invoice_id'] = $parcelInvoice->id; 
            //     $parcelInvoiceDetails['item_id'] = $item_id[$i];         
            //     $parcelInvoiceDetails['quantity'] = $quantity[$i];         
            //     $parcelInvoiceDetails['unit_price'] = $unit_price[$i];
            //     ParcelInvoiceDetails::create($parcelInvoiceDetails);
            // }

            DB::commit();
            return redirect()->route('parcel-invoices.index')->with('alert', ['messageType' => 'success', 'message' => 'Data Inserted Successfully!']);
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert', ['messageType' => 'error', 'message' => 'Something went wrong! ' . $e->getMessage()]);
        }
    }
    public function update(Request $request,$id)
    {
        DB::beginTransaction();
        try {
            $data = $request->all();
            $data['updated_by_id'] = $this->getUserInfo()->branch_id;
            $item_id = $data['item_id'];
            $quantity = $data['quantity'];
            $unit_price = $data['unit_price'];
            unset($data['item_id']);
            unset($data['quantity']);
            unset($data['unit_price']);
            $parcelInvoice = ParcelInvoice::find($id);
            ParcelInvoiceDetails::where('parcel_invoice_id', $id)->delete();
            for ($i = 0; $i < count($item_id); $i++) {
                $parcelInvoiceDetails['parcel_invoice_id'] = $parcelInvoice->id; 
                $parcelInvoiceDetails['item_id'] = $item_id[$i];         
                $parcelInvoiceDetails['quantity'] = $quantity[$i];         
                $parcelInvoiceDetails['unit_price'] = $unit_price[$i];
                ParcelInvoiceDetails::create($parcelInvoiceDetails);
            }
            $parcelInvoice->update($data);
            DB::commit();
            return redirect()->route('parcel-invoices.index')->with('alert', ['messageType' => 'success', 'message' => 'Data Updated Successfully!']);
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert', ['messageType' => 'error', 'message' => 'Something went wrong! ' . $e->getMessage()]);
        }
    }

    public function items(Request $request)
    {
        $search = $request->search;
        $items = ParcelItem::where('name', 'like', "%{$search}%")
                    ->select('id', 'name')
                    ->limit(10)
                    ->get();
        $results = $items->map(function ($item) {
            return [
                'label' => ucwords($item->name),
                'value' => ucwords($item->name),
                'item_id' => $item->id,
            ];
        });
        return response()->json($results);
    }


    public function approve($id)
    {
        try {
            DB::beginTransaction();
            $parcelInvoice = ParcelInvoice::findOrFail($id);
            $parcelInvoice->update(['parcel_status'=> 'approve']);
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => 'Parcel invoice approved successfully.'
            ], 200);
            
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Error approving sale.',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }
    
    public function destroy($id)
    {
        ParcelInvoice::destroy($id);
        ParcelInvoiceDetails::where('parcel_invoice_id',$id)->delete();
        return response()->json(['success'=>true,'message'=>'Data Deleted Successfully!'], 200);
    }

    public function list(Request $request)
    {
        $select = [
            'parcel_invoices.id',
            'parcel_invoices.created_branch_id',
            'parcel_invoices.current_branch_id',
            'parcel_invoices.agent_id',
            'parcel_invoices.invoice_no',
            'parcel_invoices.date',
            'parcel_invoices.total_price',
            'parcel_invoices.vat_tax',
            'parcel_invoices.discount_method',
            'parcel_invoices.discount_rate',
            'parcel_invoices.discount',
            'parcel_invoices.total_payable',
            'parcel_invoices.paid_amount',
            'parcel_invoices.reference_number',
            'parcel_invoices.note',
            'creator_branches.title as creator_branch_title',
            'current_branches.title as current_branch_title',
            'parcel_invoices.created_by_id',
            'admins.name as creator_name',
            'parcel_invoices.updated_by_id',
            'parcel_invoices.is_packed',
            'parcel_invoices.payment_status',
            'parcel_invoices.parcel_status',
        ];
        $query = ParcelInvoice::join('admins', 'admins.id', '=', 'parcel_invoices.created_by_id')
            ->join('branches as creator_branches', 'creator_branches.id', '=', 'parcel_invoices.created_branch_id')
            ->leftJoin('branches as current_branches', 'current_branches.id', '=', 'parcel_invoices.current_branch_id')
            ->select($select);
        if (!$request->has('order')) {
            $query = $query->orderBy('parcel_invoices.id', 'desc');
        }

        return DataTables::of($query)
            ->with(['sale_summery' => $totalSummary ?? []])
            ->make(true);
    }


    
    
}