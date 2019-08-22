<template>
    <v-container>
        <v-container>
            <search-summoner URL="getSummoner" v-on:getData="getData"/>
        </v-container>
        <v-container>
            <v-row>
                <v-col class="text-center">
                    <h2 class="display-1">Selecciona tu número de juegos</h2>
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
            <v-row>
                <v-col align-self="center" class="text-center">
                    <v-btn-toggle mandatory v-model="type" disabled>
                        <v-btn :color="this.$colors.primary" dark :value="'Solo Q'">Solo/duo</v-btn>
                        <v-btn :color="this.$colors.primary" dark :value="'Flex 5vs5'">Flex 5v5</v-btn>
                        <v-btn :color="this.$colors.primary" dark :value="'TFT'" >TFT</v-btn>
                    </v-btn-toggle>
                </v-col>
            </v-row>
        </v-container>
        <v-container>
            <pago
                :info="{
                    precios:[
                        {'label': 'Partidas de posicionamiento', 'precio': precio},                
                    ],
                    productos: productos,
                    precio_todal: precio,
                    hasta: cantidad,
                    servicio: {id: 6, tipo_servicio: 'Partidas de posicionamiento en '+ type}
                }"
                :tittle_service="`Jugar ${cantidad} partidas de posicionamiento en ${type}`"
                :labels="{
                    hasta: {value: cantidad, label: `<b>Cantidad de partidas: </b> ${cantidad}`},
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
        name:'Posicionamiento',
        components: {
            SearchSummoner,
            Pago,
        },
        data() {
            return {
                cantidad: 0,
                precio_base: 0,
                precio: 0,
                producto: {},
                productos:[],
                type:'',
            }
        },
        created () {
            this.getPrecio();
        },
        watch: {
            cantidad(old, new_value) {
                this.calcularPrecio();
            }
        },
        methods: {
            getData(summoner) {
                
            },
            getPrecio() {
                axios.get('/api/getPrecioPosicionamiento')
                .then(response=>{
                    this.producto = response.data;
                    this.precio_base = response.data.precio
                })
                .catch(err=>{
                    alert(err);
                });
            },
            calcularPrecio(){
                this.precio = 0;
                this.precio = this.cantidad * this.precio_base
                this.productos = [];
                for (let index = 0; index < this.cantidad; index++) {
                    this.productos.push(this.producto.id);
                }
            },
        },
    }
</script>

<style lang="scss" scoped>

</style>