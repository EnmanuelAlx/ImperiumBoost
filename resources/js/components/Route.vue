<template>
    <router-link :link="link" :to="to" tag="v-list-item">
        <v-list-item-action>
            <v-icon v-text="icon"></v-icon>
        </v-list-item-action>
        <v-list-item-content>
            <v-list-item-title>
                {{ name }}
            </v-list-item-title>
        </v-list-item-content>
    </router-link>
</template>

<script>
    export default {
        props: {
            icon: {
                type: String,
                default: 'fa-columns'
            },
            name:{
                type: String,
                default: 'Nueva Ruta'
            },
            to:{
                type: Object,
                default:{
                    name: 'home'
                }
            },
            link:{
                type: Boolean,
                default: false
            }
        },
    }
</script>

<style>
    v-list-item{
        cursor: pointer;
    }
</style>