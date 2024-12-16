<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Publicaciones</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 0.5cm;
            margin-left: 0.5cm;
            margin-right: 0.5cm;
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
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .fecha {
            width: 250px;
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
            width: 250px;
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

        .txt_rojo {}

        .img_celda img {
            width: 45px;
        }

        .lista {
            padding-left: 8px;
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
        <h4 class="texto">LISTA DE PUBLICACIONES</h4>
        <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
    </div>
    <table border="1">
        <thead class="bg-principal">
            <tr>
                <th width="3%">N°</th>
                <th width="5%">NRO. DEL BIEN</th>
                <th>USUARIO</th>
                <th>CATEGORÍA</th>
                <th>MONEDA</th>
                <th>OFERTA INCIAL</th>
                <th>UBICACIÓN</th>
                <th>OBSERVACIONES</th>
                <th>FECHA Y HORA DE PUBLICACIÓN</th>
                <th>FECHA Y HORA LIMITE</th>
                <th>MONTO DE GARANTÍA</th>
                <th>CARACTERISTICAS-DETALLES</th>
                <th>ESTADO</th>
            </tr>
        </thead>
        <tbody>
            @php
                $cont = 1;
            @endphp
            @foreach ($publicacions as $publicacion)
                @php
                    $detalles = App\Models\PublicacionDetalle::where('publicacion_id', $publicacion->id)
                        ->get()
                        ->take(3);
                @endphp

                <tr>
                    <td class="centreado">{{ $cont++ }}</td>
                    <td class="centreado">{{ $publicacion->nro }}</td>
                    <td>{{ $publicacion->user->full_name }}</td>
                    <td class="">{{ $publicacion->categoria }}</td>
                    <td class="">{{ $publicacion->moneda }}</td>
                    <td class="">{{ number_format($publicacion->oferta_inicial, 2, '.', ',') }}</td>
                    <td class="">{{ $publicacion->ubicacion }}</td>
                    <td class="">{{ $publicacion->observaciones }}</td>
                    <td class="">{{ $publicacion->subasta ? $publicacion->subasta->fecha_hora_pub_am : 'S/P' }}</td>
                    <td class="">{{ $publicacion->fecha_hora_limite_am }}</td>
                    <td class="">{{ number_format($publicacion->monto_garantia, 2, '.', ',') }}</td>
                    <td class="">
                        <ul class="lista">
                            @foreach ($detalles as $item)
                                <li><strong>{{ $item->caracteristica }}:</strong> {{ $item->detalle }}</li>
                            @endforeach
                        </ul>
                    </td>
                    <td class="">{{ $publicacion->estado_txt }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>
