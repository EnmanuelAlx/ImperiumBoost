<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="public_path" content="{{ asset('') }}">

        <title>{{ env('APP_NAME') }}</title>

        <!-- Fonts -->
        {{-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet"> --}}
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="sonidos" content="{{ asset('sonido') }}" />

        <!-- Styles -->
        <link rel="stylesheet" href="{{ asset('css/app.css') }}">
        
    </head>
    <body>
        <v-app id="app">
            <home v-bind:source="'{{ route('voyager.dashboard') }}'"></home>
        </v-app>
        {{-- <script src="{{ asset('js/app.js') }}"></script> --}}
        <script src="{{ mix("js/app.js") }}"></script>
    </body>
</html>
