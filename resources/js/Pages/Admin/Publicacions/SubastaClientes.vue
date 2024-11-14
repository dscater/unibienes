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
import Formulario from "./Formulario.vue";
import Habilitar from "./Habilitar.vue";
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
        title: "Cliente",
        data: "cliente.full_name",
    },
    {
        title: "Puja actual",
        data: "puja",
    },
    {
        title: "Comprobante",
        data: null,
        render: function (data, type, row) {
            return `Comprobante`;
        },
    },
    {
        title: "Estado comprobante",
        data: null,
        render: function (data, type, row) {
            return `Estado Comprobante`;
        },
    },
    {
        title: "ACCIONES",
        data: null,
        render: function (data, type, row) {
            let buttons = ``;
            if (
                props_page.auth?.user.permisos == "*" ||
                props_page.auth?.user.permisos.includes("subastas.edit")
            ) {
                if (row.estado_sub == 0) {
                    buttons += `<button class="mx-0 rounded-0 btn btn-success comprobante" data-id="${row.id}"><i class="fa fa-check-circle"></i></button> `;
                }
            }
            return buttons;
        },
    },
];
const loading = ref(false);
const accion_dialog = ref(0);
const open_dialog = ref(false);
const open_dialog_hab = ref(false);

const agregarRegistro = () => {
    accion_dialog.value = 0;
    open_dialog.value = true;
};

const accionesRow = () => {
    // comprobante
    $("#table-subasta").on("click", "button.comprobante", function (e) {
        e.preventDefault();
        let id = $(this).attr("data-id");
        axios.get(route("subastas.show", id)).then((response) => {
            open_dialog_hab.value = true;
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
        <li class="breadcrumb-item"><Link :href="route('publicacions.index')">Publicaciones</Link></li>
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
                    <h4 class="panel-title btn-nuevo"></h4>
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
                                <th width="2%"></th>
                                <th></th>
                                <th></th>
                                <th></th>
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

    <Formulario
        :open_dialog="open_dialog"
        :accion_dialog="accion_dialog"
        @envio-formulario="updateDatatable"
        @cerrar-dialog="open_dialog = false"
    ></Formulario>

    <Habilitar
        :open_dialog="open_dialog_hab"
        @envio-formulario="updateDatatable"
        @cerrar-dialog="open_dialog_hab = false"
    ></Habilitar>
</template>
