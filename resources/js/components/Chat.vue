<template>
    <v-row>
        <v-dialog
            v-model="dialog"
            fullscreen hide-overlay transition="dialog-bottom-transition"
        >
            <v-card>
                <v-toolbar dark color="primary">
                    <v-btn icon dark @click="$emit('closeChat')">
                        <v-icon>close</v-icon>
                    </v-btn>
                    <v-toolbar-title>Chat con el Administrador</v-toolbar-title>
                </v-toolbar>

                <v-card-text style="overflow-y: auto; max-height: 550px;">
                    
                        <div v-for="mensaje in messages" :key="mensaje.id">
                            <div class="text-left" v-if="mensaje.user.role_id != '1'" style="margin: 10px">
                                <!-- <p class="card-text">{{ mensaje.user.name }}: {{ mensaje.message }} </p> -->
                                <v-chip
                                    class="ma-2 text-white"
                                    :color="$colors.primary"
                                    >
                                    <v-avatar left>
                                        <v-icon>account_circle</v-icon>
                                    </v-avatar>
                                    {{ mensaje.user.name }}: <span v-if="!mensaje.image">{{ mensaje.message }}</span>
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
                                <div v-if="mensaje.image">
                                    <v-img :src="mensaje.image"/>
                                </div>
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
                                @keyup.enter="sent"
                            />
                        </v-col>
                        <v-col cols="1">
                            <v-file-input
                                v-model="archivo"
                                @change="onDrop"
                            />
                        </v-col>
                    </v-row>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-row>
</template>

<script>
    export default {
        name:'chat',
        props: {
            dialog: {
                type: Boolean,
                default: false,
            },
            trabajo:{
                type: Object
            },
            user:{
                type: String
            }
        },
        data() {
            return {
                messages: [],
                message: '',
                subscribe: '',
                archivo: null,
            }
        },
        beforeDestroy(){
            this.subscribe();
        },
        mounted() {
            this.fetchMessages();
            this.subscribe = this.$store.subscribe((mutation, state) => {
                if(mutation.type == 'message'){
                    this.messages.push(this.$store.state.message.message)
                }
            })
        },
        methods: {
            sent () {
                axios.post('/messages', {
                    'message' : this.message,
                    'trabajo' : this.trabajo
                })
                .then(res => {
                    this.messages.push(res.data);                    
                    this.message = ''
                });
            },
            fetchMessages() {
                axios.get(`/messages/${this.trabajo.id}`)
                .then(res => {
                    console.log(res.data);
                    this.messages = res.data
                })
            },
            onDrop(){
                const fd = new FormData();
                fd.append('files', this.archivo)
                fd.append('trabajo', this.trabajo.id);
                axios.post('/messages-files',fd)
                .then(res => {
                    // this.messages.push(res.data);                    
                    // this.message = ''
                });
                  // Can get access to things like file name and size
            }
        }
    }
</script>

