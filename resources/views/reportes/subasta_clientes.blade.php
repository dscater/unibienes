<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>SubastaClientes</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 1cm;
            margin-left: 1cm;
            margin-right: 1cm;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            page-break-before: avoid;
        }

        table thead tr th,
        tbody tr td {
            padding: 3px;
            word-wrap: break-word;
        }

        table thead tr th {
            font-size: 7pt;
        }

        table tbody tr td {
            font-size: 6pt;
        }


        .encabezado {
            width: 100%;
        }

        .logo img {
            position: absolute;
            height: 100px;
            top: -20px;
            left: 0px;
        }

        h2.titulo {
            width: 450px;
            margin: auto;
            margin-top: 0PX;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14pt;
        }

        .texto {
            width: 400px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .fecha {
            width: 400px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: normal;
            font-size: 0.85em;
        }

        .total {
            text-align: right;
            padding-right: 15px;
            font-weight: bold;
        }

        table {
            width: 100%;
        }

        table thead {
            background: rgb(236, 236, 236)
        }

        tr {
            page-break-inside: avoid !important;
        }

        .centreado {
            padding-left: 0px;
            text-align: center;
        }

        .datos {
            margin-left: 15px;
            border-top: solid 1px;
            border-collapse: collapse;
            width: 400px;
        }

        .txt {
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
        }

        .txt_center {
            font-weight: bold;
            text-align: center;
        }

        .cumplimiento {
            position: absolute;
            width: 150px;
            right: 0px;
            top: 86px;
        }

        .b_top {
            border-top: solid 1px black;
        }

        .gray {
            background: rgb(202, 202, 202);
        }

        .bg-principal {
            background: #153f59;
            color: white;
        }

        .page_break {
            page-break-after: always;
        }

        .img_celda img {
            width: 45px;
        }
    </style>
</head>

<body>
    @inject('configuracion', 'App\Models\Configuracion')
    <div class="encabezado">
        <div class="logo">
            <img src="{{ $configuracion->first()->logo_b64 }}">
        </div>
        <h2 class="titulo">
            {{ $configuracion->first()->razon_social }}
        </h2>
        <h4 class="texto">LISTA DE CLIENTES OFERTANTES POR SUBASTA</h4>
        <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
    </div>

    @php
        $contador = 0;
    @endphp

    @foreach ($publicacions as $publicacion)
        <table>
            <tbody>
                <tr>
                    <td width="10%">NOMBRE SUBASTADOR:</td>
                    <td>{{ $publicacion->user->full_name }}</td>
                </tr>
                <tr>
                    <td width="10%">CATEGORÍA:</td>
                    <td>{{ $publicacion->categoria }}</td>
                </tr>
            </tbody>
        </table>
        @if ($publicacion->subasta)
            <table border="1">
                <thead class="bg-principal">
                    <tr>
                        <th width="3%">N°</th>
                        <th>NOMBRE DEL PARTICIPANTE</th>
                        <th>CARNET DE IDENTIDAD</th>
                        <th>COMPLEMENTO</th>
                        <th>CORREO ELECTRÓNICO</th>
                        <th>NRO. DE CELULAR</th>
                        <th>USUARIO DEL PARTICIPANTE</th>
                        <th>NOMBRE DEL BIEN OFERTADO</th>
                        <th>FECHA DE LA OFERTA</th>
                        <th>HORA DE LA OFERTA</th>
                        <th>OFERTA(MONTO {{ $publicacion->moneda }})</th>
                        <th>MONTO DE GARANTÍA</th>
                        <th>COMPROBANTE DE PAGO DE GARANTÍA(DOCUMENTO PARA DESCARGAR)</th>
                        <th>CARNET DE IDENTIDAD(DOCUMENTO PARA DESCARGAR)</th>
                        <th>SUBASTA VIGENTE/FINALIZADA</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $cont = 1;
                    @endphp
                    @forelse ($publicacion->subasta->subasta_clientes as $subasta_cliente)
                        <tr>
                            <td class="centreado">{{ $cont++ }}</td>
                            <td>{{ $subasta_cliente->cliente->full_name }}</td>
                            <td class="">{{ $subasta_cliente->cliente->full_ci }}</td>
                            <td class="">{{ $subasta_cliente->cliente->complemento }}</td>
                            <td class="">{{ $subasta_cliente->cliente->email }}</td>
                            <td class="">{{ $subasta_cliente->cliente->fono }}</td>
                            <td class="">{{ $subasta_cliente->cliente->user->usuario }}</td>
                            <td class="">{{ $publicacion->categoria }}</td>
                            <td class="">{{ $subasta_cliente->fecha_oferta_t }}</td>
                            <td class="">{{ $subasta_cliente->hora_oferta_t }}</td>
                            <td class="">{{ $subasta_cliente->puja }}</td>
                            <td class="">{{ $publicacion->monto_garantia }}</td>
                            <td class="">{{ $subasta_cliente->url_comprobante }}</td>
                            <td class="">{{ $subasta_cliente->cliente->url_ci_anverso }} <br>
                                {{ $subasta_cliente->cliente->url_ci_reverso }}</td>
                            <td>{{ $publicacion->estado_txt }}</td>
                        </tr>

                    @empty
                    @endforelse
                </tbody>
            </table>
        @else
            <h5 style="width: 100%; text-align:center;">Aún no se publico ninguna subasta</h5>
        @endif

        @php
            $contador++;
        @endphp
        @if ($contador < count($publicacions))
            <div class="page_break"></div>
        @endif
    @endforeach
</body>

</html>