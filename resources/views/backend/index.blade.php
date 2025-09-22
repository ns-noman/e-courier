@inject('authorization', 'App\Services\AuthorizationService')
@extends('layouts.admin.master')
@section('content')
    {{-- @php
        $investor_id = Auth::guard('admin')->user()->investor_id;
    @endphp
    <style>
        td:nth-child(6),
        td:nth-child(7),
        td:nth-child(8) {
            text-align: right !important;
        }
        .cursor-pointer {
            cursor: pointer;
        }

        .active-cust {
            border: 2px solid #03d6ba;
            background-color: #dcebe9;
        }

        .bikefilter {
            font-size: 16px;
        }

        .bikefilter>.info-box-content {
            padding: 0 2px;
        }

        .bikefilter>.info-box-icon {
            width: 60px !important;
        }
    </style>
    <div class="content-wrapper">
        @include('layouts.admin.content-header')
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    @if ($authorization->hasMenuAccess(190))
                        <div class="col-lg-12">
                            <h5 class="mb-2">Financial Status</h5>
                            <div class="row">
                                <div class="col" {{ !$authorization->hasMenuAccess(191) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('investors.index') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Investment Capital</span>
                                            <span class="info-box-number">
                                                @php
                                                    $totalInvestment = $data['investors_capital'] + $data['my_capital'];
                                                @endphp
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($totalInvestment, 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(192) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('reports.stock-reports') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Item Stock Value</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['stockValueItem'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(194) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('accounts.index') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Cash Balance</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['allAccountBalance'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(195) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('expenses.index') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Expense</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['totalExpenses_exp'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(196) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('purchases.index') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Purchase</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['totalPurchase_exp'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(197) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('sales.index') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Sale</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['totalSale_inc'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                               
                        </div>
                    @endif

                    @if ($authorization->hasMenuAccess(189))
                        <div class="col-lg-12">
                            <h5 class="mb-2">Loan Status</h5>
                            <div class="row">
                                <div class="col" {{ !$authorization->hasMenuAccess(198) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('loans.index') }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-wallet"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Loan Amount Receiveable</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['totalLoanReceiveable'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(199) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('loans.index') }}">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fa fa-wallet"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Loan Amount Payable</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['totalLoanPayable'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif

                    @if ($authorization->hasMenuAccess(182))
                        <div class="col-lg-12">
                            <div class="row d-flex justify-content-center">
                                <div class="col-6">
                                    <div class="form-group d-flex align-items-center">
                                        <label for="reservation" class="mr-2 mb-0"
                                            style="white-space: nowrap;">Filter:</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="far fa-calendar-alt"></i>
                                                </span>
                                            </div>
                                            <input type="text" class="form-control float-right" id="reservation">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <h5 class="mb-2">Purchase, Sales & Expense Info</h5>
                            <div class="row">
                                <div class="col" {{ !$authorization->hasMenuAccess(170) ? 'hidden' : null }}>
                                    <a class="info-box mb-3 activeable2" data-filteron="" href="{{ route('reports.sales-report') }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-shopping-cart"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Accessories Sales</span>
                                            <span class="info-box-number" id="accessoriesSale">
                                                <i class="fas fa-spinner fa-spin"></i>
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(171) ? 'hidden' : null }}>
                                    <a class="info-box mb-3 activeable2" data-filteron="" href="{{ route('reports.sales-report') }}">
                                        <span class="info-box-icon bg-primary elevation-1">
                                            <i class="fa fa-tools"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Service Sales</span>
                                            <span class="info-box-number" id="serviceSale">
                                                <i class="fas fa-spinner fa-spin"></i>
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(172) ? 'hidden' : null }}>
                                    <a class="info-box mb-3 activeable2" data-filteron="" href="{{ route('reports.sales-report') }}">
                                        <span class="info-box-icon bg-warning elevation-1">
                                            <i class="fa fa-cogs"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Spare Parts Sales</span>
                                            <span class="info-box-number" id="sparePartsSale">
                                                <i class="fas fa-spinner fa-spin"></i>
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(178) ? 'hidden' : null }}>
                                    <a class="info-box mb-3 activeable2" data-filteron="" href="{{ route('reports.sales-report') }}">
                                        <span class="info-box-icon bg-danger elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Item & Service Sales</span>
                                            <span class="info-box-number" id="total_service_and_item_sales">
                                                <i class="fas fa-spinner fa-spin"></i>
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(179) ? 'hidden' : null }}>
                                    <a class="info-box mb-3 activeable2" data-filteron="" href="{{ route('reports.purchase-report') }}">
                                        <span class="info-box-icon bg-secondary elevation-1">
                                            <i class="fa fa-wallet"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Purchase</span>
                                            <span class="info-box-number" id="purchase">
                                                <i class="fas fa-spinner fa-spin"></i>
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(169) ? 'hidden' : null }}>
                                    <a class="info-box mb-3 expenseFilter activeable2" data-filteron="" href="{{ route('reports.monthly-expenses') }}">
                                        <span class="info-box-icon bg-dark elevation-1">
                                            <i class="fa fa-money-bill-wave"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Expense</span>
                                            <span class="info-box-number" id="expenses">
                                                <i class="fas fa-spinner fa-spin"></i>
                                            </span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif

                    @if ($authorization->hasMenuAccess(183))
                        <div class="col-lg-12">
                            <h5 class="mb-2">Investment Info</h5>
                            <div class="row">
                                <div class="col" {{ !$authorization->hasMenuAccess(173) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('reports.bike-profit') }}">
                                        <span class="info-box-icon bg-danger elevation-1">
                                            <i class="fa fa-credit-card"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Investor's Profit Payment</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['investorProfitPayment'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(174) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('investor-transactions.index') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-piggy-bank"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's New Investment</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['newinvestments'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(175) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('investor-transactions.index') }}">
                                        <span class="info-box-icon bg-secondary elevation-1">
                                            <i class="fa fa-sign-out-alt"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Today's Investment Withdraw</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['investmentwithdrawal'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(180) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('investors.index') }}">
                                        <span class="info-box-icon bg-success elevation-1">
                                            <i class="fa fa-wallet"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Investors Investment Capital</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['investors_capital'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(181) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('reports.investment') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-wallet"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">My Investment Capital</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['my_capital'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="col" {{ !$authorization->hasMenuAccess(200) ? 'hidden' : null }}>
                                    <a class="info-box cursor-pointer mb-3 investorsfilter activeable2" data-filteron=""
                                        href="{{ route('reports.investor-ledger') }}">
                                        <span class="info-box-icon bg-info elevation-1">
                                            <i class="fa fa-wallet"></i>
                                        </span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">My Available Balance</span>
                                            <span class="info-box-number">
                                                {{ $data['basicInfo']['currency_symbol'] }}
                                                {{ number_format($data['my_available_balance'], 2) }}
                                            </span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </section>
    </div> --}}
@endsection

@section('script')
    <script>
        // let isAssetTableInitialized = false;
        // $(document).ready(function() {
        //     loadSummeryData();
        // });


        // $('#reservation').daterangepicker();


        // $('#reservation').on('change', function(e) {
        //     loadSummeryData();
        // });

        // function loadSummeryData() {
        //     if ($('#reservation').length) {
        //         let dateRange = $('#reservation').val().replace(/\//g, '_');
        //         const url = ` route('dashboard.summery-data', [':dateRange']) }}`.replace(':dateRange', dateRange);
        //         $.ajax({
        //             url: url,
        //             method: 'GET',
        //             dataType: 'JSON',
        //             success: function(res) {
        //                 let accessories = parseFloat(res.accessories || 0);
        //                 let spareparts = parseFloat(res.spareparts || 0);
        //                 let services = parseFloat(res.services || 0);
        //                 let expenses = parseFloat(res.expenses || 0);
        //                 let purchase = parseFloat(res.purchase || 0);
        //                 let total_service_and_item_sales = accessories + spareparts + services;

        //                 $('#accessoriesSale').html(formatNumber(accessories));
        //                 $('#sparePartsSale').html(formatNumber(spareparts));
        //                 $('#serviceSale').html(formatNumber(services));
        //                 $('#expenses').html(formatNumber(expenses));
        //                 $('#total_service_and_item_sales').html(formatNumber(total_service_and_item_sales));
        //                 $('#purchase').html(formatNumber(purchase));
        //             }
        //         });
        //     }
        // }
    </script>
@endsection
