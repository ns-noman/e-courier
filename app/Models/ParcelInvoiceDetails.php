<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParcelInvoiceDetails extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'parcel_invoice_id',
        'item_id',
        'quantity',
        'unit_price',
    ];
}
