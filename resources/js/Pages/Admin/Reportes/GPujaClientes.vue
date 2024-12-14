<script setup>
import { useApp } from "@/composables/useApp";
import { computed, onMounted, ref, nextTick } from "vue";
import { Head, usePage } from "@inertiajs/vue3";
import Highcharts from "highcharts";
import exporting from "highcharts/modules/exporting";
import { useFormater } from "@/composables/useFormater";
const { getFormatoMoneda } = useFormater();
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

const aPublicacions = ref([]);

const generarGrafico = async () => {
    generando.value = true;
    axios;
    axios
        .get(route("reportes.gr_puja_clientes"), { params: form.value })
        .then((response) => {
            aPublicacions.value = response.data.publicacions;
            const array_data = response.data.array_data;
            const array_fechas = response.data.array_fechas;

            nextTick(() => {
                aPublicacions.value.forEach((publicacion, index) => {
                    const containerId = `chart-${index}`;
                    const container = document.getElementById(containerId);

                    // Verificar que el contenedor exista y tenga un tamaño válido
                    if (container) {
                        renderChart(
                            containerId,
                            publicacion,
                            array_data[publicacion.id],
                            array_fechas
                        );
                    } else {
                        console.error(`Contenedor ${containerId} no válido.`);
                    }
                });
            });
            // Create the chart
            generando.value = false;
        });
};

const renderChart = (containerId, publicacion, data, categories) => {
    Highcharts.chart(containerId, {
        chart: {
            type: "line",
        },
        title: {
            align: "center",
            text: `PUBLICACIÓN NRO. ${publicacion.id} - ${publicacion.categoria}<br/>${publicacion.moneda}`,
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
            categories: categories,
        },
        yAxis: {
            title: {
                text: "Total Oferta/Puja",
            },
        },
        legend: {
            enabled: true,
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    // format: "{point.y}",
                    style: {
                        fontSize: "11px",
                        fontWeight: "bold",
                    },
                    formatter: function () {
                        return getFormatoMoneda(this.point.y); // Aquí se aplica el formato de moneda
                    },
                },
            },
        },
        tooltip: {
            formatter: function () {
                let fecha_hora_puja = ``;

                this.point.array_pujas.forEach((elem) => {
                    fecha_hora_puja = `<b>- ${
                        elem.fecha_hora_oferta_t
                    }:</b> ${publicacion.moneda_txt} ${getFormatoMoneda(elem.puja)}<br/>`;
                });

                return `<span style="font-size:11px">${this.series.name}</span><br>
            ${fecha_hora_puja}`;
            },
        },

        series: data,
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
    <Head title="Ofertas/Pujas"></Head>
    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active">Gráficas > Ofertas/Pujas</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Gráficas > Ofertas/Pujas</h1>
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
    </div>
    <div class="row mt-3" id="contenedor">
        <div
            v-for="(publicacion, index) in aPublicacions"
            :key="index"
            class="col-md-6 mb-3"
            :id="'chart-container-' + index"
        >
            <!-- Aquí se renderizará el gráfico -->
            <div :id="'chart-' + index" class="chart"></div>
        </div>
    </div>
</template>
