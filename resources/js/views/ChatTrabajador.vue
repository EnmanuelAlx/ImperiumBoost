<template>
    <v-row>
        <v-col cols="12">
            <v-card min-height="800">
                <v-toolbar dark color="primary">
                    <v-toolbar-title>Chat con el Administrador</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <a href="https://wa.me/584147650847" target="_blank" rel="noopener noreferrer">
                        <v-img
                            :src="`${this.$pathImagenes}/Whatsapp_icon.png`"
                            max-height="64"
                            max-width="50"
                        />
                    </a>
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
                    <v-container>
                        <v-row class="text-center">
                            <v-col cols="12" align-self="center">
                                <v-text-field
                                    v-model="message"
                                    outlined
                                    append-icon="send"
                                    @keyup.enter="send"
                                    @click:append="send"

                                />
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-actions>
            </v-card>
        </v-col>
    </v-row>
</template>

<script>
    export default {
        name:'chatTrabajador',
        data() {
            return {
                messages: [],
                message: '',
                subscribe: '',
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
            send () {
                axios.post('/admin/messagesToAdmin', {
                    'message' : this.message,
                })
                .then(res => {
                    // this.messages.push(res.data);                    
                    this.message = ''
                });
            },
            fetchMessages() {
                axios.post(`/admin/fetchWorkerMessage`)
                .then(res => {
                    console.log(res.data);
                    this.messages = res.data
                })
            },
        }
    }
</script>

<style lang="scss" scoped>

</style>