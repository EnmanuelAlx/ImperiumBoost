<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cupon extends Model
{
    protected $table = "cupones";

    public function trabajo()
    {
        return $this->belongsTo(Trabajo::class, 'cupon_id', 'id');
    }
}
