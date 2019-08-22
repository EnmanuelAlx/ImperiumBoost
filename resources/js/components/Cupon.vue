<template>
    <v-row>
        <v-col cols="8">
            <v-text-field
                label="Cupon"
                v-model="cupon"
                clearable
                :error-messages="cupon_error" 
                :success-messages="cupon_success"
                :color="this.$colors.primary"
                @change="cambiarCupon"
            />
          <small v-if="descripcion_descuento!= ''" class="text-muted">{{ descripcion_descuento }}</small>

        </v-col>
        <v-col align-self="center">
            <v-btn :color="this.$colors.primary" 
            :loading="loading"
            @click="usarCupon">Usar Cupon</v-btn>
        </v-col>
    
    </v-row>
</template>

<script>
    export default {
        name: "Cupon",
        props: {
            total: {
                type: Number,
            },
        },
        data() {
            return {
                cupon: 'Cupon',
                cupon_error: [],
                cupon_success: [],
                total_descuento: this.total,
                descripcion_descuento: '',
                loading: false,
            }
        },
        methods: {
            cambiarCupon(){
                this.$emit('cambiarCupon', this.cupon)
            },
            usarCupon(){
                this.loading = true;
                axios.get('/user/verificarCupon', {params:{cupon: this.cupon}})
                .then(res=>{
                    this.loading = false;
                    console.log(res);
                    let discount = res.data.porcentaje/100
                    let total_descuento2 = this.total * discount;
                    this.descripcion_descuento = res.data.descripcion;
                    this.total_descuento -= total_descuento2
                    this.cupon_error =  [];
                    this.cupon_success = 'Se puede utilizar'
                    this.$emit('discount', this.total_descuento, res.data.porcentaje, this.cupon)

                }).catch(err=>{
                    this.cupon_error = ['Cupon expirado o utilizado'];
                    console.log(err)
                })
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>