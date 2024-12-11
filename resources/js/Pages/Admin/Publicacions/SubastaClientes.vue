<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { initDataTable } from "@/composables/datatable.js";
import { ref, onMounted, onBeforeUnmount } from "vue";
import PanelToolbar from "@/Components/PanelToolbar.vue";
import VerificarComprobante from "./VerificarComprobante.vue";
import PublicacionAdmin from "@/Components/PublicacionAdmin.vue";
import { useFormater } from "@/composables/useFormater";
const { getFormatoMoneda } = useFormater();
const props = defineProps({
    subasta: {
        type: Object,
        default: null,
    },
    publicacion: {
        type: Object,
        default: null,
    },
});
const { props: props_page } = usePage();
const { setLoading } = useApp();
onMounted(() => {
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const loading = ref(false);
const open_dialog_verif = ref(false);
const itemSubastaCliente = ref(null);
const intervalRegistros = ref(null);
const listRegistros = ref([]);
const lastId = ref(0);
const maxima_puja = ref(0);

const cargarRegistros = () => {
    axios
        .get(route("subastas.getClientesApi", props.subasta.id), {
            params: {
                lastId: lastId.value,
                maxima_puja: maxima_puja.value,
            },
        })
        .then((response) => {
            listRegistros.value = [
                ...new Set([
                    ...listRegistros.value,
                    ...response.data.publicacions,
                ]),
            ];

            listRegistros.value = [
                ...new Map(
                    listRegistros.value.map((item) => [item.id, item])
                ).values(),
            ].sort((a, b) => b.puja - a.puja);

            lastId.value = response.data.lastId;
            maxima_puja.value = response.data.maxima_puja;
        });
};

const fila_index = ref(-1);
const actualizaFila = (data) => {
    if (fila_index.value > -1) {
        listRegistros.value[fila_index.value] = data;
        fila_index.value = -1;
    }
};

const verificarComprobante = (index, id) => {
    // comprobante
    axios.get(route("subasta_clientes.getInfo", id)).then((response) => {
        itemSubastaCliente.value = response.data;
        open_dialog_verif.value = true;
        fila_index.value = index;
    });
};

const getEstadoParticipando = (value, value2) => {
    let estado = `PARTICIPANDO`;

    if (value == 0 || value == 2) {
        estado = `PERDEDOR`;
    }
    if (value2 == 2) {
        estado = `GANADOR`;
    }

    return estado;
};

const getEstadoComprobante = (value) => {
    let estado = `SIN VERIFICAR`;
    if (value == 1) {
        estado = `VERIFICADO`;
    } else if (value == 2) {
        estado = `RECHAZADO`;
    }
    return estado;
};

onMounted(async () => {
    cargarRegistros();
    intervalRegistros.value = setInterval(() => {
        cargarRegistros();
    }, 1300);
});
onBeforeUnmount(() => {
    if (intervalRegistros.value) {
        clearInterval(intervalRegistros.value);
    }
});
</script>
<template>
    <Head title="Subasta Clientes"></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item">
            <Link :href="route('publicacions.index')">Publicaciones</Link>
        </li>
        <li class="breadcrumb-item active">Subasta Clientes</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Subasta Clientes</h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN panel -->
            <div class="panel panel-inverse">
                <!-- BEGIN panel-heading -->
                <div class="panel-heading">
                    <h4 class="panel-title btn-nuevo">
                        <Link
                            :href="route('publicacions.index')"
                            class="btn btn-outline-default d-inline-block"
                            ><i class="fa fa-arrow-left"></i> Volver</Link
                        >
                    </h4>
                </div>
                <!-- END panel-heading -->
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6 mx-auto">
                            <div class="card">
                                <div class="card-body">
                                    <PublicacionAdmin
                                        :publicacion="props.publicacion"
                                        :column="true"
                                        :link="true"
                                    ></PublicacionAdmin>
                                </div>
                            </div>
                        </div>
                        <div class="col-12" style="overflow: auto">
                            <table
                                id="table-subasta"
                                width="100%"
                                class="table table-striped table-bordered align-middle text-nowrap tabla_datos"
                            >
                                <thead>
                                    <tr>
                                        <th>Nombre del Cliente</th>
                                        <th>C.I.</th>
                                        <th>Celular</th>
                                        <th>Correo</th>
                                        <th>Puja actual</th>
                                        <th>Estado</th>
                                        <th>Estado comprobante</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template v-if="listRegistros.length > 0">
                                        <tr
                                            v-for="(
                                                item, index
                                            ) in listRegistros"
                                        >
                                            <td>
                                                {{ item.cliente.full_name }}
                                            </td>
                                            <td>{{ item.cliente.full_ci }}</td>
                                            <td>{{ item.cliente.fono }}</td>
                                            <td>{{ item.cliente.email }}</td>
                                            <td>{{ getFormatoMoneda(item.puja) }}</td>
                                            <td>
                                                <span
                                                    class="badge"
                                                    :class="[
                                                        item.estado_puja == 2
                                                            ? 'bg-success'
                                                            : 'bg-gray',
                                                    ]"
                                                >
                                                    {{
                                                        getEstadoParticipando(
                                                            item.subasta.estado,
                                                            item.estado_puja
                                                        )
                                                    }}
                                                </span>
                                            </td>
                                            <td>
                                                <span
                                                    class="badge"
                                                    :class="[
                                                        item.estado_comprobante ==
                                                        1
                                                            ? 'bg-success'
                                                            : item.estado_comprobante ==
                                                              2
                                                            ? 'bg-danger'
                                                            : 'bg-gray',
                                                    ]"
                                                >
                                                    {{
                                                        getEstadoComprobante(
                                                            item.estado_comprobante
                                                        )
                                                    }}
                                                </span>
                                            </td>
                                            <td>
                                                <button
                                                    v-if="
                                                        props_page.auth?.user
                                                            .permisos == '*' ||
                                                        props_page.auth?.user.permisos.includes(
                                                            'publicacions.edit'
                                                        )
                                                    "
                                                    class="mx-0 rounded-0 btn btn-success comprobante"
                                                    @click="
                                                        verificarComprobante(
                                                            index,
                                                            item.id
                                                        )
                                                    "
                                                >
                                                    <i
                                                        class="fa fa-check-circle"
                                                    ></i>
                                                </button>
                                                &nbsp;
                                                <a
                                                    :href="
                                                        route(
                                                            'subasta_clientes.show',
                                                            item.id
                                                        )
                                                    "
                                                    class="mx-0 rounded-0 btn btn-primary comprobante"
                                                    :data-id="item.id"
                                                    ><i class="fa fa-eye"></i
                                                ></a>
                                            </td>
                                        </tr>
                                    </template>
                                    <template v-else>
                                        <tr>
                                            <td colspan="8" class="text-center">
                                                SIN REGISTROS
                                            </td>
                                        </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- END panel-body -->
            </div>
            <!-- END panel -->
        </div>
    </div>
    <VerificarComprobante
        :open_dialog="open_dialog_verif"
        :subasta_cliente="itemSubastaCliente"
        @envio-formulario="actualizaFila"
        @cerrar-dialog="open_dialog_verif = false"
    ></VerificarComprobante>
</template>
