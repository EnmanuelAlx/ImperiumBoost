<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CuentasCompradas extends Model
{
    protected $table = 'cuentas_compradas';
    protected $fillable = [
        'cuenta_id',
        'metodo_id',
        'precio',
        'user'
    ];
}
