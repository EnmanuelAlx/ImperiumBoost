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
                        @showComponent="showComponent"
                    />
                </div>
            </div>
            <div class="row" v-if="cuenta">
                <pago
                    :info="{
                        precios:[
                            {'label': 'Cuenta', 'precio': cuenta.precio},                    
                        ],
                        cuenta: cuenta.id,
                        servicio: {id: 7, tipo_servicio: 'Venta de cuentas'}
                    }"
                    :tittle_service="`Cuenta ${cuenta.rank} en el servidor ${cuenta.servidor}`"
                    :labels="{
                        precio: {value: 'Precio de la cuenta',label: '<b>Cuenta: </b>'+cuenta.rank},
                    }"
                />
            </div>
        </v-container>
    </v-container>
</template>

<script>
import Cuenta from '../components/Cuenta'
import Pago from '../components/Pagos'
    export default {
        name: "Cuentas",
        components: {
            Cuenta,
            Pago
        },
        data() {
            return {
                cuentas: [],
                cuenta: null,

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
            },
            showComponent(cuenta){
                console.log('entro en el metodo');
                this.cuenta = cuenta
            }
        },
    }
</script>
