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
                                    <a href="{{ route('parcel-invoices.create') }}"class="btn btn-light shadow rounded m-0"><i
                                            class="fas fa-plus"></i>
                                        <span>Add New</span></i></a>
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive">
                                        <table id="dataTa ble" class="table table-sm table-striped table-bordered table-centre">
                                            <thead>
                                                <tr>
                                                    <th>SN</th>
                                                    <th>InvoiceNo</th>
                                                    <th>Date</th>
                                                    <th>Total Price</th>
                                                    <th>Vat/Tax</th>
                                                    <th>Discount</th>
                                                    <th>Payable</th>
                                                    <th>Note</th>
                                                    
                                                    
                                                    
                                                    <th>Sender Name</th>
                                                    <th>Sender Phone</th>
                                                    <th>Sender Post Code</th>
                                                    <th>Sender Address</th>

                                                    <th>Receiver Name</th>
                                                    <th>Receiver Phone</th>
                                                    <th>Receiver Country</th>
                                                    <th>Receiver Post Code</th>
                                                    <th>Receiver Address</th>

                                                    <th>Agent Name</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="7"><b>Total:</b></td>
                                                    <td @style('text-align: right;')><b id="totalSale"></b></td>
                                                    <td @style('text-align: right;')><b id="totalProit"></b></td>
                                                    <td colspan="5"></td>
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
            $(document).on('click','.pay-now', function(e) {
                $('#sale_id').val($(this).attr('sale-id'));
                $('#amount').val(parseFloat($(this).attr('due')).toFixed(2));
                $('#due_amount').val(parseFloat($(this).attr('due')).toFixed(2));
            });
            $('#form-submit').submit(function(e) {
                let paid_amount = parseFloat($('#amount').val());
                let due = parseFloat($('#due_amount').val());
                if(paid_amount>due){
                    e.preventDefault();
                    Swal.fire("Couldn't be pay more then payable!");
                }
            });
            var table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: '{{ route("parcel-invoices.list") }}',
                type: 'GET',  
                dataSrc: function (json) {
                    $('#totalSale').html(formatNumber(json.sale_summery.total_sale));
                    $('#totalProit').html(formatNumber(json.sale_summery.total_profit));
                    return json.data;
                }
            },
            columns: [
                        { data: null, orderable: false, searchable: false },
                        {
                            data: null, 
                            name: 'sales.invoice_no', 
                            orderable: true, 
                            searchable: true, 
                            render: function(data, type, row, meta) {
                                let view = `{{ route('parcel-invoices.invoice', ":id") }}`.replace(':id', row.id);
                                return `<a href="${view}" class=""><b>${row.invoice_no}</b></a>`;
                            }
                        },
                        {
                            data: null, 
                            name: 'customers.name',
                            orderable: true, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                return `${row.customer_name}${row.bike_reg_no ? '<br>' + row.bike_reg_no : ''}`;
                            }
                        },
                        { data: 'date', name: 'sales.date'},
                        { data: 'total_price', name: 'sales.total_price'},
                        { data: 'vat_tax', name: 'sales.vat_tax'},
                        { data: 'discount', name: 'sales.discount'},
                        { data: 'total_payable', name: 'sales.total_payable'},
                        {
                            data: null, 
                            name: 'sales.paid_amount', 
                            orderable: false, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                return `<div class="text-center"><span class="text-success fw-bold"><b>${row.paid_amount}</b></span><br><span class="text-danger fw-bold"><b>${row.total_payable - row.paid_amount}</b></span></div>`;
                            }
                        },
                        { data: 'profit', name: 'sales.profit'},
                        { data: 'note', name: 'sales.note'},
                        {
                            data: null, 
                            name: 'sales.payment_status', 
                            orderable: true, 
                            searchable: false, 
                            render: function(data, type, row, meta) {
                                let color;
                                let text;
                                if(row.payment_status == '0'){
                                    color = 'warning';
                                    text = 'Unpaid';
                                }else if(row.payment_status == '1'){
                                    color = 'info';
                                    text = 'Paid';
                                }
                                return `<span class="badge badge-${color}">${text}</span>`;
                            }
                        },
                        {
                            data: null, 
                            name: 'sales.status', 
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
                                let edit = `{{ route('parcel-invoices.edit', ":id") }}`.replace(':id', row.id);
                                let print = `{{ route('parcel-invoices.invoice.print', [":id", "print"]) }}`.replace(':id', row.id);
                                let view = `{{ route('parcel-invoices.invoice', [":id"]) }}`.replace(':id', row.id);
                                let destroy = `{{ route('parcel-invoices.destroy', ":id") }}`.replace(':id', row.id);
                                return (` <div class="d-flex justify-content-center">
                                                <a href="${view}" class="btn btn-sm btn-warning ml-1">
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
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                        More
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <button due="${row.total_payable - row.paid_amount}" sale-id="${row.id }" type="button" class="btn btn-success btn-sm pay-now dropdown-item"
                                                            data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap" 
                                                                ${(row.total_payable - row.paid_amount)==0? 'disabled' : null}
                                                            >Add Payments</button>
                                                            <a href="${print}" class="dropdown-item">Print</a>
                                                    </div>
                                                </div>
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
                        const url = `{{ route('parcel-invoices.approve', ":id") }}`.replace(':id', transaction_id);
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
