<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Parametrización",
        disabled: false,
        url: "",
        name_url: "",
    },
];
</script>
<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link } from "@inertiajs/vue3";
import { useParametrizacions } from "@/composables/parametrizacions/useParametrizacions";
import { initDataTable } from "@/composables/datatable.js";
import { ref, onMounted, onBeforeUnmount } from "vue";
import PanelToolbar from "@/Components/PanelToolbar.vue";
// import { useMenu } from "@/composables/useMenu";
import Formulario from "./Formulario.vue";
// const { mobile, identificaDispositivo } = useMenu();
const { setLoading } = useApp();
onMounted(() => {
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const { getParametrizacions, setUsuario, limpiarUsuario, deleteUsuario } =
    useParametrizacions();

const columns = [
    {
        title: "",
        data: "id",
    },
    {
        title: "Tiempo de inactividad de cuenta de usuario cliente",
        data: "inactividad_cliente",
    },
    {
        title: "Tipo de cambio de moneda",
        data: "tipo_cambio",
    },
    {
        title: "Servidor de correos",
        data: null,
        render: function (data, type, row) {
            let info_correo = `<p><strong>:</strong> ${data.host}</p>`;
            info_correo += `<p><strong>Puerto:</strong> ${data.puerto}</p>`;
            info_correo += `<p><strong>Encriptado:</strong> ${data.encriptado}</p>`;
            info_correo += `<p><strong>Correo:</strong> ${data.correo}</p>`;
            info_correo += `<p><strong>Nombre:</strong> ${data.nombre}</p>`;
            info_correo += `<p><strong>Driver:</strong> ${data.driver}</p>`;
            return info_correo;
        },
    },
    {
        title: "Cantidad de imágenes de publicación",
        data: "nro_imagenes_pub",
    },
    {
        title: "Tiempo de publicación después de cierre de subasta",
        data: "tiempo_pub",
    },
    {
        title: "Términos y condiciones",
        data: null,
        render: function (data, type, row) {
            return data.substr(10);
        },
    },
    {
        title: "Acción",
        data: null,
        render: function (data, type, row) {
            return `
                <button class="mx-0 rounded-0 btn btn-info password" data-id="${row.id}"><i class="fa fa-key"></i></button>
            `;
        },
    },
];
const loading = ref(false);
const accion_dialog = ref(0);
const open_dialog = ref(false);

const agregarRegistro = () => {
    limpiarUsuario();
    accion_dialog.value = 0;
    open_dialog.value = true;
};

const accionesRow = () => {
    // editar
    $("#table-parametrizacion").on("click", "button.editar", function (e) {
        e.preventDefault();
        let id = $(this).attr("data-id");
        axios.get(route("parametrizacions.show", id)).then((response) => {
            setUsuario(response.data);
            accion_dialog.value = 1;
            open_dialog.value = true;
        });
    });
};

var datatable = null;
const datatableInitialized = ref(false);
const updateDatatable = () => {
    datatable.ajax.reload();
};

onMounted(async () => {
    datatable = initDataTable("#table-parametrizacion", columns, route("parametrizacions.api"));
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
    <Head title="Parametrización"></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active">Parametrización</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Parametrización</h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN panel -->
            <div class="panel panel-inverse">
                <!-- BEGIN panel-heading -->
                <div class="panel-heading">
                    <h4 class="panel-title btn-nuevo">
                        <button
                            type="button"
                            class="btn btn-primary"
                            @click="agregarRegistro"
                        >
                            <i class="fa fa-plus"></i> Nuevo
                        </button>
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
                        id="table-parametrizacion"
                        width="100%"
                        class="table table-striped table-bordered align-middle text-nowrap tabla_datos"
                    >
                        <thead></thead>
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
</template>
