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
const user = ref(props_page.auth?.user);
const url_asset = ref(props_page.url_assets);
const listVehiculos = ref([]);
const page = ref(1);
const last_page = ref(1);
const total = ref(0);

const obtenerRegistros = () => {
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
            total.value = registros.total;
        });
};

const updatePage = (value) => {
    page.value = page.value + value;
    if (page.value < 0) page.value = 1;
    if (page.value > total.value) page.value = last_page;
    obtenerRegistros();
};

const cargarListas = () => {
    obtenerRegistros();
};

onMounted(() => {
    cargarListas();
});
</script>
<template>
    <!-- BEGIN #trending-items -->
    <div id="trending-items" class="section-container section_page">
        <!-- BEGIN container -->
        <div class="container">
            <!-- BEGIN section-title -->
            <h4 class="titlesec">
                <img :src="url_asset + 'imgs/7.png'" alt="" />
                <span> Mis subastas </span>
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
            <div class="row mb-3" v-if="page >= 1 && listVehiculos.length > 0">
                <div class="col-12 text-center font-weight-bold">
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
