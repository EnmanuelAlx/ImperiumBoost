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
                @foreach ($trabajos as $trabajo)
                    <div class="card text-left">
                        <a href="{{ route('chat-admin', $trabajo->id) }}">
                            <div class="card-body">
                                <h4 class="card-title">Usuario: {{ $trabajo->usuario->name }}</h4>
                                <p class="card-text">Servicio: {{ $trabajo->servicio->tipo }} 
                                    @switch($trabajo->status)
                                        @case(0)
                                            <span class="badge badge-danger">Por pagar</span>
                                            @break
                                        @case(1)
                                            <span class="badge badge-info">Esperando trabajador</span>
                                            @break
                                        @case(2)
                                            <span class="badge badge-success">Trabajador: {{ $trabajo->trabajador->name }}</span>
                                            @break
                                        @default
                                            
                                    @endswitch
                                    @isset($trabajo->mensajes->last()['read'])
                                        @if (!$trabajo->mensajes->last()['read'])
                                        <br>
                                        <span class="badge badge-danger">Mensajes sin leer</span>
                                        @endif
                                    @endisset
                                </p>
                            </div>
                        </a>
                    </div>
                @endforeach
            </div>
            <div class="col-md-6">
                <chat-admin
                    :usuario="{{ $chatActual->usuario }}"
                    :trabajo="{{ $chatActual }}"
                >
                </chat-admin>
            </div>
            <div class="col-md-3">
                <div class="card text-left">
                    <div class="card-header text-white" style="background-color: #3F3F3F;">
                        <h4>Informacion del servicio</h4>
                    </div>
                    <div class="card-body">
                        <div>
                            {{ $chatActual->nota }}
                        </div>
                        <div>
                            <b>Monto a pagar</b>: {{ $chatActual->monto }}$
                        </div>
                        @if ($chatActual->cupon)
                            <div>
                                <b>Cupon usado</b>: {{ $chatActual->cupon }}
                            </div>
                        @endif
                        @if ($chatActual->nota_cliente)
                            <div>
                                <b>Nota del cliente</b>: {{ $chatActual->nota_cliente }}
                            </div>
                        @endif
                        <div>
                            <b>Cuenta</b>: {{ $chatActual->cuenta }}
                        </div>
                        <div>
                            <b>Servidor</b>: {{ $chatActual->servidor }}
                        </div>
                        <div>
                            <b>Metodo de pago seleccionado</b>: {{ $chatActual->metodoPago->nombre }}
                        </div>
                        <div>
                            @switch($chatActual->status)
                                @case(0)
                                    <span class="badge badge-danger">Por pagar</span>
                                    @break
                                @case(1)
                                    <span class="badge badge-info">Esperando trabajador</span>
                                    @break
                                @case(2)
                                    <span class="badge badge-success">Trabajador: {{ $chatActual->trabajador->name }}</span><br>
                                    <b>Fecha de asignacion</b>: {{ $chatActual->fecha_asignacion_trabajador }}
                                    @break
                                @default
                                    
                            @endswitch
                        </div>
                        <div>
                            <b>Porcentaje del trabajador</b>: {{ $chatActual->porcentaje_trabajador }}%
                        </div>
                        <div>
                            <b>Fecha de culminacion del trabajo</b>: {{ $chatActual->fecha_culminacion_trabajo }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="{{ mix("js/app.js") }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="{{ asset('voyagerjs/chat.js') }}"></script>
</body>
</html>