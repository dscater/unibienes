<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { usePublicacions } from "@/composables/publicacions/usePublicacions";
import { watch, ref, computed, defineEmits, onMounted, nextTick } from "vue";
import PublicacionAdmin from "@/Components/PublicacionAdmin.vue";
import { useFormater } from "@/composables/useFormater";
const { getFormatoMoneda } = useFormater();

const props = defineProps({
    open_dialog: {
        type: Boolean,
        default: false,
    },
    accion_dialog: {
        type: Number,
        default: 0,
    },
});

const { oPublicacion, limpiarPublicacion } = usePublicacions();
const accion = ref(props.accion_dialog);
const dialog = ref(props.open_dialog);
let form = useForm(oPublicacion);
watch(
    () => props.open_dialog,
    async (newValue) => {
        dialog.value = newValue;
        if (dialog.value) {
            document
                .getElementsByTagName("body")[0]
                .classList.add("modal-open");
            form = useForm(oPublicacion);
        }
    }
);
watch(
    () => props.accion_dialog,
    (newValue) => {
        accion.value = newValue;
    }
);

const { flash } = usePage().props;

const tituloDialog = computed(() => {
    return accion.value == 0
        ? `<i class="fa fa-check-circle"></i> Habilitar publicación`
        : `<i class="fa fa-edit"></i> Ver Publicación`;
});

const enviarFormulario = () => {
    let url = route("publicacions.habilitaPublicacion", form.id);

    form.post(url, {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: () => {
            dialog.value = false;
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            limpiarPublicacion();
            emits("envio-formulario");
        },
        onError: (err) => {
            console.log("ERROR");
            Swal.fire({
                icon: "info",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.error
                        ? err.error
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
        },
    });
};

const emits = defineEmits(["cerrar-dialog", "envio-formulario"]);

watch(dialog, (newVal) => {
    if (!newVal) {
        emits("cerrar-dialog");
    }
});

const cerrarDialog = () => {
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
                    <form @submit.prevent="enviarFormulario()">
                        <div class="row">
                            <div class="col-12">
                                <PublicacionAdmin
                                    :publicacion="oPublicacion"
                                    :column="true"
                                    :link="true"
                                ></PublicacionAdmin>
                            </div>
                        </div>

                        <h5 v-if="accion == 0">
                            ¿Está seguro(a) de habilitar la publicación? Una vez
                            habilitado no podrá deshacerlo.
                        </h5>
                        <h4 class="w-100 text-center">
                            Información de publicación
                        </h4>
                        <p>
                            <strong>Categoría: </strong
                            >{{ oPublicacion.categoria }}
                        </p>
                        <p>
                            <strong>Moneda: </strong>{{ oPublicacion.moneda }}
                        </p>
                        <p>
                            <strong>Oferta inicial: </strong
                            >{{ oPublicacion.moneda_txt }} {{ getFormatoMoneda(oPublicacion.oferta_inicial) }}
                        </p>
                        <p>
                            <strong>Ubicación: </strong
                            >{{ oPublicacion.ubicacion }}
                        </p>
                        <p>
                            <strong>Observaciones: </strong
                            >{{ oPublicacion.observaciones }}
                        </p>
                        <p>
                            <strong>Fecha y hora límite de subasta: </strong
                            >{{ oPublicacion.fecha_hora_limite }}
                        </p>
                        <p>
                            <strong>Monto de garantía: </strong
                            >{{ oPublicacion.moneda_txt }} {{ getFormatoMoneda(oPublicacion.monto_garantia) }}
                        </p>
                    </form>
                </div>
                <div class="modal-footer">
                    <a
                        href="javascript:;"
                        class="btn btn-white"
                        @click="cerrarDialog()"
                        ><i class="fa fa-times"></i> Cerrar</a
                    >
                    <button
                        v-if="accion == 0"
                        type="button"
                        @click="enviarFormulario()"
                        class="btn btn-success"
                    >
                        <i class="fa fa-check"></i>
                        Habilitar
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped></style>
