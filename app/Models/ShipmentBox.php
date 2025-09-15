<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShipmentBox extends Model
{
    use HasFactory;
    protected $fillable = [
        'box_id',
        'shipment_no',
        'from_branch_id',
        'to_branch_id',
        'is_loaded',
        'status',
    ];
    public function shipmentBoxItems()
    {
        return $this->hasMany(ShipmentBoxItem::class, 'box_shipment_id')->with('invoice')->select([
            'id',
            'box_shipment_id',
            'invoice_id',
        ]);
    }

}
