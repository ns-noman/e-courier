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
                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>HAWB No <span class="text-danger">*</span></label>
                                            <input value="{{ $data['item']->hawb_no ?? '' }}" type="text" name="hawb_no" class="form-control" placeholder="House Air Waybill No" required>
                                        </div>

                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Reference</label>
                                            <input value="{{ $data['item']->reference ?? '' }}" type="text" name="reference" class="form-control" placeholder="Reference">
                                        </div>

                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Pieces <span class="text-danger">*</span></label>
                                            <input value="{{ $data['item']->pieces ?? '' }}" type="number" name="pieces" class="form-control" placeholder="Total Pieces" required>
                                        </div>

                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Product Value</label>
                                            <input value="{{ $data['item']->product_value ?? '' }}" type="number" name="product_value" class="form-control" placeholder="Value in BDT">
                                        </div>

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Billing Weight (kg) <span class="text-danger">*</span></label>
                                            <input value="{{ $data['item']->billing_weight_kg ?? '' }}" type="number" name="billing_weight_kg" id="billing_weight_kg" class="form-control" placeholder="Kg" required>
                                        </div>

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Billing Weight (gm) <span class="text-danger">*</span></label>
                                            <input value="{{ $data['item']->billing_weight_gm ?? '' }}" type="number" name="billing_weight_gm" id="billing_weight_gm" class="form-control" placeholder="Gm" required>
                                        </div>

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Gross Weight (kg)</label>
                                            <input value="{{ $data['item']->gross_weight_kg ?? '' }}" type="number" step="0.01" name="gross_weight_kg" id="gross_weight_kg" class="form-control" placeholder="Gross Weight in Kg" readonly>
                                        </div>

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Payment Mode <span class="text-danger">*</span></label>
                                            <select name="payment_mode" class="form-control" required>
                                                <option value="">Select Mode</option>
                                                <option value="Prepaid" {{ isset($data['item']) && $data['item']->payment_mode == 'Prepaid' ? 'selected' : '' }}>Prepaid</option>
                                                <option value="Collect" {{ isset($data['item']) && $data['item']->payment_mode == 'Collect' ? 'selected' : '' }}>Collect</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>COD Amount <span class="text-danger">*</span></label>
                                            <input value="{{ $data['item']->cod_amount ?? '' }}" type="number" step="0.01" name="cod_amount" class="form-control" placeholder="Cash On Delivery Amount" required>
                                        </div>

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Item Type <span class="text-danger">*</span></label>
                                            <select name="item_type" class="form-control" required>
                                                <option value="">Select Type</option>
                                                <option value="SPX" {{ isset($data['item']) && $data['item']->item_type == 'SPX' ? 'selected' : '' }}>SPX</option>
                                                <option value="DOCS" {{ isset($data['item']) && $data['item']->item_type == 'DOCS' ? 'selected' : '' }}>DOCS</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>All Item Names</label>
                                            <input value="{{ $data['item']->all_item_names ?? '' }}" type="text" name="all_item_names" class="form-control" placeholder="All Item Names">
                                        </div>

                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Item Description</label>
                                            <textarea name="item_description" class="form-control" placeholder="Item Description" rows="1">{{ $data['item']->item_description ?? '' }}</textarea>
                                        </div>

                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Length (cm)</label>
                                            <input value="{{ $data['item']->length ?? '' }}" type="number" step="0.01" name="length" id="length" class="form-control" placeholder="Length in cm">
                                        </div>

                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Height (cm)</label>
                                            <input value="{{ $data['item']->height ?? '' }}" type="number" step="0.01" name="height" id="height" class="form-control" placeholder="Height in cm">
                                        </div>

                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Width (cm)</label>
                                            <input value="{{ $data['item']->width ?? '' }}" type="number" step="0.01" name="width"  id="width" class="form-control" placeholder="Width in cm">
                                        </div>

                                        <div class="form-group col-sm-3 col-md-3 col-lg-3">
                                            <label>Weight (kg)</label>
                                            <input value="{{ $data['item']->weight ?? '' }}" type="number" step="0.01" name="weight" id="weight" class="form-control" placeholder="Weight in kg" readonly>
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
                                    <h3 class="card-title">Service Information</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Hub ID <span class="text-danger">*</span></label>
                                            <input type="number" class="form-control" name="hub_id" placeholder="Enter Hub ID"
                                                value="{{ isset($data['item']) ? $data['item']->hub_id : '' }}" required>
                                        </div>

                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Flight <span class="text-danger">*</span></label>
                                            <select class="form-control select2" id="flight_id" name="flight_id" required>
                                                <option value="">Select Flight</option>
                                                @foreach ($data['flights'] as $flight)
                                                    <option value="{{ $flight->id }}"
                                                        {{ isset($data['item']) ? ($data['item']->flight_id == $flight->id ? 'selected' : null) : null }}>
                                                        {{ $flight->flight_name }} ({{ $flight->flight_code }})
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Service ID <span class="text-danger">*</span></label>
                                            <input type="number" class="form-control" name="service_id" placeholder="Enter Service ID"
                                                value="{{ isset($data['item']) ? $data['item']->service_id : '' }}" required>
                                        </div>

                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Payment Type <span class="text-danger">*</span></label>
                                            <select name="payment_type" class="form-control" required>
                                                <option value="">Select Payment Type</option>
                                                <option value="Cash" {{ isset($data['item']) && $data['item']->payment_type == 'Cash' ? 'selected' : '' }}>Cash</option>
                                                <option value="Due" {{ isset($data['item']) && $data['item']->payment_type == 'Due' ? 'selected' : '' }}>Due</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>USA Country Code</label>
                                            <input type="text" class="form-control" name="usa_country_code" placeholder="e.g. US, CA"
                                            value="{{ isset($data['item']) ? $data['item']->usa_country_code : '' }}">
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
                                            <label>Email</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->sender_email : null }}"
                                                type="email" class="form-control" name="sender_email"
                                                placeholder="example@gmail.com">
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
                                            <label>Email</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->receiver_email : null }}"
                                                type="email" class="form-control" name="receiver_email"
                                                placeholder="example@gmail.com">
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
                                    <h3 class="card-title">Booking & Export Date</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Booking Date <span class="text-danger">*</span></label>
                                            <input name="booking_date" id="booking_date" type="date"
                                                value="{{ isset($data['item']) ? $data['item']->booking_date : date('Y-m-d') }}"
                                                class="form-control" required>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Export Date <span class="text-danger">*</span></label>
                                            <input name="export_date" id="export_date" type="date"
                                                value="{{ isset($data['item']) ? $data['item']->export_date : date('Y-m-d') }}"
                                                class="form-control" required>
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
                                            <label>MAWB No</label>
                                            <input type="text" class="form-control" name="mawb_no"
                                                value="{{ isset($data['item']) ? $data['item']->mawb_no : '' }}"
                                                placeholder="Master Air Waybill Number">
                                        </div>

                                        <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                            <label>Remarks</label>
                                            <textarea class="form-control" name="remarks" placeholder="Enter any remarks"
                                                rows="1">{{ isset($data['item']) ? $data['item']->remarks : '' }}</textarea>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Showing Weight (kg)</label>
                                            <input type="number" class="form-control" id="showing_weight_kgs" name="showing_weight_kgs"
                                                value="{{ isset($data['item']) ? $data['item']->showing_weight_kgs : '' }}"
                                                placeholder="e.g. 5">
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Showing Weight (gm)</label>
                                            <input type="number" class="form-control" id="showing_weight_gms" name="showing_weight_gms"
                                                value="{{ isset($data['item']) ? $data['item']->showing_weight_gms : '' }}"
                                                placeholder="e.g. 500">
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Total Showing Weight (kg)</label>
                                            <input type="number" class="form-control" id="showing_weight_kgs_total" name="showing_weight_kgs_total"
                                                value="{{ isset($data['item']) ? $data['item']->showing_weight_kgs_total : '' }}"
                                                placeholder="e.g. 5.50" readonly>
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
        $('#length, #height, #width').on('input', ()=>{
            const length = parseInt($('#length').val()) | 0;
            const height = parseInt($('#height').val()) | 0;
            const width = parseInt($('#width').val()) | 0;
            let weight = (length * height * width) / 5000;
            $('#weight').val(fNum(weight));
        });
        $('#billing_weight_kg, #billing_weight_gm').on('input', ()=>{
            const billing_weight_kg = parseInt($('#billing_weight_kg').val()) | 0;
            const billing_weight_gm = parseInt($('#billing_weight_gm').val()) | 0;
            let gross_weight_kg = billing_weight_kg + (billing_weight_gm/1000);
            $('#gross_weight_kg').val(fNum(gross_weight_kg));
        });
        $('#showing_weight_kgs, #showing_weight_gms').on('input', ()=>{
            const showing_weight_kgs = parseInt($('#showing_weight_kgs').val()) | 0;
            const showing_weight_gms = parseInt($('#showing_weight_gms').val()) | 0;
            let showing_weight_kgs_total = showing_weight_kgs + (showing_weight_gms/1000);
            $('#showing_weight_kgs_total').val(fNum(showing_weight_kgs_total));
        });
    });
</script>
@endsection
