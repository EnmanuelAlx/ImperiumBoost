<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="imagenes" content="{{ asset('imagenes') }}" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="public_path" content="{{ asset('') }}">
    <title>Dashboard</title>
    <link rel="stylesheet" href="{{ config('app.name') }}" class="app_name">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">

</head>
<body>
    <div id="app">
        <App-usuario :email="'{{ Auth::user()->email }}'" :usuario="{{ Auth::user() }}" :avatar="'{{ Auth::user()->avatar }}'" :role_id="{{ Auth::user()->role_id }}"></App-usuario>
    </div>
    <script src="{{ mix("js/app.js") }}"></script>
    {{-- <script src="{{ asset('js/app.js') }}"></script> --}}
    
</body>
</html>