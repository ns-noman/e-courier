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
        'current_branch_id',
        'to_branch_id',
        'is_packed',
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

    public function fromBranch()
    {
        return $this->belongsTo(Branch::class, 'from_branch_id')->select(['id', 'title']);
    }

    public function toBranch()
    {
        return $this->belongsTo(Branch::class, 'to_branch_id')->select(['id', 'title']);
    }

    public function currentBranch()
    {
        return $this->belongsTo(Branch::class, 'current_branch_id')->select(['id', 'title']);
    }
    

}
