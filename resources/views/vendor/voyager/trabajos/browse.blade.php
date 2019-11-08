@extends('voyager::master')
@section('page_title', __('voyager::generic.viewing').' '.$dataType->display_name_plural)

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-list-add"></i> {{ $dataType->display_name_plural }}
        @can('add',app($dataType->model_name))
            <a href="{{ route('voyager.'.$dataType->slug.'.create') }}" class="btn btn-success">
                <i class="voyager-plus"></i> Agregar un nuevo trabajo
            </a>
        @endcan
    </h1>
@stop

@section('content')
    {{-- {{ $dataTypeContent  }} --}}
    {{-- 0 == por pagar
    1 == esperando por trabajador
    2 == trabajador asignado
   -1 == culminado --}}
    <div class="container">
        <div class="row justify-content-center">
            @foreach ($dataTypeContent  as $data)
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="col-md-8">
                                <h5 class="card-title">
                                    Cuenta: {{ $data->cuenta }} 
                                    @switch($data->status)
                                        @case(0)
                                            (Pendiente por pagar)
                                        @break
                                        @case(1)
                                            (Esperando por asignar trabajador)
                                        @break
                                        @case(2)
                                            (Trabajador asignado: {{ $data->trabajador->name }})
                                        @break
                                    @endswitch 
                                </h5>
                                <p class="card-text">
                                    {{ $data->nota }} <br>
                                    Servidor: {{ ($data->servidor == 'la1') ? 'LAN' : (($data->servidor == 'la2') ? 'LAS' : 'NA')  }} <br>
                                    Metodo de pago: {{ $data->metodoPago->nombre }} <br>
                                    @if ($data->cupon_id)
                                        Cupon: {{ $data->cupon->nombre }} <br>
                                    @endif
                                    @if ($data->nota_cliente)
                                        Nota del cliente: {{ $data->nota_cliente }}
                                    @endif
                                </p>
                                <a href="{{ route('chat-admin', $data->id) }}" class="card-link btn btn-success">Chat</a>
                                <a href="#" class="card-link btn btn-warning">Editar</a>
                                <a href="#" class="card-link btn btn-danger">Cerrar Trabajo</a>
                            </div>
                            <div class="col-md-4">
                                <h2>
                                    Precio: {{ $data->monto }}$
                                </h2>
                                @if ($data->fecha_asignacion_trabajador)
                                    Asignacion del trabajador: {{ $data->fecha_asignacion_trabajador }} <br>
                                @endif
                                @if ($data->fecha_culminacion_trabajo)
                                    Fecha de culminacion del trabajo: {{ $data->fecha_culminacion_trabajo }}
                                @endif
                            </div>
                        </div>   
                    </div>        
                </div>
            @endforeach
        </div>
    </div>
@endsection