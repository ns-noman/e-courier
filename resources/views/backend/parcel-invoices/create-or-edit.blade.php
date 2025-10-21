@extends('layouts.admin.master')
@section('content')
    <style>
        table td,
        table th {
            padding: 3px !important;
            text-align: center;
            align-items: center;
        }

        input[type="number"] {
            text-align: right;
        }

        .item {
            text-align: left;
        }

        .form-group {
            padding: 2px;
            margin: 0px;
        }

        label {
            margin-bottom: 0px;
        }
    </style>
    <div class="content-wrapper">
        @include('layouts.admin.content-header')
        <section class="content">
            <div class="container-fluid">
                <form id="form-submit"
                    action="{{ isset($data['item']) ? route('parcel-invoices.update', $data['item']->id) : route('parcel-invoices.store') }}"
                    method="POST" enctype="multipart/form-data">
                    @csrf()
                    @if (isset($data['item']))
                        @method('put')
                    @endif
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Shipment Information</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                    <label>Reference</label>
                                                    <input value="{{ $data['item']->reference ?? '' }}" type="text" name="reference" class="form-control" placeholder="Reference">
                                                </div>

                                                <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                    <label>Pieces <span class="text-danger">*</span></label>
                                                    <input value="{{ $data['item']->pieces ?? '' }}" type="number" name="pieces" class="form-control" placeholder="Total Pieces" required>
                                                </div>

                                                <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                    <label>Product Value</label>
                                                    <input value="{{ $data['item']->product_value ?? '' }}" type="number" name="product_value" class="form-control" placeholder="Value in BDT">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                                    <label>Payment Mode <span class="text-danger">*</span></label>
                                                    <select name="payment_mode" class="form-control" required>
                                                        <option value="">Select Mode</option>
                                                        <option value="Prepaid" {{ isset($data['item']) && $data['item']->payment_mode == 'Prepaid' ? 'selected' : '' }}>Prepaid</option>
                                                        <option value="Collect" {{ isset($data['item']) && $data['item']->payment_mode == 'Collect' ? 'selected' : '' }}>Collect</option>
                                                    </select>
                                                </div>

                                                <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                                    <label>Item Type <span class="text-danger">*</span></label>
                                                    <select name="item_type" class="form-control" required>
                                                        <option value="">Select Type</option>
                                                        <option value="SPX" {{ isset($data['item']) && $data['item']->item_type == 'SPX' ? 'selected' : '' }}>SPX</option>
                                                        <option value="DOCS" {{ isset($data['item']) && $data['item']->item_type == 'DOCS' ? 'selected' : '' }}>DOCS</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col-sm-12 col-md-12 col-lg-12 mt-3">
                                                    <div class="table-responsive">
                                                        <table id="table-item"
                                                            class="table table-striped table-bordered table-centre p-0 m-0">
                                                            <thead>
                                                                <tr>
                                                                    <th width="5%">SN</th>
                                                                    <th width="30%">
                                                                        <div class="d-flex justify-content-center align-items-center gap-1">
                                                                            Item Name: 
                                                                            <input type="text" class="form-control form-control-sm" id="item_name_input" placeholder="Item Name">
                                                                            <input type="hidden" id="item_name_temp">
                                                                            <input type="hidden" id="item_id_temp">
                                                                        </div>
                                                                    </th>
                                                                    <th width="10%">Quantity</th>
                                                                    <th width="10%">Unit Price</th>
                                                                    <th width="10%">Sub Total</th>
                                                                    <th width="5%">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="tbody">
                                                                @if(isset($data['parcelInvoiceDetails']))
                                                                    @foreach ($data['parcelInvoiceDetails'] as $pid)
                                                                        <tr>
                                                                            <td class="serial">{{ $loop->iteration }}</td>
                                                                            <td class="text-left">
                                                                            {{ ucwords($pid['item_name']) }}
                                                                                <input type="hidden" value="{{  $pid['item_id'] }}" name="item_id[]">
                                                                            </td>
                                                                            <td><input type="number" value="{{ $pid['quantity'] }}"
                                                                                    class="form-control form-control-sm calculate"
                                                                                    name="quantity[]" placeholder="0.00" required>
                                                                            </td>
                                                                            <td><input type="number" value="{{ $pid['unit_price'] }}"
                                                                                    class="form-control form-control-sm calculate"
                                                                                    name="unit_price[]" placeholder="0.00" required>
                                                                            </td>
                                                                            <td><input type="number"
                                                                                    value="{{ $pid['unit_price'] * $pid['quantity'] }}"
                                                                                    class="form-control form-control-sm"
                                                                                    name="sub_total[]" placeholder="0.00" disabled>
                                                                            </td>
                                                                            <td><button class="btn btn-sm btn-danger btn-del"
                                                                                    type="button"><i
                                                                                        class="fa-solid fa-trash btn-del"></i></button>
                                                                            </td>
                                                                        </tr>
                                                                    @endforeach
                                                                @else
                                                                    <tr id="no_item_row_item" class="bg-dark">
                                                                        <td colspan="6"><b>No items added yet...</b></td>
                                                                    </tr>
                                                                @endif
                                                            </tbody>
                                                            <footer>
                                                                <tr>
                                                                    <th colspan="4" class="text-left">Total Price</th>
                                                                    <th><input type="number" id="total_price" name="total_price" class="form-control form-control-sm" value="{{ isset($data['item']) ? $data['item']->total_price : '0.00' }}" placeholder="0.00" readonly></th>
                                                                    <th></th>
                                                                </tr>
                                                            </footer>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-sm-9 col-md-9 col-lg-8">
                                                    <div class="row">
                                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                            <label>Length (cm) <span class="text-danger">*</span></label>
                                                            <input value="{{ $data['item']->length ?? '' }}" type="number" min="1" step="1" name="length" id="length" class="form-control" placeholder="Length in cm" required>
                                                        </div>

                                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                            <label>Height (cm) <span class="text-danger">*</span></label>
                                                            <input value="{{ $data['item']->height ?? '' }}" type="number" min="1" step="1" name="height" id="height" class="form-control" placeholder="Height in cm" required>
                                                        </div>

                                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                            <label>Width (cm) <span class="text-danger">*</span></label>
                                                            <input value="{{ $data['item']->width ?? '' }}" type="number" min="1" step="1" name="width"  id="width" class="form-control" placeholder="Width in cm" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-3 col-md-3 col-lg-4">
                                                    <label>Gross Volume Weight (kg)</label>
                                                    <input value="{{ $data['item']->gross_volume_weight ?? '' }}" type="number" step="0.01" name="gross_volume_weight" id="gross_volume_weight" class="form-control" placeholder="Weight in kg" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                    <label>Physical Weight (kg) <span class="text-danger">*</span></label>
                                                    <input value="{{ $data['item']->physical_weight_kg ?? '' }}" type="number" min="0" step="1" id="physical_weight_kg" class="form-control" placeholder="Kg" required>
                                                </div>
                                                <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                    <label>Physical Weight (gm) <span class="text-danger">*</span></label>
                                                    <input value="{{ $data['item']->physical_weight_gm ?? '' }}" type="number" min="0" max="999" step="1" id="physical_weight_gm" class="form-control" placeholder="Gm" required>
                                                </div>
                                                <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                    <label>Gross Physical Weight (kg)</label>
                                                    <input value="{{ $data['item']->gross_physical_weight ?? '' }}" type="number" step="0.01" name="gross_physical_weight" id="gross_physical_weight" class="form-control" placeholder="Gross Weight in Kg" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                    <label>Billing Weight (kg)</label>
                                                    <input value="{{ $data['item']->billing_weight_kg ?? '' }}" type="number" id="billing_weight_kg" class="form-control" placeholder="Kg" readonly>
                                                </div>
                                                <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                    <label>Billing Weight (gm)</label>
                                                    <input value="{{ $data['item']->billing_weight_gm ?? '' }}" type="number" id="billing_weight_gm" class="form-control" placeholder="Gm" readonly>
                                                </div>
                                                <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                                    <label>Gross Billing Weight (kg)</label>
                                                    <input value="{{ $data['item']->gross_billing_weight ?? '' }}" type="number" step="0.01" name="gross_billing_weight" id="gross_billing_weight" class="form-control" placeholder="Gross Weight in Kg" required readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col-sm-12 col-md-12 col-lg-12 mt-3">
                                                    <div class="table-responsive">
                                                        <table id="table-box" class="table table-striped table-bordered table-centre p-0 m-0">
                                                            <thead>
                                                                <tr>
                                                                    <th width="5%">SN</th>
                                                                    <th width="30%">
                                                                        <div class="d-flex justify-content-center align-items-center gap-1">
                                                                            <label>Box:&nbsp;</label>
                                                                            <select class="form-control form-control-sm select2" id="box_id" name="box_id" required>
                                                                                <option value="" selected>Select Box</option>
                                                                                @foreach($data['boxes'] as $key => $box)
                                                                                    <option value="{{ $box->id }}" 
                                                                                        data-total_weight="{{ $box->total_weight }}"
                                                                                        @if(isset($data['item']) && $box->id == $data['item']->box_id) selected
                                                                                        @endif>
                                                                                        {{ $box->box_name }} : {{ round($box->length_cm) }}×{{ round($box->width_cm) }}×{{ round($box->height_cm) }} cm, {{ $box->total_weight }} kg
                                                                                    </option>
                                                                                @endforeach
                                                                            </select>
                                                                        </div>
                                                                    </th>
                                                                    <th width="30%">Box Weight (kg)</th>
                                                                    <th width="10%">Box Dimension (cm)</th>
                                                                    <th width="5%">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="tbody-box">
                                                                @if(isset($data['parcelBoxes']) && count($data['parcelBoxes']) > 0)
                                                                    @foreach ($data['parcelBoxes'] as $index => $box)
                                                                        <tr>
                                                                            <td class="serial">{{ $loop->iteration }}</td>
                                                                            <td>
                                                                                {{ $box->box_name }} 
                                                                                <input type="hidden" name="box_id[]" value="{{ $box->id }}">
                                                                            </td>
                                                                            <td>
                                                                                <input type="number" 
                                                                                    name="box_weight[]" 
                                                                                    value="{{ $box->gross_physical_weight_kg ?? 0 }}" 
                                                                                    step="0.001" 
                                                                                    class="form-control form-control-sm text-center" 
                                                                                    placeholder="0.000" 
                                                                                    required>
                                                                            </td>
                                                                            <td class="text-center">
                                                                                {{ round($box->length_cm, 1) }} × {{ round($box->width_cm, 1) }} × {{ round($box->height_cm, 1) }} cm
                                                                                <input type="hidden" name="length_cm[]" value="{{ $box->length_cm }}">
                                                                                <input type="hidden" name="width_cm[]" value="{{ $box->width_cm }}">
                                                                                <input type="hidden" name="height_cm[]" value="{{ $box->height_cm }}">
                                                                            </td>
                                                                            <td class="text-center">
                                                                                <button type="button" class="btn btn-sm btn-danger btn-del">
                                                                                    <i class="fa-solid fa-trash"></i>
                                                                                </button>
                                                                            </td>
                                                                        </tr>
                                                                    @endforeach
                                                                @else
                                                                    <tr id="no_item_row_box" class="bg-secondary text-center">
                                                                        <td colspan="5"><b>No box added yet...</b></td>
                                                                    </tr>
                                                                @endif
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Shipper & Consignee Information</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-center">
                                            <h5>Shipper Information</h5>
                                        </div>
                                    </div>
                                    <hr style="height: 2px; border: none; background-color: #ccc; border-radius: 3px; margin: 5px 0;">
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Name <span class="text-danger">*</span></label>
                                            <input value="{{ isset($data['item']) ? $data['item']->sender_name : null }}"
                                                type="text" class="form-control" name="sender_name"
                                                placeholder="Name" required>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Company <span class="text-danger">*</span></label>
                                            <input value="{{ isset($data['item']) ? $data['item']->sender_company : null }}"
                                                type="text" class="form-control" name="sender_company"
                                                placeholder="Company" required>
                                        </div>
                                        <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                            <label>Address</label>
                                            <textarea class="form-control" name="sender_address" placeholder="Address" cols="30" rows="1">{{ isset($data['item']) ? $data['item']->sender_address : null }}</textarea>
                                        </div>
                                         <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>City</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->sender_city : null }}"
                                                type="text" class="form-control" name="sender_city"
                                                placeholder="City">
                                        </div>
                                         <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Zip Code</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->sender_zip ?? $data['item']->sender_zip : null }}"
                                                type="number" class="form-control" name="sender_zip"
                                                placeholder="3850">
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Country</label>
                                            <select class="form-control select2" id="sender_country_id" name="sender_country_id">
                                                <option value="">Select Country</option>
                                                @foreach ($data['counties'] as $key => $country)
                                                    <option value="{{ $country->id }}"
                                                        {{ isset($data['item']) ? ($data['item']->sender_country_id == $country->id ? 'selected' : null) : ($country->id == 18 ? 'selected' : null) }}>
                                                        {{ $country->country_name }} ({{ $country->country_code }})
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Phone</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->sender_phone : null }}"
                                                type="number" class="form-control" name="sender_phone"
                                                placeholder="+8801XXXXXXXXX">
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Email <span class="text-danger">*</span></label>
                                            <input value="{{ isset($data['item']) ? $data['item']->sender_email : null }}"
                                                type="email" class="form-control" name="sender_email"
                                                placeholder="example@gmail.com" required>
                                        </div>
                                    </div>

                                    <hr style="height: 3px; border: none; background-color: #ccc; border-radius: 3px; margin: 20px 0;">

                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-center">
                                            <h5>Consignee Information</h5>
                                        </div>
                                    </div>
                                    <hr style="height: 2px; border: none; background-color: #ccc; border-radius: 3px; margin: 5px 0;">
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Name <span class="text-danger">*</span></label>
                                            <input value="{{ isset($data['item']) ? $data['item']->receiver_name : null }}"
                                                type="text" class="form-control" name="receiver_name"
                                                placeholder="Name" required>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Company <span class="text-danger">*</span></label>
                                            <input value="{{ isset($data['item']) ? $data['item']->receiver_company : null }}"
                                                type="text" class="form-control" name="receiver_company"
                                                placeholder="Company" required>
                                        </div>
                                        <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                            <label>Address</label>
                                            <textarea class="form-control" name="receiver_address" placeholder="Address" cols="30" rows="1">{{ isset($data['item']) ? $data['item']->receiver_address : null }}</textarea>
                                        </div>
                                         <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>City <span class="text-danger">*</span></label>
                                            <input value="{{ isset($data['item']) ? $data['item']->receiver_city : null }}"
                                                type="text" class="form-control" name="receiver_city"
                                                placeholder="City" required>
                                        </div>
                                         <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Zip Code <span class="text-danger">*</span></label>
                                            <input value="{{ isset($data['item']) ? $data['item']->receiver_zip ?? $data['item']->receiver_zip : null }}"
                                                type="number" class="form-control" name="receiver_zip"
                                                placeholder="3850" required>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Country <span class="text-danger">*</span></label>
                                            <select class="form-control select2" id="receiver_country_id" name="receiver_country_id" required>
                                                <option value="">Select Country</option>
                                                @foreach ($data['counties'] as $key => $country)
                                                    <option value="{{ $country->id }}"
                                                        {{ isset($data['item']) ? ($data['item']->receiver_country_id == $country->id ? 'selected' : null) : null }}>
                                                        {{ $country->country_name }} ({{ $country->country_code }})
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Phone <span class="text-danger">*</span></label>
                                            <input value="{{ isset($data['item']) ? $data['item']->receiver_phone : null }}"
                                                type="number" class="form-control" name="receiver_phone"
                                                placeholder="+8801XXXXXXXXX" required>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Email <span class="text-danger">*</span></label>
                                            <input value="{{ isset($data['item']) ? $data['item']->receiver_email : null }}"
                                                type="email" class="form-control" name="receiver_email"
                                                placeholder="example@gmail.com" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Other Information</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Picked Up By <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" name="picked_up_by"
                                                value="{{ isset($data['item']) ? $data['item']->picked_up_by : '' }}"
                                                placeholder="Picked Up By" required>
                                        </div>

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Picked Up Date & Time <span class="text-danger">*</span></label>
                                            <input type="datetime-local" class="form-control" name="picked_up_date_time"
                                                value="{{ isset($data['item']) ? \Carbon\Carbon::parse($data['item']->picked_up_date_time)->format('Y-m-d\TH:i') : '' }}"
                                                required>
                                        </div>
                                        
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Export Date <span class="text-danger">*</span></label>
                                            <input name="export_date" id="export_date" type="date"
                                                value="{{ isset($data['item']) ? $data['item']->export_date : date('Y-m-d') }}"
                                                class="form-control" required>
                                        </div>

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>MAWB No</label>
                                            <input type="text" class="form-control" name="mawb_no"
                                                value="{{ isset($data['item']) ? $data['item']->mawb_no : '' }}"
                                                placeholder="Master Air Waybill Number">
                                        </div>

                                        <div class="form-group col-sm-8 col-md-8 col-lg-8">
                                            <label>Remarks</label>
                                            <textarea class="form-control" name="remarks" placeholder="Enter any remarks"
                                                rows="1">{{ isset($data['item']) ? $data['item']->remarks : '' }}</textarea>
                                        </div>

                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </section>
    </div>
@endsection
@section('script')
<script>
    $(document).ready(function() {
        $('#length, #height, #width, #billing_weight_kg, #billing_weight_gm, #physical_weight_kg, #physical_weight_gm').on('input', ()=>{
            const length = parseInt($('#length').val()) | 0;
            const height = parseInt($('#height').val()) | 0;
            const width = parseInt($('#width').val()) | 0;
            let gross_volume_weight = (length * height * width) / 5000;
            $('#gross_volume_weight').val(gross_volume_weight); 
            
            const physical_weight_kg = parseInt($("#physical_weight_kg").val()) | 0;
            const physical_weight_gm = parseInt($("#physical_weight_gm").val()) | 0;
            let gross_physical_weight = parseInt(physical_weight_kg) + (parseInt(physical_weight_gm)/1000);
            
            $('#gross_physical_weight').val(gross_physical_weight); 

            if(gross_volume_weight || gross_physical_weight){
                let gross_billing_weight = parseFloat(gross_volume_weight) > parseFloat(gross_physical_weight) ? gross_volume_weight : gross_physical_weight;
                let billing_weight_kg = parseInt(gross_billing_weight);
                let billing_weight_gm = parseInt((gross_billing_weight - billing_weight_kg) * 1000);
                $('#billing_weight_kg').val(billing_weight_kg);
                $('#billing_weight_gm').val(billing_weight_gm);
                $('#gross_billing_weight').val(gross_billing_weight);
            }
        });
        $("#box_id").on("change", function (e) {
            e.preventDefault();
            let box_id = $("#box_id").val();
            if (box_id) {
                generateBoxRow();
                $("#box_id").val('').trigger('change');
                let no_item_row_box = $("#no_item_row_box");
                if (no_item_row_box) {
                    no_item_row_box.remove();
                }
            }
        });

       
    });

    $('#tbody').bind('click', function(e) {
        $(e.target).is('.btn-del') && e.target.closest('tr').remove();
        $(".serial").each(function(index) {
            $(this).html(index + 1);
        });
        calculate();
    });


    function generateBoxRow() {
        let box_id = $('#box_id').val();
        let box_text = $('#box_id option:selected').text();
        let box_weight = $('#box_id option:selected').attr('data-total_weight')  || 0;
        let tbody = '';
        tbody += `<tr>
                    <td class="serial"></td>

                    <!-- Box name -->
                    <td>
                        ${box_text}
                        <input type="hidden" name="box_id[]" value="${box_id}">
                    </td>

                    <!-- Box weight -->
                    <td>
                        <input type="number" name="box_weight[]" value="${box_weight}" 
                            step="0.001" 
                            class="form-control form-control-sm text-center calculate-weight" 
                            placeholder="0.000" required>
                    </td>

                    <!-- Box dimensions (display only) -->
                    <td class="text-center">
                        ${getBoxDimensions(box_text)}
                    </td>

                    <!-- Action -->
                    <td class="text-center">
                        <button type="button" class="btn btn-sm btn-danger btn-del">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                </tr>`;

        $('#tbody-box').append(tbody);

        $(".serial").each(function(index) {
            $(this).html(index + 1);
        });
    }

    function getBoxDimensions(box_text) {
        let parts = box_text.split(':');
        return parts.length > 1 ? parts[1].trim() : '';
    }



</script>

<script>
    $('#table-item').bind('keyup, input', function(e) {
        if ($(e.target).is('.calculate')) {
            calculate();
        }
    });
    $('#tbody').bind('click', function(e) {
        $(e.target).is('.btn-del') && e.target.closest('tr').remove();
        $(".serial").each(function(index) {
            $(this).html(index + 1);
        });
        calculate();
    });
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $("#item_name_input").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "{{ route('parcel-invoices.items') }}",
                type: "POST",
                dataType: "json",
                data: {
                    search: request.term
                },
                success: function(data) {
                    console.log(data);
                    response(data);
                    
                }
            });
        },

        change: function(event, ui) {
            if (!ui.item) {
                event.currentTarget.value = '';
                event.currentTarget.focus();
            }
        },
        select: function(event, ui) {
            $('#item_name_input').val(ui.item.label);
            $('#item_name_temp').val(ui.item.label);
            $('#item_id_temp').val(ui.item.item_id);
            return false;
        }
    });


    $("#item_name_input").on("keydown", async function (e) {
        if (e.key === "Enter" || e.keyCode === 13) {
            e.preventDefault();

            const item_name_input = $("#item_name_input").val();
            const item_name_temp = $("#item_name_temp").val();
            const item_id_temp = $("#item_id_temp").val();

            if(item_name_input){
                if(!item_id_temp && item_name_input){
                    const item = await storeItem(item_name_input);
                    $("#item_name_temp").val(item.name);
                    $("#item_id_temp").val(item.id);
                }
                generateRow();
                $("#item_name_input").val('');
                $("#item_name_temp").val('');
                $("#item_id_temp").val('');
                let no_item_row_item = $("#no_item_row_item");
                if(no_item_row_item){
                    no_item_row_item.remove();
                }
            }
        }
    });

    function generateRow()
    {
        let item_id = $('#item_id_temp').val();
        let item_name = $('#item_name_temp').val();
        let item_price = null;
        let unit_price_temp = null;
        let quantity_temp = 1;
        let total_temp = unit_price_temp * quantity_temp;
        let tbody = ``;

        if (checkDuplicate(item_id)) {
            duplicateAlert();
            return;
        }

        tbody += `<tr>
                    <td class="serial"></td>
                    <td class="text-left">
                        ${item_name}
                        <input type="hidden" value="${item_id}" name="item_id[]">
                    </td>
                    <td><input type="number" value="${quantity_temp}" class="form-control form-control-sm calculate" name="quantity[]" placeholder="0.00" required></td>
                    <td><input type="number" value="${unit_price_temp}" class="form-control form-control-sm calculate" name="unit_price[]" placeholder="0.00" required></td>
                    <td><input type="number" value="${total_temp}" class="form-control form-control-sm" name="sub_total[]" placeholder="0.00" disabled></td>
                    <td><button class="btn btn-sm btn-danger btn-del" type="button"><i class="fa-solid fa-trash btn-del"></i></button></td>
                </tr>`;

        $('#tbody').append(tbody);
        $(".serial").each(function(index) {
            $(this).html(index + 1);
        });
        calculate();
    }

    async function storeItem(itemName)
    {
        try {
            const item = await $.ajax({
                url: "{{ route('parcel-invoices.store-new-item') }}",
                type: "POST",
                dataType: "json",
                data: {
                    name: itemName,
                }
            });
            return item;
        } catch (error) {
            console.error("Error: ", error);
            return null
        }
    }
    $('#tbody').bind('click', function(e) {
        $(e.target).is('.btn-del') && e.target.closest('tr').remove();
        $(".serial").each(function(index) {
            $(this).html(index + 1);
        });
    });
    
    function checkDuplicate(item_id) {
        let isDuplicate = false;
        $('#tbody tr').each(function() {
            let existingItemId = $(this).find('input[name="item_id[]"]').val();
            if (existingItemId == item_id) {
                isDuplicate = true;
                return false;
            }
        });
        return isDuplicate;
    }

    function duplicateAlert() {
        Swal.fire({
            icon: 'error',
            title: 'Duplicate Item',
            text: 'This Item has already been added!'
        });
    }

    function calculate() {
        let item_id = $('input[name="item_id[]"]');
        let total_price = 0;
        for (let i = 0; i < item_id.length; i++) {
            let quantity = $('input[name="quantity[]"]')[i].value;
            let unit_price = $('input[name="unit_price[]"]')[i].value;
            let sub_total = $('input[name="sub_total[]"]')[i].value;
            sub_total = unit_price * quantity;
            total_price += sub_total;
            $('input[name="sub_total[]"]')[i].value = sub_total;
        }
        $('#total_price').val(total_price.toFixed(2));
        let discount_method = $('#discount_method').val();
        let discount_rate = parseFloat($('#discount_rate').val()) || 0;
        let vat_tax = parseFloat($('#vat_tax').val()) || 0;
        let discount = 0;
        let total_payable = 0;
        if (discount_method == 0) {
            discount = total_price * (discount_rate / 100);
        } else {
            discount = discount_rate;
        }
        total_payable = total_price + vat_tax - discount;
        $('#paid_amount').val(total_payable.toFixed(2));
        $('#discount').val(discount.toFixed(2));
        $('#total_payable').val(total_payable.toFixed(2));
    }

</script>
@endsection
