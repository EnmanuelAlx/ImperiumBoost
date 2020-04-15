@extends('voyager::master')

{{-- {{ $dataTypeContent  }} --}}
{{-- 0 == por pagar
1 == esperando por trabajador
2 == trabajador asignado
3 == trabajo culminado
-1 == cancelado --}}
@section('content')
  <h1>
    Ganancia total: {{ $ganancias }}
  </h1>

  <div class="">
        <div class="row">
            <div class="col-md-6">
                <h2>Trabajos realizados</h2>

                <table class="table table-light">
                    <thead>
                        <th>
                            Servicio
                        </th>
                        <th>
                            Usuario
                        </th>
                        <th>
                            Trabajador
                        </th>
                        <th>
                            Metodo Pago
                        </th>
                        <th>
                            Monto
                        </th>
                        <th>
                            % Trabajador
                        </th>
                        <th>
                            Ganancia
                        </th>
                        
                    </thead>
                    <tbody>
                        @foreach ($trabajos as $trabajo)
                            <tr>
                                <td>
                                    {{ $trabajo->servicio->tipo }}
                                </td>
                                <td>
                                    {{ $trabajo->usuario->email }}
                                </td>
                                <td>
                                    {{ $trabajo->trabajador->email }}
                                </td>
                                <td>
                                    {{ $trabajo->metodoPago->nombre }}
                                </td>
                                <td>
                                    {{ $trabajo->monto }}
                                </td>
                                <td>
                                    {{ $trabajo->porcentaje_trabajador }}
                                </td>
                                <td>
                                    {{ $trabajo->ganancia() }}
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr >
                            <td></td><td></td><td></td><td></td><td></td>
                            <td colspan="2">
                                <span>
                                    Ganancia total: {{ $ganancias }}
                                </span>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="col-md-6">
                <h2>Trabajos cancelados</h2>
                <table class="table table-light">
                    <thead>
                        <th>
                            Servicio
                        </th>
                        <th>
                            Usuario
                        </th>
                        <th>
                            Trabajador
                        </th>
                        <th>
                            Metodo Pago
                        </th>
                        <th>
                            Monto
                        </th>
                        <th>
                            % Trabajador
                        </th>
                        <th>
                            Perdida
                        </th>
                        
                    </thead>
                    <tbody>
                        @foreach ($trabajos_cancelados as $trabajo)
                            <tr>
                                <td>
                                    {{ $trabajo->servicio->tipo }}
                                </td>
                                <td>
                                    {{ $trabajo->usuario->email }}
                                </td>
                                <td>
                                    {{ $trabajo->trabajador->email }}
                                </td>
                                <td>
                                    {{ $trabajo->metodoPago->nombre }}
                                </td>
                                <td>
                                    {{ $trabajo->monto }}
                                </td>
                                <td>
                                    {{ $trabajo->porcentaje_trabajador }}
                                </td>
                                <td>
                                    {{ $trabajo->ganancia() }}
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
  </div>
@stop