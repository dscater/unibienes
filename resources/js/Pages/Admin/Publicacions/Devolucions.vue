<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import axios from "axios";
import { ref, onMounted, onBeforeUnmount, nextTick } from "vue";
import { useFormater } from "@/composables/useFormater";
import PublicacionAdmin from "@/Components/PublicacionAdmin.vue";
import RegistraDevolucion from "./RegistraDevolucion.vue";
const { getFormatoMoneda } = useFormater();
const { props: props_page } = usePage();
const { setLoading } = useApp();
onMounted(() => {
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const loading = ref(false);
const accion_dialog = ref(0);
const open_dialog = ref(false);
const oPublicacion = ref(null);
const listPublicacions = ref([]);
const publicacion_id = ref(null);
const itemSubastaCliente = ref(null);

const obtenerPublicacion = (value) => {
    oPublicacion.value = null;
    if (value) {
        axios.get(route("publicacions.show", value)).then((response) => {
            oPublicacion.value = response.data;
        });
    }
};

const abrirFormularioDevolucion = (item, index) => {
    itemSubastaCliente.value = item;
    open_dialog.value = true;
};

const cargarPublicacions = () => {
    axios
        .get(route("publicacions.listado"), {
            params: {
                con_subasta: true,
            },
        })
        .then((response) => {
            listPublicacions.value = response.data.publicacions;
        });
};

const actualizaRegistros = () => {
    obtenerPublicacion(oPublicacion.value.id);
};

onMounted(async () => {
    cargarPublicacions();
});
onBeforeUnmount(() => {});
</script>
<template>
    <Head title="Devolución de garantías"></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active">Devolución de garantías</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Devolución de garantías</h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-6">
            <div class="panel" v-if="oPublicacion">
                <div class="panel-body">
                    <PublicacionAdmin
                        :publicacion="oPublicacion"
                        :column="true"
                        :link="true"
                    ></PublicacionAdmin>
                </div>
            </div>
            <div class="panel panel-body bg-secondary" v-else>
                <el-empty>
                    <template #description>
                        <span class="text-white"
                            >Debes seleccionar una publicación</span
                        >
                    </template>
                </el-empty>
            </div>
        </div>
        <div class="col-md-6">
            <!-- BEGIN panel -->
            <div class="panel panel-inverse">
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <el-select
                        class="w-100"
                        no-data-text="Sin registros"
                        placeholder="Seleccionar publicación"
                        filterable
                        v-model="publicacion_id"
                        @change="obtenerPublicacion"
                        clearable
                    >
                        <el-option
                            v-for="item in listPublicacions"
                            :key="item.id"
                            :value="item.id"
                            :label="`${item.nro} - ${item.categoria}`"
                        >
                        </el-option>
                    </el-select>
                    <div class="row mt-3" v-if="oPublicacion">
                        <div class="col-12">
                            <h4 class="w-100 text-center">
                                ESTADO DE LA DEVOLUCIÓN EFECTIVA DE GARANTÍAS
                            </h4>
                        </div>
                        <div class="col-12" style="overflow: auto">
                            <table class="table table-bordered">
                                <thead>
                                    <tr class="bg-primary">
                                        <th class="text-white">#</th>
                                        <th class="text-white">
                                            Nombre completo
                                        </th>
                                        <th class="text-white">
                                            Fecha devolución
                                        </th>
                                        <th class="text-white">Descripción</th>
                                        <th class="text-white">
                                            Estado devolución
                                        </th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr
                                        v-for="(item, index) in oPublicacion
                                            .subasta
                                            .subasta_clientes_devolucion"
                                    >
                                        <td>{{ index + 1 }}</td>
                                        <td>{{ item.cliente.full_name }}</td>
                                        <td>
                                            {{ item.fecha_hora_devolucion }}
                                        </td>
                                        <td>
                                            {{ item.descripcion_devolucion }}
                                        </td>
                                        <td v-html="item.devolucion_span"></td>
                                        <td>
                                            <button
                                                v-if="
                                                    item.devolucion == 0 &&
                                                    (props_page.auth?.user
                                                        .permisos == '*' ||
                                                        props_page.auth?.user.permisos.includes(
                                                            'publicacions.edit'
                                                        ))
                                                "
                                                class="btn btn-success"
                                                @click="
                                                    abrirFormularioDevolucion(
                                                        item,
                                                        index
                                                    )
                                                "
                                            >
                                                <i
                                                    class="fa fa-clipboard-check"
                                                ></i>
                                            </button>
                                        </td>
                                    </tr>
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
    <RegistraDevolucion
        :open_dialog="open_dialog"
        :subasta_cliente="itemSubastaCliente"
        @envio-formulario="actualizaRegistros"
        @cerrar-dialog="open_dialog = false"
    ></RegistraDevolucion>
</template>
<style scoped></style>
