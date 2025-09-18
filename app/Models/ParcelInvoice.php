<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParcelInvoice extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        // Payment Information
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

        // Shipment Information
        'hawb_no',
        'reference',
        'pieces',
        'product_value',
        'billing_weight_kg',
        'billing_weight_gm',
        'gross_weight_kg',
        'payment_mode',
        'cod_amount',
        'item_type',
        'all_item_names',
        'item_description',

        'length',
        'height',
        'width',
        'weight',

        // Sender Information
        'sender_name',
        'sender_company',
        'sender_address',
        'sender_city',
        'sender_zip',
        'sender_country_id',
        'sender_phone',
        'sender_email',

        // Receiver Information
        'receiver_name',
        'receiver_company',
        'receiver_address',
        'receiver_city',
        'receiver_zip',
        'receiver_country_id',
        'receiver_phone',
        'receiver_email',

        // Booking/Export Date
        'booking_date',
        'export_date',

        // Service Information
        'from_branch_id',
        'to_branch_id',
        'current_branch_id',
        'agent_id',
        'hub_id',
        'flight_id',
        'service_id',
        'payment_type',
        'usa_country_code',

        // Others
        'picked_up_by',
        'picked_up_date_time',
        'mawb_no',
        'remarks',
        'updated_by_id',
        'showing_weight_kgs',
        'showing_weight_gms',
        'showing_weight_kgs_total',
        'created_by_id',

        'is_packed',
        'payment_status',
        'parcel_status',
    ];

}
