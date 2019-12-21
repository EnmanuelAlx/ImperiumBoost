<template>
    <v-app>
        <div class="card text-left" v-if="usuario">
        <h4 class="card-header text-white" style="background-color: #3F3F3F;">Chat con: {{ usuario.name }} sobre {{ trabajo.servicio.descripcion }}</h4>
        
        <div class="card-body" style="overflow-y: auto; max-height: 450px;">
            <div v-for="mensaje in mensajes" :key="mensaje.id">
                <div class="text-left" v-if="mensaje.user.role_id != '1'" style="margin: 10px">
                    <!-- <p class="card-text">{{ mensaje.user.name }}: {{ mensaje.message }} </p> -->
                    <v-chip
                        class="ma-2 text-white"
                        :color="$colors.primary"
                        >
                        <v-avatar left>
                            <v-icon>account_circle</v-icon>
                        </v-avatar>
                        {{ mensaje.user.name }}: {{ mensaje.message }}
                    </v-chip>
                    <div v-if="mensaje.image">
                        <v-img :src="mensaje.image"/>
                    </div>
                </div>
                <div class="text-right" style="margin: 10px" v-else>
                    <v-chip
                        class="ma-2"
                        color="#D8D8D8"
                    >
                        <v-avatar left>
                            <v-icon>account_circle</v-icon>
                        </v-avatar>
                        <span style="color: black">
                            {{ mensaje.user.name }}: <span v-if="!mensaje.image">{{ mensaje.message }}</span>                                    
                        </span>
                    </v-chip>
                    <div v-if="mensaje.image">
                        <v-img :src="mensaje.image"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="row">
                <div class="col-md-11">
                    <v-text-field
                        style="margin-top: 10px"
                        label="Escriba un mensaje"
                        outlined
                        v-model="mensaje"
                        append-icon="send"
                        @keyup.enter="send"
                        @click:append="send"

                    />
                </div>
                <div class="col-md-1">
                    <v-file-input
                        v-model="archivo"
                        @change="onDrop"
                    />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4"  v-if="trabajo.status == 0">
                    <button class="btn btn-success" @click="marcarPagado">Marcar como pagado</button> 
                </div>
                <div class="col-md-4" v-else-if="trabajo.status == 1 || trabajo.status == 2">
                    <button class="btn btn-info" @click="dialog = true" >Asignar o cambiar Trabajador</button>
                </div>
                <div class="col-md-4" v-if="trabajo.status == 1 || trabajo.status == 2">
                    <button class="btn btn-info" @click="dialogCambiarContraseña = true">Agregar o cambiar Contraseña de la cuenta</button>
                </div>
                <div class="col-md-4">
                    <button class="btn btn-danger" @click="dialogCerrarTrabajo = true">Cerrar trabajo</button>
                </div>
            </div>
        </div>

        <v-dialog
            v-model="dialogCerrarTrabajo"
            max-width="500"
        >
            <v-card>
                <v-card-title primary-title>
                    <div>
                        <h3 class="headline mb-0">Cerrar Trabajo</h3>
                    </div>
                </v-card-title>
                <v-card-text class="text-center">
                    <v-row>
                        <v-btn-toggle v-model="btnCancelar">
                            <v-col>
                                <v-btn value="1" color="success">Culminar Trabajo</v-btn>
                            </v-col>
                            <v-col>
                                <v-btn value="2" color="red">Cancelar Trabajo</v-btn>
                            </v-col>
                        </v-btn-toggle>
                    </v-row>
                    <v-row v-if="btnCancelar == 1 && trabajo.servicio.id == 1"> 
                        <v-col>
                            <span v-html="diasTardados"></span>
                            <v-text-field
                                outlined
                                label="Partidas por dia"
                                v-model="partidas_x_dia"
                                @change="calcularPuntos"
                            ></v-text-field>
                            <v-text-field
                                outlined
                                label="Factor de dificultad"
                                v-model="factor"
                                @change="calcularPuntos"
                            ></v-text-field>
                            <span>Cantidad de puntos: {{ puntos }}</span>
                        </v-col>
                    </v-row>
                    <v-row v-if="btnCancelar == 2">
                        <v-col>
                            <v-text-field
                                v-model="notaCancelacion"
                                label="Escriba el motivo de la cancelación"
                                outlined
                            />
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col>
                            <v-btn color="warning" @click="cerrarTrabajo">Enviar</v-btn>
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
        </v-dialog>
        
        <v-dialog
            v-model="dialogCambiarContraseña"
            max-width="500"
        >
            <v-card>
                <v-card-title primary-title>
                    <div>
                        <h3 class="headline mb-0">Agregar o cambiar contraseña de la cuenta {{ trabajo.cuenta }}</h3>
                    </div>
                </v-card-title>
                <v-card-text class="text-center">
                    <v-row>
                        <v-col>
                            <v-text-field
                                v-model="contraseña"
                                label="Inserte contraseña"
                                outlined
                            />
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col>
                            <v-btn color="success" @click="cambiarContrasena">Cambiar contraseña</v-btn>
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
        </v-dialog>

        <div v-if="!chatTrabajador">
            <v-dialog
                v-model="dialog"
                max-width="500"
            >
                <div class="card">
                    <div class="card-header">
                        <div v-if="trabajo.trabajador">
                            <div class="row">
                                <div class="col">
                                    <b>Trabajador actual</b>: {{ trabajo.trabajador.name }}
                                </div>
                                <div class="col">
                                    <button class="btn btn-primary" @click="cargarTrabajadores">Cambiar Trabajador</button>
                                </div>
                            </div>
                        </div>
                        <div v-else>
                            <div class="row">
                                <div class="col">
                                    <button class="btn btn-primary" @click="cargarTrabajadores">Cargar trabajadores</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <v-list 
                            nav
                            dense
                        >
                            <v-subheader>Trabajadores</v-subheader>
                            <v-list-item-group>
                                <v-list-item
                                    v-for="trabajador in trabajadores"
                                    :key="trabajador.id"
                                    @click="trabajadorSeleccionado(trabajador.id)"
                                >
                                    <v-list-item-avatar>
                                        <v-img :src="trabajador.avatar"/>
                                    </v-list-item-avatar>

                                    <v-list-item-content>
                                        <v-list-item-title v-text="trabajador.name"/>
                                    </v-list-item-content>
                                </v-list-item>
                            </v-list-item-group>
                        </v-list>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col">
                                <v-menu
                                    ref="menu"
                                    v-model="menu"
                                    :close-on-content-click="false"
                                    :return-value.sync="fecha_culminacion_trabajo"
                                    transition="scale-transition"
                                    offset-y
                                    min-width="290px"
                                >
                                    <template v-slot:activator="{ on }">
                                        <v-text-field
                                            v-model="fecha_culminacion_trabajo"
                                            label="Fecha de culminacion del trabajo"
                                            prepend-icon="event"
                                            readonly
                                            v-on="on"
                                            outlined
                                        ></v-text-field>
                                    </template>
                                    <v-date-picker v-model="fecha_culminacion_trabajo" no-title scrollable>
                                        <v-spacer></v-spacer>
                                        <v-btn text color="primary" @click="menu = false">Cancel</v-btn>
                                        <v-btn text color="primary" @click="$refs.menu.save(fecha_culminacion_trabajo)">OK</v-btn>
                                    </v-date-picker>
                                </v-menu>
                            </div>
                            <div class="col">
                                <v-text-field
                                    outlined
                                    label="Porcentaje del trabajador"
                                    v-model="porcentaje_trabajador"
                                ></v-text-field>
                            </div>
                            <div class="col-md-12">
                                <button class="btn btn-primary" @click="asignarTrabajador">
                                    Asignar trabajador
                                </button>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </v-dialog>
        </div>

    </div>
    </v-app>
</template>

<script>
import moment from 'moment'
import { parse } from 'path';
    export default {
        props: {
            usuario:{
                type: Object
            },
            trabajo:{
                type: Object
            },
            chatTrabajador:{
                type: Boolean,
                default: false
            }
        },
        data() {
            return {
                mensajes:[],
                mensaje: '',
                dialog: false,
                menu: false,
                trabajadores: [],
                trabajador_seleccionado: '',
                archivo: null,
                fecha_culminacion_trabajo: (this.trabajo.fecha_culminacion_trabajo) ? this.trabajo.fecha_culminacion_trabajo : new Date().toISOString().substr(0, 10),
                porcentaje_trabajador: (this.trabajo.porcentaje_trabajador) ? this.trabajo.porcentaje_trabajador : 50.0,
                dialogCerrarTrabajo: false,
                btnCancelar: 0,
                notaCancelacion: '',
                dialogCambiarContraseña: false,
                contraseña: this.trabajo.contraseña_cuenta,
                partidas_x_dia: 1,
                puntos: 1,
                tiempo_de_culminacion: 0,
                factor: 1,
            }
        },
        computed: {
            diasTardados() {
                let fecha_trabajo = moment(this.trabajo.fecha_asignacion_trabajador);
                let fecha_actual = moment();
                this.tiempo_de_culminacion = fecha_actual.diff(fecha_trabajo, 'days');
                this.puntos = this.tiempo_de_culminacion; 
                return `Culmino el trabajo en ${this.tiempo_de_culminacion} dias`;
            }
        },
        beforeDestroy(){
            this.subscribe();
        },
        mounted () {
            this.fetchMessages();
            this.subscribe = this.$store.subscribe((mutation, state) => {
                if(mutation.type == 'message'){
                    console.log('dentro del mutation admi');                    
                    console.log(mutation);
                    this.mensajes.push(this.$store.state.message.message)
                }
            })


            window.Echo.private('chat.'+this.trabajo.id)
            .listen('.my-event-chat', (e) => {
                this.$store.commit('message', e);
                console.log('dentro del my-event-chat');
                console.log(e);
            });
        },
        methods: {
            send () {
                axios.post('/admin/messages', {
                    'message' : this.mensaje,
                    'trabajo' : this.trabajo
                })
                .then(res => {
                    this.mensajes.push(res.data);
                    this.mensaje = ''
                });
            },
            fetchMessages() {
                axios.get(`/messages/${this.trabajo.id}`)
                .then(res => {
                    console.log(res.data);
                    this.mensajes = res.data
                })
            },
            marcarPagado(){
                axios.post('/admin/marcar-pago', this.trabajo)
                .then(res=>{
                    location.reload();
                })
            },
            cargarTrabajadores(){
                axios.get('/api/getTrabajadores')
                .then(res=>{
                    this.trabajadores = res.data
                });
            },
            trabajadorSeleccionado(trabajador_id){
                this.trabajador_seleccionado = trabajador_id
                
            },
            asignarTrabajador(){
                axios.post('/admin/asignarTrabajador',{
                    'trabajador_id': this.trabajador_seleccionado,
                    'trabajo_id': this.trabajo.id,
                    'fecha_culminacion_trabajo': this.fecha_culminacion_trabajo,
                    'porcentaje_trabajador': this.porcentaje_trabajador,
                })
                .then(res => {
                    location.reload();
                })
                .catch(err => {
                    alert(err); 
                })
            },
            onDrop(){
                const fd = new FormData();
                fd.append('files', this.archivo)
                fd.append('trabajo', this.trabajo.id);
                axios.post('/admin/messages-files',fd)
                .then(res => {
                    this.mensajes.push(res.data);                    
                    this.archivo = null
                });
            },
            cerrarTrabajo(){
                let params = {
                    'opcion': this.btnCancelar,
                    'nota' :  this.notaCancelacion,
                    'puntos' : this.puntos,
                }
                axios.post(`/admin/cerrarTrabajo/${this.trabajo.id}`, params)
                .then(res => {
                    location.reload();
                })
                .catch(err => {
                    console.error(err); 
                })
            },
            cambiarContrasena(){
                let params = {
                    'contraseña': this.contraseña  
                };
                console.log('hey')
                axios.post(`/admin/cambiarContrasena/${this.trabajo.id}`,params)
                .then(res => {
                    this.contraseña = res.data.contraseña_cuenta;
                    this.dialogCambiarContraseña = false;
                })
                .catch(err => {
                    alert('Introduce una contraseña');
                })
            },
            calcularPuntos(){
                this.puntos = 0;
                if(this.partidas_x_dia != 0 && this.factor != 0){
                    this.puntos = this.tiempo_de_culminacion * parseFloat(this.partidas_x_dia) * parseFloat(this.factor);
                }
            }
        },

    }
</script>
