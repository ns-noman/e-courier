<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParcelInvoiceDetails extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'sale_id',
        'item_name',
        'quantity',
        'unit_price',
    ];
}
