<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    public function trabajos()
    {
        return $this->belongsToMany(Trabajo::class, 'producto_trabajos', 'producto_id', 'trabajo_id');
    }

    public function getImagenAttribute($imagen){
        if(!$imagen){
            return asset('images/logo.png');
        }
        return \Storage::disk('public')->url($imagen);
    }
}
