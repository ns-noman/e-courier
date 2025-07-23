@extends('layouts.admin.master')
@section('content')
    <style>
        td:nth-child(6){
            text-align: right !important;
        }
    </style>
    <div class="content-wrapper">
        @include('layouts.admin.content-header')
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <section class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-primary p-1">
                                <h3 class="card-title">
                                    <a href="{{ route('branches.create') }}"class="btn btn-light shadow rounded m-0"><i
                                            class="fas fa-plus"></i>
                                        <span>Add New</span></i></a>
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive">
                                        <table id="dataTable" class="table table-sm table-striped table-bordered table-centre">
                                            <thead>
                                                <tr>
                                                    <th>SN</th>
                                                    <th>Parent Branch</th>
                                                    <th>Branch Name</th>
                                                    <th>Branch Type</th>
                                                    <th>Branch Code</th>
                                                    <th>Commission(%)</th>
                                                    <th>Phone</th>
                                                    <th>Address</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
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
            options.url = '{{ route("branches.all-branches") }}';
            options.type = 'GET';
            options.columns = 
                    [
                        { data: null, orderable: false, searchable: false },
                        {
                            data: 'parent_title',
                            name: 'parent_branches.title',
                            orderable: true, 
                            searchable: true,
                            render: function(data, type, row, meta){
                                if(row.parent_title === null){
                                    row.parent_title = `Main Branch`;
                                }
                                return row.parent_title;
                            }
                        },
                        { data: 'branch_type', name: 'branches.branch_type'},
                        {
                            data: 'title',
                            name: 'branches.title',
                            orderable: true, 
                            searchable: true,
                            render: function(data, type, row, meta){
                                if(row.is_main_branch == '1'){
                                    row.title = row.title + ` <span class="badge badge-warning" >main</span>`;
                                }
                                return row.title;
                            }
                        },
                        { 
                            data: 'code',
                            name: 'branches.code',
                            orderable: true, 
                            searchable: true,
                            render: function(data, type, row, meta){
                                return `<b>${row.code}</b>`; 
                            }
                        },
                        { 
                            data: 'commission_percentage',
                            name: 'branches.commission_percentage',
                            orderable: true, 
                            searchable: true,
                            render: function(data, type, row, meta){
                                return `${parseFloat(row.commission_percentage).toLocaleString('en-IN', {maximumFractionDigits: 2, minimumFractionDigits: 2})} %`; 
                            }
                        },
                        { data: 'phone', name: 'branches.phone'},
                        { data: 'address', name: 'branches.address'},
                        { 
                            data: null, 
                            name: 'branches.status', 
                            orderable: true, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                               return `<span class="badge badge-${row.status == '1' ? 'success' : 'warning'}">${row.status == '1' ? 'Active' : 'Inactive'}</span>`;
                            }
                        },
                        { 
                            data: null,
                            orderable: false, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                let edit = `{{ route('branches.edit', ":id") }}`.replace(':id', row.id);
                                let destroy = `{{ route('branches.destroy', ":id") }}`.replace(':id', row.id);

                                return (` <div class="d-flex justify-content-center">
                                                <a href="${edit}"
                                                    class="btn btn-sm btn-info">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </a>
                                                <form class="delete" action="${destroy}" method="post" hidden>
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-sm btn-danger" ${row.is_main_branch == '1' ? 'disabled' : null}>
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