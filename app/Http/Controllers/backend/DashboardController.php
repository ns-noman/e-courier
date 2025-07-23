<?php

namespace App\Http\Controllers\backend;

use App\Models\BasicInfo;
use App\Models\BikePurchase;
use App\Models\Expense;
use App\Models\Sale;
use App\Models\Purchase;
use App\Models\BikeProfitShareRecords;
use App\Models\InvestorTransaction;
use App\Models\Investor;
use App\Models\Account;
use App\Models\PartyLoan;
use App\Models\BikeServiceRecord;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Auth;

class DashboardController extends Controller
{
    protected $breadcrumb;

    public function __construct()
    {
        $this->breadcrumb = ['title' => 'Dashboard'];
    }

    public function index()
    {
        $data['breadcrumb'] = $this->breadcrumb;
        $investor_id = Auth::guard('admin')->user()->investor_id;

        $data['basicInfo'] = BasicInfo::first()->toArray();


        $data['investorProfitPayment'] = BikeProfitShareRecords::where('status', 1)
                                ->whereDate('date', date('Y-m-d'))
                                ->sum('amount');
        $data['newinvestments'] = InvestorTransaction::where(['status'=> 1])
                                ->whereDate('transaction_date', date('Y-m-d'))
                                ->sum('credit_amount');
        $data['investmentwithdrawal'] = InvestorTransaction::where(['transaction_type'=> 0,'status'=> 1])
                                ->whereDate('transaction_date', date('Y-m-d'))
                                ->sum('debit_amount');
        $data['investors_capital'] = Investor::where(['is_self'=>0, 'status'=> 1])
                                    ->sum('investment_capital');
                                    
                                    
        $data['my_capital'] = Investor::find(Auth::guard('admin')->user()->investor_id)->investment_capital ?? 0;
        $data['my_available_balance'] = Investor::find(Auth::guard('admin')->user()->investor_id)->balance ?? 0;

        $data['totalExpenses_exp'] = Expense::where('status', 1)->sum('total_amount');
        $data['totalPurchase_exp'] = Purchase::where('status', 1)->sum('total_payable');
        $data['totalSale_inc'] = Sale::where('status', 1)->sum('total_payable');
        $data['stockValueItem'] = $this->stockValue();
        $data['allAccountBalance'] = $this->allAccountBalance();
        $data['totalLoanReceiveable'] = PartyLoan::where(['loan_type'=>0, 'status'=> 1])->where('payment_status','!=',1)->select(DB::raw('SUM(amount-paid_amount) as due'))->value('due');
        $data['totalLoanPayable'] = PartyLoan::where(['loan_type'=>1, 'status'=> 1])->where('payment_status','!=',1)->select(DB::raw('SUM(amount-paid_amount) as due'))->value('due');
        return view('backend.index', compact('data'));
        
    }

    public function summeryData($dateRange)
    {
        $dateRange = explode(' - ', $dateRange);
        $fromDate = Carbon::createFromFormat('m_d_Y', $dateRange[0])->toDateString();
        $toDate   = Carbon::createFromFormat('m_d_Y', $dateRange[1])->toDateString();

        $data['purchase'] = Purchase::where('status', 1)
            ->whereBetween('date', [$fromDate, $toDate])
            ->sum('total_payable');
        $data['expenses'] = Expense::where('status', 1)
            ->whereBetween('date', [$fromDate, $toDate])
            ->sum('total_amount');

        $data['accessories'] = Sale::join('sale_details', 'sale_details.sale_id', '=', 'sales.id')
            ->join('items', 'items.id', '=', 'sale_details.item_id')
            ->where(['sales.status'=> 1, 'sale_details.item_type'=> 0])
            ->where('items.cat_type_id', 1)
            ->whereBetween('sales.date', [$fromDate, $toDate])
            ->select(DB::raw('SUM(sale_details.quantity * sale_details.net_sale_price) as total'))
            ->value('total');

        $data['spareparts'] = Sale::join('sale_details', 'sale_details.sale_id', '=', 'sales.id')
            ->join('items', 'items.id', '=', 'sale_details.item_id')
            ->where(['sales.status'=> 1, 'sale_details.item_type'=> 0])
            ->where('items.cat_type_id', 2)
            ->whereBetween('sales.date', [$fromDate, $toDate])
            ->select(DB::raw('SUM(sale_details.quantity * sale_details.net_sale_price) as total'))
            ->value('total');

        $data['services'] = Sale::join('sale_details', 'sale_details.sale_id', '=', 'sales.id')
            ->where(['sales.status'=> 1, 'sale_details.item_type'=> 1])
            ->whereBetween('sales.date', [$fromDate, $toDate])
            ->select(DB::raw('SUM(sale_details.quantity * sale_details.net_sale_price) as total'))
            ->value('total');
        return response()->json($data, 200);
    }
    public function allAccountBalance()
    {
        return Account::where('status',1)->sum('balance');
    }
    public function stockValue()
    {
        return DB::table('items')
            ->where('status', 1)
            ->select(DB::raw('SUM(current_stock * purchase_price) as stockvalue'))
            ->value('stockvalue');
    }

}
