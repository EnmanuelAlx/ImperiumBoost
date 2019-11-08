<?php

namespace App;

use App\Trabajo;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $table = "mensajes_de_trabajo";
    protected $fillable = ['message', 'image', 'read' ,'trabajo_id', 'from'];

    public function trabajo()
    {
        return $this->belongsTo(Trabajo::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'from', 'id');
    }


    public function getImageAttribute($imagen){
        if(!$imagen){
            return null;
        }
        return \Storage::disk('public')->url($imagen);
    }
}
