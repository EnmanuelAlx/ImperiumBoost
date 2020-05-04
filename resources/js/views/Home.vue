<template>
    <v-app>
      <v-container
        fluid
        fill-height
      >
        <v-layout
          align-center
          justify-center
        >
          <v-flex
            xs12
            sm8
            md4
          >
            <v-card class="elevation-12">
              <v-toolbar
                color="primary"
                dark
                flat
              >
            <v-toolbar-title>Loguearse</v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-form v-model="valid">
                  <v-text-field
                    label="Email"
                    name="Email"
                    prepend-icon="fa-user"
                    type="text"
                    :rules="emailRules"
                    required
                    v-model="user.email"
                  ></v-text-field>

                  <v-text-field
                    id="password"
                    label="Password"
                    name="password"
                    prepend-icon="fa-user-secret"
                    type="password"
                    :rules="[v => !!v || 'Porfavor escribe tu contraseña',]"
                    required
                    v-model="user.password"
                    @keyup.enter="login"
                  ></v-text-field>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="primary" :disabled="!valid" @click="login" @keyup.enter="login">Login</v-btn>
              </v-card-actions>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
      <v-container fluid>
        <public-chat></public-chat>  
      </v-container>
      <v-overlay :value="overlay">
        <v-progress-circular indeterminate size="64"></v-progress-circular>
      </v-overlay>
    </v-app>
</template>

<script>
import axios from "axios";
  export default {
    props: {
      source: {
        type: String,
      },
    },
    data() {
      return {
        valid: true,
        drawer: null,
        user:{
          email:'',
          password:''
        },
        emailRules:[
          v => !!v || 'Porfavor escribe tu email',
          v => /.+@.+\..+/.test(v) || 'El email es invalido',
        ],
        overlay: false,
      }
    },
    created () {
      this.$vuetify.theme.dark = true;
    },
    methods: {
      login() {
        let token = document.head.querySelector('meta[name="csrf-token"]');
        
        this.overlay = true;
        axios.post("admin/login",this.user, {
          headers: { 'X-CSRF-TOKEN': token.content}
        })
        .then(res => {
          console.log(this.source);
          this.overlay = false;
          window.location = this.source
        })
        .catch(err => {
          this.overlay=false;
          console.error(err); 
        })
      }
    },
    
  }
</script>
