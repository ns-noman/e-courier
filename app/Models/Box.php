<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Box extends Model
{
    use HasFactory;
    protected $fillable = 
    [
        'box_name',
        'box_code',
        'box_type',
        'height_cm',
        'width_cm',
        'length_cm',
        'volume_weight',
        'box_weight',
        'total_weight',
        'cbm',
        'status',
    ];
}
