<template>
    <v-app>
        <div class="card text-left" v-if="usuario">
        <h4 class="card-header text-white" style="background-color: #3F3F3F;">Chat con: {{ usuario.name }}</h4>
        
        <div class="card-body" style="overflow-y: auto; max-height: 450px;">
            <div v-for="mensaje in mensajes" :key="mensaje.id">
                <div class="text-left" v-if="mensaje.user.role_id != '1'" style="margin: 10px">
                    <!-- <p class="card-text">{{ mensaje.user.name }}: {{ mensaje.message }} </p> -->
                    <v-chip
                        class="ma-2 text-white"
                        :color="$colors.primary"
                        >
                        <v-avatar left>
                            <v-icon>account_circle</v-icon>
                        </v-avatar>
                        {{ mensaje.user.name }}: {{ mensaje.message }}
                    </v-chip>
                    <div v-if="mensaje.image">
                        <v-img :src="mensaje.image"/>
                    </div>
                </div>
                <div class="text-right" style="margin: 10px" v-else>
                    <v-chip
                        class="ma-2"
                        color="#D8D8D8"
                    >
                        <v-avatar left>
                            <v-icon>account_circle</v-icon>
                        </v-avatar>
                        <span style="color: black">
                            {{ mensaje.user.name }}: <span v-if="!mensaje.image">{{ mensaje.message }}</span>                                    
                        </span>
                    </v-chip>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="row">
                <div class="col-md-11">
                    <v-text-field
                        style="margin-top: 10px"
                        label="Escriba un mensaje"
                        outlined
                        v-model="mensaje"
                        append-icon="send"
                        @keyup.enter="send"
                        @click:append="send"

                    />
                </div>
            </div>
        </div>        
    </div>
    </v-app>
</template>

<script>
    export default {
        props: {
            usuario:{
                type: Object
            },
        },
        data() {
            return {
                mensajes:[],
                mensaje: '',
                menu: false,
            }
        },
        beforeDestroy(){
            this.subscribe();
        },
        mounted () {
            this.fetchMessages();
            this.subscribe = this.$store.subscribe((mutation, state) => {
                if(mutation.type == 'message'){
                    this.mensajes.push(this.$store.state.message.message)
                }
            })


            window.Echo.private('chat.'+this.usuario.id)
            .listen('.my-event-chat', (e) => {
                this.$store.commit('message', e);
                console.log('dentro del my-event-chat');
                console.log(e);
            });
        },
        methods: {
            send () {
                axios.post('/admin/messages/trabajador', {
                    'message' : this.mensaje,
                    'usuario' : this.usuario
                })
                .then(res => {
                    // this.mensajes.push(res.data);
                    this.mensaje = ''
                });
            },
            fetchMessages() {
                axios.get(`/messages/trabajador/${this.usuario.id}`)
                .then(res => {
                    console.log(res.data);
                    this.mensajes = res.data
                })
            },
            
        },

    }
</script>
