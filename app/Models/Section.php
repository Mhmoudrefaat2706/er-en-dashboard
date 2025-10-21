<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Section extends Model
{
        protected $fillable = ['slug','lang', 'content', 'status'];

    protected $casts = [
        'content' => 'array',
    ];
}
