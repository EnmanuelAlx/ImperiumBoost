<?php

namespace App\Widgets;

use App\User;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
use Illuminate\Support\Facades\Auth;

class Trabajadores extends BaseDimmer
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
        $count = User::where("role_id", 3)->count();
        $string = "Trabajadores";

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-user',
            'title'  => "{$count} {$string}",
            'text'   => "{$count} Trabajadores de Imperium Boost",
            'button' => [
                'text' => ('Ver todos los Usuarios'),
                'link' => route('voyager.users.index'),
            ],
            'image' => voyager_asset('images/widget-backgrounds/03.jpg'),
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
