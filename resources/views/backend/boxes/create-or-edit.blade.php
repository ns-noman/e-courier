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
                                @csrf()
                                @if(isset($data['item']))
                                    @method('put')
                                @endif
                                <div class="card-body">
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Box Name *</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->box_name : null }}" type="text" class="form-control" name="box_name" placeholder="Box Name" required>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Box Code *</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->box_code : null }}" type="text" class="form-control" name="box_code" placeholder="Box Code" required>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Box Type *</label>
                                            <select name="box_type" id="box_type" class="form-control">
                                                <option @selected(isset($data['item']) && $data['item']->box_type == 'small') value="small">Small</option>
                                                <option @selected(isset($data['item']) && $data['item']->box_type == 'medium') value="medium">Medium</option>
                                                <option @selected(isset($data['item']) && $data['item']->box_type == 'large') value="large">Large</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Weight (kg)</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->weight : null }}" type="number" step="0.01" class="form-control" name="weight" placeholder="Weight">
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Dimensions</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->dimensions : null }}" type="text" class="form-control" name="dimensions" placeholder="Dimensions">
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Status *</label>
                                            <select name="status" id="status" class="form-control">
                                                <option @selected(($data['item']->status ?? null) === 1) value="1">Active</option>
                                                <option @selected(($data['item']->status ?? null) === 0) value="0">Inactive</option>
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