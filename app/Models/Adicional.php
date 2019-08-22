<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Adicional extends Model
{
    protected $table = 'adicionales';

    public function trabajos()
    {
        return $this->belongsToMany(Trabajo::class, 'adicionales_trabajos', 'adicional_id', 'trabajo_id');
    }
}
