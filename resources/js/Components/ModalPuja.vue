<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { watch, ref, computed, defineEmits, onMounted } from "vue";
const props = defineProps({
    open_dialog: {
        type: Boolean,
        default: false,
    },
    publicacion: {
        type: Object,
        default: null,
    },
    subasta_cliente: {
        type: Object,
        default: null,
    },
});

const dialog = ref(props.open_dialog);
const oPublicacion = ref(props.publicacion);
const oSubastaCliente = ref(props.subasta_cliente);
const oSubasta = ref(null);
const montoInicial = ref(0);
const monto_puja = ref(0);
const input_file = ref(null);
const enviando = ref(false);
const errors = ref(null);

const emits = defineEmits(["cerrar-dialog", "envio-formulario"]);

const cargarFile = (e) => {
    const file = e.target.files[0];
    form.value.comprobante = null;
    if (file) {
        form.value.comprobante = e.target;
    }
};

watch(
    () => props.open_dialog,
    async (newValue) => {
        dialog.value = newValue;
        if (dialog.value) {
            obtenerSubastaMontoInicial();
            document
                .getElementsByTagName("body")[0]
                .classList.add("modal-open");
        }
    }
);
watch(
    () => props.publicacion,
    async (newValue) => {
        oPublicacion.value = newValue;
        obtenerSubastaMontoInicial();
    }
);
watch(
    () => props.subasta_cliente,
    async (newValue) => {
        oSubastaCliente.value = newValue;
    }
);

const { flash } = usePage().props;

const tituloDialog = computed(() => {
    return `<i class="fa fa-info-circle"></i> Registrar oferta/puja`;
});

watch(dialog, (newVal) => {
    if (!newVal) {
        emits("cerrar-dialog");
    }
});

const txtBotonEnviar = computed(() => {
    if (enviando.value) {
        return `<i class="fa fa-spinner fa-spin"></i> Enviando...`;
    }
    return `<i class="fa fa-send"></i> Registrar oferta`;
});

const cerrarDialog = () => {
    error_monto.value = false;
    dialog.value = false;
    document.getElementsByTagName("body")[0].classList.remove("modal-open");
};

const registrarPuja = () => {
    enviando.value = true;
    axios
        .post(route("subastas.registrarPuja"), {
            monto_puja: monto_puja.value,
            subasta_cliente_id: oSubastaCliente.value.id,
        })
        .then((response) => {
            error_monto.value = false;
            enviando.value = false;
            dialog.value = false;
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${
                    response.message ? response.message : "Proceso realizado"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            emits("envio-formulario", response.data);
        })
        .catch((error) => {
            enviando.value = false;
            error_monto.value = false;
            console.log("ERROR");
            console.log(error);
            if (error.status == 422) {
                errors.value = error.response.data.errors;
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    text: `${
                        error.response.data.message
                            ? error.response.data.message
                            : "Hay errores en el formulario"
                    }`,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: `Aceptar`,
                });
            } else {
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    text: `Ocurrió un error inesperado intente mas tarde por favor`,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: `Aceptar`,
                });
            }
        });
};

const obtenerSubastaMontoInicial = () => {
    axios
        .get(route("subastas.infoSubastaPorPublicacion"), {
            params: {
                publicacion_id: oPublicacion.value.id,
            },
        })
        .then((response) => {
            oSubasta.value = response.data.subasta;
            montoInicial.value = response.data.monto_puja_actual;
            if (montoInicial.value && montoInicial.value != "-") {
                console.log(oSubasta.value);
                monto_puja.value = parseInt(montoInicial.value);
                if (oSubasta.value.subasta_clientes_puja.length > 0) {
                    monto_puja.value++;
                }
            }
        });
};

const error_monto = ref(false);
const mensajeError = ref("");

const verificaMontoPuja = () => {
    console.log(oSubasta.value);
    if (montoInicial.value && montoInicial.value != "-") {
        let monto_valdacion = parseInt(montoInicial.value);
        mensajeError.value = `Debes ingresar un monto mayor o igual a ${monto_valdacion}`;
        if (oSubasta.value.subasta_clientes_puja.length > 0) {
            mensajeError.value = `Debes ingresar un monto mayor a la puja actual de ${monto_valdacion}`;
            monto_valdacion++;
        }
        if (monto_puja.value && monto_puja.value < monto_valdacion) {
            error_monto.value = true;
        } else {
            error_monto.value = false;
        }
    }
};

onMounted(() => {});
</script>

<template>
    <div
        class="modal fade"
        :class="{
            show: dialog,
        }"
        id="modal-dialog-form"
        :style="{
            display: dialog ? 'block' : 'none',
        }"
    >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h4 class="modal-title" v-html="tituloDialog"></h4>
                    <button
                        type="button"
                        class="btn-close"
                        @click="cerrarDialog()"
                    ></button>
                </div>
                <div class="modal-body">
                    <div
                        class="row"
                        v-show="
                            !oSubastaCliente ||
                            oSubastaCliente.estado_comprobante == 0
                        "
                    >
                        <div class="alert alert-info">
                            <ul class="pb-0 mb-0">
                                <li>
                                    Aún se esta verificando el pago de tu
                                    garantía
                                </li>
                                <li>
                                    Una vez verificado el pago podrás realizar
                                    tus ofertas/pujas
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <p>
                                <strong>Puja actual: </strong>{{ montoInicial }}
                            </p>
                            <p>
                                <strong>Moneda: </strong>
                                {{ oPublicacion.moneda }}
                            </p>
                            <form @submit.prevent="registrarPuja">
                                <div class="form-group">
                                    <label class="font-weight-bold mb-1"
                                        >Ingresar oferta*</label
                                    >
                                    <input
                                        type="number"
                                        class="form-control"
                                        v-model="monto_puja"
                                        @keyup.prevent="verificaMontoPuja"
                                        @change="verificaMontoPuja"
                                        step="1"
                                    />
                                    <span
                                        class="text-danger d-block"
                                        v-if="errors && errors.monto_puja"
                                        >{{ errors.monto_puja[0] }}</span
                                    >
                                    <span
                                        class="text-danger d-block"
                                        v-if="error_monto"
                                        >{{ mensajeError }}</span
                                    >
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a
                        href="javascript:;"
                        class="btn btn-default"
                        @click="cerrarDialog()"
                        ><i class="fa fa-times"></i> Cerrar</a
                    >
                    <button
                        v-show="
                            oSubastaCliente &&
                            oSubastaCliente.estado_comprobante == 1
                        "
                        type="button"
                        @click="registrarPuja()"
                        class="btn btn-primary"
                        v-html="txtBotonEnviar"
                        :disabled="enviando || error_monto"
                    ></button>
                </div>
            </div>
        </div>
    </div>
</template>
