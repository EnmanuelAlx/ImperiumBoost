<template>
    <v-container>
        <v-container>
            <v-row>
                <v-col>
                    <v-overlay :value="overlay" absolute opacity="0">
                        <v-progress-circular indeterminate size="64" :color="this.$colors.primary"></v-progress-circular>
                    </v-overlay>
                </v-col>
            </v-row>
        </v-container>

        <v-container v-if="data">
            <servicios
                :servicios = data
            />
        </v-container>

    </v-container>
</template>

<script>
import Servicios from '../components/Servicios'
    export default {
        name: 'Dashboard',
        components: {
            Servicios,
        },
        data() {
            return {
                data: [],
                overlay: true,
            }
        },
        created () {
            this.getServicios();
        },
        methods: {
            getServicios(){
                axios.get('/getServicios')
                .then(res=>{
                    this.data = res.data;
                    this.overlay = false;
                })
                .catch(err=>{
                    alert(err)
                })
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>