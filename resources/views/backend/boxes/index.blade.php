@extends('layouts.admin.master')
@section('content')
<div class="content-wrapper">
    @include('layouts.admin.content-header')
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <section class="col-lg-12">
                    <div class="card">
                        <div class="card-header bg-primary p-1">
                            <h3 class="card-title">
                                <a href="{{ route('boxes.create') }}" class="btn btn-light shadow rounded m-0">
                                    <i class="fas fa-plus"></i> <span>Add New</span>
                                </a>
                            </h3>
                        </div>
                        <div class="card-body">
                            <div class="bootstrap-data-table-panel">
                                <div class="table-responsive">
                                    <table id="dataTable" class="table table-sm table-striped table-bordered table-centre">
                                        <thead>
                                            <tr>
                                                <th>SN</th>
                                                <th>Box Name</th>
                                                <th>Code</th>
                                                <th>Type</th>
                                                <th>Box Weight (kg)</th>
                                                <th>Volume Weight (kg)</th>
                                                <th>Total Weight (kg)</th>
                                                <th>CBM (m³)</th>
                                                <th>Dimensions (H×W×L cm)</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>
</div>
@endsection

@section('script')
<script>
$(document).ready(function(){
    const options = {};
    options.url = '{{ route("boxes.list") }}';
    options.type = 'GET';
    options.columns = [
        { data: null, orderable: false, searchable: false }, // SN
        { data: 'box_name', name: 'boxes.box_name' },
        { data: 'box_code', name: 'boxes.box_code' },
        { data: 'box_type', name: 'boxes.box_type' },
        { 
            data: 'box_weight', 
            name: 'boxes.box_weight',
            render: function(data, type, row) {
                // Convert grams to kg for display
                return (data / 1000).toFixed(2);
            }
        },
        { 
            data: 'volume_weight', 
            name: 'boxes.volume_weight',
            render: function(data) { return parseFloat(data).toFixed(2); }
        },
        { 
            data: 'total_weight', 
            name: 'boxes.total_weight',
            render: function(data) { return parseFloat(data).toFixed(2); }
        },
        { 
            data: 'cbm', 
            name: 'boxes.cbm',
            render: function(data) { return parseFloat(data).toFixed(4); }
        },
        { 
            data: null,
            orderable: false,
            searchable: false,
            render: function(data, type, row) {
                return `${row.height_cm} × ${row.width_cm} × ${row.length_cm}`;
            }
        },
        { 
            data: null, 
            name: 'boxes.status', 
            orderable: true, 
            searchable: false, 
            render: function(data, type, row) {
                return `<span class="badge badge-${row.status == 1 ? 'success' : 'warning'}">
                            ${row.status == 1 ? 'Active' : 'Inactive'}
                        </span>`;
            }
        },
        { 
            data: null,
            orderable: false, 
            searchable: false, 
            render: function(data, type, row) {
                let edit = `{{ route('boxes.edit', ":id") }}`.replace(':id', row.id);
                let destroy = `{{ route('boxes.destroy', ":id") }}`.replace(':id', row.id);
                return (`
                    <div class="d-flex justify-content-center">
                        <a href="${edit}" class="btn btn-sm btn-info">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </a>
                        <form class="delete" action="${destroy}" method="post" hidden>
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-danger">
                                <i class="fa-solid fa-trash-can"></i>
                            </button>
                        </form>
                    </div>
                `);
            }
        }
    ];
    options.processing = true;
    dataTable(options);
});
</script>
@endsection
