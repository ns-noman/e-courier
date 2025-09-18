<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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

    /**
     * From Branch relation
     */
    public function fromBranch()
    {
        return $this->belongsTo(Branch::class, 'from_branch_id');
    }

    /**
     * To Branch relation
     */
    public function toBranch()
    {
        return $this->belongsTo(Branch::class, 'to_branch_id');
    }

    /**
     * Created by relation (admin user who created)
     */
    public function creator()
    {
        return $this->belongsTo(Admin::class, 'created_by_id');
    }

    /**
     * Received by relation (admin user who received)
     */
    public function receiver()
    {
        return $this->belongsTo(Admin::class, 'received_by_id');
    }
}
