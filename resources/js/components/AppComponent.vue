<template>
  <v-app id="inspire">
    <v-navigation-drawer
      v-model="drawer"
      app
      clipped
    >
      <v-list shaped>
        <v-list-item-group :color="`${this.$colors.primary}`">
            <route :to="{name: 'dashboard'}" name="Dashboard" icon="dashboard"/>
        </v-list-item-group>

        
            <v-list-group
            prepend-icon="view_column"
            value="false"
            :color="`${this.$colors.primary}`"
            v-if="role_id == 2"
            >
                <template v-slot:activator>
                    <v-list-item-content>
                    <v-list-item-title>Servicios</v-list-item-title>
                    </v-list-item-content>
                </template>
                <route :to="{name: 'boost'}" name="Elo Boost" icon="trending_up" :link="true"/>
                <route :to="{name: 'maestria'}" name="Maestria de campeón" icon="label_important" :link="true"/>
                <route :to="{name: 'level'}" name="Subir cuenta de nivel" icon="keyboard_arrow_up" :link="true"/>
                <route :to="{name: 'honor'}" name="Subir Honor" icon="whatshot" :link="true"/>
                <route :to="{name: 'baja'}" name="Partidas de baja prioridad" icon="watch" :link="true"/>
                <route :to="{name: 'posicionamiento'}" name="Partidas de posicionamiento" icon="hdr_strong" :link="true"/>
                <route :to="{name: 'cuentas'}" name="Cuentas" icon="contacts" :link="true"/>
            </v-list-group>
        <v-list-item-group :color="`${this.$colors.primary}`">
            <route :to="{name: 'historial'}" name="Historial de Servicios" icon="assignment"/>
            <route :to="{name: 'chat-trabajador'}" name="Chat con el Administrador" icon="chat" v-if="role_id != 2"/>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar
      app
      clipped-left
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>Imperium Boost</v-toolbar-title>
      <v-spacer/>
      <v-menu
        left
        bottom
      >
        <template v-slot:activator="{ on }">
          <v-btn icon v-on="on">
            <v-avatar
              size="40"
            >
                <v-img :src="$store.state.imagen" alt="alt"/>
            </v-avatar>
          </v-btn>
        </template>

        <v-list>
          <route :to="{name: 'modificar'}" name="Modificar Usuario" icon="visibility"/>
          <v-list-item :link="true" @click="logout">
              <v-list-item-action>
                  <v-icon>power_settings_new</v-icon>
              </v-list-item-action>
              <v-list-item-content>
                  <v-list-item-title>
                      Cerrar sesion
                  </v-list-item-title>
              </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-app-bar>

    <v-content>
      <v-img :src="`${pathImagenes}/fondo.png`">
        <v-container
        fluid
        fill-height
        >
          <v-layout
            align-center
            justify-center
          >
            <v-flex>
              <transition
                  name="fadeDown"
                  mode="out-in"
              >
                  <router-view style="animation-duration: 0.2s"></router-view>
              </transition>
            </v-flex>
          </v-layout>
      </v-container>
      </v-img>
    </v-content>
  </v-app>
</template>

<script>
import toastr from "toastr"
import route from './Route.vue'

  export default {
    components: {
        route,
    },
    props: {
      usuario: Object,
      email: String,
      avatar: String,
      role_id: {
        type: Number,
        default: 2
      }
    },
    data: () => ({
      drawer: null,
      pathImagenes: document.head.querySelector('meta[name="imagenes"]').content,
    }),
    created () {
      const path = '../../sonido/sonido.mp3';
      let audio = new Audio(path);
      this.$vuetify.theme.dark = true
      this.$store.state.email = this.email;
      this.$store.state.imagen = this.avatar;
      this.$store.state.role_id = this.role_id;
      this.countryCode();
      this.versionLol();
      window.Echo.private('chat.'+this.usuario.id)
        .listen('.my-event-chat', (e) => {
            console.log('dentro del my-event-chat uysuario');
            console.log(e);
            this.$store.commit('message', e);
      });
      window.Echo.channel('notification.'+this.usuario.id)
      .listen('.notification', (e) => {
          console.log(e);
          audio.play();
          alert(`Te envio un mensaje el administrador por el servicio ${e.trabajo.servicio.tipo}`)
      });
    },
    methods: {
      logout() {
        axios.get('/logout').then(response=>{
            window.location.replace('/');
        })
      },
      versionLol(){
        axios.get('/api/getVersion')
        .then(res => {
          this.$store.state.version = res.data
        })
        .catch(err => {
          console.error(err); 
        })
      },
      countryCode(){
        axios.get('/api/getTasa')
        .then(res=>{
          this.$store.state.subfix = res.data.subfix
          this.$store.state.tasa = res.data.tasa
        })
        .catch(err=>{
          this.$store.state.tasa = 1
        })
      }
    },
  }
</script>

