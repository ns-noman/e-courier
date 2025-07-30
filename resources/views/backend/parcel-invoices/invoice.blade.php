@extends('layouts.admin.master')
@section('content')
  <div class="content-wrapper">
      @include('layouts.admin.content-header')
      <section class="content">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-12">
                      <div class="invoice p-3 mb-3" id="my-invoice">
                        <style>
                            .c-table {
                                width: 100%;
                                margin-bottom: 1rem;
                                color: #212529;
                                border-collapse: collapse;
                            }

                            .c-table th,
                            .c-table td {
                                padding: 5px;
                                vertical-align: top;
                                border: 1px solid #dee2e6;
                            }

                            .c-table thead th {
                                vertical-align: bottom;
                                background-color: #f8f9fa;
                                font-weight: bold;
                            }

                            .c-table tbody + tbody {
                                border-top: 2px solid #dee2e6;
                            }

                            /* Optional - Striped rows */
                            .c-table-striped tbody tr:nth-of-type(odd) {
                                background-color: #f2f2f2;
                            }

                            /* Optional - Hover effect */
                            .c-table-hover tbody tr:hover {
                                background-color: #f1f1f1;
                            }

                            /* Optional - Bordered */
                            .c-table-bordered {
                                border: 1px solid #dee2e6;
                            }

                            /* Responsive wrapper */
                            .c-table-responsive {
                                width: 100%;
                                overflow-x: auto;
                            }
                        </style>
                          <div class="row">
                              <div class="col-12">
                                  <h4>
                                    {{-- , strtotime($data['master']['']) --}}
                                    <img style="height: 50px;width: px;" src="{{ asset('public/uploads/basic-info/' . $data['basicInfo']['logo']) }}" alt="Logo" />
                                      {{ $data['basicInfo']['title'] }}
                                      <small class="float-right">Date: {{ date('dS M Y') }}</small>
                                  </h4>
                              </div>
                          </div>
                          <div class="row">
                            <div class="col-sm-12 d-flex justify-content-end">
                                <p><span><svg class="barcode"></svg></span></p>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-sm-12">
                                <h5>Shipper & Consignee Information</h5>
                                <table class="c-table">
                                    <thead>
                                        <tr>
                                            <th>Field</th>
                                            <th>Shipper</th>
                                            <th>Consignee</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>Name</th>
                                            <td>{{ $data['master']['sender_name'] }}</td>
                                            <td>{{ $data['master']['receiver_name'] }}</td>
                                        </tr>
                                        <tr>
                                            <th>Company</th>
                                            <td>{{ $data['master']['sender_company'] }}</td>
                                            <td>{{ $data['master']['receiver_company'] }}</td>
                                        </tr>
                                        <tr>
                                            <th>Phone</th>
                                            <td>{{ $data['master']['sender_phone'] }}</td>
                                            <td>{{ $data['master']['receiver_phone'] }}</td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td>{{ $data['master']['sender_email'] }}</td>
                                            <td>{{ $data['master']['receiver_email'] }}</td>
                                        </tr>
                                        <tr>
                                            <th>Address</th>
                                            <td>{{ $data['master']['sender_address'] }}</td>
                                            <td>{{ $data['master']['receiver_address'] }}</td>
                                        </tr>
                                        <tr>
                                            <th>City</th>
                                            <td>{{ $data['master']['sender_city'] }}</td>
                                            <td>{{ $data['master']['receiver_city'] }}</td>
                                        </tr>
                                        <tr>
                                            <th>Post Code</th>
                                            <td>{{ $data['master']['sender_zip'] }}</td>
                                            <td>{{ $data['master']['receiver_zip'] }}</td>
                                        </tr>
                                        <tr>
                                            <th>Country</th>
                                            <td>{{ $data['master']['sender_country_name'] ?? '' }}</td>
                                            <td>{{ $data['master']['receiver_country_name'] ?? '' }}</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>

                          <div class="row no-print">
                              <div class="col-12">
                                  <a href="javascript:void(0)" onclick="customPrint()" rel="noopener" class="btn btn-default">
                                    <i class="fas fa-print"></i> Print</a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </section>
  @endsection

@section('script')
    <script>
        $(document).ready(function() {
            if ("{{ $data['print'] }}" == 'print') {
              customPrint();
            }
        });
        JsBarcode(".barcode", "{{ $data['master']['invoice_no'] }}", {
            width: 1,
            height: 20,
            displayValue: true
        });
        function customPrint(){
          var printContents = document.getElementById('my-invoice').innerHTML;
          var originalContents = document.body.innerHTML;
          document.body.innerHTML = printContents;
          window.print();
          document.body.innerHTML = originalContents;
        }
    </script>
@endsection
