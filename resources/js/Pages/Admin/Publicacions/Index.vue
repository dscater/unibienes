<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { usePublicacions } from "@/composables/publicacions/usePublicacions";
import { initDataTable } from "@/composables/datatable.js";
import { ref, onMounted, onBeforeUnmount, nextTick } from "vue";
import PanelToolbar from "@/Components/PanelToolbar.vue";
import Formulario from "./Formulario.vue";
import Habilitar from "./Habilitar.vue";
import ListaSubastaClientes from "./ListaSubastaClientes.vue";
import { useFormater } from "@/composables/useFormater";
const { getFormatoMoneda } = useFormater();
const { props: props_page } = usePage();
const { setLoading } = useApp();
onMounted(() => {
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const {
    getPublicacions,
    setPublicacion,
    limpiarPublicacion,
    deletePublicacion,
} = usePublicacions();

const columns = [
    {
        title: "",
        data: "id",
        name: "id",
    },
    {
        title: "Usuario",
        data: "full_name",
    },
    {
        title: "Categoría",
        data: "categoria",
    },
    {
        title: "Moneda",
        data: "moneda",
    },
    {
        title: "Oferta inicial",
        data: "oferta_inicial",
        render: function (data, type, row) {
            return getFormatoMoneda(data);
        },
    },
    {
        title: "Ubicación",
        data: "ubicacion",
    },
    {
        title: "Observaciones",
        data: "observaciones",
    },
    {
        title: "Fecha y hora límite",
        data: "fecha_hora_limite",
    },
    {
        title: "Monto de garantía",
        data: "monto_garantia",
        render: function (data, type, row) {
            return getFormatoMoneda(data);
        },
    },
    {
        title: "Estado",
        data: "estado_sub",
        render: function (data, type, row) {
            let clase = `bg-default text-black`;
            if (row.estado_sub === 1) {
                clase = `bg-success`;
            }
            if (row.estado_sub === 6) {
                clase = `bg-danger`;
            }
            return `<span class="badge ${clase}">${row.estado_txt}</span>`;
        },
    },
    {
        title: "ACCIONES",
        data: null,
        sortable: false,
        render: function (data, type, row) {
            let buttons = ``;

            if (
                row.estado_sub == 1 ||
                row.estado_sub == 2 ||
                row.estado_sub == 3
            ) {
                buttons += `
                    <div style="position:relative;width:auto; display:inline-flex; flex-direction:column; width:40px;">
                        <span class="d-block button_subasta_clientes verSubastaClientes"
                            data-id="${row.id}"
                        ><i class="fa fa-external-link"></i></span>  
                        <button class="mx-0 rounded-0 btn btn-primary verSubasta" 
                        data-id="${row.subasta.id}"
                        style="z-index:0;"
                        >
                            ${row.subasta.subasta_clientes.length}<br/>
                            <i class="fa fa-users"></i>
                        </button>
                    </div>
                `;

                if (
                    row.estado_sub == 1 &&
                    (props_page.auth?.user.permisos == "*" ||
                        props_page.auth?.user.permisos.includes(
                            "publicacions.destroy_habilitado"
                        ))
                ) {
                    buttons += `<button class="mx-0 rounded-0 btn btn-danger eliminar_habilitado" data-id="${
                        row.id
                    }" data-nombre="${row.id} | ${row.categoria}"
                    data-url="${route("publicacions.destroy", row.id)}"
                    data-estado="6"
                    style="min-height:53px;margin-top:14px;"><i class="fa fa-ban"></i></button>`;
                }
            }

            if (
                props_page.auth?.user.permisos == "*" ||
                props_page.auth?.user.permisos.includes("publicacions.edit")
            ) {
                if (row.estado_sub == 0) {
                    buttons += `<button class="mx-0 rounded-0 btn btn-success habilitar" data-id="${row.id}"><i class="fa fa-check-circle"></i></button> `;
                    buttons += `<button class="mx-0 rounded-0 btn btn-warning editar" data-id="${row.id}"><i class="fa fa-edit"></i></button>`;
                }
            }

            if (row.estado_sub == 6) {
                buttons += `<button class="mx-0 rounded-0 btn btn-primary verPublicacion" data-id="${row.id}"><i class="fa fa-eye"></i></button> `;
            }

            if (
                props_page.auth?.user.permisos == "*" ||
                props_page.auth?.user.permisos.includes("publicacions.destroy")
            ) {
                if (row.estado_sub == 0) {
                    buttons += ` <button class="mx-0 rounded-0 btn btn-danger eliminar"
                     data-id="${row.id}" data-nombre="${row.id} | ${
                        row.categoria
                    }"
                      data-url="${route("publicacions.destroy", row.id)}"
                    data-estado="5"
                      ><i class="fa fa-trash"></i></button>`;
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
const accion_dialog_hab = ref(0);
const open_dialog_lista_sc = ref(false);
const accion_dialog_lista_sc = ref(0);

const agregarRegistro = () => {
    limpiarPublicacion();
    accion_dialog.value = 0;
    open_dialog.value = true;
};

const accionesRow = () => {
    // verSubastaClientes
    $("#table-publicacion").on("click", ".verSubastaClientes", function (e) {
        e.preventDefault();
        let id = $(this).attr("data-id");
        axios.get(route("publicacions.show", id)).then((response) => {
            setPublicacion(response.data, true);
            open_dialog_lista_sc.value = true;
        });
    });

    // verSubasta
    $("#table-publicacion").on("click", "button.verSubasta", function (e) {
        e.preventDefault();
        let id = $(this).attr("data-id");
        router.get(route("subastas.clientes", id));
    });

    // habilitar
    $("#table-publicacion").on("click", "button.habilitar", function (e) {
        e.preventDefault();
        let id = $(this).attr("data-id");
        axios.get(route("publicacions.show", id)).then((response) => {
            setPublicacion(response.data);
            open_dialog_hab.value = true;
        });
    });

    // verPublicacion
    $("#table-publicacion").on("click", "button.verPublicacion", function (e) {
        e.preventDefault();
        let id = $(this).attr("data-id");
        axios.get(route("publicacions.show", id)).then((response) => {
            setPublicacion(response.data);
            open_dialog_hab.value = true;
            accion_dialog_hab.value = 1;
        });
    });

    // editar
    $("#table-publicacion").on("click", "button.editar", function (e) {
        e.preventDefault();
        let id = $(this).attr("data-id");
        axios.get(route("publicacions.show", id)).then((response) => {
            setPublicacion(response.data);
            accion_dialog.value = 1;
            open_dialog.value = true;
        });
    });
    // eliminar
    $("#table-publicacion").on("click", "button.eliminar", function (e) {
        e.preventDefault();
        let nombre = $(this).attr("data-nombre");
        let id = $(this).attr("data-id");
        let estado = $(this).attr("data-estado");
        Swal.fire({
            title: "¿Quierés eliminar este registro?",
            html: `<strong>${nombre}</strong>`,
            showCancelButton: true,
            confirmButtonColor: "#B61431",
            confirmButtonText: "Si, eliminar",
            cancelButtonText: "No, cancelar",
            denyButtonText: `No, cancelar`,
        }).then(async (result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                let respuesta = await deletePublicacion(id, { estado });
                if (respuesta && respuesta.sw) {
                    updateDatatable();
                }
            }
        });
    });
    // eliminar_habilitado
    $("#table-publicacion").on(
        "click",
        "button.eliminar_habilitado",
        function (e) {
            e.preventDefault();
            let nombre = $(this).attr("data-nombre");
            let id = $(this).attr("data-id");
            let estado = $(this).attr("data-estado");
            Swal.fire({
                title: "¿Quierés eliminar este registro?",
                html: `<strong>${nombre}</strong>`,
                showCancelButton: true,
                confirmButtonColor: "#B61431",
                confirmButtonText: "Si, eliminar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then(async (result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    let respuesta = await deletePublicacion(id, { estado });
                    if (respuesta && respuesta.sw) {
                        updateDatatable();
                    }
                }
            });
        }
    );
};

var datatable = null;
var input_search = null;
var debounceTimeout = null;
const loading_table = ref(false);
const datatableInitialized = ref(false);
const updateDatatable = () => {
    datatable.ajax.reload();
    iniciaTooltip();
};

const iniciaTooltip = () => {
    const tooltipTriggerList = document.querySelectorAll(
        '[data-bs-toggle="tooltip"]'
    );
    tooltipTriggerList.forEach((tooltipTriggerEl) => {
        new bootstrap.Tooltip(tooltipTriggerEl); // Inicializa el tooltip
    });
};

onMounted(async () => {
    datatable = initDataTable(
        "#table-publicacion",
        columns,
        route("publicacions.api"),
        {
            order: [[0, "desc"]],
        }
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
    nextTick(() => {
        iniciaTooltip();
    });
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
    <Head title="Publicaciones"></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active">Publicaciones</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Publicaciones</h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN panel -->
            <div class="panel panel-inverse">
                <!-- BEGIN panel-heading -->
                <div
                    class="panel-heading"
                    v-if="
                        props_page.auth?.user.permisos.includes(
                            'publicacions.create'
                        )
                    "
                >
                    <h4 class="panel-title btn-nuevo">
                        <button
                            type="button"
                            class="btn btn-primary"
                            @click="agregarRegistro"
                        >
                            <i class="fa fa-plus"></i> Nuevo
                        </button>
                    </h4>
                    <!-- <panel-toolbar
                        :mostrar_loading="loading"
                        @loading="updateDatatable"
                    /> -->
                </div>
                <!-- END panel-heading -->
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <table
                        id="table-publicacion"
                        width="100%"
                        class="table table-striped table-bordered align-middle text-nowrap tabla_datos"
                    >
                        <thead>
                            <tr>
                                <th width="2%"></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
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
        :accion_dialog="accion_dialog_hab"
        @envio-formulario="updateDatatable"
        @cerrar-dialog="open_dialog_hab = false"
    ></Habilitar>

    <ListaSubastaClientes
        :open_dialog="open_dialog_lista_sc"
        :accion_dialog="accion_dialog_lista_sc"
        @cerrar-dialog="open_dialog_lista_sc = false"
    ></ListaSubastaClientes>
</template>
<style scoped></style>
