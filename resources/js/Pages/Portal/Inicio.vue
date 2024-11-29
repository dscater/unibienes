<script>
import Portal from "@/Layouts/Portal.vue";
export default {
    layout: Portal,
};
</script>
<script setup>
import { onMounted, ref } from "vue";
import { Link, usePage } from "@inertiajs/vue3";
import PublicacionLista from "@/Components/PublicacionLista.vue";

const { props: props_page } = usePage();
const user = ref(props_page.auth?.user);
const url_asset = ref(props_page.url_assets);

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
    <div id="vehiculos" class="seccion_categoria vehiculos">
        <!-- BEGIN container -->
        <div class="container mb-0">
            <!-- BEGIN section-title -->
            <h4 class="titlesec">
                <img :src="url_asset + 'imgs/14.png'" alt="" />
                <span class="flex-1"> Vehículos Siniestrados</span>
            </h4>
            <!-- END section-title -->
            <!-- BEGIN row -->
            <div class="row gx-2">
                <!-- BEGIN col-2 -->
                <div
                    class="col-lg-2 col-md-4 col-sm-6 mt-3"
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
    <div
        id="otros_bienes"
        class="section-container seccion_categoria otros_bienes"
    >
        <!-- BEGIN container -->
        <div class="container">
            <!-- BEGIN section-title -->
            <h4 class="titlesec">
                <img :src="url_asset + 'imgs/16.png'" alt="" />
                <span> Otros bienes Siniestrados</span>
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
    <div id="ecologicos" class="section-container seccion_categoria ecologicos">
        <!-- BEGIN container -->
        <div class="container">
            <!-- BEGIN section-title -->
            <h4 class="titlesec">
                <img :src="url_asset + 'imgs/15.png'" alt="" />
                <span class="flex-1"> Ecológicos Siniestrados</span>
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

<style scoped>
.item.item-thumbnail {
    margin: 0px;
    padding: 0px;
    border: none;
}

.item.item-thumbnail .item-image img {
    width: 100% !important;
}

.seccion_categoria .container {
    padding-bottom: 30px;
}
.seccion_categoria .titlesec {
    position: relative;
    margin-bottom: 0px;
    color: var(--principal-portal2);
    font-weight: bold;
}
.seccion_categoria .titlesec span {
    padding: 3px 14px 3px 14px;
    border-radius: 20px;
    border: solid 1px var(--principal-portal);
}

.seccion_categoria .titlesec img {
    height: 70px;
}

/* vehiculos-ecologicos */
.seccion_categoria.vehiculos,
.seccion_categoria.ecologicos {
    background-color: white;
    margin-bottom: 0px;
}
.seccion_categoria.ecologicos .container,
.seccion_categoria.vehiculos .container {
    background-color: #e8ecee;
    padding-bottom: 40px;
}
/* otros bienes */

.seccion_categoria.otros_bienes {
    background-color: #e8ecee;
}
.seccion_categoria.otros_bienes .container {
    background-color: white;
}

.seccion_categoria.otros_bienes .item {
    border: solid 1px #d0d1d1;
}
</style>
