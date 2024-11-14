<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { usePublicacions } from "@/composables/publicacions/usePublicacions";
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

const listCategorias = ["VEHÍCULOS", "OTROS BIENES", "ECOLÓGICO"];
const listMonedas = ["DÓLARES (USD)", "BOLIVIANOS (BS)"];
const listUbicacions = [
    { value: "LA PAZ", label: "La Paz" },
    { value: "COCHABAMBA", label: "Cochabamba" },
    { value: "SANTA CRUZ", label: "Santa Cruz" },
    { value: "CHUQUISACA", label: "Chuquisaca" },
    { value: "ORURO", label: "Oruro" },
    { value: "POTOSI", label: "Potosi" },
    { value: "TARIJA", label: "Tarija" },
    { value: "PANDO", label: "Pando" },
    { value: "BENI", label: "Beni" },
];

const foto = ref(null);

function cargaArchivo(e, index) {
    const file = e.target.files[0];
    form.publicacion_imagens[index]["imagen"] = file;
    if (file) {
        const reader = new FileReader();
        reader.onload = (event) => {
            form.publicacion_imagens[index]["url_imagen"] = event.target.result; // Asignar la URL de la imagen.
        };
        reader.readAsDataURL(file);
    } else {
        form.publicacion_imagens[index]["url_imagen"] = ""; // Restablecer si no hay archivo.
    }
}

const tituloDialog = computed(() => {
    return accion.value == 0
        ? `<i class="fa fa-check-circle"></i> Habilitar publicación`
        : `<i class="fa fa-edit"></i> Editar Publicación`;
});

const agregarDetalle = () => {
    form.publicacion_detalles.push({
        id: 0,
        publicacion_id: 0,
        caracteristica: "",
        detalle: "",
    });
};

const removerDetalle = (index) => {
    let item = form.publicacion_detalles[index];
    if (item.id != 0) {
        form.eliminados_detalles.push(item.id);
    }

    form.publicacion_detalles.splice(index, 1);
};

const agregarImagen = () => {
    form.publicacion_imagens.push({
        id: 0,
        publicacion_id: 0,
        imagen: "",
        url_imagen: "",
    });
};

const removerImagen = (index) => {
    let item = form.publicacion_imagens[index];
    if (item.id != 0) {
        form.eliminados_imagens.push(item.id);
    }

    form.publicacion_imagens.splice(index, 1);
};

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
                        <h5>
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
                            >{{ oPublicacion.oferta_inicial }}
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
                            >{{ oPublicacion.monto_garantia }}
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
