<template>
    <v-container>
        <v-container>
            <v-overlay :value="cuentas == []">
                <v-progress-circular indeterminate size="64"></v-progress-circular>
            </v-overlay>
        </v-container>
        <v-container>
            <div class="row">
                <div class="col-sm-4" v-for="cuenta in cuentas" :key="cuenta.id">
                    <cuenta
                        :cuenta="cuenta"
                    />
                </div>
            </div>
        </v-container>
    </v-container>
</template>

<script>
import Cuenta from '../components/Cuenta'
    export default {
        name: "Cuentas",
        components: {
            Cuenta,
        },
        data() {
            return {
                cuentas: [],
            }
        },        
        created () {
            this.getCuentas();
        },
        methods: {
            getCuentas() {
                axios.get('/api/getCuentas')
                .then(res=>{
                    this.cuentas = res.data;
                }).catch(err=>{
                    console.log(err)
                })
            }
        },
    }
</script>
