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
    detalles: {
        type: Array,
        default: [],
    },
});

const dialog = ref(props.open_dialog);
const oPublicacion = ref(props.publicacion);
const oSubastaCliente = ref(props.subasta_cliente);
const aDetalles = ref(props.detalles);
const input_file = ref(null);
const enviando = ref(false);
const errors = ref(null);
const form = ref({
    publicacion_id: oPublicacion.value.id,
    comprobante: null,
});
const emits = defineEmits(["cerrar-dialog", "envio-formulario"]);

const cargarFile = (e) => {
    const file = e.target.files[0];
    form.value.comprobante = null;
    if (file) {
        form.value.comprobante = file;
    }
};

watch(
    () => props.open_dialog,
    async (newValue) => {
        dialog.value = newValue;
        if (dialog.value) {
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
    }
);
watch(
    () => props.detalles,
    async (newValue) => {
        aDetalles.value = newValue;
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
    return `<i class="fa fa-info-circle"></i> Registrar comprobante`;
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
    return `<i class="fa fa-send"></i> Enviar comprobante`;
});

const cerrarDialog = () => {
    dialog.value = false;
    oSubastaCliente.value = null;
    enviando.value = false;
    document.getElementsByTagName("body")[0].classList.remove("modal-open");
};

const registrarComprobante = () => {
    enviando.value = true;
    let config = {
        headers: {
            "Content-Type": "multipart/form-data",
        },
    };
    let formdata = new FormData();
    formdata.append("publicacion_id", form.value.publicacion_id);
    formdata.append("comprobante", form.value.comprobante);

    if (oSubastaCliente.value) {
        formdata.append("subasta_cliente_id", oSubastaCliente.value.id);
    }

    axios
        .post(route("subastas.registrarComprobante"), formdata, config)
        .then((response) => {
            oSubastaCliente.value = response.data.subasta_cliente;
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
            emits("envio-formulario", oSubastaCliente.value);
        })
        .catch((error) => {
            enviando.value = false;
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
                    <div class="row">
                        <div class="col-12">
                            <div
                                class="alert alert-danger"
                                v-if="oSubastaCliente"
                            >
                                <i class="fa fa-info-circle"></i> Su comprobante
                                fue rechazado
                                <ul>
                                    <li>El comprobante debe ser claro</li>
                                    <li>
                                        Llame a su banco y reporte el problema
                                    </li>
                                </ul>
                                <i class="far fa-circle"></i> Vuelva a cargar su
                                comprobante
                            </div>
                            <div class="alert alert-info" v-else>
                                <i class="fa fa-info-circle"></i> Debes realizar
                                el pago del monto de garantía
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <p>
                                <strong>Monto de garantía: </strong
                                >{{ oPublicacion.monto_garantia }}
                            </p>
                            <p>
                                <strong>Moneda: </strong>
                                {{ oPublicacion.moneda }}
                            </p>
                            <form @submit.prevent="registrarComprobante">
                                <div class="form-group">
                                    <label class="font-weight-bold mb-1"
                                        >Cargar comprobante (Pdf/Imagen)*</label
                                    >
                                    <input
                                        type="file"
                                        ref="input_file"
                                        @change="cargarFile($event)"
                                    />
                                    <span
                                        class="text-danger d-block"
                                        v-if="errors && errors.comprobante"
                                        >{{ errors.comprobante[0] }}</span
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
                        type="button"
                        @click="registrarComprobante()"
                        class="btn btn-primary"
                        v-html="txtBotonEnviar"
                        :disabled="enviando"
                    ></button>
                </div>
            </div>
        </div>
    </div>
</template>
