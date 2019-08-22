<template>
    <v-container>
        <search-summoner URL="getSummoner" v-on:getData="getData"/>
        <v-container>
            <v-row>
                <v-col class="text-center">
                    <h2 class="display-1">¿Cuantas partidas de baja prioridad deseas comprar?</h2>
                </v-col>
            </v-row>
        </v-container>
        <v-container>
            <v-row>
                <v-col>
                    <v-slider
                        v-model="cantidad"
                        :color="this.$colors.primary"
                        thumb-label="always"
                        :thumb-size="15"
                        min="1"
                        max="10"
                        append-icon="add"
                        prepend-icon="remove"
                        @click:append="cantidad++"
                        @click:prepend="cantidad--"
                    />
                </v-col>
            </v-row>
            <v-row v-if="otra_cantidad">
                <v-col>
                    <v-text-field outline label="Elija cantidad" mask="#######" v-model="cantidad_mas"/>
                </v-col>
            </v-row>
        </v-container>

        <v-container>
            <pago
                :info="{
                    precios:[
                        {'label': 'Partidas de baja prioridad', 'precio': precio},                
                    ],
                    productos: productos,
                    precio_total: precio,
                    hasta: (cantidad_mas>cantidad) ? cantidad_mas : cantidad,
                    servicio: {id: 5, tipo_servicio: 'Partidas baja prioridad'}
                }"
                :tittle_service="`Jugar ${(cantidad_mas>cantidad) ? cantidad_mas : cantidad} partidas de baja prioridad`"
                :labels="{
                    hasta: {value: (cantidad_mas>cantidad) ? cantidad_mas : cantidad, label: `<b>Cantidad de partidas: </b> ${(cantidad_mas>cantidad) ? cantidad_mas : cantidad}`},
                    precio_por_partida: {value: precio_base, label: `<b>Precio por partida </b>${precio_base}$`},
                }"
            />
        </v-container>
    </v-container>
</template>

<script>
import SearchSummoner from '../components/SearchSummoner'
import Pago from '../components/Pagos'
    export default {
        name:'BajaPrioridad',
        components: {
            SearchSummoner,
            Pago,
        },
        data() {
            return {
                cantidad: 0,
                cantidad_mas: 0,
                otra_cantidad: 0,
                precio:0,
                precio_base: 0,
                productos: [],
                producto:[],
            }
        },
        created () {
            this.getPrecio();
        },
        watch: {
            cantidad(old, new_value) {
                if(new_value >= 10){
                    this.otra_cantidad=true;
                }else{
                    this.otra_cantidad = false;
                    this.cantidad_mas = 0;
                }
                    this.calcularPrecio();
                },
                cantidad_mas(old_value, new_value){
                    this.calcularPrecio();                
                }
        },
        methods: {
            getData() {
                
            },
            getPrecio(){
                axios.get('/api/getPrecioBajaPrioridad')
                .then(response=>{
                    console.log(response);
                    this.producto = response.data;
                    this.precio_base = response.data.precio
                })
                .catch(err=>{
                    alert(err);
                });
            },
            calcularPrecio(){
                this.precio = 0;
                let cant_partidas = (this.cantidad_mas>this.cantidad) ? this.cantidad_mas : this.cantidad
                this.precio = cant_partidas * this.precio_base
                this.productos = [];
                for (let index = 0; index < cant_partidas; index++) {
                    this.productos.push(this.producto.id);
                }
            },
        },
    }
</script>

<style lang="scss" scoped>

</style>