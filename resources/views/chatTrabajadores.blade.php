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
                    <h4>Trabajos <a name="" id="" class="btn btn-danger" href="{{ route('voyager.trabajos.index') }}" role="button">X</a></h4>  
                </div>
                </div>
                {{-- {{ $dataTypeContent  }} --}}
                {{-- 0 == por pagar
                1 == esperando por trabajador
                2 == trabajador asignado
                3 == trabajo culminado
                -1 == cancelado --}}
                @foreach ($trabajadores as $trabajador)
                    <div class="card text-left">
                        <a href="{{ route('chat-trabajador', $trabajador->id) }}">
                            <div class="card-body">
                                <h4 class="card-title">Nombre: {{ $trabajador->name }}</h4>
                                <p class="card-text">
                                    <span> Email: {{ $trabajador->email}} </span><br>
                                    <span>Cantidad de trabajos activos {{ $trabajador->trabajosActivos()->count() }}</span><br>
                                    <span class="badge badge-danger">Kda: {{ $trabajador->kda }}</span>
                                </p>
                            </div>
                        </a>
                    </div>
                @endforeach
            </div>
            <div class="col-md-6">
                @isset($traba)
                    <chat-trabajador-admin
                        :usuario="{{ $traba }}"
                    >
                    </chat-trabajador-admin>
                @endisset
            </div>
            <div class="col-md-3">
                @isset($traba)
                    <div class="card text-left">
                            <div class="card-header text-white" style="background-color: #3F3F3F;">
                                <h4>Informacion del servicio</h4>
                            </div>
                            <div class="card-body">
                               
                            </div>
                        </div>
                @endisset
            </div>
        </div>
    </div>
    
    <script src="{{ mix("js/app.js") }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="{{ asset('voyagerjs/chat.js') }}"></script>
</body>
</html>