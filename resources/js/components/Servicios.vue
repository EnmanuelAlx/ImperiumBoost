<template>
    <v-container>
        <v-row>
            <v-col cols="12" v-for="servicio in servicios" :key="servicio.id">
                <servicio
                    :servicio="servicio"
                />
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
import Servicio from './Servicio'
    export default {
        name:"Servicios",
        components: {
            Servicio,
        },
        props: {
            servicios: {
                type: Array,
            },
        },
        data() {
            return {
                
            }
        },
        methods: {
            
        },
    }
</script>

<style lang="scss" scoped>

</style>