<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\Configuracion;
use App\Models\Publicacion;
use App\Models\PublicacionDetalle;
use App\Models\SubastaCliente;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;
use PDF;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use Carbon\Carbon;

class ReporteController extends Controller
{
    public $titulo = [
        'font' => [
            'bold' => true,
            'size' => 12,
            'family' => 'Times New Roman'
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
            ],
        ],
    ];

    public $textoBold = [
        'font' => [
            'bold' => true,
            'size' => 10,
        ],
    ];

    public $headerTabla = [
        'font' => [
            'bold' => true,
            'size' => 10,
            'color' => ['argb' => 'ffffff'],
        ],
        'alignment' => [
            'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            ],
        ],
        'fill' => [
            'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
            'color' => ['rgb' => '203764']
        ],
    ];

    public $bodyTabla = [
        'font' => [
            'size' => 10,
        ],
        'alignment' => [
            'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            ],
        ],
    ];

    public function usuarios()
    {
        return Inertia::render("Admin/Reportes/Usuarios");
    }

    public function r_usuarios(Request $request)
    {
        $tipo =  $request->tipo;
        $sucursal_id =  $request->sucursal_id;
        $usuarios = User::select("users.*")
            ->where('id', '!=', 1);

        if ($tipo != 'todos') {
            $request->validate([
                'tipo' => 'required',
            ]);
            $usuarios->where('tipo', $tipo);
        }

        if ($sucursal_id != 'todos') {
            $usuarios->where('sucursal_id', $sucursal_id);
        }

        $usuarios = $usuarios->orderBy("paterno", "ASC")->get();

        $pdf = PDF::loadView('reportes.usuarios', compact('usuarios'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->stream('usuarios.pdf');
    }

    public function publicacions()
    {
        return Inertia::render("Admin/Reportes/Publicacions");
    }

    public function r_publicacions(Request $request)
    {
        $formato =  $request->formato;

        $fecha_ini =  $request->fecha_ini;
        $fecha_fin =  $request->fecha_fin;
        $categoria =  $request->categoria;

        $publicacions = Publicacion::select("publicacions.*");

        $permisos = Auth::user()->permisos;
        if (is_array($permisos) && !in_array("publicacions.todos", $permisos)) {
            $publicacions->where("user_id", Auth::user()->id);
        }


        if ($categoria != 'todos') {
            $publicacions->where("categoria", $categoria);
        }

        if ($fecha_ini && $fecha_fin) {
            $publicacions->whereBetween("created_at", [
                Carbon::parse($fecha_ini)->startOfDay(),
                Carbon::parse($fecha_fin)->endOfDay()
            ]);
        }

        $publicacions->whereNotIn("estado_sub", [5]);

        $publicacions = $publicacions->get();

        if ($formato == "pdf") {
            $pdf = PDF::loadView('reportes.publicacions', compact('publicacions'))->setPaper('legal', 'landscape');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->stream('publicacions.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Formularios')
                ->setSubject('Formularios')
                ->setDescription('Formularios')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "LISTA DE PUBLICACIONES");
            $sheet->mergeCells("A" . $fila . ":L" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':L' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':L' . $fila)->applyFromArray($this->titulo);
            $fila++;
            $fila++;
            $fila++;
            $sheet->setCellValue('A' . $fila, 'N°');
            $sheet->setCellValue('B' . $fila, 'USUARIO');
            $sheet->setCellValue('C' . $fila, 'CATEGORÍA');
            $sheet->setCellValue('D' . $fila, 'MONEDA');
            $sheet->setCellValue('E' . $fila, 'OFERTA INICIAL');
            $sheet->setCellValue('F' . $fila, 'UBICACIÓN');
            $sheet->setCellValue('G' . $fila, 'OBSERVACIONES');
            $sheet->setCellValue('H' . $fila, 'FECHA Y HORA DE PUBLICACIÓN');
            $sheet->setCellValue('I' . $fila, 'FECHA Y HORA LIMITE');
            $sheet->setCellValue('J' . $fila, 'MONTO DE GARANTÍA');
            $sheet->setCellValue('K' . $fila, 'CARACTERISTICAS-DETALLES');
            $sheet->setCellValue('L' . $fila, 'ESTADO');
            $sheet->getStyle('A' . $fila . ':L' . $fila)->applyFromArray($this->headerTabla);
            $fila++;
            $cont = 1;
            foreach ($publicacions as $publicacion) {
                $sheet->setCellValue('A' . $fila, $cont++);
                $sheet->setCellValue('B' . $fila, $publicacion->user->full_name);
                $sheet->setCellValue('C' . $fila, $publicacion->categoria);
                $sheet->setCellValue('D' . $fila, $publicacion->moneda);
                $sheet->setCellValue('E' . $fila, $publicacion->oferta_inicial);
                $sheet->setCellValue('F' . $fila, $publicacion->ubicacion);
                $sheet->setCellValue('G' . $fila, $publicacion->observaciones);
                $sheet->setCellValue('H' . $fila, $publicacion->subasta ? $publicacion->subasta->fecha_hora_pub_am : 'S/P');
                $sheet->setCellValue('I' . $fila, $publicacion->fecha_hora_limite_am);
                $sheet->setCellValue('J' . $fila, $publicacion->monto_garantia);

                $detalles = PublicacionDetalle::where('publicacion_id', $publicacion->id)
                    ->get()
                    ->take(3);
                $text = "";

                foreach ($detalles as $item) {
                    $text .= "-$item->caracteristica: $item->detalle \n";
                }

                $sheet->setCellValue('K' . $fila, $text);
                $sheet->setCellValue('L' . $fila, $publicacion->estado_txt);
                $sheet->getStyle('A' . $fila . ':L' . $fila)->applyFromArray($this->bodyTabla);
                $fila++;
            }

            $sheet->getColumnDimension('A')->setWidth(6);
            $sheet->getColumnDimension('B')->setWidth(20);
            $sheet->getColumnDimension('C')->setWidth(15);
            $sheet->getColumnDimension('D')->setWidth(15);
            $sheet->getColumnDimension('E')->setWidth(10);
            $sheet->getColumnDimension('F')->setWidth(25);
            $sheet->getColumnDimension('G')->setWidth(30);
            $sheet->getColumnDimension('H')->setWidth(10);
            $sheet->getColumnDimension('I')->setWidth(10);
            $sheet->getColumnDimension('J')->setWidth(10);
            $sheet->getColumnDimension('K')->setWidth(25);
            $sheet->getColumnDimension('L')->setWidth(10);

            foreach (range('A', 'L') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:L');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="publicacions_' . time() . '.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
    public function subasta_clientes()
    {
        return Inertia::render("Admin/Reportes/SubastaClientes");
    }

    public function r_subasta_clientes(Request $request)
    {
        $formato =  $request->formato;
        $fecha_ini =  $request->fecha_ini;
        $fecha_fin =  $request->fecha_fin;
        $categoria =  $request->categoria;
        $publicacions = Publicacion::select("publicacions.*");

        $permisos = Auth::user()->permisos;
        if (is_array($permisos) && !in_array("publicacions.todos", $permisos)) {
            $publicacions->where("user_id", Auth::user()->id);
        }

        if ($categoria != 'todos') {
            $publicacions->where("categoria", $categoria);
        }

        $publicacions = $publicacions->whereNotIn("estado_sub", [5])->get();

        if ($formato == "pdf") {
            $pdf = PDF::loadView('reportes.subasta_clientes', compact('publicacions', 'fecha_ini', 'fecha_fin'))->setPaper('legal', 'landscape');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->stream('subasta_clientes.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Registros')
                ->setSubject('Registros')
                ->setDescription('Registros')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "LISTA DE CLIENTES OFERTANTES POR SUBASTA");
            $sheet->mergeCells("A" . $fila . ":S" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':S' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':S' . $fila)->applyFromArray($this->titulo);
            $fila++;
            $fila++;
            $fila++;

            foreach ($publicacions as $publicacion) {

                $subasta_clientes = [];
                if ($fecha_ini && $fecha_fin) {
                    if ($publicacion->subasta) {
                        $subasta_clientes = SubastaCliente::where(
                            'subasta_id',
                            $publicacion->subasta->id,
                        )
                            ->whereBetween('fecha_oferta', [$fecha_ini, $fecha_fin])
                            ->where('puja', '>', 0)
                            // ->where('estado_comprobante', 1)
                            ->get();
                    }
                } else {
                    $subasta_clientes = SubastaCliente::where(
                        'subasta_id',
                        $publicacion->subasta->id,
                    )
                        ->where('puja', '>', 0)
                        // ->where('estado_comprobante', 1)
                        ->get();
                }

                if ($publicacion->subasta && count($subasta_clientes) > 0) {
                    $sheet->setCellValue('A' . $fila, 'NOMBRE DEL SUBASTADOR:');
                    $sheet->mergeCells("A" . $fila . ":B" . $fila);  //COMBINAR CELDAS
                    $sheet->setCellValue('C' . $fila, $publicacion->user->full_name);
                    $sheet->mergeCells("C" . $fila . ":S" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':S' . $fila)->applyFromArray($this->bodyTabla);
                    $fila++;
                    $sheet->setCellValue('A' . $fila, 'CATEGORÍA:');
                    $sheet->mergeCells("A" . $fila . ":B" . $fila);  //COMBINAR CELDAS
                    $sheet->setCellValue('C' . $fila, $publicacion->categoria);
                    $sheet->mergeCells("C" . $fila . ":S" . $fila);  //COMBINAR CELDAS
                    $sheet->getStyle('A' . $fila . ':S' . $fila)->applyFromArray($this->bodyTabla);
                    $fila++;

                    $sheet->setCellValue('A' . $fila, 'N°');
                    $sheet->setCellValue('B' . $fila, 'NOMBRE DEL PARTICIPANTE');
                    $sheet->setCellValue('C' . $fila, 'CARNET DE IDENTIDAD');
                    $sheet->setCellValue('D' . $fila, 'COMPLEMENTO');
                    $sheet->setCellValue('E' . $fila, 'CORREO ELECTRÓNICO INICIAL');
                    $sheet->setCellValue('F' . $fila, 'NRO. DE CELULAR');
                    $sheet->setCellValue('G' . $fila, 'USUARIO DEL PARTICIPANTE');
                    $sheet->setCellValue('H' . $fila, 'NOMBRE DEL BIEN OFERTADO');
                    $sheet->setCellValue('I' . $fila, 'FECHA DE LA OFERTA');
                    $sheet->setCellValue('J' . $fila, 'ÚLTIMA FECHA DE LA OFERTA'); //
                    $sheet->setCellValue('K' . $fila, 'HORA DE LA OFERTA');
                    $sheet->setCellValue('L' . $fila, 'ÚLTIMA HORA DE LA OFERTA'); //
                    $sheet->setCellValue('M' . $fila, "OFERTA\nMONTO " . $publicacion->moneda);
                    $sheet->setCellValue('N' . $fila, "OFERTA FINAL\nMONTO " . $publicacion->moneda); //
                    $sheet->setCellValue('O' . $fila, 'MONTO DE GARANTÍA');
                    $sheet->setCellValue('P' . $fila, "COMPROBANTE DE PAGO DE GARANTÍA\n(DOCUMENTO PARA DESCARGAR)");
                    $sheet->setCellValue('Q' . $fila, "CARNET DE IDENTIDAD\n(DOCUMENTO PARA DESCARGAR)");
                    $sheet->setCellValue('R' . $fila, 'CARACTERISTICAS-DETALLES');
                    $sheet->setCellValue('S' . $fila, 'SUBASTA VIGENTE/FINALIZADA');
                    $sheet->getStyle('A' . $fila . ':S' . $fila)->applyFromArray($this->headerTabla);
                    $fila++;
                    $cont = 1;



                    $detalles = PublicacionDetalle::where('publicacion_id', $publicacion->id)
                        ->get()
                        ->take(3);
                    $text = "";

                    foreach ($detalles as $item) {
                        $text .= "-$item->caracteristica: $item->detalle \n";
                    }

                    foreach ($subasta_clientes as $subasta_cliente) {
                        $sheet->setCellValue('A' . $fila, $cont++);
                        $sheet->setCellValue('B' . $fila, $subasta_cliente->cliente->full_name);
                        $sheet->setCellValue('C' . $fila, $subasta_cliente->cliente->full_ci);
                        $sheet->setCellValue('D' . $fila, $subasta_cliente->cliente->complemento);
                        $sheet->setCellValue('E' . $fila, $subasta_cliente->cliente->email);
                        $sheet->setCellValue('F' . $fila, $subasta_cliente->cliente->fono);
                        $sheet->setCellValue('G' . $fila, $subasta_cliente->cliente->user->usuario);
                        $sheet->setCellValue('H' . $fila, $publicacion->categoria);
                        $texto = $subasta_cliente->fecha_oferta_t;
                        if (count($subasta_cliente->historial_ofertas) > 0) {
                            $texto = "";
                            foreach ($subasta_cliente->historial_ofertas as $key_ho => $historial_oferta) {
                                $texto .= "- " . $historial_oferta->fecha_oferta_t . "\n";
                            }
                        }
                        $sheet->setCellValue('I' . $fila, $texto);
                        $sheet->setCellValue('J' . $fila, $subasta_cliente->fecha_oferta_t);
                        $texto = $subasta_cliente->hora_oferta_t;
                        if (count($subasta_cliente->historial_ofertas) > 0) {
                            $texto = "";
                            foreach ($subasta_cliente->historial_ofertas as $key_ho => $historial_oferta) {
                                $texto .= "- " . $historial_oferta->hora_oferta_t . "\n";
                            }
                        }
                        $sheet->setCellValue('K' . $fila, $texto);
                        $sheet->setCellValue('L' . $fila, $subasta_cliente->hora_oferta_t);
                        $texto = number_format($subasta_cliente->puja, 2, '.', ',');
                        if (count($subasta_cliente->historial_ofertas) > 0) {
                            $texto = "";
                            foreach ($subasta_cliente->historial_ofertas as $key_ho => $historial_oferta) {
                                $texto .= "- " . number_format($historial_oferta->puja, 2, '.', ',')  . "\n";
                            }
                        }
                        $sheet->setCellValue('M' . $fila, $texto);
                        $sheet->setCellValue('N' . $fila, number_format($subasta_cliente->puja, 2, ".", ","));
                        $sheet->setCellValue('O' . $fila, $publicacion->monto_garantia);
                        $sheet->setCellValue('P' . $fila, $subasta_cliente->url_comprobante);
                        $sheet->setCellValue('Q' . $fila, $subasta_cliente->cliente->url_ci_anverso . "\n" . $subasta_cliente->cliente->url_ci_reverso);
                        $sheet->setCellValue('R' . $fila, $text);
                        $sheet->setCellValue('S' . $fila, $publicacion->estado_txt);
                        $sheet->getStyle('A' . $fila . ':S' . $fila)->applyFromArray($this->bodyTabla);
                        $fila++;
                    }
                    $fila++;
                    $fila++;
                    $fila++;
                }
            }


            $sheet->getColumnDimension('A')->setWidth(6);
            $sheet->getColumnDimension('B')->setWidth(20);
            $sheet->getColumnDimension('C')->setWidth(10);
            $sheet->getColumnDimension('D')->setWidth(7);
            $sheet->getColumnDimension('E')->setWidth(15);
            $sheet->getColumnDimension('F')->setWidth(10);
            $sheet->getColumnDimension('G')->setWidth(10);
            $sheet->getColumnDimension('H')->setWidth(15);
            $sheet->getColumnDimension('I')->setWidth(10);
            $sheet->getColumnDimension('J')->setWidth(10);
            $sheet->getColumnDimension('K')->setWidth(10);
            $sheet->getColumnDimension('L')->setWidth(10);
            $sheet->getColumnDimension('M')->setWidth(15);
            $sheet->getColumnDimension('N')->setWidth(15);
            $sheet->getColumnDimension('O')->setWidth(15);
            $sheet->getColumnDimension('P')->setWidth(20);
            $sheet->getColumnDimension('Q')->setWidth(20);
            $sheet->getColumnDimension('R')->setWidth(35);
            $sheet->getColumnDimension('S')->setWidth(15);

            foreach (range('A', 'S') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:S');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="subasta_clientes_' . time() . '.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }


    public function g_subasta_clientes()
    {
        return Inertia::render("Admin/Reportes/GSubastaClientes");
    }

    public function gr_subasta_clientes(Request $request)
    {
        $fecha_ini = $request->fecha_ini;
        $fecha_fin = $request->fecha_fin;
        $categoria = $request->categoria;

        $publicacions = Publicacion::select("publicacions.*")
            ->whereIn("estado_sub", [1, 2, 3, 4]);

        if ($categoria != 'todos') {
            $publicacions->where("publicacions.categoria", $categoria);
        }

        $permisos = Auth::user()->permisos;
        if (is_array($permisos) && !in_array("publicacions.todos", $permisos)) {
            $publicacions->where("user_id", Auth::user()->id);
        }

        $publicacions->whereNotIn("estado_sub", [5]);
        $publicacions = $publicacions->get();
        $data = [];
        foreach ($publicacions as $publicacion) {
            $total = 0;
            if ($publicacion->subasta) {
                $total = SubastaCliente::select("subasta_clientes.*")
                    ->join("historial_ofertas", "historial_ofertas.subasta_cliente_id", "=", "subasta_clientes.id")
                    ->where("subasta_clientes.subasta_id", $publicacion->subasta->id);
                if ($fecha_ini && $fecha_fin) {
                    $total->whereBetween("historial_ofertas.fecha_oferta", [$fecha_ini, $fecha_fin]);
                }
                $total = $total->distinct("subasta_clientes.cliente_id")->count();
            }

            $data[] = [$publicacion->categoria . "-" . $publicacion->id, (int)$total];
        }

        return response()->JSON([
            "data" => $data
        ]);
    }

    public function clientes()
    {
        return Inertia::render("Admin/Reportes/Clientes");
    }

    public function r_clientes(Request $request)
    {
        $formato =  $request->formato;
        $fecha_ini =  $request->fecha_ini;
        $fecha_fin =  $request->fecha_fin;
        $clientes = Cliente::select("clientes.*");

        if ($fecha_ini && $fecha_fin) {
            $clientes->whereBetween("fecha_registro", [$fecha_ini, $fecha_fin]);
        }

        $clientes = $clientes->get();

        if ($formato == "pdf") {
            $pdf = PDF::loadView('reportes.clientes', compact('clientes'))->setPaper('letter', 'portrait');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->stream('clientes.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Registros')
                ->setSubject('Registros')
                ->setDescription('Registros')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo); // put your path and image here
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "LISTA DE CLIENTES");
            $sheet->mergeCells("A" . $fila . ":M" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':M' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':M' . $fila)->applyFromArray($this->titulo);
            $fila++;
            $fila++;
            $fila++;
            $sheet->setCellValue('A' . $fila, 'N°');
            $sheet->setCellValue('B' . $fila, 'NOMBRE(S)');
            $sheet->setCellValue('C' . $fila, 'PATERNO');
            $sheet->setCellValue('D' . $fila, 'MATERNO');
            $sheet->setCellValue('E' . $fila, 'CARNET DE IDENTIDAD');
            $sheet->setCellValue('F' . $fila, 'COMPLEMENTO');
            $sheet->setCellValue('G' . $fila, 'CELULAR');
            $sheet->setCellValue('H' . $fila, 'DPTO. RESIDENCIA');
            $sheet->setCellValue('I' . $fila, 'CORREO ELECTRÓNICO');
            $sheet->setCellValue('J' . $fila, 'BANCO');
            $sheet->setCellValue('K' . $fila, 'NRO. CUENTA');
            $sheet->setCellValue('L' . $fila, 'MONEDA');
            $sheet->setCellValue('M' . $fila, 'FECHA DE REGISTRO');
            $sheet->getStyle('A' . $fila . ':M' . $fila)->applyFromArray($this->headerTabla);
            $fila++;
            $cont = 1;
            foreach ($clientes as $publicacion) {
                $sheet->setCellValue('A' . $fila, $cont++);
                $sheet->setCellValue('B' . $fila, $publicacion->nombre);
                $sheet->setCellValue('C' . $fila, $publicacion->paterno);
                $sheet->setCellValue('D' . $fila, $publicacion->materno);
                $sheet->setCellValue('E' . $fila, $publicacion->full_ci);
                $sheet->setCellValue('F' . $fila, $publicacion->complemento);
                $sheet->setCellValue('G' . $fila, $publicacion->fono);
                $sheet->setCellValue('H' . $fila, $publicacion->dpto_residencia);
                $sheet->setCellValue('I' . $fila, $publicacion->email);
                $sheet->setCellValue('J' . $fila, $publicacion->banco);
                $sheet->setCellValue('K' . $fila, $publicacion->nro_cuenta . " ");
                $sheet->setCellValue('L' . $fila, $publicacion->moneda);
                $sheet->setCellValue('M' . $fila, $publicacion->fecha_registro_t);
                $sheet->getStyle('A' . $fila . ':M' . $fila)->applyFromArray($this->bodyTabla);
                $fila++;
            }

            $sheet->getColumnDimension('A')->setWidth(6);
            $sheet->getColumnDimension('B')->setWidth(10);
            $sheet->getColumnDimension('C')->setWidth(10);
            $sheet->getColumnDimension('D')->setWidth(10);
            $sheet->getColumnDimension('E')->setWidth(10);
            $sheet->getColumnDimension('F')->setWidth(8);
            $sheet->getColumnDimension('G')->setWidth(10);
            $sheet->getColumnDimension('H')->setWidth(16);
            $sheet->getColumnDimension('I')->setWidth(20);
            $sheet->getColumnDimension('J')->setWidth(20);
            $sheet->getColumnDimension('K')->setWidth(16);
            $sheet->getColumnDimension('L')->setWidth(10);
            $sheet->getColumnDimension('M')->setWidth(10);

            foreach (range('A', 'M') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:M');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="clientes_' . time() . '.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
}
