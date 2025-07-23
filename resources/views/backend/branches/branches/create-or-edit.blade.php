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
                            <form action="{{ isset($data['item']) ? route('branches.update',$data['item']->id) : route('branches.store') }}" method="POST" enctype="multipart/form-data">
                                @csrf()
                                @if(isset($data['item']))
                                    @method('put')
                                @endif
                                <div class="card-body">
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Parent Branch *</label>
                                            <select name="parent_id" id="parent_id" class="form-control select2" required @disabled(isset($data['item']) && $data['item']->parent_id == 0)>
                                                @php
                                                    $levelIcon = ['&#11042;','&#10148;','&rarr;','&#8618;','&#8627;','&#8658;'];
                                                @endphp

                                                {!! (function($branches, $selectedId, $levelIcon) {
                                                    $renderBranchOptions = function($branches, $level = 0, $selectedId = null) use (&$renderBranchOptions, $levelIcon) {
                                                        $html = '';
                                                        foreach ($branches as $branch) {
                                                            $indent = str_repeat('&nbsp;&nbsp;', $level);
                                                            $arrow = $levelIcon[$level] ?? '&rarr;';
                                                            $selected = $selectedId == $branch['id'] ? 'selected' : '';
                                                            $html .= "<option value=\"{$branch['id']}\" $selected>{$indent}{$arrow} {$branch['title']}</option>";
                                                            if (!empty($branch['children'])) {
                                                                $html .= $renderBranchOptions($branch['children'], $level + 1, $selectedId);
                                                            }
                                                        }
                                                        return $html;
                                                    };
                                                    return $renderBranchOptions($branches, 0, $selectedId);
                                                })($data['branches'], $data['item']['parent_id'] ?? null, $levelIcon) !!}
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-6 col-lg-6">
                                            <label>Branch Type *</label>
                                            <select name="branch_type" id="branch_type" class="form-control" required  @disabled(isset($data['item']) && $data['item']->parent_id == 0)>
                                                <option @selected(($data['item']->status ?? null) === "Branch") value="Branch">Branch</option>
                                                <option @selected(($data['item']->status ?? null) === "Hub") value="Hub">Hub</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Branch Name *</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->title : null }}" type="text" class="form-control" name="title" placeholder="Branch Name" required>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Branch Code *</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->code : null }}" type="text" class="form-control" name="code" placeholder="B-1234" required>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Commission(%) *</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->commission_percentage : null }}" type="number" min="0" step="0.01" class="form-control" name="commission_percentage" placeholder="10%" required>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Phone *</label>
                                            <input value="{{ isset($data['item']) ? $data['item']->phone : null }}" type="text" class="form-control" name="phone" placeholder="017XXXXXXXX,018..." required>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Address</label>
                                            <textarea class="form-control" name="address" placeholder="Address" rows="1">{{ isset($data['item']) ? $data['item']->address : null }}</textarea>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
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