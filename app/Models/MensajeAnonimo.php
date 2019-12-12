<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MensajeAnonimo extends Model
{
    protected $table = 'mensajes_anonimos';
    protected $fillable = [
        'email',
        'name',
        'mensaje'
    ];
}
