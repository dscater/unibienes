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
            // if (oSubastaCliente.value.estado_comprobante == 1) {
            modal_dialog_puja.value = true;
            // } else if (oSubastaCliente.value.estado_comprobante == 2) {
            //     // mostrar registro de comprobante nuevo
            //     modal_dialog_comprobante.value = true;
            // }
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
    if (props_page.auth && props_page.auth.user) {
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
    obtieneInfoSubastaCliente();
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

const verificarGanadorPublicacion = () => {
    axios
        .post(route("publicacions.verificaGanador", oPublicacion.value.id))
        .then((response) => {
            console.log(response);
        });
};

const verificaSwOferta = () => {
    console.log(oPublicacion.value.estado_sub);
    if (oPublicacion.value.estado_sub == 1) {
        intervalConteo.value = setInterval(() => {
            iniciaConteoFinalizacion();
        }, 1000);
    } else {
        swRealizarOferta.value = false;
    }
};

const btnTxtRealizarOferta = computed(() => {
    if (oSubastaCliente.value && oSubastaCliente.value.estado_comprobante == 0)
        return "Pendiente";
    return "Realizar una oferta";
});

onMounted(() => {
    obtieneInfoSubastaCliente();
    verificaSwOferta();
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
    <div class="product mb-3">
        <div class="row">
            <!-- BEGIN product-detail -->
            <div
                class="contenedor_imagen p-3"
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
                        <div class="col-12 text-center" v-if="link">
                            <Link
                                class="btn btn-primary btn-sm"
                                :href="
                                    route(
                                        'publicacions.publicacionPortal',
                                        oPublicacion.id
                                    )
                                "
                            >
                                <i class="fa fa-arrow-right"></i>
                            </Link>
                        </div>
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
                    <!-- BEGIN product-info-header -->
                    <!-- <div class="product-info-header">
                        <h4 class="product-title w-100 text-center">Ofertas</h4>
                    </div> -->
                    <div class="row">
                        <div class="col-12" v-if="column">
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
                                    <template
                                        v-if="
                                            oPublicacion.subasta &&
                                            oPublicacion.subasta
                                                .subasta_clientes_puja.length >
                                                0
                                        "
                                    >
                                        <tr class="bg-success">
                                            <td
                                                class="text-white font-weight-bold h5"
                                            >
                                                Oferta actual
                                            </td>
                                            <td
                                                class="text-white font-weight-bold h5"
                                            >
                                                {{
                                                    oPublicacion.subasta
                                                        .subasta_clientes_puja[0]
                                                        .puja
                                                }}
                                            </td>
                                        </tr>
                                    </template>
                                    <template v-else>
                                        <tr>
                                            <td colspan="2" class="text-center">
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
                    <div class="text-center">
                        <div
                            v-if="
                                oSubastaCliente &&
                                oSubastaCliente.estado_puja == 2
                            "
                            class="alert alert-success"
                        >
                            GANADOR
                        </div>
                        <button
                            class="btn btn-theme btn-lg"
                            @click="realizarOferta"
                            :class="[
                                !oSubastaCliente ||
                                oSubastaCliente.estado_puja == 0
                                    ? 'btn-danger'
                                    : 'btn-success bg-green',
                            ]"
                            v-if="swRealizarOferta"
                            v-text="btnTxtRealizarOferta"
                        ></button>
                        <div v-else>
                            <span class="text-danger font-weight-bold"
                                >SUBASTA CONCLUIDA</span
                            >
                        </div>
                    </div>
                    <!-- END product-purchase-container -->
                </div>
                <!-- END product-info -->
            </div>
            <div class="col-md-6 p-3" v-if="detalle_lista">
                <div class="product-info-header">
                    <h4 class="product-title w-100 text-center">Ofertas</h4>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr class="bg-primary">
                            <th class="text-white" width="2%">#</th>
                            <th class="text-white">Oferta</th>
                        </tr>
                    </thead>
                    <tbody>
                        <template
                            v-if="
                                oPublicacion.subasta &&
                                oPublicacion.subasta.subasta_clientes_puja
                                    .length > 0
                            "
                        >
                            <tr
                                v-for="(item, index) in oPublicacion.subasta
                                    .subasta_clientes_puja"
                                :class="[
                                    index == 0 ? 'h3' : '',
                                    index == 1 ? 'h4' : '',
                                    oSubastaCliente &&
                                    oSubastaCliente.id == item.id
                                        ? 'bg-teal text-white'
                                        : '',
                                ]"
                            >
                                <td>{{ index + 1 }}</td>
                                <td>
                                    {{ item.puja }}
                                    <small
                                        v-if="
                                            oSubastaCliente &&
                                            oSubastaCliente.id == item.id
                                        "
                                        >(Mi oferta)</small
                                    >
                                </td>
                            </tr>

                            <tr
                                v-if="
                                    oSubastaCliente &&
                                    oSubastaCliente.estado_puja == 0 &&
                                    (oPublicacion.estado_sub == 1 || oPublicacion.estado_sub == 2 ||
                                        oPublicacion.estado_sub == 3)
                                "
                                class="bg-teal text-white"
                            >
                                <td>-</td>
                                <td>
                                    {{ oSubastaCliente.puja }}
                                    <small>(Mi oferta)</small>
                                </td>
                            </tr>
                        </template>
                        <template v-else>
                            <tr>
                                <td colspan="2" class="text-center">
                                    Sin registros aún
                                </td>
                            </tr>
                        </template>
                    </tbody>
                </table>
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
    background-color: rgba(0, 179, 45, 0.767);
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

.contenedor_imagen {
    position: relative;
}

.product_info_imagen {
    border-right: solid 1px rgb(204, 204, 204);
}
</style>
