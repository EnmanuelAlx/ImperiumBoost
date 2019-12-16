<template>
    <v-row>
        <v-row>
            <v-col cols="12" class="text-right">
                <v-menu
                    v-model="menu"
                    :close-on-content-click="false"
                    :nudge-width="200"
                    offset-x
                    transition="slide-x-transition"
                >
                    <template v-slot:activator="{ on }">
                        <v-btn
                            color="orange"
                            fab
                            v-on="on"
                            >
                            <v-icon>chat</v-icon>
                        </v-btn>
                    </template>

                    <v-card shaped>
                        <v-card-title>
                           <v-content>
                                <v-row>
                                    <v-col cols="12">
                                        <h3>Chat con el administrador</h3>
                                        <button @click="fetchMessages">hasd</button>
                                    </v-col>
                                </v-row>
                                <v-row>
                                    <v-col cols="12">
                                        <v-text-field
                                            name="email"
                                            label="Correo"
                                            outlined
                                            v-model="email"
                                        ></v-text-field>
                                        <v-text-field
                                            name="nombre"
                                            label="Nombre"
                                            outlined
                                            v-model="name"
                                        ></v-text-field>
                                    </v-col>
                                </v-row>
                           </v-content>
                        </v-card-title>
                        <v-divider></v-divider>
                        <v-card-text style="overflow-y: auto; max-height: 450px;">
                    
                            <div v-for="mensaje in mensajes" :key="mensaje.id">
                                <div class="text-left" v-if="mensaje.admin != '1'" style="margin: 10px">
                                    <!-- <p class="card-text">{{ mensaje.user.name }}: {{ mensaje.message }} </p> -->
                                    <v-chip
                                        class="ma-2 text-white"
                                        :color="$colors.primary"
                                        >
                                        <v-avatar left>
                                            <v-icon>account_circle</v-icon>
                                        </v-avatar>
                                        {{ mensaje.name }}: <span>{{ mensaje.mensaje }}</span>
                                    </v-chip>
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
                                            {{ mensaje.name }}: <span>{{ mensaje.mensaje }}</span>                                    
                                        </span>
                                    </v-chip>
                                </div>
                            </div>
                    </v-card-text>
                        <v-card-actions>
                            <v-row class="text-center">
                                <v-col cols="11" align-self="center">
                                    <v-text-field
                                        v-model="message"
                                        outlined
                                        append-icon="send"
                                        @keyup.enter="send"
                                        @click:append="send"
                                    />
                                </v-col>
                            </v-row>
                        </v-card-actions>
                    </v-card>
                    </v-menu>
            </v-col>
        </v-row>
    </v-row>
</template>

<script>
    export default {
        name: 'Public chat',
        data() {
            return {
                fav: true,
                menu: false,
                hints: true,
                message: '',
                email: '',
                name: 'Anonimo',
                mensajes: [],
            }
        },
        created () {
            setInterval(() => {
                this.fetchMessages();
            }, 1000);
        },
        methods: {
            send() {
                if(!this.email){
                    alert('Ingrese un correo para identificarse');
                    return;
                }
                if(!this.message){
                    return;
                }
                axios.post('/message-guest', {
                    'mensaje' : this.message,
                    'email': this.email,
                    'name': this.name
                })
                .then(res => {
                    console.log(res.data);
                    this.mensajes.push(res.data);                    
                    this.message = ''
                });
            },
            fetchMessages() {
                axios.get(`/messages/anonimos/${this.email}`)
                .then(res => {
                    this.mensajes = res.data
                })
            },
        },
    }
</script>

<style lang="scss" scoped>

</style>