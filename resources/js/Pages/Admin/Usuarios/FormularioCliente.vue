<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { useUsuarios } from "@/composables/usuarios/useUsuarios";
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

const { oUsuario, limpiarUsuario } = useUsuarios();
const accion = ref(props.accion_dialog);
const dialog = ref(props.open_dialog);
let form = useForm(oUsuario.value);
watch(
    () => props.open_dialog,
    async (newValue) => {
        dialog.value = newValue;
        if (dialog.value) {
            document
                .getElementsByTagName("body")[0]
                .classList.add("modal-open");
            form = useForm(oUsuario.value);
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

const listExpedido = [
    { value: "LP", label: "La Paz" },
    { value: "CB", label: "Cochabamba" },
    { value: "SC", label: "Santa Cruz" },
    { value: "CH", label: "Chuquisaca" },
    { value: "OR", label: "Oruro" },
    { value: "PT", label: "Potosi" },
    { value: "TJ", label: "Tarija" },
    { value: "PD", label: "Pando" },
    { value: "BN", label: "Beni" },
];
const foto_ci_anverso = ref(null);
const foto_ci_reverso = ref(null);

function cargaArchivo(e, key) {
    form.cliente[key] = null;
    form.cliente[key] = e.target.files[0];
}

const tituloDialog = computed(() => {
    return accion.value == 0
        ? `<i class="fa fa-plus"></i> Nuevo Usuario`
        : `<i class="fa fa-edit"></i> Editar Usuario`;
});

const enviarFormulario = () => {
    let url =
        form["_method"] == "POST"
            ? route("usuarios.store")
            : route("clientes.update", form.cliente.id);

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
            limpiarUsuario();
            foto_ci_anverso.value.value = null;
            foto_ci_reverso.value.value = null;
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
                <div class="modal-body" v-if="form.cliente">
                    <form @submit.prevent="enviarFormulario()">
                        <div class="row">
                            <div class="col-md-4">
                                <label>Nombre(s)*</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors &&
                                            form.errors['cliente.nombre'],
                                    }"
                                    v-model="form.cliente.nombre"
                                />
                                <ul
                                    v-if="
                                        form.errors &&
                                        form.errors['cliente.nombre']
                                    "
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors["cliente.nombre"] }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4 mt-2">
                                <label>Ap. Paterno*</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors &&
                                            form.errors['cliente.paterno'],
                                    }"
                                    v-model="form.cliente.paterno"
                                />

                                <ul
                                    v-if="
                                        form.errors &&
                                        form.errors['cliente.paterno']
                                    "
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors["cliente.paterno"] }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4 mt-2">
                                <label>Ap. Materno</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors &&
                                            form.errors['cliente.materno'],
                                    }"
                                    v-model="form.cliente.materno"
                                />

                                <ul
                                    v-if="
                                        form.errors &&
                                        form.errors['cliente.materno']
                                    "
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors["cliente.materno"] }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4 mt-2">
                                <label>C.I.*</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors &&
                                            form.errors['cliente.ci'],
                                    }"
                                    v-model="form.cliente.ci"
                                />

                                <ul
                                    v-if="
                                        form.errors && form.errors['cliente.ci']
                                    "
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors["cliente.ci"] }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4 mt-2">
                                <label>Expedición*</label>
                                <select
                                    class="form-select"
                                    :class="{
                                        'parsley-error':
                                            form.errors &&
                                            form.errors['cliente.ci_exp'],
                                    }"
                                    v-model="form.cliente.ci_exp"
                                >
                                    <option value="">- Seleccione -</option>
                                    <option
                                        v-for="item in listExpedido"
                                        :value="item.value"
                                    >
                                        {{ item.label }}
                                    </option>
                                </select>

                                <ul
                                    v-if="
                                        form.errors &&
                                        form.errors['cliente.ci_exp']
                                    "
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors["cliente.ci_exp"] }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4 mt-2">
                                <label>Complemento</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors &&
                                            form.errors['cliente.complemento'],
                                    }"
                                    v-model="form.cliente.complemento"
                                />

                                <ul
                                    v-if="
                                        form.errors &&
                                        form.errors['cliente.complemento']
                                    "
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors["cliente.complemento"] }}
                                    </li>
                                </ul>
                            </div>

                            <div class="col-12 mt-3">
                                <h4>Datos complementarios</h4>
                            </div>
                            <div class="col-md-4 mb-2">
                                <label
                                    >Foto del C.I. anverso(PDF o Imagen)*</label
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors &&
                                            form.errors[
                                                'cliente.foto_ci_anverso'
                                            ],
                                    }"
                                    ref="foto_ci_anverso"
                                    @change="
                                        cargaArchivo($event, 'foto_ci_anverso')
                                    "
                                />

                                <ul
                                    v-if="
                                        form.errors &&
                                        form.errors['cliente.foto_ci_anverso']
                                    "
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{
                                            form.errors[
                                                "cliente.foto_ci_anverso"
                                            ]
                                        }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4 mb-2">
                                <label
                                    >Foto del C.I. reverso(PDF o Imagen)*</label
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{
                                        'parsley-error':
                                            form.errors &&
                                            form.errors[
                                                'cliente.foto_ci_reverso'
                                            ],
                                    }"
                                    ref="foto_ci_reverso"
                                    @change="
                                        cargaArchivo($event, 'foto_ci_reverso')
                                    "
                                />

                                <ul
                                    v-if="
                                        form.errors &&
                                        form.errors['cliente.foto_ci_reverso']
                                    "
                                    class="parsley-errors-list filled"
                                >
                                    <li class="parsley-required">
                                        {{
                                            form.errors[
                                                "cliente.foto_ci_reverso"
                                            ]
                                        }}
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
