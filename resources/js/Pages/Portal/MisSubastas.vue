<script>
import Portal from "@/Layouts/Portal.vue";
import Publicacion from "@/Components/Publicacion.vue";
export default {
    layout: Portal,
};
</script>
<script setup>
import { usePage, Head, router, Link } from "@inertiajs/vue3";
import { onMounted, ref } from "vue";
const { props: props_page } = usePage();
const listVehiculos = ref([]);
const page = ref(1);
const last_page = ref(1);
const total = ref(0);

const obtenerVehiculos = () => {
    axios
        .get(route("publicacions.porClientePaginado"), {
            params: {
                page: page.value,
            },
        })
        .then((response) => {
            const registros = response.data.publicacions;
            page.value = registros.current_page;
            last_page.value = registros.last_page;
            listVehiculos.value = registros.data;
        });
};

const cargarListas = () => {
    obtenerVehiculos();
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
                    Mis subastas
                    <small></small>
                </span>
            </h4>
            <!-- END section-title -->
            <!-- BEGIN row -->
            <div class="row gx-2">
                <!-- BEGIN col-2 -->
                <div class="col-12" v-for="item in listVehiculos">
                    <Publicacion
                        :publicacion="item"
                        :link="true"
                        :column="true"
                        :detalle_lista="true"
                    ></Publicacion>
                </div>
                <!-- END col-2 -->
            </div>
            <!-- END row -->
            <div class="row mb-3" v-if="page == 1 && listVehiculos.length > 0">
                <div class="col-12 text-center">
                    <button class="btn bg-dark text-white mx-1" v-if="page > 1">
                        <i class="fa fa-angle-left"></i>
                    </button>
                    <button
                        class="btn bg-dark text-white mx-1"
                        v-if="page < last_page"
                    >
                        <i class="fa fa-angle-right"></i>
                    </button>
                </div>
            </div>
        </div>
        <!-- END container -->
    </div>
    <!-- END #trending-items -->
</template>
<style scoped>
.section-container {
    min-height: 70vh;
}
</style>
