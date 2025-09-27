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
                                    {{-- <a href="{{ route('parcel-transfer-outgoing.create') }}" class="btn btn-light shadow rounded m-0">
                                        <i class="fas fa-plus"></i> <span>Add New</span>
                                    </a> --}}
                                </h3>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-data-table-panel">
                                    <div class="table-responsive">
                                        <table id="dataTable" class="table table-sm table-striped table-bordered table-centre text-center">
                                            <thead>
                                                <tr>
                                                    <th>SN</th>
                                                    <th>Transfer No</th>
                                                    <th>Boxes</th>
                                                    <th>From Branch</th>
                                                    <th>To Branch</th>
                                                    <th>Transfer Date</th>
                                                    <th>Note</th>
                                                    <th>Received Status</th>
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
        var table = $('#dataTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: '{{ route("parcel-transfer-incoming.list") }}',
                type: 'GET',
            },
            columns: [
                { data: null, orderable: false, searchable: false },
                {
                    data: 'parcel_transfer_no',
                    name: 'parcel_transfers.parcel_transfer_no',
                    render: function(data, type, row) {
                        return `<b>${data}</b>`;
                    }
                },
                {
                    data: 'items',
                    orderable: false, 
                    searchable: false, 
                    render: function(data, type, row, meta) {
                        return data;
                    }
                },
                {
                    data: null,
                    render: function(data, type, row) {
                        return row.from_branch ? row.from_branch.title : 'N/A';
                    }
                },
                {
                    data: null,
                    render: function(data, type, row) {
                        return row.to_branch ? row.to_branch.title : 'N/A';
                    }
                },
                { data: 'transfer_date', name: 'parcel_transfers.transfer_date' },
                {
                    data: 'note',
                    orderable: false,
                    searchable: false,
                    render: function(data) {
                        return data ? data : '-';
                    }
                },
                {
                    data: 'is_received',
                    name: 'parcel_transfers.is_received',
                    render: function(data, type, row) {
                        let color, text, eventClass = '';
                        if (data) {
                            color = 'success'; text = 'Received';
                        }else{
                            color = 'danger'; text = 'Pending'; eventClass = 'event';
                        }
                        return `<button transaction_id="${row.id}" type="button" class="btn btn-sm btn-${color} ${eventClass}">${text}</button>`;
                    }
                },
                
            ],
            rowCallback: function(row, data, index) {
                var pageInfo = table.page.info();
                var serialNumber = pageInfo.start + index + 1;
                $('td:eq(0)', row).html(serialNumber);
            },
            order: [],
        });


        $(document).on('click', '.event', function(e) {
            e.preventDefault();
            let transaction_id = $(this).attr('transaction_id');
            Swal.fire({
                title: "Approve this transfer?",
                text: "You can't revert this action!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#198754",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, Receive it!",
                cancelButtonText: "Cancel",
            }).then((result) => {
                if (result.isConfirmed) {
                    const url = `{{ route('parcel-transfer-incoming.receive', ":id") }}`.replace(':id', transaction_id);
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
