<template>
    <v-card>
        <v-card-text>
            <div class="text-center">
                <h3 class="headline mb-0" v-html="servicio.nota.replace(/\n/g, '<br>')"></h3>
            </div>

            <v-container>
                <v-row>
                    <v-col class="text-center"><span >Productos cancelados</span></v-col>
                </v-row>
                <v-row justify="center">
                    <v-col cols="4" v-for="producto in servicio.productos" :key="producto.id">
                        <v-img
                            max-height="200"
                            max-width="200"
                            aspect-ratio="1"
                            :src="producto.imagen"
                        />
                    </v-col>
                </v-row>
                <v-row>
                    <v-col class="headline text-center">
                        <span>
                            Precio: {{ servicio.monto }}$
                        </span>
                    </v-col>
                </v-row>
            </v-container>
        </v-card-text>
        <v-card-actions>
            <v-container>
                <v-row>
                    <v-col class="text-center">
                        <v-btn :color="this.$colors.primary" @click="dialog=true"><v-icon>chat</v-icon></v-btn>
                        <v-btn color="red" @click="$emit('closeModal')"><v-icon>close</v-icon></v-btn>
                    </v-col>
                </v-row>
                <chat
                    v-if="dialog"
                    :dialog="dialog"
                    :trabajo="servicio"
                    :user="$store.state.email"
                    @closeChat="closeChat"
                />
            </v-container>
        </v-card-actions>
    </v-card>
</template>

<script>
import chat from './Chat'
    export default {
        name:"ModalServicio",
        components: {
            chat,
        },
        props: {
            servicio: {
                type: Object,
            },
        },
        data() {
            return {
                dialog: false,
            }
        },
        methods: {
            closeChat() {
                this.dialog=false;
            }
        },
    }
</script>
