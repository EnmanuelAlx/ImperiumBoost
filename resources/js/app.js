/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
require('vue2-animate/dist/vue2-animate.min.css')


import Vue from 'vue'
import Vuetify from 'vuetify'
import router from './router/routes'
import store from './store'

import 'vuetify/dist/vuetify.min.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'

Vue.use(Vuetify)

// Vue.component('admin-trabajo', require('./components/Trabajos.vue').default);
Vue.component('home', require('./views/Home').default);
Vue.component('app-usuario', require('./components/AppComponent.vue').default);
Vue.component('chatAdmin', require('./components/ChatAdmin.vue').default);
Vue.component('chatTrabajadorAdmin', require('./components/ChatTrabajadorAdmin.vue').default);
Vue.component('PublicChat', require('./components/PublicChat.vue').default);

Vue.prototype.$pathImagenes = "http://localhost:8000/imagenes"
Vue.prototype.$colors = {
    primary: '#9E2FB9',
    success: '#ffffff',
};
const app = new Vue({
    el: '#app',
    router,
    store,
    vuetify: new Vuetify({
        icons: {
            iconfont: 'md',
        },
    }),
    
});
