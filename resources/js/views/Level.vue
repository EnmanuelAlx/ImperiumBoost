<template>
    <v-container grid-list-xs>
        <v-container grid-list-xs>
            <search-summoner URL="getSummoner" v-on:getData="getData"/>
        </v-container>

        <v-container grid-list-xs>
            <v-row>
                <v-col>
                    <v-img :src="from_imagen" aspect-ratio="1">
                        <v-col cols="8" align-self="center">
                            <v-text-field style="margin-top: 105px; margin-left: 100px"
                                v-model="from"
                                outlined
                                disabled
                                mask="####"
                                :color="this.$colors.primary"
                            />
                        </v-col>
                    </v-img>
                </v-col>
                <v-col/>
                
                <v-col>
                    <v-img :src="to_imagen" aspect-ratio="1">
                        <v-col cols="10" align-self="center">
                            <v-text-field style="margin-top: 105px; margin-left: 75px"
                                prepend-icon="remove"
                                append-outer-icon="add"
                                v-model="to"
                                outlined
                                mask="####"
                                :color="this.$colors.primary"
                                :disabled="from==0"
                                @click:prepend="to--"
                                @click:append-outer="to++"
                            />
                        </v-col>
                    </v-img>
                </v-col>
            </v-row>
        </v-container>
        <v-container grid-list-xs>
            <pago
                :info="{
                    precios:[
                        {'label': 'Precio por subir de nivel', 'precio': precio},                
                    ],
                    productos: productos,
                    precio_total: precio,
                    desde: from,
                    hasta: to,
                    cantidad_niveles: cant_niveles,
                    servicio: {id: 3, tipo_servicio: 'Subir cuenta de nivel'}
                }"
                :tittle_service="`Subir de nivel la cuenta ${this.$store.state.name}`"
                :labels="{
                    desde: {value: from.name,label: '<b>Desde: </b>'+from},
                    hasta: {value: to.name,label: '<b>Hasta: </b>'+to},
                    precio_por_level: {value: precio_base, label: `<b>Precio por nivel </b>${precio_base}$`},
                    cant_niveles: {value: cant_niveles,label:  '<b>Cantidad de niveles </b>' + cant_niveles}
                }"
            />
        </v-container>
    </v-container>
</template>

<script>
import SearchSummoner from '../components/SearchSummoner'
import Pago from '../components/Pagos'
    export default {
        name:'Level',
        components: {
            SearchSummoner,
            Pago
        },
        data() {
            return {
                invocador: {},
                from: '',
                from_imagen: '',
                to: '',
                to_imagen: '',
                precio_base: 0,
                precio: 0,
                cant_niveles: 0,
                productos: [],
                niveles: {},

            }
        },
        created () {
            this.getPrecioLvl();
            this.from_imagen = `${this.$pathImagenes}/levels/29.png`;
            this.to_imagen = `${this.$pathImagenes}/levels/30.png`;
        },
        watch: {
            from(level) {
                if(level>=0 && level<30){
                    this.from_imagen = `${this.$pathImagenes}/levels/29.png`
                }
                else if(level>=30 && level<50){
                    this.from_imagen = `${this.$pathImagenes}/levels/30.png`
                }
                else if(level>=50 && level<75){
                    this.from_imagen = `${this.$pathImagenes}/levels/50.png`
                }
                else if(level>=75 && level<100){
                    this.from_imagen = `${this.$pathImagenes}/levels/75.png`
                }
                else if(level>=100 && level<125){
                    this.from_imagen = `${this.$pathImagenes}/levels/100.png`
                }
                else if(level>=125 && level<150){
                    this.from_imagen = `${this.$pathImagenes}/levels/125.png`
                }
                else if(level>=150 && level<175){
                    this.from_imagen = `${this.$pathImagenes}/levels/150.png`
                }
                else if(level>=175){
                    this.from_imagen = `${this.$pathImagenes}/levels/175.png`
                }
                this.to=this.from;
                this.to++;
            },
            to(level) {
                if(level>=0 && level<30){
                    this.to_imagen = `${this.$pathImagenes}/levels/29.png`
                }
                else if(level>=30 && level<50){
                    this.to_imagen = `${this.$pathImagenes}/levels/30.png`
                }
                else if(level>=50 && level<75){
                    this.to_imagen = `${this.$pathImagenes}/levels/50.png`
                }
                else if(level>=75 && level<100){
                    this.to_imagen = `${this.$pathImagenes}/levels/75.png`
                }
                else if(level>=100 && level<125){
                    this.to_imagen = `${this.$pathImagenes}/levels/100.png`
                }
                else if(level>=125 && level<150){
                    this.to_imagen = `${this.$pathImagenes}/levels/125.png`
                }
                else if(level>=150 && level<175){
                    this.to_imagen = `${this.$pathImagenes}/levels/150.png`
                }
                else if(level>=175){
                    this.to_imagen = `${this.$pathImagenes}/levels/175.png`
                }
                this.calcularPrecio();
            },
            
        },
        methods: {
            getData(invocador) {
                this.from = invocador.summonerLevel
            },
            getPrecioLvl(){
                axios.get('/api/getPrecioLvl').then(response=>{
                    this.niveles = response.data
                    this.precio_base = response.data.precio;
                }).catch(err=>{
                    alert(err);
                });
            },
            calcularPrecio(){
                this.precio = 0;
                this.cant_niveles = (this.to - this.from)
                this.precio = this.cant_niveles * this.precio_base
                this.productos = [];
                for (let index = 0; index < this.cant_niveles; index++) {
                    this.productos.push(this.niveles.id)
                }
            }
        },
    }
</script>
