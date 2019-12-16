<template>
    <div>
        <div class="card text-left" v-for="chat in chats_anonimos" :key="chat.id">
            <a :href="`/admin/chatAnonimos/${chat[0].email}`">
                <div class="card-body">
                    <h4 class="card-title">Nombre: {{ chat[0].name }}  
                        <button class="btn btn-danger" @click="eliminarConversacion(chat[0].email)">
                            Eliminar
                        </button>
                    </h4>
                    <p class="card-text">
                        <span> Email: {{ chat[0].email }}</span><br>
                    </p>
                </div>
            </a>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
    export default {
        data() {
            return {
                chats_anonimos: [],

            }
        },
        created () {
            // setInterval(() => {
                this.getChats();
            // }, 10000);;
        },
        methods: {
            getChats() {
                axios.get('/admin/getChatsAnonimos')
                .then(res => {
                    console.log(res.data);
                    this.chats_anonimos = res.data
                })
                .catch(err => {
                    console.error(err); 
                })
            },
            eliminarConversacion(email){
                //Eliminar la conversacion por que ya acabo 
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>