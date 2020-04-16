<template>
    <div class="container">
        <search-summoner URL="getLeague" v-on:getData="getData"/>
        
        <v-divider/>

        <v-container fluid grid-list-xs>
            <v-row justify="center" >
                <v-col class="text-center">
                    <lista-productos
                        :productos="productos"
                        v-on:calcularPrecio="selectDesde"
                        :status="status"
                    />
                </v-col>
                <v-col align-self="center" class="text-center">
                    <v-icon size="100" :color="this.$colors.primary">forward</v-icon>
                </v-col>
                <v-col>
                    <lista-productos
                        :productos="productos"
                        v-on:calcularPrecio="calcularPrecio"
                        :status="status"
                    />
                </v-col>
            </v-row>
        </v-container>

        
        <div class="row">
            <pago 
            :info="{
                precios:[
                    {'label': 'Boost', 'precio': precio_base},
                ],
                ligas: ligas_a_subir,
                desde: desde.nombre,
                hasta: hastaObj.nombre,
                servicio: {id: 8, tipo_servicio: 'Boost de TFT'}
            }"
            :tittle_service="`Servicio de TFT Boost desde ${desde.nombre} hasta ${hastaObj.nombre}`"
            :labels="{
                desde: {label: `<b>Desde: </b> ${desde.nombre}`, value: `<b>Desde: </b> ${desde.nombre}`},
                hasta: {label: `<b>Hasta: </b> ${hastaObj.nombre}`, value: `<b>Hasta: </b> ${hastaObj.nombre}`},
            }"
            />
            
        </div>
    </div>
</template>

<script>
import SearchSummoner from '../components/SearchSummoner'
import ListaProductos from '../components/Productos'
import Pago from '../components/Pagos'
    export default {
        name:'BoostPage',
        components: {
            SearchSummoner,
            ListaProductos,
            Pago
        },
        data() {
            return {
                productos: [],
                imagenInvocador:`${this.$pathImagenes}/leagues/hierroiv.png`,
                precio_base: 0,
                ligas_a_subir : [],
                desde: {},
                hastaObj: '',
                status: true,
            }
        },
        created () {
            this.getProductos();
        },

        methods: {
            getData(data){
                this.status = false;
            },
            getProductos(){
                axios.get('/api/getBoostPrices')
                .then(res => {
                    this.productos = res.data
                })
                .catch(err => {
                    console.error(err); 
                })
            },
            selectDesde(desdeObj){
                this.desde = desdeObj;
            },
            calcularPrecio(hastaObj){
                console.log(hastaObj);
                this.hastaObj = hastaObj
                let hasta = parseFloat(hastaObj.descripcion);
                this.precio_base = 0;
                this.ligas_a_subir = [];
                const desde = this.desde.descripcion;
                const desde_split = String(desde).split('.');
                const hasta_split = String(hasta).split('.')
                console.log(desde_split, hasta_split);
                if(desde_split[0]< hasta_split[0] 
                || (desde_split[0] == hasta_split[0] 
                && desde_split[1]<hasta_split[1])){
                    let found_desde = this.productos.find((el)=>{
                        return (el.descripcion==desde)
                    });
                    let found_hasta = this.productos.find((el)=>{
                        return (el.descripcion==hasta)
                    });
                    let i_desde = (this.productos.indexOf(found_desde));
                    let i_hasta = (this.productos.indexOf(found_hasta));
                    for (let i = i_desde; i < i_hasta; i++){
                        this.precio_base += this.productos[i].precio
                        this.ligas_a_subir.push(this.productos[i].id)
                    }
                }
                else{
                    this.precio_base = 0;
                }
                    
                
            },
            calculPrecio(service){
                let precio = parseFloat((service.precio + (this.precio_base*service.porcentaje/100)).toFixed(2))
                return precio;
            }
        },
    }
</script>

<style scoped>
</style>