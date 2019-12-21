<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Saldo extends Model
{
    protected $fillable = [
        'saldo',
        'user_id',
        'trabajo_id'

    ];
}
