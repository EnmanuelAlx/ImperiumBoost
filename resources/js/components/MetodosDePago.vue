<template>
    <v-sheet
        class="mx-auto"
        elevation="9"
        max-width="1000"
    >
        <h2 class="text-center">
            Metodos de pago
        </h2>
        <v-slide-group
            v-model="metodo_id"
            class="pa-2"
            center-active
            show-arrows
            prev-icon="keyboard_arrow_left"
            next-icon="keyboard_arrow_right"
            mandatory
        >
            <v-slide-item
                v-for="(metodo) in metodos_pago"
                :key="metodo.id"
                v-slot:default="{ active, toggle }"
            >
                <div @click="toggle">
                    <v-card
                    :color="(active) ? 'success' : 'grey lighten-1'"
                    class="ma-4 text-center"
                    height="150"
                    width="120"
                    @click="seleccionar(metodo.id)"
                    
                    >
                        <v-row
                            class="fill-height d-flex child-flex"
                            align="center"
                            justify="center"
                        >
                            <v-scale-transition>
                                <v-img :src="metodo.imagen" max-height="100" max-width="100">

                                </v-img>
                            </v-scale-transition>
                        </v-row>
                        {{ metodo.nombre }}
                    </v-card>
                </div>
            </v-slide-item>
        </v-slide-group>
    </v-sheet>
</template>

<script>
    export default {
        name:"MetodosDePago",
        props: {
            metodos_pago: {
                type: Array,
            },
        },
        data() {
            return {
                metodo_id: 0,
            }
        },
        methods: {
            seleccionar(metodo){
               this.$emit('metodo_seleccionado', metodo)
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>