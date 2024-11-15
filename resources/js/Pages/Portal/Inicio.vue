<script>
import Portal from "@/Layouts/Portal.vue";
export default {
    layout: Portal,
};
</script>
<script setup>
import { onMounted, ref } from "vue";
import { Link } from "@inertiajs/vue3";
import PublicacionLista from "@/Components/PublicacionLista.vue";
const listVehiculos = ref([]);
const listOtrosBienes = ref([]);
const listEcologicos = ref([]);

const obtenerVehiculos = () => {
    axios
        .get(route("publicacions.porCategoriaLimitado"), {
            params: {
                categoria: "VEHÍCULOS",
            },
        })
        .then((response) => {
            listVehiculos.value = response.data;
        });
};

const obtenerOtrosBienes = () => {
    axios
        .get(route("publicacions.porCategoriaLimitado"), {
            params: {
                categoria: "OTROS BIENES",
            },
        })
        .then((response) => {
            listOtrosBienes.value = response.data;
        });
};

const obtenerEcologicos = () => {
    axios
        .get(route("publicacions.porCategoriaLimitado"), {
            params: {
                categoria: "ECOLÓGICO",
            },
        })
        .then((response) => {
            listEcologicos.value = response.data;
        });
};

const cargarListas = () => {
    obtenerVehiculos();
    obtenerOtrosBienes();
    obtenerEcologicos();
};

onMounted(() => {
    cargarListas();
});
</script>
<template>
    <!-- BEGIN #vehiculos -->
    <div id="vehiculos" class="section-container">
        <!-- BEGIN container -->
        <div class="container">
            <!-- BEGIN section-title -->
            <h4 class="section-title clearfix">
                <span class="flex-1">
                    Vehículos
                    <small></small>
                </span>
            </h4>
            <!-- END section-title -->
            <!-- BEGIN row -->
            <div class="row gx-2">
                <!-- BEGIN col-2 -->
                <div
                    class="col-lg-2 col-md-4 col-sm-6"
                    v-for="item in listVehiculos"
                >
                    <!-- BEGIN item -->
                    <div class="item item-thumbnail">
                        <PublicacionLista
                            :publicacion="item"
                        ></PublicacionLista>
                    </div>
                    <!-- END item -->
                </div>
                <!-- END col-2 -->
                <div class="col-12 text-center mt-20px">
                    <Link
                        :href="route('portal.vehiculos')"
                        class="btn btn-primary"
                        >Ver más <i class="fa fa-arrow-right"></i
                    ></Link>
                </div>
            </div>
            <!-- END row -->
        </div>
        <!-- END container -->
    </div>
    <!-- END #vehiculos -->
    <!-- BEGIN #otros_bienes -->
    <div id="otros_bienes" class="section-container bg-component">
        <!-- BEGIN container -->
        <div class="container">
            <!-- BEGIN section-title -->
            <h4 class="section-title clearfix">
                <span class="flex-1">
                    Otros bienes
                    <small></small>
                </span>
            </h4>
            <!-- END section-title -->
            <!-- BEGIN row -->
            <div class="row gx-2">
                <!-- BEGIN col-2 -->
                <div
                    class="col-lg-2 col-md-4 col-sm-6"
                    v-for="item in listOtrosBienes"
                >
                    <!-- BEGIN item -->
                    <div class="item item-thumbnail">
                        <PublicacionLista
                            :publicacion="item"
                        ></PublicacionLista>
                    </div>
                    <!-- END item -->
                </div>
                <!-- END col-2 -->
            </div>
            <div class="col-12 text-center mt-20px">
                <Link
                    :href="route('portal.otros_bienes')"
                    class="btn btn-primary"
                    >Ver más <i class="fa fa-arrow-right"></i
                ></Link>
            </div>
            <!-- END row -->
        </div>
        <!-- END container -->
    </div>
    <!-- END #otros_bienes -->
    <!-- BEGIN #ecologicos -->
    <div id="ecologicos" class="section-container">
        <!-- BEGIN container -->
        <div class="container">
            <!-- BEGIN section-title -->
            <h4 class="section-title clearfix">
                <span class="flex-1">
                    Ecológicos
                    <small></small>
                </span>
            </h4>
            <!-- END section-title -->
            <!-- BEGIN row -->
            <div class="row gx-2">
                <!-- BEGIN col-2 -->
                <div
                    class="col-lg-2 col-md-4 col-sm-6"
                    v-for="item in listEcologicos"
                >
                    <!-- BEGIN item -->
                    <div class="item item-thumbnail">
                        <PublicacionLista
                            :publicacion="item"
                        ></PublicacionLista>
                    </div>
                    <!-- END item -->
                </div>
                <!-- END col-2 -->
            </div>
            <div class="col-12 text-center mt-20px">
                <Link :href="route('portal.ecologicos')" class="btn btn-primary"
                    >Ver más <i class="fa fa-arrow-right"></i
                ></Link>
            </div>
            <!-- END row -->
        </div>
        <!-- END container -->
    </div>
    <!-- END #ecologicos -->
</template>
