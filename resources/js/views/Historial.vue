<template>
    <v-container>
        <v-row>
            <v-col>
                <v-overlay :value="overlay" absolute opacity="0">
                    <v-progress-circular indeterminate size="64" :color="this.$colors.primary"></v-progress-circular>
                </v-overlay>
            </v-col>
        </v-row>
        <div v-if="data">
            <servicios
                :servicios="data"
            />
        </div>
    </v-container>
</template>

<script>
import Servicios from '../components/Servicios'

    export default {
        name: 'Historial',
        components: {
            Servicios,
        },
        data() {
            return {
                data:[],
                overlay: true
            }
        },
        created () {
            this.getHistoryServices();
        },
        methods: {
            getHistoryServices() {
                axios.get('/getHistorial')
                .then(res => {
                    this.data = res.data
                    this.overlay=false;
                })
                .catch(err => {
                    console.error(err); 
                })
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>