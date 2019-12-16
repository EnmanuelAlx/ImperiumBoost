<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chats de trabajo</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    {{-- <link rel="stylesheet" href="{{ asset('css/chat.css') }}"> --}}
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" type="text/css" rel="stylesheet">

</head>
<body style="background-image: url({{ asset('imagenes/fondo.png') }}); background-repeat: repeat;">
    <div id="app" class="container-fluid">
        <div class="row">
            <div class="col-md-3 overflow-auto">
                <div class="card text-left">
                <div class="card-header text-white" style="background-color: #3F3F3F;">
                    <h4>Regresar <a name="" id="" class="btn btn-danger" href="{{ route('voyager.trabajos.index') }}" role="button">X</a></h4>  
                </div>
                </div>
                {{-- {{ $dataTypeContent  }} --}}
                {{-- 0 == por pagar
                1 == esperando por trabajador
                2 == trabajador asignado
                3 == trabajo culminado
                -1 == cancelado --}}
                <lista-chats></lista-chats>
            </div>
            <div class="col-md-9">
                @isset($chatAnonimo)
                    <chat-anonimo-admin
                        :usuario="'{{ $chatAnonimo }}'"
                    >
                    </chat-anonimo-admin>
                @endisset
            </div>
        </div>
    </div>
    
    <script src="{{ mix("js/app.js") }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="{{ asset('voyagerjs/chat.js') }}"></script>
</body>
</html>