<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

class ParcelTransfer extends Model
{
    use HasFactory;

    protected $fillable = [
        'parcel_transfer_no',
        'from_branch_id',
        'to_branch_id',
        'transfer_date',
        'status',
        'is_received',
        'note',
        'created_by_id',
        'received_by_id',
    ];


    public function fromBranch()
    {
        return $this->belongsTo(Branch::class, 'from_branch_id');
    }

    public function toBranch()
    {
        return $this->belongsTo(Branch::class, 'to_branch_id');
    }

    public function creator()
    {
        return $this->belongsTo(Admin::class, 'created_by_id');
    }

    public function receiver()
    {
        return $this->belongsTo(Admin::class, 'received_by_id');
    }
    public function parcelTransferDetails()
    {
        return $this->hasMany(ParcelTransferDetails::class, 'parcel_transfer_id')->with('boxes')->select([
            'id',
            'shipment_box_id',
        ]);
    }

}
