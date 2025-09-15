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
                            <form id="form-submit" action="{{ isset($data['item']) ? route('shipment-boxes.update',$data['item']->id) : route('shipment-boxes.store') }}" method="POST" enctype="multipart/form-data">
                                @csrf()
                                @if(isset($data['item']))
                                    @method('put')
                                @endif 
                                <div class="card-body">
                                    <div class="row">
                                        <div class="form-group col-sm-12 col-md-6 col-lg-6">
                                            <label>Box</label>
                                            <select class="form-control" id="box_id" name="box_id" required>
                                                <option value="" selected>Select Box</option>
                                                @foreach($data['boxes'] as $key => $box)
                                                    <option value="{{ $box->id }}" @if(isset($data['item'])){{ $box->id == $data['item']->box_id ? 'selected' : null }} @endif>{{ $box->box_name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-12 col-md-6 col-lg-6">
                                        </div>
                                        <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                            <div class="bootstrap-data-table-panel">
                                                <div class="table-responsive">
                                                   <table class="table table-striped table-bordered table-centre">
                                                        <thead>
                                                            <tr>
                                                                <th width="10%">SN</th>
                                                                <th width="30%">Invoice No</th>
                                                                <th width="30%">Date</th>
                                                                <th width="30%">
                                                                    Action 
                                                                    <span class="btn btn-sm bg-success m-0" id="select" style="font-size: 11px; padding:2px;">Select All</span>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="table-data">
                                                            @foreach($data['parcel_invoices'] as $index => $invoice)
                                                                <tr>
                                                                    <td>{{ $index + 1 }}</td>
                                                                    <td>{{ $invoice->invoice_no }}</td>
                                                                    <td>{{ $invoice->booking_date }}</td>
                                                                    <td>
                                                                        <input type="checkbox" name="selected_invoices[]" class="select-invoice" value="{{ $invoice->id }}" 
                                                                            @isset($data['item'])
                                                                                {{ in_array($invoice->id,$data['parcel_invoice_ids']) ? 'checked' : '' }}
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

    $('#box_id').change(function() {
        $.ajax({
            url: "{{ url('admin/get-schedule-trainee') }}/"+$(this).val(),
            method: "GET",
            dataType: "json",
            success: function(data){
                let td = '';
                let i = 1;
                data.forEach((element) => {
                    td += '<tr>';
                    td += '<td align="center" valign="middle">'+i+'</td>';
                    td += '<td align="left" valign="middle">' + element.trainee.name + ' - ' + element.trainee.id + '</td>';
                    td += '<td align="left" valign="middle"><input class="form-control" name="comment[]" placeholder="Comment"></td>';
                    td += '<td>';
                    td +=   '<div class="col-12">';
                    td +=     '<div class="custom-control custom-switch custom-switch-off-gray custom-switch-on-success child-menu">';
                    td +=       '<input name="attendance_status[]" type="checkbox" class="custom-control-input" id="ats-'+element.id+'" value="'+element.id+'">';
                    td +=       '<label class="custom-control-label" for="ats-'+element.id+'" ></label>';
                    td +=     '</div>';
                    td +=   '</div>';
                    td += '</td>';
                    td += '</tr>';
                    i++;
                });
                if(!data.length) td = 'No Data Found!';

                $('#table-data').html(td);
            }
        });
    });

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
            return alert('Please select attendance!');
        }

    });
</script>
@endsection