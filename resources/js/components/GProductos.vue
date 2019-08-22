<template>

    <v-row aling="center" justify="center" no-gutters>
        <v-col cols="8">
            <v-img :src="imagen"
            aspect-ratio="1"
            :max-height="max"
            :max-width="max"
            />
                <v-select
                v-model="to"
                :items="productos"
                :label="label"
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
        name: 'G-producto',
        props: {
            productos:{
                type: Array
            },
            status:{
                type: Boolean,
                default: true
            },
            label: {
                type: String,
                default: ''
            },
            max:{
                type:Number,
                default: null,
            }
        },
        data() {
            return {
                to:'',
                imagen: ''
            }
        },
        watch: {
            to(val) {
                this.imagen = val.imagen;
                this.$emit("objProducto", (val))
            }
        },
    }
</script>
