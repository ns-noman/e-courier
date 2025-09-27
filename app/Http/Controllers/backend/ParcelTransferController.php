<?php

namespace App\Http\Controllers\backend;

use App\Models\ParcelTransfer;
use App\Models\ParcelTransferDetails;
use App\Models\ShipmentBox;
use App\Models\Branch;
use App\Models\ParcelInvoice;

use App\Models\ShipmentBoxItem;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\HtmlString;
use DB;
use Auth;

class ParcelTransferController extends Controller
{
    protected $breadcrumb;

    public function __construct()
    {
        $this->breadcrumb = ['title' => 'Parcel Transfer'];
    }

    // ========== Outgoing ==========
    public function indexOutgoing()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.parcel-transfers.index-outgoing', compact('data'));
    }
    public function indexIncoming()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.parcel-transfers.index-incoming', compact('data'));
    }

    public function createOrEdit($id=null)
    {
        if($id){
            $data['title'] = 'Edit';
            $data['item'] = ShipmentBox::find($id);
            $shipmentBoxParcelIds = $data['item'] ? $data['item']->shipmentBoxItems->pluck('invoice_id') : [];
            $data['parcel_invoice_ids'] = count($shipmentBoxParcelIds) ? $shipmentBoxParcelIds->toArray() : [];

        }else{
            $data['title'] = 'Create';
        }

        $data['shipment_boxes'] = ShipmentBox::where(['shipment_boxes.is_packed'=> 0, 'shipment_boxes.status'=> 'approved'])
                            ->select('shipment_boxes.id','shipment_boxes.shipment_no')
                            ->get();
        $data['branches'] = Branch::where('status', 1)->where('id', '!=', $this->getUserInfo()->branch_id)->select(['is_main_branch','code','title', 'id'])->get();
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.parcel-transfers.create-or-edit',compact('data'));
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $data = $request->all();

            // Auto-generate parcel transfer number
            $lastNo = ParcelTransfer::latest()->limit(1)->max('parcel_transfer_no');
            $nextNo = $lastNo ? (intval(str_replace('PT-', '', $lastNo)) + 1) : 1;
            $data['parcel_transfer_no'] = 'PT-' . str_pad($nextNo, 6, '0', STR_PAD_LEFT);

            // Branch & user info
            $data['from_branch_id'] = Auth::guard('admin')->user()->branch_id;
            $data['to_branch_id']   = $request->to_branch_id;
            $data['transfer_date']  = now()->toDateString();
            $data['status']         = 'pending';
            $data['created_by_id']  = Auth::guard('admin')->user()->id;

            // Create main transfer
            $parcelTransfer = ParcelTransfer::create($data);

            // Insert related items (multiple boxes)
            if ($request->has('selected_boxes')) {
                foreach ($request->selected_boxes as $box_id) {
                    ParcelTransferDetails::create([
                        'parcel_transfer_id' => $parcelTransfer->id,
                        'shipment_box_id'    => $box_id,
                        'note'               => $request->note ?? null,
                    ]);
                }
            }

            DB::commit();
            return redirect()->route('parcel-transfer-outgoing.index')
                ->with('alert', ['messageType' => 'success', 'message' => 'Parcel Transfer Created Successfully!']);

        } catch (\Exception $e) {
            DB::rollBack();

            dd($e->getMessage());
            return redirect()->back()->with('alert', [
                'messageType' => 'warning',
                'message' => 'Something went wrong! ' . $e->getMessage()
            ]);
        }
    }


    public function outgoingList(Request $request)
    {
        $branch_id = Auth::guard('admin')->user()->branch_id;
        $query = ParcelTransfer::with(['fromBranch', 'toBranch', 'creator', 'receiver'])
                    ->where('from_branch_id', $branch_id);
        if (!$request->has('order')) {
            $query = $query->orderBy('id', 'desc');
        }
        return DataTables::of($query)->make(true);
    }
    public function incomingList(Request $request)
    {
        $branch_id = Auth::guard('admin')->user()->branch_id;
        $query = ParcelTransfer::with(['parcelTransferDetails','fromBranch', 'toBranch', 'creator', 'receiver'])
                    ->where('to_branch_id', $branch_id);
        if (!$request->has('order')) {
            $query = $query->orderBy('id', 'desc');
        }
        return DataTables::of($query)
            ->addColumn('items', function ($query) {
                $html = $query->parcelTransferDetails
                    ->map(function ($item) {
                        if ($item->boxes) {
                            // $url = route('parcel-invoices.invoice', $item->invoice->id);
                            $url = 'javascript:void(0)';
                            return '<a href="' . $url . '" target="_blank"><b>#' . e($item->boxes->shipment_no) . '</b></a>';
                        }
                        return '';
                    })
                    ->implode(', ');
                return new HtmlString($html);
            })
            ->make(true);
    }

    // ========== Incoming ==========
    public function incoming()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        return view('backend.parcel-transfers.incoming', compact('data'));
    }



   public function approve($id)
    {
        DB::beginTransaction();
        try {
            $transfer = ParcelTransfer::findOrFail($id);
            $transfer->status = 'approved';
            $transfer->save();
            $to_branch_id = $transfer->to_branch_id;

            $parcelTransferDetails = ParcelTransferDetails::where('parcel_transfer_id', $id)->get();
            foreach ($parcelTransferDetails as $detail) {
                $box = ShipmentBox::find($detail->shipment_box_id);
                if (! $box) {
                    continue;
                }

                $shipmentBoxItems = ShipmentBoxItem::where('box_shipment_id', $box->id)->get();
                foreach ($shipmentBoxItems as $item) {
                    $invoice = ParcelInvoice::find($item->invoice_id);
                    if ($invoice) {
                        $invoice->to_branch_id = $to_branch_id;
                        $invoice->parcel_status = 'in_transit';
                        $invoice->save();
                    }
                }

                $box->update([
                    'to_branch_id' => $to_branch_id,
                    'is_packed'    => 1,
                    'status'       => 'in_transit'
                ]);
            }

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Parcel Transfer Approved Successfully!']);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['success' => false, 'message' => 'Approval failed: ' . $e->getMessage()], 500);
        }
    }
    
    public function receive($id)
    {
        DB::beginTransaction();
        try {
             $transfer = ParcelTransfer::findOrFail($id);
            $details = ParcelTransferDetails::where('parcel_transfer_id', $id)->get();
            foreach ($details as $detail) {
                $shipmentBoxes = ShipmentBox::where('id', $detail->shipment_box_id)->get();
                foreach ($shipmentBoxes as $box) {
                    $shipmentBoxesItems = ShipmentBoxItem::where('box_shipment_id', $box->id)->get();
                    foreach ($shipmentBoxesItems as $item) {
                        $invoice = ParcelInvoice::find($item->invoice_id);
                        if ($invoice) {
                            $invoice->current_branch_id = $transfer->to_branch_id;
                            $invoice->parcel_status = 'delivered';
                            $invoice->save();
                        }
                    }
                    $box->update([
                        'status' => 'delivered',
                        'current_branch_id' => $transfer->to_branch_id,
                    ]);
                }
            }

            $transfer->is_received = 1;
            $transfer->status = 'delivered';
            $transfer->received_by_id = Auth::guard('admin')->user()->id;
            $transfer->save();
            DB::commit();
            return response()->json(['success' => true, 'message' => 'Parcel Received Successfully!']);
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['success' => false, 'message' => 'Receive failed: ' . $th->getMessage()], 500);
        }
    }
    
    public function destroy($id)
    {
        try {
            // ParcelTransfer::destroy($id);
            return redirect()->back()->with('alert', [
                'messageType' => 'success',
                'message' => 'Parcel Transfer Deleted successfully!'
            ]);
        } catch (\Exception $e) {
            return redirect()->back()->with('alert', [
                'messageType' => 'warning',
                'message' => $e->getMessage()
            ]);
        }
    }
}
