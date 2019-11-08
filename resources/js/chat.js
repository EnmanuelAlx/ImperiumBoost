let token = document.head.querySelector('meta[name="csrf-token"]');

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
window.Echo.channel('chat')
.listen('.my-event-chat', (e) => {
    console.log(e);
});