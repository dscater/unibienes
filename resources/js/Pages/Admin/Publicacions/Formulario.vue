<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { usePublicacions } from "@/composables/publicacions/usePublicacions";
import { watch, ref, computed, defineEmits, onMounted, nextTick } from "vue";
import MiDropZone from "@/Components/MiDropZone.vue";
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
        ? `<i class="fa fa-plus"></i> Nueva Publicación`
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

const enviarFormulario = () => {
    let url =
        form["_method"] == "POST"
            ? route("publicacions.store")
            : route("publicacions.update", form.id);

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

const detectaArchivos = (files) => {
    form.publicacion_imagens = files;
};

const detectaEliminados = (eliminados) => {
    form.eliminados_imagens = eliminados;
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
        <div class="modal-dialog modal-xl">
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
                    <form @submit.prevent="enviarFormulario()">
                        <div class="row">
                            <div class="col-md-4">
                                <label>Seleccionar categoría*</label>
                                <select
                                    class="form-select"
                                    :class="{
                                        'parsley-error': form.errors?.categoria,
                                    }"
                                    v-model="form.categoria"
                                >
                                    <option value="">- Seleccione -</option>
                                    <option
                                        v-for="item in listCategorias"
                                        :value="item"
                                    >
                                        {{ item }}
                                    </option>
                                </select>
                                <ul
                                    v-if="form.errors?.categoria"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.categoria }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Seleccionar moneda*</label>
                                <select
                                    class="form-select"
                                    :class="{
                                        'parsley-error': form.errors?.moneda,
                                    }"
                                    v-model="form.moneda"
                                >
                                    <option value="">- Seleccione -</option>
                                    <option
                                        v-for="item in listMonedas"
                                        :value="item"
                                    >
                                        {{ item }}
                                    </option>
                                </select>
                                <ul
                                    v-if="form.errors?.moneda"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.moneda }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Oferta inicial*</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors?.oferta_inicial,
                                    }"
                                    v-model="form.oferta_inicial"
                                    step="0.01"
                                />
                                <ul
                                    v-if="form.errors?.oferta_inicial"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.oferta_inicial }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Seleccionar ubicación*</label>
                                <select
                                    class="form-select"
                                    :class="{
                                        'parsley-error': form.errors?.ubicacion,
                                    }"
                                    v-model="form.ubicacion"
                                >
                                    <option value="">- Seleccione -</option>
                                    <option
                                        v-for="item in listUbicacions"
                                        :value="item.value"
                                    >
                                        {{ item.label }}
                                    </option>
                                </select>
                                <ul
                                    v-if="form.errors?.ubicacion"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.ubicacion }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Observaciones</label>
                                <textarea
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors?.observaciones,
                                    }"
                                    v-model="form.observaciones"
                                    rows="2"
                                ></textarea>
                                <ul
                                    v-if="form.errors?.observaciones"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.observaciones }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <label>Fecha y hora límite de subasta*</label>
                                <div class="row">
                                    <div class="col-6">
                                        <input
                                            type="date"
                                            class="form-control"
                                            :class="{
                                                'parsley-error':
                                                    form.errors?.fecha_limite,
                                            }"
                                            v-model="form.fecha_limite"
                                        />
                                        <ul
                                            v-if="form.errors?.fecha_limite"
                                            class="parsley-errors-list filled"
                                        >
                                            <li class="parsley-required">
                                                {{ form.errors?.fecha_limite }}
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-6">
                                        <input
                                            type="time"
                                            class="form-control"
                                            :class="{
                                                'parsley-error':
                                                    form.errors?.hora_limite,
                                            }"
                                            v-model="form.hora_limite"
                                        />
                                        <ul
                                            v-if="form.errors?.hora_limite"
                                            class="parsley-errors-list filled"
                                        >
                                            <li class="parsley-required">
                                                {{ form.errors?.hora_limite }}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Monto de garantía*</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors?.monto_garantia,
                                    }"
                                    v-model="form.monto_garantia"
                                    step="0.01"
                                />
                                <ul
                                    v-if="form.errors?.monto_garantia"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.monto_garantia }}
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <h4 class="w-100 text-center">CARACTERISTICAS</h4>
                            <div class="col-12">
                                <div
                                    class="row mb-2 contenedor_detalle"
                                    v-for="(
                                        item, index
                                    ) in form.publicacion_detalles"
                                >
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <button
                                                type="button"
                                                class="remover"
                                                @click.prevent="
                                                    removerDetalle(index)
                                                "
                                            >
                                                X
                                            </button>
                                            <textarea
                                                type="text"
                                                class="form-control"
                                                placeholder="Caracteristica"
                                                v-model="item.caracteristica"
                                                rows="2"
                                            ></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <textarea
                                            type="text"
                                            class="form-control"
                                            placeholder="Detalle"
                                            v-model="item.detalle"
                                            rows="2"
                                        ></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <button
                                    type="button"
                                    class="btn btn-sm btn-default"
                                    @click.prevent="agregarDetalle"
                                >
                                    <i class="fa fa-plus"></i> Agregar
                                    caracteristica
                                </button>
                            </div>
                            <div class="col-12">
                                <ul
                                    v-if="form.errors?.publicacion_detalles"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.publicacion_detalles }}
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <h4 class="w-100 text-center">IMAGENES</h4>
                            <div class="col-12">
                                <MiDropZone
                                    :files="form.publicacion_imagens"
                                    @UpdateFiles="detectaArchivos"
                                    @addEliminados="detectaEliminados"
                                ></MiDropZone>
                            </div>
                            <div class="col-12">
                                <ul
                                    v-if="form.errors?.publicacion_imagens"
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.publicacion_imagens }}
                                    </li>
                                </ul>
                            </div>
                        </div>
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
                        class="btn btn-primary"
                    >
                        <i class="fa fa-save"></i>
                        Guardar
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
.contenedor_detalle {
    position: relative;
    border-bottom: solid 1px rgb(206, 206, 206);
    padding-top: 10px;
    padding-bottom: 10px;
}
button.remover {
    background-color: red;
    color: white;
    width: 20px;
    height: auto;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px 0px;
    border: none;
}

.contenedor_imagenes .imagen img {
    margin-left: 10px;
}

.contenedor_input_file {
    display: flex;
    height: 100%;
    padding-left: 5px;
    justify-content: center;
    align-items: center;
}

.imagen_detalles {
    max-width: 200px;
}
</style>
