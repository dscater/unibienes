<script>
import Portal from "@/Layouts/Portal.vue";
import Publicacion from "@/Components/Publicacion.vue";
export default {
    layout: Portal,
};
</script>
<script setup>
import { onMounted, ref } from "vue";
const listVehiculos = ref([]);
const page = ref(1);
const last_page = ref(1);
const total = ref(0);

const obtenerVehiculos = () => {
    axios
        .get(route("publicacions.porCategoriaPagina"), {
            params: {
                page: page.value,
                categoria: "OTROS BIENES",
            },
        })
        .then((response) => {
            const registros = response.data.publicacions;
            page.value = registros.current_page;
            last_page.value = registros.last_page;
            listVehiculos.value = registros.data;
            total.value = registros.total;
        });
};

const updatePage = (value) => {
    page.value = page.value + value;
    if (page.value < 0) page.value = 1;
    if (page.value > total.value) page.value = last_page;
    console.log(page.value);
    obtenerVehiculos();
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
                    Otros bienes
                    <small></small>
                </span>
            </h4>
            <!-- END section-title -->
            <!-- BEGIN row -->
            <div class="row gx-2">
                <!-- BEGIN col-2 -->
                <div
                    class="col-lg-6 col-md-6 col-sm-12"
                    v-for="item in listVehiculos"
                >
                    <Publicacion
                        :publicacion="item"
                        :column="true"
                        :link="true"
                    ></Publicacion>
                </div>
                <!-- END col-2 -->
            </div>
            <!-- END row -->
            <div class="row mb-3" v-if="page >= 1 && listVehiculos.length > 0">
                <div class="col-12 text-center">
                    <button
                        class="btn bg-dark text-white mx-1"
                        v-if="page > 1"
                        @click.prevent="updatePage(-1)"
                    >
                        <i class="fa fa-angle-left"></i>
                    </button>
                    Pág. {{ page }}/{{ last_page }}
                    <button
                        class="btn bg-dark text-white mx-1"
                        v-if="page < last_page"
                        @click.prevent="updatePage(1)"
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
