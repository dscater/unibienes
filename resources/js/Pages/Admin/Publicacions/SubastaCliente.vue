<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { initDataTable } from "@/composables/datatable.js";
import { ref, onMounted, computed, onBeforeUnmount } from "vue";
import PanelToolbar from "@/Components/PanelToolbar.vue";
import VerificarComprobante from "./VerificarComprobante.vue";
import { useFormater } from "@/composables/useFormater";
const { getFormatoMoneda } = useFormater();
const props = defineProps({
    subasta_cliente: {
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
const itemSubastaCliente = ref(props.subasta_cliente);
const open_dialog_verif = ref(false);

const estadoComprobante = computed(() => {
    let estado = `SIN VERIFICAR`;
    if (itemSubastaCliente.value.estado_comprobante == 1) {
        estado = `VERIFICADO`;
    }

    if (itemSubastaCliente.value.estado_comprobante == 2) {
        estado = `RECHAZADO`;
    }
    return estado;
});

const verificaComprobante = () => {
    itemSubastaCliente.value = props.subasta_cliente;
    open_dialog_verif.value = true;
};

const updateItemSubastaCliente = (newVal) => {
    itemSubastaCliente.value = newVal;
};

const loading = ref(false);
onMounted(async () => {});
onBeforeUnmount(() => {});
</script>
<template>
    <Head title="Subasta Clientes"></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item">
            <Link :href="route('publicacions.index')">Publicaciones</Link>
        </li>
        <li class="breadcrumb-item">
            <Link
                :href="
                    route('subastas.clientes', itemSubastaCliente.subasta_id)
                "
                >Subasta-Clientes</Link
            >
        </li>
        <li class="breadcrumb-item active">Información cliente</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Información cliente</h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN panel -->
            <div class="panel panel-inverse">
                <!-- BEGIN panel-heading -->
                <div class="panel-heading">
                    <h4 class="panel-title btn-nuevo">
                        <Link
                            :href="
                                route(
                                    'subastas.clientes',
                                    itemSubastaCliente.subasta_id
                                )
                            "
                            class="btn btn-outline-default d-inline-block"
                            ><i class="fa fa-arrow-left"></i> Volver</Link
                        >
                    </h4>
                    <panel-toolbar :mostrar_loading="loading" />
                </div>
                <!-- END panel-heading -->
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <div class="row">
                        <div class="col-12 p-3">
                            <p>
                                <strong>Categoría: </strong>
                                {{
                                    subasta_cliente.subasta.publicacion
                                        .categoria
                                }}
                            </p>
                            <p>
                                <strong>Monto garantía: </strong>
                                {{
                                    getFormatoMoneda(
                                        subasta_cliente.subasta.publicacion
                                            .monto_garantia
                                    )
                                }}
                            </p>
                            <p>
                                <strong>Moneda: </strong>
                                {{ subasta_cliente.subasta.publicacion.moneda }}
                            </p>
                        </div>
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <p>
                                        <strong>Nombre Cliente:</strong>
                                        {{
                                            itemSubastaCliente?.cliente
                                                ?.full_name
                                        }}
                                    </p>
                                    <p>
                                        <strong>Puja actual:</strong>
                                        {{
                                            getFormatoMoneda(
                                                itemSubastaCliente?.puja
                                            )
                                        }}
                                    </p>
                                    <p>
                                        <strong>Estado comprobante: </strong>
                                        <span
                                            class="badge"
                                            :class="{
                                                'bg-gray':
                                                    itemSubastaCliente.estado_comprobante ==
                                                    0,
                                                'bg-success':
                                                    itemSubastaCliente.estado_comprobante ==
                                                    1,
                                                'bg-danger':
                                                    itemSubastaCliente.estado_comprobante ==
                                                    2,
                                            }"
                                            v-text="estadoComprobante"
                                        ></span>
                                    </p>
                                    <p>
                                        <strong>Verificar comprobante: </strong>
                                        <button
                                            class="btn btn-success"
                                            @click="verificaComprobante"
                                        >
                                            <i class="fa fa-check"></i>
                                        </button>
                                    </p>
                                </div>
                            </div>
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
        @envio-formulario="updateItemSubastaCliente"
        @cerrar-dialog="open_dialog_verif = false"
    ></VerificarComprobante>
</template>
