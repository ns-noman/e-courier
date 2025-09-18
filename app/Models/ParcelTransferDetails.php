<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParcelTransferDetails extends Model
{
    use HasFactory;
    protected $fillable = [
        'parcel_transfer_id',
        'shipment_box_id',
        'invoice_id',
        'note',
    ];
}
