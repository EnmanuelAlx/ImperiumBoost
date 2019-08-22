<template>

    <v-row class="justify-content-center">
        <v-col>
            <v-img :src="imagen"
            aspect-ratio="1"
            />
                <v-select
                v-model="to"
                :items="productos"
                label="Liga"
                item-text="nombre"
                return-object
                outlined
                :color="`${this.$colors.primary}`"
                :disabled="this.status"
                />
        </v-col>
    </v-row>
</template>

<script>
    export default {
        props: {
            productos:{
                type: Array
            },
            status:{
                type: Boolean,
                default: true
            }
        },
        data() {
            return {
                to:'',
                imagen: `${this.$pathImagenes}/leagues/diamantei.png`,
                peso: ''
            }
        },
        watch: {
            to(val) {
                this.imagen = val.imagen;
                this.$emit("calcularPrecio", (val))
            }
        },
    }
</script>
