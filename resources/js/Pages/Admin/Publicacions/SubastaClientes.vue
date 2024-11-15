<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Subasta > Clientes",
        disabled: false,
        url: "",
        name_url: "",
    },
];
</script>
<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { initDataTable } from "@/composables/datatable.js";
import { ref, onMounted, onBeforeUnmount } from "vue";
import PanelToolbar from "@/Components/PanelToolbar.vue";
// import { useMenu } from "@/composables/useMenu";
import VerificarComprobante from "./VerificarComprobante.vue";
// const { mobile, identificaDispositivo } = useMenu();
const props = defineProps({
    subasta: {
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

const columns = [
    {
        title: "Nombre del Cliente",
        data: "cliente.full_name",
    },
    {
        title: "Puja actual",
        data: "puja",
    },
    {
        title: "Estado comprobante",
        data: "estado_comprobante",
        render: function (data, type, row) {
            let estado = `SIN VERIFICAR`;
            let clase = `bg-gray`;
            if (row.estado_comprobante == 1) {
                estado = `VERIFICADO`;
                clase = `bg-success`;
            } else if (row.estado_comprobante == 2) {
                estado = `RECHAZADO`;
                clase = `bg-danger`;
            }

            let span = `<span class="badge ${clase}">${estado}</span>`;
            return span;
        },
    },
    {
        title: "ACCIONES",
        data: null,
        sortable: false,
        render: function (data, type, row) {
            let buttons = ``;
            if (
                props_page.auth?.user.permisos == "*" ||
                props_page.auth?.user.permisos.includes("publicacions.edit")
            ) {
                if (row.subasta.estado == 1) {
                    buttons += `<button class="mx-0 rounded-0 btn btn-success comprobante" data-id="${row.id}"><i class="fa fa-check-circle"></i></button> `;
                }
            }

            let url_show = route("subasta_clientes.show", row.id);
            buttons += `<a href="${url_show}" class="mx-0 rounded-0 btn btn-primary comprobante" data-id="${row.id}"><i class="fa fa-eye"></i></a> `;

            return buttons;
        },
    },
];
const loading = ref(false);
const open_dialog_verif = ref(false);
const itemSubastaCliente = ref(null);
const accionesRow = () => {
    // comprobante
    $("#table-subasta").on("click", "button.comprobante", function (e) {
        e.preventDefault();
        let id = $(this).attr("data-id");
        axios.get(route("subasta_clientes.getInfo", id)).then((response) => {
            itemSubastaCliente.value = response.data;
            open_dialog_verif.value = true;
        });
    });
};

var datatable = null;
var input_search = null;
var debounceTimeout = null;
const loading_table = ref(false);
const datatableInitialized = ref(false);
const updateDatatable = () => {
    datatable.ajax.reload();
};

onMounted(async () => {
    datatable = initDataTable(
        "#table-subasta",
        columns,
        route("subastas.getClientesApi", props.subasta.id)
    );
    input_search = document.querySelector('input[type="search"]');

    // Agregar un evento 'keyup' al input de búsqueda con debounce
    input_search.addEventListener("keyup", () => {
        loading_table.value = true;
        clearTimeout(debounceTimeout);
        debounceTimeout = setTimeout(() => {
            datatable.search(input_search.value).draw(); // Realiza la búsqueda manualmente
            loading_table.value = false;
        }, 500);
    });

    datatableInitialized.value = true;
    accionesRow();
});
onBeforeUnmount(() => {
    if (datatable) {
        datatable.clear();
        datatable.destroy(false); // Destruye la instancia del DataTable
        datatable = null;
        datatableInitialized.value = false;
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
                    <panel-toolbar
                        :mostrar_loading="loading"
                        @loading="updateDatatable"
                    />
                </div>
                <!-- END panel-heading -->
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <table
                        id="table-subasta"
                        width="100%"
                        class="table table-striped table-bordered align-middle text-nowrap tabla_datos"
                    >
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th width="2%"></th>
                                <th width="5%"></th>
                            </tr>
                        </thead>
                        <div class="loading_table" v-show="loading_table">
                            Cargando...
                        </div>
                        <tbody></tbody>
                    </table>
                </div>
                <!-- END panel-body -->
            </div>
            <!-- END panel -->
        </div>
    </div>
    <VerificarComprobante
        :open_dialog="open_dialog_verif"
        :subasta_cliente="itemSubastaCliente"
        @envio-formulario="updateDatatable"
        @cerrar-dialog="open_dialog_verif = false"
    ></VerificarComprobante>
</template>
