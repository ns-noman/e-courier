@extends('layouts.admin.master')
@section('content')
<style>
    td:nth-child(4){
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
                                    <a href="{{ route('expenses.create') }}"class="btn btn-light shadow rounded m-0"><i
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
                                                    <th>Expense No</th>
                                                    <th>Date</th>
                                                    <th>Total Amount</th>
                                                    <th>Payment Methods</th>
                                                    <th>Reference Number</th>
                                                    <th>Note</th>
                                                    <th>Created By</th>
                                                    <th>Statu</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                             <tfoot>
                                                <tr>
                                                    <td colspan="3"><b>Total:</b></td>
                                                    <td @style('text-align: right')><b id="totalExpense"></b></td>
                                                    <td colspan="6"></td>
                                                </tr>
                                            </tfoot>
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
            var table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: '{{ route("expenses.list") }}',
                type: 'GET',
                dataSrc: function (json) {
                    $('#totalExpense').html(formatNumber(json.totalExpense));
                    return json.data;
                }
                
            },
            columns: [
                        { data: null, orderable: false, searchable: false },
                        {
                            data: null, 
                            name: 'expenses.expense_no', 
                            orderable: true, 
                            searchable: true, 
                            render: function(data, type, row, meta) {
                                let view = `{{ route('expenses.view', ":id") }}`.replace(':id', row.id);
                                return `<a href="${view}" class=""><b>${row.expense_no}</b></a>`;
                            }
                        },
                        { data: 'date', name: 'expenses.date'},
                        { data: 'total_amount', name: 'expenses.total_amount'},
                        { data: 'payment_method', name: 'payment_methods.name'},
                        { data: 'reference_number', name: 'expenses.reference_number'},
                        { data: 'note', name: 'expenses.note'},
                        { data: 'created_by', name: 'admins.name'},
                        { 
                            data: null, 
                            name: 'expenses.status', 
                            orderable: true, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                let color;
                                let text;
                                let eventClass = '';
                                if(row.status == '0'){
                                    color = 'danger';
                                    text = 'Pending';
                                    eventClass = 'event';
                                }else if(row.status == '1'){
                                    color = 'success';
                                    text = 'Approved';
                                }
                                return `<button transaction_id=${row.id} type="button" class="btn btn-sm btn-${color} ${eventClass}">${text}</button>`;
                            }
                        },
                        { 
                            data: null,
                            orderable: false, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                let edit = `{{ route('expenses.edit', ":id") }}`.replace(':id', row.id);
                                let view = `{{ route('expenses.view', ":id") }}`.replace(':id', row.id);
                                let destroy = `{{ route('expenses.destroy', ":id") }}`.replace(':id', row.id);
                                return (` <div class="d-flex justify-content-center">
                                                <a href="${view}" class="btn btn-sm btn-warning">
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                                <a href="${edit}" class="btn btn-sm btn-info ${row.status == '1' ? 'disabled' : null}">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </a>
                                                <form class="delete" action="${destroy}" method="post">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-sm btn-danger" ${row.status == '1' ? "disabled" : null}>
                                                        <i class="fa-solid fa-trash-can"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        `);
                            }
                        }
                    ],
                rowCallback: function(row, data, index) {
                    var pageInfo = table.page.info();
                    var serialNumber = pageInfo.start + index + 1;
                    $('td:eq(0)', row).html(serialNumber);
                },
                order: [],
                search: {return: false}
            });

            $(document).on('click', '.delete button', function(e) {
                e.preventDefault();
                let form = $(this).closest('form');
                let tr = $(this).closest('tr');
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, delete it!"
                }).then(async (result) => {
                    if (result.isConfirmed){
                        nsAjaxPost(form.attr('action'), form.serialize())
                        .then(res => {
                            table.draw();
                            message(res);
                        })
                        .catch(err => {
                            message(err);
                        });
                    }
                });
            });

        

            $(document).on('click', '.event', function(e) {
                e.preventDefault();
                let transaction_id = $(this).attr('transaction_id');
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#198754",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Approve",
                    cancelButtonText: "Cancel",
                }).then((result) => {
                    if (result.isConfirmed) {
                        const url = `{{ route('expenses.approve', ":id") }}`.replace(':id', transaction_id);
                        $.ajax({
                            url: url,
                            method: 'GET',
                            dataType: 'JSON',
                            success: function(res) {
                                message(res);
                                table.draw();
                            },
                            error: function(xhr, status, error) {
                                message(xhr.responseJSON);
                            }
                        });
                    }
                });

            });
        });

        
    </script>
@endsection