<template>
    <v-container grid-list-xs>
        <search-summoner URL="getSummoner" v-on:getData="getData"/>
        <v-container grid-list-xs>
            <v-row>
                <v-col>
                    <v-img
                        :src="imagen_campeon"
                        :max-height="max"
                        :max-width="max"
                        aspect-ratio="1"
                    />
                    <v-autocomplete
                        :items="campeones"
                        v-model="campeonSeleccionado"
                        :color="this.$colors.primary"
                        outlined
                        label="Elije un campeón"
                    />
                </v-col>
                <v-col>
                    <v-img :src="from_image"
                    :max-height="max"
                    :max-width="max"
                    aspect-ratio="1"
                    />
                    <v-select
                        :items="maestrias"
                        item-text="nombre"
                        item-value="id"
                        return-object
                        v-model="from"
                        :color="this.$colors.primary"
                        outlined
                        label="Maestría Actual"
                    ></v-select>
                </v-col>
                <v-col>
                    <v-img
                        :src="to_image"
                        aspect-ratio="1"
                        :max-height="max"
                        :max-width="max"
                    />
                     <v-select
                        :items="maestrias"
                        item-text="nombre"
                        item-value="id"
                        return-object
                        v-model="to"
                        :color="this.$colors.primary"
                        outlined
                        label="Maestría Deseada"
                    ></v-select>
                </v-col>
            </v-row>
        </v-container>        
        <v-container grid-list-xs>
            <pago
            :info="{
                precios:[
                    {'label': 'Precio por maestria', 'precio': precio}
                ],
                productos: productos,
                precio_total: precio,
                desde: from.nombre,
                hasta: to.nombre,
                servicio: {id: 2, tipo_servicio: 'Maestría de Campeón '+campeonSeleccionado}
            }"
            :tittle_service="`Maestria de campeon de ${campeonSeleccionado}`"
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
    export default {
        name:'Maestria',
        components: {
            SearchSummoner,
            Pago
        },
        data() {
            return {
                campeones:[],
                campeonSeleccionado: '',
                imagen_campeon: '',
                maestrias:[],
                max: 150,
                from: '',
                from_image: '',
                to:'',
                to_image: '',
                precio: 0,
                productos: [],
            }
        },
        created () {
            this.getChamps();
            this.getMaestrias();
        },
        watch: {
            campeonSeleccionado(champ) {
                this.imagen_campeon = `http://ddragon.leagueoflegends.com/cdn/${this.$store.state.version}/img/champion/${champ}.png` 
            },
            from(tier){
                this.from_image = tier.imagen
                this.calcularPrecio();
            },
            to(tier){
                this.to_image = tier.imagen
                this.calcularPrecio();
            }
        },
        methods: {
            getData(data) {
            },
            getChamps(){
                axios.get('/api/getChamps')
                .then(res => {
                    for (var key in res.data) {
                        this.campeones.push(key);
                    }
                })
                .catch(err => {
                    console.error(err); 
                })
            },
            getMaestrias(){
                axios.get('/api/getMaestrias')
                .then(res => {
                    console.log(res.data);
                    this.maestrias = res.data
                })
                .catch(err => {
                    console.error(err); 
                })
            },
            calcularPrecio(){
                this.precio = 0;
                let desde = this.maestrias.indexOf(this.from);
                let hasta = this.maestrias.indexOf(this.to);
                this.productos= [];
                for (let index = desde+1; index <= hasta; index++) {
                    this.precio += this.maestrias[index].precio
                    this.productos.push(this.maestrias[index].id)
                }
            }
        },
    }
</script>
