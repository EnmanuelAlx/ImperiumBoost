<template>
    <v-container grid-list-xs>
        
        <search-summoner URL="getSummoner" v-on:getData="getData"/>
        
        <v-container>
            <v-row>
                <v-col>
                    <producto :productos="productos" v-on:objProducto="getFrom"
                        :status="false"
                        label="Honor actual"
                        :max="300"
                    />
                </v-col>
                <v-col>
                    <producto :productos="productos" v-on:objProducto="getTo"
                        :status="false"
                        label="Honor deseado"
                        :max="300"
                    />
                </v-col>
            </v-row>
        </v-container>
        <v-container >
            <pago
                :info="{
                    precios:[
                        {'label': 'Honor', 'precio': precio},                    
                    ],
                    productos: productosSeleccionados,
                    precio_total: precio,
                    desde:from.nombre,
                    hasta: to.nombre,
                    servicio: {id: 4, tipo_servicio: 'Subir honor'}
                }"
                :tittle_service="`Subir de honor ${from.nombre} hasta ${to.nombre}`"
                :labels="{
                    desde: {value: from.name,label: '<b>Desde: </b>'+from.nombre},
                    hasta: {value: to.name,label: '<b>Hasta: </b>'+to.nombre},
                }"
            />
        </v-container>
    </v-container>
</template>

<script>
import SearchSummoner from '../components/SearchSummoner'
import Pago from '../components/Pagos'
import Producto from '../components/GProductos'
    export default {
        name:'Honor',
        components: {
            SearchSummoner,
            Pago,
            Producto
        },
        data() {
            return {
                productos:[],
                from: '',
                to:'',
                productosSeleccionados: [],
                precio: 0,
            }
        },
        created () {
            this.getHonors();
        },
        methods: {
            getData() {
            },
            getHonors(){
                axios.get('/api/getHonores')
                .then(response=>{
                    this.productos = response.data;
                })
                .catch(err=>{
                    alert(err);
                });
            },
            getFrom(from){
                this.from = (from);
                this.calcularPrecio();

            },
            getTo(to){
                this.to = (to)
                this.calcularPrecio();
            },
            calcularPrecio(){
                this.precio = 0;
                let desde = this.productos.indexOf(this.from);
                let hasta = this.productos.indexOf(this.to);
                this.productosSeleccionados= [];
                for (let index = desde; index < hasta; index++) {
                    this.precio += this.productos[index].precio
                    this.productosSeleccionados.push(this.productos[index].id)
                }
            }
            
        },
    }
</script>

<style lang="scss" scoped>

</style>