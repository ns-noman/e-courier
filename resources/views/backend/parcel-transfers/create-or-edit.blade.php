@extends('layouts.admin.master')
@section('content')
<style>
    table td, table th{
        padding: 3px!important;
        text-align: center;
    }
    input[type="number"]{
        text-align: right;
    }
    .item{
        text-align: left;
    }
    .form-group{
        padding: 2px;
        margin: 0px;
    }
    label{
        margin-bottom: 0px;
    }
</style>
    <div class="content-wrapper">
        @include('layouts.admin.content-header')
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">{{ $data['title'] }} Form</h3>
                            </div>
                            <form id="form-submit" action="{{ isset($data['item']) ? route('parcel-transfer-outgoing.update',$data['item']->id) : route('parcel-transfer-outgoing.store') }}" method="POST" enctype="multipart/form-data">
                                @csrf()
                                @if(isset($data['item']))
                                    @method('put')
                                @endif 
                                <div class="card-body">
                                    <div class="row">
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>To Branch *</label>
                                            <select class="form-control" id="to_branch_id" name="to_branch_id" required>
                                                <option value="" selected>Select Branch</option>
                                                @foreach($data['branches'] as $branch)
                                                    <option value="{{ $branch->id }}" 
                                                        @if(isset($data['item'])){{ $branch->id == $data['item']->to_branch_id ? 'selected' : null }}@endif>
                                                        {{ $branch->code }} - {{ $branch->title }}
                                                        @if($branch->is_main_branch==1)
                                                            (head office)
                                                        @endif
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Date *</label>
                                            <input name="date" id="date" type="date" value="{{ isset($data['item']) ? $data['item']->date : date('Y-m-d') }}" class="form-control" required>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                                            <label>Note</label>
                                            <input type="text" value="{{ isset($data['item']) ? $data['item']->note : null }}" class="form-control" id="note" name="note" placeholder="Note">
                                        </div>

                                        <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                            <div class="bootstrap-data-table-panel">
                                                <div class="table-responsive">
                                                   <table class="table table-striped table-bordered table-centre">
                                                        <thead>
                                                            <tr>
                                                                <th width="10%">SN</th>
                                                                <th width="30%">Shipment Box No</th>
                                                                <th width="30%">
                                                                    Action 
                                                                    <span class="btn btn-sm bg-success m-0" id="select" style="font-size: 11px; padding:2px;">Select All</span>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="table-data">
                                                            @foreach($data['shipment_boxes'] as $index => $box)
                                                                <tr>
                                                                    <td>{{ $index + 1 }}</td>
                                                                    <td>{{ $box->shipment_no }}</td>
                                                                    <td>
                                                                        <input type="checkbox" name="selected_boxes[]" class="select-invoice" value="{{ $box->id }}" 
                                                                            @isset($data['item'])
                                                                                {{ in_array($box->id,$data['parcel_invoice_ids']) ? 'checked' : '' }}
                                                                            @endisset
                                                                        >
                                                                    </td>
                                                                </tr>
                                                            @endforeach
                                                        </tbody>
                                                    </table>
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
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
@section('script')
<script>
    $('#select').click(function(){
        let checkboxes = $('input[type="checkbox"]');
        let text = $(this).text();
        if(text=='Select All'){
            $(this).text('Deselect All');
            $(this).removeClass('bg-success');
            $(this).addClass('bg-dark');
            checkboxes.each((index,element)=>{element.checked = true;});
        }else{
            $(this).text('Select All');
            $(this).removeClass('bg-dark');
            $(this).addClass('bg-success');
            checkboxes.each((index,element)=>{element.checked = false;});
        }
    });

    $('#form-submit').submit(function(e){
        let checked = false;
        if(!$('input[type="checkbox"]').length){
            e.preventDefault();
            return alert('Please Select Batch!');
        }
        $('input[type="checkbox"]').each(function(index, element) {
            if(element.checked){
                checked = true;
            }
        });
        if(!checked){
            e.preventDefault();
            return alert('Select Boxes!');
        }

    });
</script>
@endsection