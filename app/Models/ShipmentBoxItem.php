<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShipmentBoxItem extends Model
{
    protected $fillable = [
        'box_shipment_id',
        'invoice_id',
    ];

    public function invoice()
    {
        // Each item belongs to ONE invoice
        return $this->belongsTo(ParcelInvoice::class, 'invoice_id', 'id')
                    ->select('id', 'invoice_no'); 
    }
}
