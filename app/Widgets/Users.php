<?php

namespace App\Widgets;

use App\User;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
use Illuminate\Support\Facades\Auth;

class Users extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        //Status 2 es abierto
        //Status 1 esperando trabajador
        $count = User::where("role_id", 2)->count();
        $string = "Usuarios";

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-user',
            'title'  => "{$count} {$string}",
            'text'   => "{$count} Usuarios utilizando Imperium Boost",
            'button' => [
                'text' => ('Ver todos los Usuarios'),
                'link' => route('voyager.users.index'),
            ],
            'image' => voyager_asset('images/widget-backgrounds/01.jpg'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', Voyager::model('Post'));
    }
}
