let token = document.head.querySelector('meta[name="csrf-token"]');
const path = '../sonido/sonido.mp3';
import toastr from 'toastr'
import Echo from 'laravel-echo';
window.Pusher = require('pusher-js');

window.Echo = new Echo({
    broadcaster: 'pusher',
    key: process.env.MIX_PUSHER_APP_KEY,
    cluster: process.env.MIX_PUSHER_APP_CLUSTER,
    encrypted: false,
    forceTLS: true,
    auth: {
        headers: {
            'X-CSRF-TOKEN': token.content
        }
    }
});

let audio = new Audio(path);
window.Echo.channel('notification.1')
.listen('.notification', (e) => {
    console.log(e);
    audio.play();
    if(e.message.user.name){
        toastr.success(`Te envio un mensaje ${e.message.user.name} por el servicio ${e.trabajo.servicio.tipo}`);
    }else{
        toastr.success(`Te llego un mensaje anonimo`);
    }
});