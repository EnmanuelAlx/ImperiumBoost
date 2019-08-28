<template>
    <v-container>
        <div class="row justify-content-md-center aling-center">
            <v-img :src="$store.state.imagen" max-height="200" max-width="200"/>
        </div>
        <v-row justify="center">
            <v-col cols="8">
                <div class="custom-file">
                    <input class="custom-file-input" type="file" name="imagen" id="#imagen" @change="onFileSelected">
    
                    <label class="custom-file-label" for="#imagen">Cambiar avatar</label>
                </div>
            </v-col>
        </v-row>


        <div class="row">
            <div class="col-6">
            <v-text-field
                name="name"
                v-model="email"
                label="Correo electronico"
                :rules="emailRules"
                :error-messages="error_message"
                :success-messages="success_message"
                :color="this.$colors.primary"
                id="id"
            ></v-text-field>
            <v-btn :color="this.$colors.primary" @click="cambiarEmail">Cambiar email</v-btn>
            </div>
            <div class="col-6">
                <v-text-field
                    name="password"
                    v-model="password"
                    label="Cambiar contraseña"
                    :append-icon="show1 ? 'visibility' : 'visibility_off'"
                    :type="show1 ? 'text' : 'password'"
                    @click:append="show1 = !show1"
                    :error-messages="error_message_password"
                    :success-messages="success_message_password"
                    :color="this.$colors.primary"
                ></v-text-field>
                <v-text-field
                    name="verifyPassword"
                    v-model="password2"
                    label="Repetir contraseña"
                    :append-icon="show1 ? 'visibility' : 'visibility_off'"
                    :type="show1 ? 'text' : 'password'"
                    @click:append="show1 = !show1"
                    :error-messages="error_message_password"
                    :success-messages="success_message_password"
                    :color="this.$colors.primary"
                ></v-text-field>
                <v-btn :color="this.$colors.primary" :disabled="ok" @click="changePassword">Cambiar contraseña</v-btn>
            </div>
        </div>

    </v-container>
</template>

<script>
    export default {
        name:"ModificarUsuario",
        data() {
            return {
                email: this.$store.state.email,
                emailRules: [
                    v => /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) || 'E-mail no valido'
                ],
                password: '',
                password2: '',
                show1: false,
                selectedFile: null,
                error_message:'',
                success_message: '', 
                error_message_password: '',
                success_message_password: '',

                ok:false,
            }
        },
        methods: {
            onFileSelected(event) {
                console.log(event);
                const fd = new FormData();
                this.selectedFile = event.target.files[0]
                fd.append('image', this.selectedFile, this.selectedFile.name)
                axios.post('/modifyImage', fd)
                .then(res=>{
                    this.$store.state.imagen = res.data
                })
                .catch(err=>{
                    alert(err)
                })
            },
            cambiarEmail(){
                let email = this.email
                axios.post('/changeEmail', {email})
                .then(res=>{
                    console.log(res);
                    this.error_message = []
                    this.$store.state.email = res.data.email
                    this.success_message = res.data.message
                })
                .catch(err=>{
                    console.log(err.response.data);
                    this.error_message = err.response.data
                })
            },
            changePassword(){
                let password = this.password
                let password_confirmation = this.password2
                if(password != password_confirmation){
                    this.error_message_password = "Las contraseñas no coinciden"
                    return;
                }
                axios.post('/changePassword', {password, password_confirmation})
                .then(res=>{
                    this.success_message_password = res.data;
                })
                .catch(err=>{
                    this.error_message_password = err.response.data
                })
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>