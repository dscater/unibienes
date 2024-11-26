<script>
import SliderImagenes from "@/Components/SliderImagenes.vue";
import DetalleSubasta from "@/Components/DetalleSubasta.vue";
import ModalComprobante from "@/Components/ModalComprobante.vue";
import ModalPuja from "@/Components/ModalPuja.vue";
</script>
<script setup>
import { usePage, Link } from "@inertiajs/vue3";
import { onMounted, ref, inject, computed } from "vue";
import { useFormater } from "@/composables/useFormater";
const { getFormatoMoneda } = useFormater();
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

const verificaClienteTop = (id) => {
    if (id && oPublicacion.value.subasta) {
        let res = oPublicacion.value.subasta.subasta_clientes_puja.filter(
            (elem) => elem.id == id
        );
        return res.length > 0;
    }
    return true;
};

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
    <div class="border-0 mb-4 mx-2">
        <div class="row">
            <!-- BEGIN product-detail -->
            <div
                class="contenedor_imagen p-0"
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
                    <div class="row fila_detalle pt-3" style="">
                        <div class="col-12 text-center" v-if="link">
                            <Link
                                class="btn bg1 btn-sm"
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
                        <div
                            class="col-12 mt-2 mb-0 p-0"
                            style="margin: 0px 0px; padding: 0px 6px 0px 6px"
                        >
                            <h4 class="w-100 text-center">Detalles</h4>
                            <div class="row mx-0 detalles_principal">
                                <div
                                    class="col-md-4"
                                    v-for="item in primerosTres"
                                >
                                    <div class="row">
                                        <div
                                            class="col-12 bg1 text-white text-center font-weight-bold"
                                        >
                                            {{ item.caracteristica }}
                                        </div>
                                        <div class="col-12 text-center">
                                            {{ item.detalle }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 text-center p-0">
                            <button
                                class="btn bg3 btn-sm w-100 rounded-0 mx-0"
                                @click="verDetallesPublicacion"
                            >
                                Ver mas detalles
                                <i class="fa fa-external-link-alt"></i>
                            </button>
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
                            <div class="row">
                                <div
                                    class="text_info col-md-6 font-weight-bold"
                                >
                                    Oferta inicial:
                                </div>
                                <div class="col-md-6 txt_info2">
                                    {{
                                        getFormatoMoneda(
                                            oPublicacion.oferta_inicial
                                        )
                                    }}
                                </div>
                                <div
                                    class="text_info col-md-6 font-weight-bold"
                                >
                                    Oferta actual:
                                </div>
                                <template
                                    v-if="
                                        oPublicacion.subasta &&
                                        oPublicacion.subasta
                                            .subasta_clientes_puja.length > 0
                                    "
                                >
                                    <div class="col-md-6 txt_info2">
                                        {{
                                            getFormatoMoneda(
                                                oPublicacion.subasta
                                                    .subasta_clientes_puja[0]
                                                    .puja
                                            )
                                        }}
                                    </div>
                                </template>
                                <template v-else>
                                    <div class="col-md-6 txt_info2">
                                        Sin registros aún
                                    </div>
                                </template>
                            </div>
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
                            class="btn btn-sm"
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
            <div
                class="col-md-6 p-0 bg_blue_dark cont_ofertas pt-3"
                v-if="detalle_lista"
            >
                <div class="product-info-header">
                    <h4
                        class="product-title w-100 text-center font-weight-bold"
                    >
                        OFERTAS
                    </h4>
                </div>
                <table class="table tabla_ofertas">
                    <thead>
                        <tr class="bg1">
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
                                    index == 0 ? 'h2' : '',
                                    index == 1 ? 'h4' : '',
                                    oSubastaCliente &&
                                    oSubastaCliente.id == item.id
                                        ? 'bg-teal text-white'
                                        : '',
                                ]"
                            >
                                <td class="text-white">{{ index + 1 }}</td>
                                <td class="text-white">
                                    {{ getFormatoMoneda(item.puja) }}
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
                                v-if="!verificaClienteTop(oSubastaCliente?.id)"
                                class="bg-teal text-white"
                            >
                                <td>-</td>
                                <td>
                                    {{
                                        getFormatoMoneda(oSubastaCliente?.puja)
                                    }}
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
.product-info,
.product-image {
    background-color: var(--bg_blue_dark);
    color: white;
}

.fila_detalle {
    margin: auto;
    max-width: 100%;
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

.text_info {
    text-align: right;
}

.detalles_principal {
    background-color: var(--bg1-t);
}

.detalles_principal .col-12 {
    padding: 10px;
}
.tabla_ofertas {
}

.tabla_ofertas tbody tr:hover {
    background-color: transparent;
}

@media (max-width: 900px) {
    .text_info {
        text-align: center;
    }

    .txt_info2 {
        text-align: center;
    }
    .cont_ofertas {
        border-top: solid 1px white;
    }
}
</style>
