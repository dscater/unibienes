<script>
import Portal from "@/Layouts/Portal.vue";
import SliderImagenes from "@/Components/SliderImagenes.vue";
import DetalleSubasta from "@/Components/DetalleSubasta.vue";
import ModalComprobante from "@/Components/ModalComprobante.vue";
import ModalPuja from "@/Components/ModalPuja.vue";
import Publicacion from "@/Components/Publicacion.vue";
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
const oPublicacion = ref(props.publicacion);
const oSubastaCliente = ref(null);

const modal_dialog = ref(false);
const modal_dialog_comprobante = ref(false);
const modal_dialog_puja = ref(false);
const data_puja = ref(null);
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
        data_puja.value = await verificarPujaUser(
            props_page.auth.user.id,
            oPublicacion.value.id
        );
        // console.log(data_puja);
        if (data_puja.value && data_puja.value.subasta_cliente) {
            // verificar estado_comprobante

            // mostrar info para registrar puja
            oSubastaCliente.value = data_puja.value.subasta_cliente;
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

const obtieneInfoSubastaCliente = async () => {
    if (props.auth && props.auth.user) {
        data_puja.value = await verificarPujaUser(
            props_page.auth.user.id,
            oPublicacion.value.id
        );
        if (data_puja.value && data_puja.value.subasta_cliente) {
            oSubastaCliente.value = data_puja.value.subasta_cliente;
        } else {
            oSubastaCliente.value = null;
        }
    }
};

const actualizaPublicacion = (newVal) => {
    oPublicacion.value = newVal;
};

onMounted(() => {
    obtieneInfoSubastaCliente();
});
</script>
<template>
    <DetalleSubasta
        :open_dialog="modal_dialog"
        :publicacion="oPublicacion"
        :detalles="restantes"
        @cerrar-dialog="modal_dialog = false"
    ></DetalleSubasta>
    <ModalComprobante
        :open_dialog="modal_dialog_comprobante"
        :publicacion="oPublicacion"
        :subasta_cliente="oSubastaCliente"
        @cerrar-dialog="modal_dialog_comprobante = false"
        @envio-formulario="muestraFormPuja"
    ></ModalComprobante>
    <ModalPuja
        :open_dialog="modal_dialog_puja"
        :publicacion="oPublicacion"
        :subasta_cliente="oSubastaCliente"
        @cerrar-dialog="modal_dialog_puja = false"
        @envio-formulario="actualizaPublicacion"
    ></ModalPuja>
    <Publicacion
        :publicacion="oPublicacion"
        :detalle_lista="true"
    ></Publicacion>
</template>
