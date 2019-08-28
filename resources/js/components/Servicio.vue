<template>
    <v-card hover @click="dialog = true">
        <v-card-text>
            <v-row>
                <v-col cols="8">
                    <h3 class="headline mb-0">Servicio de {{ servicio.servicio.tipo }}</h3>
                    <div v-html="servicio.nota.replace(/\n/g, '<br>')" ></div>
                </v-col>
                <v-col>
                    <div>Fecha de creacion: {{ servicio.date_format_1 }}</div>
                    <div v-if="servicio.fecha_asignacion_trabajador != null">Fecha asignado: {{ servicio.fecha_asignacion_trabajador }}</div>
                    <div v-if="servicio.fecha_culminacion_trabajo != null">Fecha culminacion: {{ servicio.fecha_culminacion_trabajo }}</div>
                    <div class="headline" v-if="$store.state.role_id==2"><b>Precio: {{ servicio.monto }}$</b></div>
                    <div class="headline" v-else><b>Ganancia: {{ servicio.monto * (servicio.porcentaje_trabajador/100) }}$</b></div>
                </v-col>
            </v-row>
        </v-card-text>
        <v-row>
            <v-col v-if="servicio.status == 0">
                <v-card color="red" class="text-center">
                    <v-card-text>
                        <div class="subheading"><b>Por pagar</b></div>
                    </v-card-text>
                </v-card>
            </v-col>
             <v-col class="text-center" v-else-if="servicio.status == 1">
                <v-card color="green">
                    <v-card-text>
                        <span class="subheading"><b>Esperando trabajador</b></span>
                    </v-card-text>
                </v-card>
            </v-col>
            <v-col class="text-center" v-else-if="servicio.status == 2 && servicio.trabajador_id">
                <v-card color="primary">
                    <v-card-text>
                        <span class="subheading"><b>Trabajador: {{ servicio.trabajador.name }}</b></span>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
        <v-dialog
            v-model="dialog"
            max-width="600px"
            transition="dialog-transition"
        >
            <modal-servicio
                :servicio="servicio"
                @closeModal="closeModal"
            />
        </v-dialog>
    </v-card>
</template>

<script>
import ModalServicio from './ModalServicio'
    export default {
        name:'Servicio',
        components: {
            ModalServicio,
        },
        props: {
            servicio: {
                type: Object, 
            },
        },
        data() {
            return {
                dialog: false
            }
        },
        methods: {
            closeModal() {
                this.dialog = false
            }
        },
    }
</script>
