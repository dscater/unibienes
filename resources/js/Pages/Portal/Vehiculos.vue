<script>
import Portal from "@/Layouts/Portal.vue";
export default {
    layout: Portal,
};
</script>
<script setup>
import { onMounted, ref } from "vue";
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
    <!-- BEGIN #trending-items -->
    <div id="trending-items" class="section-container">
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
                        <a href="" class="item-image">
                            <img
                                :src="item.publicacion_imagens[0].url_imagen"
                                alt=""
                            />
                        </a>
                        <div class="item-info">
                            <h4 class="item-title">
                                {{ item.ubicacion }}
                            </h4>
                            <p class="item-price">
                                Oferta inicial: {{ item.oferta_inicial }}
                            </p>
                            <p class="item-desc">
                                Monto garantía: {{ item.monto_garantia }}
                            </p>
                            <p class="item-desc">
                                {{ item.moneda }}
                            </p>
                        </div>
                    </div>
                    <!-- END item -->
                </div>
                <!-- END col-2 -->
            </div>
            <!-- END row -->
        </div>
        <!-- END container -->
    </div>
    <!-- END #trending-items -->
</template>
