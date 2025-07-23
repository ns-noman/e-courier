<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParcelInvoice extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'created_branch_id',
        'current_branch_id',
        'agent_id',
        'invoice_no',
        'date',
        'total_price',
        'vat_tax',
        'discount_method',
        'discount_rate',
        'discount',
        'total_payable',
        'paid_amount',
        'reference_number',
        'note',

        'sender_name',
        'sender_phone',
        'sender_post_code',
        'sender_address',
        
        'receiver_name',
        'receiver_phone',
        'receiver_post_code',
        'receiver_address',
        'receiver_country_id',

        'created_by_id',
        'updated_by_id',
        'payment_status',
        'parcel_status',
    ];
}
