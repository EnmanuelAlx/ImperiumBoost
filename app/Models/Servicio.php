<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Servicio extends Model
{
    protected $fillable = ['tipo', 'descripcion'];

    public function productos()
    {
        return $this->hasMany(Producto::class);
    }

    public function trabajos()
    {
        return $this->hasMany(Trabajo::class);
    }
}
