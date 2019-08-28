import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({
    state:{
        name: 'Zeirt',
        server: 'la1',
        imagen: '',
        email: '',
        version: '',
        role_id: '',
    },
})