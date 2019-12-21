<?php

namespace App;

use App\Message;
use App\Trabajo;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends \TCG\Voyager\Models\User
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'puntos'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function getAvatarAttribute($imagen){
        if(!$imagen){
            return \Storage::disk('public')->url('users/default.png');
        }
        return \Storage::disk('public')->url($imagen);
    }

    public function message()
    {
        return $this->hasMany(Message::class);
    }

    public function servicios(){
        return $this->hasMany(Trabajo::class, 'user_id', 'id');
    }

    public function trabajos(){
        return $this->hasMany(Trabajo::class, 'trabajador_id', 'id');
    }

    public function trabajosActivos(){
        return Trabajo::where('status', '!=', -1)->where('status', '!=', 3)->where('trabajador_id', $this->id)->get();
    }
}
