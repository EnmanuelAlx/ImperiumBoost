import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({
    state:{
        name: '',
        server: '',
        imagen: '',
        email: '',
        version: '',
        role_id: '',
        subfix: '',
        tasa: 1,
        message:{
            user: '',
            message: ''
        }
    },
    mutations:{
        message(state, event){
            state.message.user  = event.user;
            state.message.message = event.message;
        }
    }
})