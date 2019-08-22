<template>
    <v-img :src="`${this.$pathImagenes}/fondo_azul.png`" :aspect-ratio="15">
        <v-container fluid>
            <metodos-de-pago :metodos_pago="metodos_pagos"
            v-on:metodo_seleccionado="metodoSeleccionado"></metodos-de-pago>
        </v-container>
        
        <v-container>
            <v-row>
                <v-col align-self="center" cols="8" class="text-center">
                    <h1>Precios</h1>
                </v-col>
                <v-col align-self="center">
                    <div class="subheading text-center"  v-for="(precio, i) in info.precios" :key="i" >
                        <span class="subheading" v-if="precio.precio>0">
                            {{ precio.label }} : {{ precio.precio }}$
                        </span>
                    </div>
                </v-col>
            </v-row>
            <v-row>
                <v-col align-self="center" cols="8" class="text-center">
                    
                </v-col>
                <v-col align-self="center">
                    <div class="subheading text-center" >
                        <span class="subheading">
                            Total : {{ Cprecio_total }}$
                        </span>
                    </div>
                </v-col>
            </v-row>
            <v-row>
                <v-col align-self="center" class="text-center">
                    <v-btn :color="this.$colors.primary"
                        :disabled="precioTotal <=0"
                        @click="verificarUsuario"
                        :loading="loading"
                    >Pagar</v-btn>
                </v-col>
            </v-row>
        </v-container>


        <v-dialog
            v-model="dialogPagar"
            scrollable 
            :overlay="false"
            max-width="600"
            transition="dialog-transition"
        >
            <v-card>
                <v-card-title class="headline">{{ tittle_service }}</v-card-title>
                <v-card-text>
                    <v-container grid-list-xs>
                        <v-row v-for="(label, i) in labels" :key="i">
                            <span v-if="label.value != ''" v-html="label.label"/>
                        </v-row>
                    </v-container>
                    <v-container grid-list-xs>
                        <table class="table table-bordered text-white" >
                            <thead>
                                <tr>
                                    <th>Concepto</th>
                                    <th class="text-right">Precio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(precio, i) in info.precios" :key="i">
                                    <td v-if="precio.precio>0">{{ precio.label }}</td>
                                    <td class="text-right" v-if="precio.precio>0">{{ precio.precio }}$</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr :style="(total_descuento) ? 'text-decoration:line-through' : '' ">
                                    <td>
                                        Total
                                    </td>
                                    <td class="text-right">
                                        {{ Cprecio_total }}$
                                    </td>
                                </tr>
                                <tr v-if="total_descuento">
                                    <td>
                                        Descuento de un {{ porcentaje_descuento }}%
                                    </td>
                                    <td class="text-right">
                                        {{ total_descuento }}$
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </v-container>
                    <v-container>
                        <v-row>
                            <v-text-field
                                label="Nota"
                                placeholder="No agregar a nadie"
                                v-model="nota"
                                outlined
                                :color="this.$colors.primary"
                                row-height="5"
                            />
                        </v-row>
                    </v-container>
                    <v-container grid-list-xs>
                        <cupon
                            :total="precioTotal"
                            v-on:discount="descontarTotal"
                            @cambiarCupon="cambiarCupon"
                        />
                    </v-container>
                </v-card-text>
                
                <v-container class="text-center">
                    <v-btn
                    :color="this.$colors.success"
                    text
                    @click="dialogPagar = false"
                    >
                        Cancelar
                    </v-btn>

                    <v-btn
                        :color="this.$colors.primary"
                        rounded
                        @click="pagar"
                    >
                        Pagar
                    </v-btn>
                </v-container>
            </v-card>
        </v-dialog>



    </v-img>
</template>

<script>
import MetodosDePago from "./MetodosDePago"
import Cupon from "./Cupon"
    export default {
        name:"Pagos",
        components: {
            MetodosDePago,
            Cupon
        },
        props: {
            labels: {
                type: Object,
            },
            info:{
                type: Object,
            },
            tittle_service:{
                type: String,
            },
        },
        data() {
            return {
                metodos_pagos: [],
                metodo_id: 0,
                precioTotal: 0,
                dialogPagar: false,
                loading: false,
                nota: '',
                total_descuento: 0,
                porcentaje_descuento: 0,
                cupon: ''
            }
        },
        created () {
            this.getMetodosDePago();
        },
        computed: {
            Cprecio_total() {
                this.precioTotal= 0;
                this.info.precios.forEach(element => {
                    this.precioTotal+=element.precio
                });
                return this.precioTotal
            }
        },
        methods: {
            getMetodosDePago() {
                axios.get("/api/getMetodosDePago")
                .then(res => {
                    this.metodos_pagos = res.data;
                })
                .catch(err => {
                    console.error(err); 
                })
            },
            metodoSeleccionado(id){
                this.metodo_id = id;
            },
            verificarUsuario(){
                if (this.metodo_id == 0) {
                    alert('Debes elegir un metodo de pago antes de proseguir con el pago')
                    return;
                }
                this.loading = true;
                axios.get('/verificarUsuario')
                .then(res => {
                    this.loading = false
                    if(res.data){
                        this.dialogPagar = true
                    }
                    else{

                    }
                })
                .catch(err => {
                    this.loading=false;
                })
            },
            cambiarCupon(nombreCupon){
                console.log(nombreCupon);
                this.cupon = nombreCupon
            },
            descontarTotal(totalDescuento, porcentajeDescuento, nombreCupon){
                this.porcentaje_descuento = porcentajeDescuento
                this.total_descuento = totalDescuento
                this.cupon = nombreCupon
            },
            pagar(){
                let URL = '/user/pay'
                let params = {
                    service : this.info.servicio,
                    info: this.info,
                    total: (this.total_descuento) ? this.total_descuento : this.precioTotal,
                    nota: this.nota,
                    cupon: this.cupon,
                    name: this.$store.state.name,
                    server:this.$store.state.server,
                    payment_method: this.metodo_id,
                }
                axios.post(URL, params).then(res => {
                    if(res.status === 205){
                        alert('Cupon usado papu')
                    }
                })
                .catch(err=>{
                    console.log(err);
                })
                console.log(this.info, this.precioTotal, this.metodo_id)
            },
            
        },
    }
</script>

<style lang="scss" scoped>

</style>