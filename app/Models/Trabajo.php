<?php

namespace App;

use App\MetodoPago;
use Illuminate\Database\Eloquent\Model;

class Trabajo extends Model
{
    protected $fillable = [
        'nota', 'monto', 'servicio_id', 'user_id', 'trabajador_id', 'cupon_id', 'metodo_id', 'cuenta', 'servidor', 'nota_cliente'
    ];

    public function cupon()
    {
        return $this->hasOne(Cupon::class, 'cupon_id', 'id');
    }

    public function servicio()
    {
        return $this->belongsTo(Servicio::class, 'servicio_id', 'id');
    }

    public function trabajador()
    {
        return $this->hasOne(User::class, 'id', 'trabajador_id');
    }
 
    public function adicionales()
    {
        return $this->belongsToMany(Adicional::class, 'adicional_trabajos', 'trabajo_id', 'adicional_id');
    }
   
    public function productos()
    {
        return $this->belongsToMany(Producto::class, 'producto_trabajos', 'trabajo_id', 'producto_id');
    }

    public function metodoPago()
    {
        return $this->hasOne(MetodoPago::class, 'metodo_id', 'id');
    }
}
