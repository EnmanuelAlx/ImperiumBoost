<template>
    <v-card>
        <v-img
            :src="`${this.$pathImagenes}/fondo_azul.png`"
        >
            <v-container>
                <v-row>
                    <v-col cols="7">
                        <h5 class="">{{ cuenta.rank }}</h5>
                        <h5 class="">Cola: {{ cuenta.cola }}</h5>
                        <h5 class="">Servidor: {{ cuenta.servidor }}</h5>
                    </v-col>
                    <v-col cols="5">
                        <v-img :src="imagen(cuenta.rank)"
                            max-height="120"
                            max-width="120"
                        />
                    </v-col>
                </v-row>
            </v-container>
        
        </v-img>
        <v-card-title primary-title>
            <div>
                <div><v-icon>undo</v-icon> Season pasada: {{ cuenta.rank_season_anterior || 'Unranked' }}</div>
                <div><v-icon>group</v-icon> Campeones: {{ cuenta.campeones }}</div>
                <div><v-icon>brush</v-icon> Skins: {{ cuenta.skins }}</div>
                <div><v-icon>star</v-icon> RP: {{ cuenta.rp }}</div>
                <div><v-icon>star_half</v-icon> Escencia Azul: {{ cuenta.lp }}</div>
            </div>
        </v-card-title>
        <v-card-actions>
            <v-row>
                <v-col cols="6">
                    <h3 style="color:#D4AF37"><b>{{ cuenta.precio }}$</b></h3>
                </v-col>
                <v-col cols="6">
                        <v-btn color="primary" @click="verifyUser(cuenta)" :loading="loading">Comprar</v-btn>
                </v-col>
            </v-row>
        </v-card-actions>
    </v-card>
</template>

<script>
    export default {
        name: 'Cuenta',
        props: {
            cuenta: {
                type: Object,
            },
        },
        data() {
            return {
                loading: false
            }
        },
        methods: {
            imagen(rank) {
                let rango = rank.replace(/ /g, ""); 
                return `${this.$pathImagenes}/leagues/${rango}.png`
            },
            verifyUser(cuenta){
                let URL = '/verificarUsuario'
                this.loading = true;
                axios.get(URL).then(res=>{
                    this.loading = false;
                    this.$emit('showComponent', cuenta)
                }).catch(err=>{
                    this.loading = false;
                })
            }
        },
    }   
</script>

<style lang="scss" scoped>

</style>