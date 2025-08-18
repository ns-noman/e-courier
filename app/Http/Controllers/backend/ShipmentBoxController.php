<?php

namespace App\Http\Controllers\backend;

use App\Models\ShipmentBox;
use App\Models\Box;
use App\Models\ShipmentBoxItem;
use App\Models\BasicInfo;
use App\Models\ParcelInvoice;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\HtmlString;

class ShipmentBoxController extends Controller
{
    protected $breadcrumb;
    public function __construct(){$this->breadcrumb = ['title'=>'Shipment Boxes'];}
    public function index()
    {
      
        $data['currency_symbol'] = BasicInfo::first()->currency_symbol;
        $data['paymentMethods'] = $this->paymentMethods();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.shipment-boxes.index', compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = ShipmentBox::find($id);
            $data['parcel_invoice_ids'] = ShipmentBox::find($id)->shipmentBoxItems->pluck('invoice_id');
        }else{
            $data['title'] = 'Create';
        }
        $data['paymentMethods'] = $this->paymentMethods();
        $data['currency_symbol'] = BasicInfo::first()->currency_symbol;

        $data['parcel_invoices'] = ParcelInvoice::where(['parcel_invoices.is_packed'=> 0, 'parcel_invoices.parcel_status'=> 'approved'])
                            ->select('parcel_invoices.id','parcel_invoices.invoice_no', 'parcel_invoices.booking_date')
                            ->get();
        $data['boxes'] = Box::select('id','box_name', 'box_code')->get();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.shipment-boxes.create-or-edit',compact('data'));
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $data = $request->all();
            $data['shipment_no'] = $this->formatNumber(ShipmentBox::latest()->limit(1)->max('shipment_no') + 1);
            $selected_invoices = $data['selected_invoices'];
            $shipmentbox = ShipmentBox::create($data);
            for ($i = 0; $i < count($selected_invoices); $i++) {
                ShipmentBoxItem::create([
                    'box_shipment_id' => $shipmentbox->id,
                    'invoice_id' =>$selected_invoices[$i],
                ]);
            }
            DB::commit();
            return redirect()->route('shipment-boxes.index')->with('alert', ['messageType' => 'success', 'message' => 'Data Inserted Successfully!']);
        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert', ['messageType' => 'error', 'message' => 'Something went wrong! ' . $e->getMessage()]);
        }
    }
    public function update(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $shipmentBox = ShipmentBox::findOrFail($id);
            $data = $request->all();

            // Update shipment box fields
            $shipmentBox->update($data);

            // Update ShipmentBoxItems
            $selected_invoices = $data['selected_invoices'] ?? [];

            // Delete existing items
            $shipmentBox->shipmentBoxItems()->delete();

            // Re-insert new items
            foreach ($selected_invoices as $invoice_id) {
                ShipmentBoxItem::create([
                    'box_shipment_id' => $shipmentBox->id,
                    'invoice_id' => $invoice_id,
                ]);
            }

            DB::commit();

            return redirect()->route('shipment-boxes.index')
                ->with('alert', [
                    'messageType' => 'success', 
                    'message' => 'Data Updated Successfully!'
                ]);

        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->back()
                ->with('alert', [
                    'messageType' => 'error', 
                    'message' => 'Something went wrong! ' . $e->getMessage()
                ]);
        }
    }


    public function approve($id)
    {
        try {
            DB::beginTransaction();

            $shipmentBox = ShipmentBox::find($id);
            $shipmentBoxItems = ShipmentBoxItem::where('box_shipment_id', $id)->get();

            foreach ($shipmentBoxItems as $item) {
                ParcelInvoice::find($item->invoice_id)->update(['is_packed' => 1]);
            }

            $shipmentBox->status = 'approved';
            $shipmentBox->save();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'ShipmentBox approved successfully.'
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
        ShipmentBox::destroy($id);
        ShipmentBoxItem::where('box_shipment_id',$id)->delete();
        return response()->json(['success'=>true,'message'=>'Data Deleted Successfully!'], 200);
    }


    public function list(Request $request)
    {
        $query = ShipmentBox::with('shipmentBoxItems.invoice');

        // Apply default order if no custom order is provided
        if (!$request->has('order')) {
            $query->orderByDesc('shipment_boxes.id');
        }

        return DataTables::of($query)
            ->addColumn('invoice_numbers', function ($shipmentBox) {
                $html = $shipmentBox->shipmentBoxItems
                    ->map(function ($item) {
                        if ($item->invoice) {
                            $url = route('parcel-invoices.invoice', $item->invoice->id);
                            return '<a href="' . $url . '" target="_blank"><b>#' . e($item->invoice->invoice_no) . '</b></a>'; // do NOT escape here
                        }
                        return '';
                    })
                    ->implode(', ');

                return new HtmlString($html); // <- important
            })
            ->rawColumns(['invoice_numbers'])
            ->filterColumn('shipment_no', function ($q, $keyword) {
                $q->where('shipment_boxes.shipment_no', 'like', "%{$keyword}%");
            })
            ->rawColumns(['status'])
            ->make(true);
    }


    
    
}