<?php

namespace App\Widgets;

use App\Trabajo;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
use Illuminate\Support\Facades\Auth;

class Trabajos extends BaseDimmer
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
        $count = Trabajo::whereIn("status", array(0, 1, 2))->count();
        $string = "Trabajos";

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-hammer',
            'title'  => "{$count} {$string}",
            'text'   => "Tienes {$count} Trabajos pendientes por revisar",
            'button' => [
                'text' => ('Ver los trabajos pendientes'),
                'link' => route('voyager.trabajos.index'),
            ],
            'image' => voyager_asset('images/widget-backgrounds/02.jpg'),
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
