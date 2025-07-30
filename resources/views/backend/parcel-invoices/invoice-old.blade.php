@extends('layouts.admin.master')
@section('content')
  <div class="content-wrapper">
      @include('layouts.admin.content-header')
      <section class="content">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-12">
                      <div class="invoice p-3 mb-3" id="my-invoice">
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
                            <div class="col-sm-6">
                                Sender Info
                                <hr>
                                <address>
                                    <strong>{{ $data['master']['sender_name'] }}</strong><br>
                                    Phone: {{ $data['master']['sender_phone'] }}<br>
                                    Post Code: {{ $data['master']['sender_zip'] }}<br>
                                    Address: {{ $data['master']['sender_address'] }}<br>
                                </address>
                            </div>
                            <div class="col-sm-6">
                                Receiver Info
                                <hr>
                                <address>
                                    <strong>{{ $data['master']['receiver_name'] }}</strong><br>
                                    Phone: {{ $data['master']['receiver_phone'] }}<br>
                                    Country Name: {{ $data['master']['country_name'] }}<br>
                                    Post Code: {{ $data['master']['receiver_zip'] }}<br>
                                    Address: {{ $data['master']['receiver_address'] }}<br>
                                </address>
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
