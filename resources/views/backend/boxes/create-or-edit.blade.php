@extends('layouts.admin.master')
@section('content')
<div class="content-wrapper">
    @include('layouts.admin.content-header')
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">{{ $data['title'] }} Form</h3>
                        </div>
                        <form action="{{ isset($data['item']) ? route('boxes.update',$data['item']->id) : route('boxes.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @if(isset($data['item']))
                                @method('put')
                            @endif
                            <div class="card-body">
                                <div class="row">

                                    <div class="form-group col-md-4">
                                        <label>Box Name *</label>
                                        <input value="{{ $data['item']->box_name ?? '' }}" type="text" class="form-control" name="box_name" placeholder="Box Name" required>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Box Code *</label>
                                        <input value="{{ $data['item']->box_code ?? '' }}" type="text" class="form-control" name="box_code" placeholder="Box Code" required>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Box Type *</label>
                                        <select name="box_type" class="form-control" required>
                                            <option value="Domestic" @selected(($data['item']->box_type ?? '') == 'Domestic')>Domestic</option>
                                            <option value="International" @selected(($data['item']->box_type ?? '') == 'International')>International</option>
                                        </select>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Height (cm)</label>
                                        <input value="{{ $data['item']->height_cm ?? 0 }}" type="number" step="0.01" class="form-control calc-field" name="height_cm" placeholder="Height in cm">
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Width (cm)</label>
                                        <input value="{{ $data['item']->width_cm ?? 0 }}" type="number" step="0.01" class="form-control calc-field" name="width_cm" placeholder="Width in cm">
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Length (cm)</label>
                                        <input value="{{ $data['item']->length_cm ?? 0 }}" type="number" step="0.01" class="form-control calc-field" name="length_cm" placeholder="Length in cm">
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Box Weight (g)</label>
                                        <input value="{{ $data['item']->box_weight ?? 0 }}" type="number" step=".1" class="form-control calc-field" name="box_weight" placeholder="Box Weight in grams">
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Volume Weight (kg)</label>
                                        <input value="{{ $data['item']->volume_weight ?? 0 }}" type="number" step="0.01" class="form-control" name="volume_weight" placeholder="Volume Weight" readonly>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label>Total Weight (kg)</label>
                                        <input value="{{ $data['item']->total_weight ?? 0 }}" type="number" step="0.01" class="form-control" name="total_weight" placeholder="Total Weight" readonly>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>CBM (m³)</label>
                                        <input value="{{ $data['item']->cbm ?? 0 }}" type="number" step="0.0001" class="form-control" name="cbm" placeholder="Cubic Meter (CBM)" readonly>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label>Status *</label>
                                        <select name="status" class="form-control">
                                            <option value="1" @selected(($data['item']->status ?? 1) == 1)>Active</option>
                                            <option value="0" @selected(($data['item']->status ?? 1) == 0)>Inactive</option>
                                        </select>
                                    </div>

                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection

@section('script')
<script>
    $(document).ready(function(){

        function calculate() {
            // Get values
            let height = parseFloat($('input[name="height_cm"]').val()) || 0;
            let width = parseFloat($('input[name="width_cm"]').val()) || 0;
            let length = parseFloat($('input[name="length_cm"]').val()) || 0;
            let boxWeightGram = parseFloat($('input[name="box_weight"]').val()) || 0;

            // Convert box weight from grams to kg
            let boxWeight = boxWeightGram / 1000;

            // Calculate CBM (convert cm³ to m³)
            let cbm = (height * width * length) / 1000000;
            $('input[name="cbm"]').val(cbm.toFixed(4));

            // Calculate volumetric weight in kg using divide by 5000
            let volumeWeight = (length * width * height) / 5000;
            $('input[name="volume_weight"]').val(volumeWeight.toFixed(2));

            // Calculate total weight
            let totalWeight = boxWeight + volumeWeight;
            $('input[name="total_weight"]').val(totalWeight.toFixed(2));
        }

        // Trigger calculation on input change
        $('.calc-field').on('input', calculate);

        // Initial calculation on page load
        calculate();

    });
</script>
@endsection
