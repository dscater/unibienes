<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Grafico Clientes por Subasta",
        disabled: false,
        url: "",
        name_url: "",
    },
];
</script>

<script setup>
import { useApp } from "@/composables/useApp";
import { computed, onMounted, ref } from "vue";
import { Head, usePage } from "@inertiajs/vue3";
import Highcharts from "highcharts";
import exporting from "highcharts/modules/exporting";
exporting(Highcharts);
Highcharts.setOptions({
    lang: {
        downloadPNG: "Descargar PNG",
        downloadJPEG: "Descargar JPEG",
        downloadPDF: "Descargar PDF",
        downloadSVG: "Descargar SVG",
        printChart: "Imprimir gráfico",
        contextButtonTitle: "Menú de exportación",
        viewFullscreen: "Pantalla completa",
        exitFullscreen: "Salir de pantalla completa",
    },
});
const { setLoading } = useApp();

const generando = ref(false);
const txtBtn = computed(() => {
    if (generando.value) {
        return "Generando Grafico...";
    }
    return "Generar Grafico";
});

const obtenerFechaActual = () => {
    const fecha = new Date();
    const anio = fecha.getFullYear();
    const mes = String(fecha.getMonth() + 1).padStart(2, "0"); // Mes empieza desde 0
    const dia = String(fecha.getDate()).padStart(2, "0"); // Día del mes
    return `${anio}-${mes}-${dia}`;
};

const form = ref({
    fecha_ini: obtenerFechaActual(),
    fecha_fin: obtenerFechaActual(),
    publicacion_id: "todos",
    cliente_id: "todos",
    categoria: "todos",
});

const listPublicacions = ref([]);
const listClientes = ref([]);
const listCategorias = ref(["VEHÍCULOS", "OTROS BIENES", "ECOLÓGICO"]);

const cargarPublicacions = () => {
    axios.get(route("publicacions.listado")).then((response) => {
        listPublicacions.value = response.data.publicacions;
    });
};

const cargarClientes = () => {
    axios.get(route("clientes.listado")).then((response) => {
        listClientes.value = response.data.clientes;
    });
};

const cargarListas = () => {
    cargarPublicacions();
    cargarClientes();
};

const generarGrafico = async () => {
    generando.value = true;
    axios
        .get(route("reportes.gr_subasta_clientes"), { params: form.value })
        .then((response) => {
            // Create the chart
            Highcharts.chart("container", {
                chart: {
                    type: "column",
                },
                title: {
                    align: "center",
                    text: "Clientes Registrados por subasta",
                },
                subtitle: {
                    align: "left",
                    text: "",
                },
                accessibility: {
                    announceNewData: {
                        enabled: true,
                    },
                },
                xAxis: {
                    type: "category",
                },
                yAxis: {
                    title: {
                        text: "Total",
                    },
                },
                legend: {
                    enabled: false,
                },
                plotOptions: {
                    series: {
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true,
                            format: "{point.y:.0f}",
                        },
                    },
                },

                tooltip: {
                    headerFormat:
                        '<span style="font-size:11px">{series.name}</span><br>',
                    pointFormat:
                        '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}</b><br/>',
                },

                series: [
                    {
                        name: "Publicación/Subasta",
                        colorByPoint: true,
                        data: response.data.data,
                    },
                ],
            });
            generando.value = false;
        });
};

onMounted(() => {
    cargarListas();
    setTimeout(() => {
        setLoading(false);
    }, 300);
});
</script>
<template>
    <Head title="Grafico Clientes por Subasta"></Head>
    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active">Gráficas > Clientes por Subasta</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Gráficas > Clientes por Subasta</h1>
    <!-- END page-header -->
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">
                    <form @submit.prevent="generarReporte">
                        <div class="row">
                            <div class="col-12">
                                <label>Rango de fechas</label>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input
                                            type="date"
                                            class="form-control"
                                            v-model="form.fecha_ini"
                                        />
                                    </div>
                                    <div class="col-md-6">
                                        <input
                                            type="date"
                                            class="form-control"
                                            v-model="form.fecha_fin"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label>Publicación</label>
                                <select
                                    name=""
                                    id=""
                                    class="form-select"
                                    v-model="form.publicacion_id"
                                >
                                    <option value="todos">Todos</option>
                                    <option
                                        v-for="item in listPublicacions"
                                        :value="item.id"
                                    >
                                        {{ item.id }} - {{ item.categoria }}
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label>Categoría</label>
                                <select
                                    name=""
                                    id=""
                                    class="form-select"
                                    v-model="form.categoria"
                                >
                                    <option value="todos">Todos</option>
                                    <option
                                        v-for="item in listCategorias"
                                        :value="item"
                                    >
                                        {{ item }}
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label>Cliente</label>
                                <select
                                    name=""
                                    id=""
                                    class="form-select"
                                    v-model="form.cliente_id"
                                >
                                    <option value="todos">Todos</option>
                                    <option
                                        v-for="item in listClientes"
                                        :value="item.id"
                                    >
                                        {{ item.full_name }}
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-12 text-center mt-3">
                                <button
                                    class="btn btn-primary"
                                    block
                                    @click="generarGrafico"
                                    :disabled="generando"
                                    v-text="txtBtn"
                                ></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-12 mt-20px" id="container"></div>
    </div>
</template>
