<?php

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('chat.{seder}', function ($user, $seder) {
    return true;
});

Broadcast::channel('notification.{usuario}', function ($user, $usuario) {
    return true;
});