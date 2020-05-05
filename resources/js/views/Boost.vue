<template>
    <div class="container">
        <search-summoner URL="getLeague" v-on:getData="getData"/>
        
        <v-divider/>

        <div class="row justify-content-center">
            <div>
                <v-btn-toggle mandatory v-model="typeBoost">
                    <v-btn :color="`${this.$colors.primary}`" :disabled="status" value="SoloQ" @click="showSoloQ" dark>Solo/duo</v-btn>
                    <v-btn :color="`${this.$colors.primary}`" :disabled="status" value="Flex 5v5" @click="showFlex5v5" dark>Flex 5v5</v-btn>
                </v-btn-toggle>
            </div>
        </div>

        <v-divider/>

        <v-container fluid grid-list-xs>
            <v-row justify="center" >
                <v-col class="text-center">
                    <v-img :src="imagenInvocador"/>
                    <h1 v-html="ligaInvocador"/>
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

        <v-row >
            <v-img :src="`${this.$pathImagenes}/imperiumboost.png`" :aspect-ratio="15"  v-if="this.adicionales[0]">
                <v-container grid-list-xs>
                    <v-row >
                        <v-col>
                            <v-tooltip right>
                                <template v-slot:activator="{ on }">
                                    <v-checkbox color="#000" :label="label_precio_duo" v-model="duo" class="body-1"
                                    :disabled="precio_base<=0"                                    
                                    hide-details 
                                    v-on="on"/>
                                </template>
                                <span>{{ tooltip_duo }}</span>
                            </v-tooltip>
                        </v-col>
                        <v-col>
                            <v-tooltip right>
                                <template v-slot:activator="{ on }">
                                    <v-checkbox light color="#000" v-model="champ" hide-details :label="label_precio_champs" 
                                    :disabled="precio_base<=0"
                                    class="body-1" 
                                    v-on="on"/>
                                </template>
                                <span>{{ tooltip_champs }}</span>
                            </v-tooltip>
                            
                            <v-autocomplete
                                v-if="champ"
                                v-model="champsSelected"
                                :items="champs"
                                label="Seleccione mínimo 2 campeones"
                                multiple
                                chips
                                clearable
                                hide-details
                                hide-selected
                                color="#000"
                                light
                            />
                        </v-col>
                    </v-row>
                    
                </v-container>
            </v-img>
        </v-row>
        
        <div class="row">
            <pago 
            :info="{
                precios:[
                    {'label': 'Boost', 'precio': precio_base},
                    {'label': 'Duo', 'precio': precio_duo},
                    {'label': 'Champs', 'precio': precio_champ},
                ],
                ligas: ligas_a_subir,
                adicionales: adicionalesSelected,
                desde: ligaInvocador,
                hasta: hastaObj.nombre,
                campeones_selected: champsSelected,
                servicio: {id: 1, tipo_servicio: typeBoost}
            }"
            :tittle_service="`Servicio de boost desde ${ligaInvocador} hasta ${hastaObj.nombre}`"
            :labels="{
                desde: {label: `<b>Desde: </b> ${ligaInvocador}`, value: `<b>Desde: </b> ${ligaInvocador}`},
                hasta: {label: `<b>Hasta: </b> ${hastaObj.nombre}`, value: `<b>Hasta: </b> ${hastaObj.nombre}`},
                campeones_seleccionados: {label: `<b>Campeones Seleccionados: </b> ${champsSelected.toString()}`, value: champsSelected.toString()}
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
                invocador:{
                    ranked5v5:{
                        image: `${this.$pathImagenes}/leagues/unranked.png`,
                        tier_rank_translate:'Unranked',
                        selected: false,
                    },
                    ranked3v3:{
                        image: `${this.$pathImagenes}/leagues/unranked.png`,
                        tier_rank_translate: 'Unranked',
                        selected:false,
                    },
                    soloq:{
                        image: `${this.$pathImagenes}/leagues/hierroiv.png`,
                        tier_rank_translate: 'Hierro IV',
                        selected:true,
                    }
                },
                productos: [],
                imagenInvocador:`${this.$pathImagenes}/leagues/hierroiv.png`,
                ligaInvocador: 'Hierro IV',
                precio_base: 0,
                precio_duo: 0,
                precio_champ: 0,
                ligas_a_subir : [],
                adicionales: [],
                duo: '',
                champs:[],
                champ: false,
                champsSelected:[],
                adicionalesSelected:[],
                hastaObj: '',
                typeBoost: 'SoloQ',
                status: true,
            }
        },
        created () {
            this.getProductos();
            this.getAdicionales();
            this.getChamps();
        },
        computed: {
            label_precio_duo() {
                return `Duo (${this.adicionales[0].precio}$) + (${this.adicionales[0].porcentaje}%)`
            },
            tooltip_duo(){
                return this.adicionales[0].descripcion
            },
            label_precio_champs(){
                let label = `Seleccionar Campeones (${this.adicionales[1].precio}$)`;
                if(this.adicionales[1].porcentaje || this.adicionales[1].porcentaje==0){
                    label += ` + (${this.adicionales[1].porcentaje}%)`
                }
                return label
            },
            tooltip_champs(){
                return this.adicionales[1].descripcion
            },
        },
        watch: {
            duo(status) {
                if(status){
                    this.precio_duo = this.calculPrecio(this.adicionales[0]);
                    this.adicionalesSelected.push(this.adicionales[0].id)

                }
                else{
                    this.precio_duo = 0;
                    let index = this.adicionalesSelected.indexOf(this.adicionales[0].id);
                    this.adicionalesSelected.splice(index, 1);
                }
            },
            champ(status){
                if (status) {
                    this.precio_champ = this.calculPrecio(this.adicionales[1]);
                    this.adicionalesSelected.push(this.adicionales[1].id)
                }
                else{
                    this.precio_champ = 0;
                    this.champsSelected=[];
                    let index = this.adicionalesSelected.indexOf(this.adicionales[1].id);
                    this.adicionalesSelected.splice(index, 1);
                }
            }
        },
        methods: {
            getData(data) {
                this.status = false;
                data.forEach(element => {
                    switch (element.queueType) {
                        case 'RANKED_FLEX_SR':
                            this.invocador.ranked5v5 = element
                            this.imagenInvocador = this.invocador.ranked5v5.image
                            this.ligaInvocador = this.invocador.ranked5v5.tier_rank_translate
                            break;    
                        case 'RANKED_SOLO_5x5':
                            this.invocador.soloq = element
                            this.imagenInvocador = this.invocador.soloq.image
                            this.ligaInvocador = this.invocador.soloq.tier_rank_translate
                            this.invocador.soloq.selected = true;
                            break;
                        default:
                            break;
                    }
                });
            },
            getAdicionales(){
                axios.get('/api/getAdicionalesBoost')
                .then(res => {
                    this.adicionales = res.data
                })
                .catch(err => {
                    console.error(err); 
                })
            },
            getChamps(){
                axios.get('/api/getChamps').then(response=>{
                    for (var key in response.data) {
                        this.champs.push(key);
                    }
                }).catch(err=>{
                    alert(err);
                });
            },
            showSoloQ(){
                this.invocador.ranked5v5.selected = false;
                this.imagenInvocador = this.invocador.soloq.image
                this.ligaInvocador = this.invocador.soloq.tier_rank_translate
                this.invocador.soloq.selected = true;
                
            },
            showFlex5v5(){
                this.invocador.soloq.selected = false;
                this.imagenInvocador = this.invocador.ranked5v5.image
                this.ligaInvocador = this.invocador.ranked5v5.tier_rank_translate
                this.invocador.ranked5v5.selected = true;

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
            calcularPrecio(hastaObj){
                console.log(hastaObj);
                this.hastaObj = hastaObj
                let hasta = parseFloat(hastaObj.descripcion);
                this.precio_base = 0;
                this.ligas_a_subir = [];
                for (const element in this.invocador) {
                    if (this.invocador[element].selected) {
                        const desde = this.invocador[element].id_league;
                        const desde_split = String(desde).split('.');
                        const hasta_split = String(hasta).split('.')
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
                            console.log('-------------------------------------------');
                            console.log(this.productos[i_desde]);
                            console.log(this.productos[i_hasta]);
                            console.log('i_hasta '+i_hasta);
                            console.log('i_desde '+i_desde);
                            console.log('-------------------------------------------');
                            for (let i = i_desde; i < i_hasta; i++){
                                console.log(this.productos[i]);
                            
                                this.precio_base += this.productos[i].precio
                                this.ligas_a_subir.push(this.productos[i].id)
                            }
                        }
                        else{
                            this.precio_base = this.precio_duo = this.precio_champ = 0;
                        }
                        if(this.duo){
                            this.precio_duo = this.calculPrecio(this.adicionales[0]);
                        }
                        if(this.champ){
                            this.precio_champ = this.calculPrecio(this.adicionales[1]);
                        }
                    }
                }
            },
            calculPrecio(service){
                let pre = this.precio_base*service.porcentaje/100;
                let cio = service.precio + pre
                console.log('pre: '+pre);
                console.log('cio: '+cio);
                let precio = parseFloat((cio).toFixed(2));
                

                return precio;
            }
        },
    }
</script>

<style scoped>
</style>