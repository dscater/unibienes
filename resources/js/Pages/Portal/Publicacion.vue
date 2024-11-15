<script>
import Portal from "@/Layouts/Portal.vue";
import SliderImagenes from "@/Components/SliderImagenes.vue";
import DetalleSubasta from "@/Components/DetalleSubasta.vue";
import ModalComprobante from "@/Components/ModalComprobante.vue";
import ModalPuja from "@/Components/ModalPuja.vue";
export default {
    layout: Portal,
};
</script>
<script setup>
import { usePage, Link } from "@inertiajs/vue3";
const { props: props_page } = usePage();
import { onMounted, ref, inject } from "vue";
const props = defineProps({
    publicacion: {
        type: Object,
        default: null,
    },
});
const verificaUser = inject("verificaUser");
const verificarPujaUser = inject("verificarPujaUser");
const oSubastaCliente = ref(null);

const modal_dialog = ref(false);
const modal_dialog_comprobante = ref(false);
const modal_dialog_puja = ref(false);

// 3 detalles
const primerosTres = ref(props.publicacion.publicacion_detalles.slice(0, 3));

// restantes
const restantes = ref(props.publicacion.publicacion_detalles.slice(3));

const verDetallesPublicacion = () => {
    modal_dialog.value = true;
};

const realizarOferta = async () => {
    if (verificaUser()) {
        // mostrar puja
        const data_puja = await verificarPujaUser(
            props_page.auth.user.id,
            props.publicacion.id
        );
        // console.log(data_puja);
        if (data_puja.subasta_cliente) {
            // verificar estado_comprobante

            // mostrar info para registrar puja
            oSubastaCliente.value = data_puja.subasta_cliente;
            if (oSubastaCliente.value.estado_comprobante == 1) {
                modal_dialog_puja.value = true;
            } else if (oSubastaCliente.value.estado_comprobante == 2) {
                // mostrar registro de comprobante nuevo
                modal_dialog_comprobante.value = true;
            }
        } else {
            // mostrar registro de comprobante
            modal_dialog_comprobante.value = true;
        }
    }
};

const muestraFormPuja = (subasta_cliente) => {
    oSubastaCliente.value = subasta_cliente;
    modal_dialog_comprobante.value = false;
    modal_dialog_puja.value = true;
};

onMounted(() => {});
</script>
<template>
    <DetalleSubasta
        :open_dialog="modal_dialog"
        :publicacion="props.publicacion"
        :detalles="restantes"
        @cerrar-dialog="modal_dialog = false"
    ></DetalleSubasta>
    <ModalComprobante
        :open_dialog="modal_dialog_comprobante"
        :publicacion="props.publicacion"
        :subasta_cliente="oSubastaCliente"
        @cerrar-dialog="modal_dialog_comprobante = false"
        @envio-formulario="muestraFormPuja"
    ></ModalComprobante>
    <ModalPuja
        :open_dialog="modal_dialog_puja"
        :publicacion="props.publicacion"
        :subasta_cliente="oSubastaCliente"
        @cerrar-dialog="modal_dialog_puja = false"
    ></ModalPuja>
    <div id="product" class="section-container pt-20px">
        <div class="container">
            <div class="product">
                <!-- BEGIN product-detail -->
                <div class="product-detail">
                    <!-- BEGIN product-image -->
                    <div class="product-image flex-column">
                        <!-- BEGIN product-main-image -->
                        <div class="product-main-image">
                            <SliderImagenes
                                :imagenes="publicacion.publicacion_imagens"
                            ></SliderImagenes>
                        </div>
                        <!-- END product-main-image -->
                        <div class="row">
                            <div class="col-12 px-5">
                                <h4 class="w-100 text-center">Detalles</h4>
                                <div class="row">
                                    <div
                                        class="col-md-4 border"
                                        v-for="item in primerosTres"
                                    >
                                        <div class="row">
                                            <div
                                                class="col-12 bg-primary text-white"
                                            >
                                                {{ item.caracteristica }}
                                            </div>
                                            <div class="col-12">
                                                {{ item.detalle }}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 text-center mt-2 mb-2">
                                        <button
                                            class="btn btn-primary"
                                            @click="verDetallesPublicacion"
                                        >
                                            Detalles de la subasta
                                            <i
                                                class="fa fa-external-link-alt"
                                            ></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END product-image -->
                    <!-- BEGIN product-info -->
                    <div class="product-info">
                        <!-- BEGIN product-info-header -->
                        <div class="product-info-header">
                            <h1 class="product-title w-100 text-center">
                                Ofertas
                            </h1>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr class="bg-primary">
                                            <th class="text-white" width="2%">
                                                #
                                            </th>
                                            <th class="text-white">Oferta</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <template
                                            v-if="
                                                publicacion.subasta &&
                                                publicacion.subasta
                                                    .subasta_clientes_puja
                                                    .length > 0
                                            "
                                        >
                                            <tr
                                                v-for="(
                                                    item, index
                                                ) in publicacion.subasta
                                                    .subasta_clientes_puja"
                                            >
                                                <td>{{ index + 1 }}</td>
                                                <td>{{ item.puja }}</td>
                                            </tr>
                                        </template>
                                        <template v-else>
                                            <tr>
                                                <td
                                                    colspan="2"
                                                    class="text-center"
                                                >
                                                    Sin registros aún
                                                </td>
                                            </tr>
                                        </template>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- END product-info-header -->
                        <!-- BEGIN product-purchase-container -->
                        <div class="product-purchase-container text-center">
                            <button
                                class="btn btn-success btn-theme btn-lg"
                                @click="realizarOferta"
                            >
                                Realizar una oferta
                            </button>
                        </div>
                        <!-- END product-purchase-container -->
                    </div>
                    <!-- END product-info -->
                </div>
                <!-- END product-detail -->
            </div>
        </div>
    </div>
</template>
