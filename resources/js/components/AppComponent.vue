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
                <v-img :src="avatar" alt="alt"/>
            </v-avatar>
          </v-btn>
        </template>

        <v-list>
          <v-list-item>
            <v-list-item-title>Modificar Usuario</v-list-item-title>
          </v-list-item>
          <v-list-item>
            <v-list-item-title @click="logout">Cerrar sesion</v-list-item-title>
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
import route from './Route.vue'
  export default {
    components: {
        route,
    },
    props: {
      email: String,
      avatar: String,
    },
    data: () => ({
      drawer: null,
      pathImagenes: document.head.querySelector('meta[name="imagenes"]').content,
    }),
    created () {
      this.$vuetify.theme.dark = true
      this.versionLol()
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
      }
    },
  }
</script>

