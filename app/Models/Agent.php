<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Agent extends Model
{
    use HasFactory;

    protected $fillable = 
    [
        'branch_id',
        'name',
        'email',
        'contact',
        'address',
        'current_balance',
        'is_default',
        'status',
    ];
    public function branch()
    {
        return $this->belongsTo(Branch::class, 'branch_id')->select('id', 'title');
    }
}
