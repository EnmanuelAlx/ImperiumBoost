<template>
    <div class="row justify-content-center">
        <div class="col-4">
            <v-text-field
            name="nombre"
            label="Ingrese su nombre de invocador"
            id="id"
            outlined
            clearable
            v-model="search.nombre"
            :color="`${this.$colors.primary}`"
            @change="changeInput"
            @keyup.enter="getInfo"
            />
        </div>
        <div class="col-3">
            <v-select
                :items="servers"
                v-model="search.servidor"
                outlined
                label="Servidor"
                append-outer-icon="search"
                @click:append-outer="getInfo"
                @keyup.enter="getInfo"
                :color="`${this.$colors.primary}`"
                @change="changeSelect"
            ></v-select>
        </div>
        <v-progress-linear :color="`${this.$colors.primary}`" :indeterminate="loading" :active="loading" v-if="loading"></v-progress-linear>
    </div>
</template>

<script>
    export default {
        name: 'SearchSummoner',
        props: {
            URL: {
                type: String,
            },
        },
        data() {
            return {
                search:{
                    nombre: '',
                    servidor: 'la1'
                },
                servers: [
                    {text: 'LAN', value: 'la1'},
                    {text: 'LAS', value: 'la2'},
                    {text: 'NA', value: 'na1'},
                ],
                loading: false,
            }
        },
        methods: {
            getInfo() {
                this.loading = true;
                axios.post(`/api/${this.URL}`,this.search)
                .then(res => {
                    this.loading = false
                    this.$store.state.name = this.search.nombre,
                    this.$store.state.server = this.search.servidor
                    this.$emit('getData', res.data)
                })
                .catch(err => {
                    this.loading = false;
                    console.error(err); 
                })
            },
            changeInput(){
                this.$store.state.name = this.search.nombre
            },
            changeSelect(){
                this.$store.state.server = this.search.servidor
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>