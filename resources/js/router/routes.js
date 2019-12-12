import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)
export default new Router({
    routes:[
        {
            path: '/home',
            name: 'home',
            component: require('../views/Home').default,
        },
        {
            path: '/',
            name: 'dashboard',
            component: require('../views/Dashboard').default,
        },
        {
            path: '/boost',
            name: 'boost',
            component: require('../views/Boost').default,
        },
        {
            path: '/maestria-campeon',
            name: 'maestria',
            component: require('../views/Maestria').default,
        },
        {
            path: '/level',
            name: 'level',
            component: require('../views/Level').default,
        },
        {
            path: '/honor',
            name: 'honor',
            component: require('../views/Honor').default,
        },
        {
            path: '/baja-prioridad',
            name: 'baja',
            component: require('../views/BajaPrioridad').default,
        },
        {
            path: '/posicionamiento',
            name: 'posicionamiento',
            component: require('../views/Posicionamiento').default,
        },
        {
            path: '/cuentas',
            name: 'cuentas',
            component: require('../views/Cuentas').default,
        },
        {
            path: '/modificar',
            name: 'modificar',
            component: require('../views/ModificarUsuario').default,
        },
        {
            path: '/historial',
            name: 'historial',
            component: require('../views/Historial').default,
        },
        {
            path: '/chat-trabajador',
            name: 'chat-trabajador',
            component: require('../views/ChatTrabajador').default,
        },

    ]
});
