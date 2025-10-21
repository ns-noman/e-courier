<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParcelInvoice extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'invoice_no',
        'total_price',
        'vat_tax',
        'discount_method',
        'discount_rate',
        'discount',
        'total_payable',
        'paid_amount',
        'reference_number',
        'note',
        'reference',
        'pieces',
        'product_value',
        'payment_mode',
        'item_type',
        
        'length',
        'height',
        'width',
        'gross_volume_weight',
        'gross_physical_weight',
        'gross_billing_weight',

        'sender_name',
        'sender_company',
        'sender_address',
        'sender_city',
        'sender_zip',
        'sender_country_id',
        'sender_phone',
        'sender_email',

        'receiver_name',
        'receiver_company',
        'receiver_address',
        'receiver_city',
        'receiver_zip',
        'receiver_country_id',
        'receiver_phone',
        'receiver_email',

        'booking_date',
        'export_date',
        'from_branch_id',
        'to_branch_id',
        'current_branch_id',
        'agent_id',
        'service_id',
        'picked_up_by',
        'picked_up_date_time',
        'mawb_no',
        'remarks',
        'updated_by_id',
        'created_by_id',
        'is_packed',
        'payment_status',
        'parcel_status',
    ];

}
