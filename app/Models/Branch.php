<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'parent_id',
        'branch_type',
        'title',
        'code',
        'phone',
        'address',
        'is_main_branch',
        'commission_percentage',
        'status',
        'created_by_id',
        'updated_by_id',
    ];
    public function children()
    {
        return $this->hasMany(Branch::class, 'parent_id')->where('status',1)->orderBy('title','asc');
    }


}
