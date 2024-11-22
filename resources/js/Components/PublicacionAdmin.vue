<script>
import SliderImagenes from "@/Components/SliderImagenes.vue";
import DetalleSubasta from "@/Components/DetalleSubasta.vue";
import ModalComprobante from "@/Components/ModalComprobante.vue";
import ModalPuja from "@/Components/ModalPuja.vue";
</script>
<script setup>
import { usePage, Link } from "@inertiajs/vue3";
import { onMounted, ref, inject, computed } from "vue";
const { props: props_page } = usePage();
const props = defineProps({
    publicacion: {
        type: Object,
        default: null,
    },
    link: {
        type: Boolean,
        default: false,
    },
    column: {
        type: Boolean,
        default: false,
    },
    detalle_lista: {
        type: Boolean,
        default: false,
    },
});
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

const segundosDif = ref(0);
const minutosDif = ref(0);
const horasDif = ref(0);
const diasDif = ref(0);
const strRestante = ref("");
const intervalConteo = ref(null);
const swRealizarOferta = ref(true);

const iniciaConteoFinalizacion = () => {
    // Fecha en formato DD/MM/YYYY HH:MM:SS

    // Fecha actual
    const fechaActual = new Date();
    let fechaStr = "";
    if (oPublicacion.value) {
        fechaStr = oPublicacion.value.fecha_hora_limite;
        // Separar la fecha y la hora
        const [fecha, hora] = fechaStr.split(" ");
        const [dia, mes, anio] = fecha.split("/");
        const [horas, minutos, segundos] = hora.split(":");

        // Crear el objeto Date con los valores separados (meses empiezan en 0)
        const fechaObjetivo = new Date(
            anio,
            mes - 1,
            dia,
            horas,
            minutos,
            segundos
        );

        // Calcular la diferencia en milisegundos
        const diferenciaMs = fechaObjetivo - fechaActual;

        // Convertir la diferencia a segundos, minutos, horas y días
        segundosDif.value = Math.floor((diferenciaMs / 1000) % 60);
        minutosDif.value = Math.floor((diferenciaMs / (1000 * 60)) % 60);
        horasDif.value = Math.floor((diferenciaMs / (1000 * 60 * 60)) % 24);
        diasDif.value = Math.floor(diferenciaMs / (1000 * 60 * 60 * 24));

        if (
            segundosDif.value <= 0 &&
            minutosDif.value <= 0 &&
            horasDif.value <= 0 &&
            diasDif.value <= 0
        ) {
            verificarGanadorPublicacion();
            clearInterval(intervalConteo.value);
            swRealizarOferta.value = false;
        }
    }

    strRestante.value = `${diasDif.value}d ${horasDif.value}h ${minutosDif.value}m ${segundosDif.value}s`;
};

const oGanadorSubastaCliente = ref(null);

const verificarGanadorPublicacion = () => {
    axios
        .post(route("publicacions.verificaGanador", oPublicacion.value.id))
        .then((response) => {
            oGanadorSubastaCliente.value = response.data.subasta_cliente;
        });
};

onMounted(() => {
    intervalConteo.value = setInterval(iniciaConteoFinalizacion, 1000);
});
</script>
<template>
    <DetalleSubasta
        :open_dialog="modal_dialog"
        :publicacion="oPublicacion"
        :detalles="restantes"
        @cerrar-dialog="modal_dialog = false"
    ></DetalleSubasta>
    <div class="product mb-3">
        <div class="row">
            <!-- BEGIN product-detail -->
            <div
                class="p-3"
                :class="[
                    props.column ? 'flex-column' : '',
                    props.detalle_lista
                        ? 'col-md-6 product_info_imagen'
                        : 'col-md-12',
                ]"
            >
                <!-- tiempo restante -->
                <div class="tiempoRestante" v-if="swRealizarOferta">
                    <strong>Quedan</strong>
                    <span v-text="strRestante"></span>
                </div>
                <!-- BEGIN product-image -->
                <div
                    class="product-image flex-column"
                    :class="[props.column ? ' w-100' : '']"
                >
                    <!-- BEGIN product-main-image -->
                    <div class="product-main-image">
                        <SliderImagenes
                            :imagenes="publicacion.publicacion_imagens"
                        ></SliderImagenes>
                    </div>
                    <!-- END product-main-image -->
                    <div class="row fila_detalle">
                        <!-- FIN tiempo restante -->
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
                                        <i class="fa fa-external-link-alt"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END product-image -->
                <!-- BEGIN product-info -->
                <div class="product-info p-3">
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr class="bg-primary">
                                        <td
                                            class="text-white font-weight-bold h5"
                                        >
                                            Oferta inicial
                                        </td>
                                        <td
                                            class="text-white font-weight-bold h5"
                                        >
                                            {{ oPublicacion.oferta_inicial }}
                                        </td>
                                    </tr>
                                    <tr v-if="oGanadorSubastaCliente" class="bg-success">
                                        <td class="text-white">GANADOR</td>
                                        <td class="text-white">
                                            {{
                                                oGanadorSubastaCliente.cliente
                                                    .full_name
                                            }}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END product-info-header -->
                </div>
                <!-- END product-info -->
            </div>
            <!-- END product-detail -->
        </div>
    </div>
</template>
<style scoped>
.fila_detalle {
    position: relative;
}
.product-detail {
    position: relative;
}

.tiempoRestante {
    display: flex;
    flex-direction: column;
    background-color: rgba(0, 0, 0, 0.767);
    color: white;
    text-align: center;
    padding: 5px;
    min-width: 130px;
    width: 20%;
    border-radius: 5px;
    position: absolute;
    left: 10px;
    top: 0px;
    z-index: 500;
}

.product_info_imagen {
    border-right: solid 1px rgb(204, 204, 204);
}
</style>
