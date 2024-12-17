<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { watch, ref, computed, defineEmits, onMounted, nextTick } from "vue";
const props = defineProps({
    open_dialog: {
        type: Boolean,
        default: false,
    },
    accion_dialog: {
        type: Number,
        default: 0,
    },
    subasta_cliente: {
        tpye: Object,
        default: null,
    },
});

const obtenerFechaActual = () => {
    const fecha = new Date();
    const anio = fecha.getFullYear();
    const mes = String(fecha.getMonth() + 1).padStart(2, "0"); // Mes empieza desde 0
    const dia = String(fecha.getDate()).padStart(2, "0"); // Día del mes
    return `${anio}-${mes}-${dia}`;
};

const obtenerHoraActual = () => {
    const fecha = new Date();
    const horas = String(fecha.getHours()).padStart(2, "0"); // Horas en formato 24 horas
    const minutos = String(fecha.getMinutes()).padStart(2, "0"); // Minutos
    return `${horas}:${minutos}`;
};

const accion = ref(props.accion_dialog);
const dialog = ref(props.open_dialog);
const oSubastaCliente = ref(props.subasta_cliente);

const form = ref({
    _method: "PUT",
    descripcion_devolucion: "",
    fecha_devolucion: obtenerFechaActual(),
    hora_devolucion: obtenerHoraActual(),
    errors: null,
});

watch(
    () => props.open_dialog,
    async (newValue) => {
        dialog.value = newValue;
        if (dialog.value) {
            form.value.descripcion_devolucion = "";
            form.value.fecha_devolucion = obtenerFechaActual();
            form.value.hora_devolucion = obtenerHoraActual();
            document
                .getElementsByTagName("body")[0]
                .classList.add("modal-open");
        }
    }
);
watch(
    () => props.accion_dialog,
    (newValue) => {
        accion.value = newValue;
    }
);

watch(
    () => props.subasta_cliente,
    (newValue) => {
        form.value.fecha_devolucion = obtenerFechaActual();
        form.value.hora_devolucion = obtenerHoraActual();
        oSubastaCliente.value = newValue;
    }
);

const { auth } = usePage().props;

const tituloDialog = computed(() => {
    return `<i class="fa fa-check-circle"></i> Registrar devolución`;
});

const actualizando = ref(false);

const registrarDevolucion = () => {
    actualizando.value = true;
    form.value.errors = null;
    let url = route(
        "subasta_clientes.registrarDevolucion",
        oSubastaCliente.value.id
    );
    axios
        .post(url, form.value)
        .then((response) => {
            actualizando.value = false;
            dialog.value = false;
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `Proceso realizado`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            emits("envio-formulario", response.data);
        })
        .catch((error) => {
            actualizando.value = false;
            console.log("ERROR");
            console.log(error);
            if (error.response.data.errors) {
                const errors = error.response.data.errors;
                form.value.errors = {};
                for (const field in errors) {
                    if (errors.hasOwnProperty(field)) {
                        form.value.errors[field] = errors[field][0]; // Asignar solo el primer error
                    }
                }
            } else {
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    text: `${error.response.data.message}`,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: `Aceptar`,
                });
            }
        });
};

const emits = defineEmits(["cerrar-dialog", "envio-formulario"]);

watch(dialog, (newVal) => {
    if (!newVal) {
        emits("cerrar-dialog");
    }
});

const cerrarDialog = () => {
    // oSubastaCliente.value = null;
    form.value.descripcion_devolucion = "";
    form.value.errors = null;
    dialog.value = false;
    document.getElementsByTagName("body")[0].classList.remove("modal-open");
};

// const cargarListas = () => {};

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
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h4 class="modal-title" v-html="tituloDialog"></h4>
                    <button
                        type="button"
                        class="btn-close"
                        @click="cerrarDialog()"
                    ></button>
                </div>
                <div class="modal-body">
                    <div class="row" v-if="oSubastaCliente">
                        <div class="col-12">
                            <p>
                                <strong>Nombre: </strong>
                                {{ oSubastaCliente.cliente?.full_name }}
                            </p>
                            <p>
                                <strong>C.I.: </strong
                                >{{ oSubastaCliente.cliente?.full_ci }}
                            </p>
                            <p>
                                <strong>Complemento: </strong
                                >{{ oSubastaCliente.cliente?.complemento }}
                            </p>
                            <p>
                                <strong>Número de celular: </strong
                                >{{ oSubastaCliente.cliente?.fono }}
                            </p>
                            <h4>Datos para devolución</h4>
                            <p>
                                <strong>Banco: </strong
                                >{{ oSubastaCliente.cliente?.banco }}
                            </p>
                            <p>
                                <strong>Número de cuenta: </strong
                                >{{ oSubastaCliente.cliente?.nro_cuenta }}
                            </p>
                            <p>
                                <strong>Moneda de cuenta bancaria: </strong
                                >{{ oSubastaCliente.cliente?.moneda }}
                            </p>
                            <p class="alert alert-info">
                                <strong>MONTO DE GARANTÍA: </strong
                                >{{ oSubastaCliente.moneda_abrev_pub }}
                                {{ oSubastaCliente.monto_garantia_pub }}
                            </p>
                        </div>
                        <div class="col-md-6">
                            <label>Fecha de devolución*</label>
                            <input
                                type="date"
                                class="form-control"
                                :class="{
                                    'parsley-error':
                                        form.errors?.fecha_devolucion,
                                }"
                                v-model="form.fecha_devolucion"
                            />

                            <div
                                class="w-100"
                                v-if="form.errors?.fecha_devolucion"
                            >
                                <span
                                    class="invalid-feedback alert alert-danger"
                                    style="display: block"
                                    role="alert"
                                >
                                    <strong>{{
                                        form.errors.fecha_devolucion
                                    }}</strong>
                                </span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label>Hora de devolución*</label>
                            <input
                                type="time"
                                class="form-control"
                                :class="{
                                    'parsley-error':
                                        form.errors?.hora_devolucion,
                                }"
                                v-model="form.hora_devolucion"
                            />

                            <div
                                class="w-100"
                                v-if="form.errors?.hora_devolucion"
                            >
                                <span
                                    class="invalid-feedback alert alert-danger"
                                    style="display: block"
                                    role="alert"
                                >
                                    <strong>{{
                                        form.errors.hora_devolucion
                                    }}</strong>
                                </span>
                            </div>
                        </div>
                        <div class="col-12">
                            <label>Descripción</label>
                            <textarea
                                type="date"
                                class="form-control"
                                :class="{
                                    'parsley-error': form.errors?.descripcion_devolucion,
                                }"
                                v-model="form.descripcion_devolucion"
                            ></textarea>

                            <div class="w-100" v-if="form.errors?.descripcion_devolucion">
                                <span
                                    class="invalid-feedback alert alert-danger"
                                    style="display: block"
                                    role="alert"
                                >
                                    <strong>{{
                                        form.errors.descripcion_devolucion
                                    }}</strong>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-end">
                    <a
                        href="javascript:;"
                        class="btn btn-white"
                        @click="cerrarDialog()"
                        ><i class="fa fa-times"></i> Cerrar</a
                    >
                    <button
                        v-if="
                            auth?.user.permisos == '*' ||
                            auth?.user.permisos.includes('publicacions.edit')
                        "
                        type="button"
                        @click="registrarDevolucion()"
                        class="btn btn-success"
                        :disabled="actualizando"
                    >
                        <i class="fa fa-check"></i>
                        Registrar devolución
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
iframe {
    width: 100%;
}
</style>
