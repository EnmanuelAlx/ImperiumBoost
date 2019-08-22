<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MetodoPago extends Model
{
    public function getImagenAttribute($imagen){
        if(!$imagen){
            return "";
        }
        return \Storage::disk('public')->url($imagen);
    }
}
