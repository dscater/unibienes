<script setup>
import { useForm, usePage, router } from "@inertiajs/vue3";
import { usePublicacions } from "@/composables/publicacions/usePublicacions";
import { watch, ref, computed, defineEmits, onMounted, nextTick } from "vue";
import PublicacionAdmin from "@/Components/PublicacionAdmin.vue";
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
        ? `<i class="fa fa-list-alt"></i> Lista de clientes registrados`
        : `<i class="fa fa-edit"></i> Ver Publicación`;
});

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

const administrarRegistros = () => {
    dialog.value = false;
    document.getElementsByTagName("body")[0].classList.remove("modal-open");
    router.get(route("subastas.clientes", oPublicacion.subasta.id));
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
                <div class="modal-header bg-primary text-white">
                    <h4 class="modal-title" v-html="tituloDialog"></h4>
                    <button
                        type="button"
                        class="btn-close"
                        @click="cerrarDialog()"
                    ></button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nombre Completo</th>
                                <th>Fecha y hora de registro</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr
                                v-for="(item, index) in oPublicacion.subasta
                                    ?.subasta_clientes"
                            >
                                <td>{{ index + 1 }}</td>
                                <td>{{ item.cliente.full_name }}</td>
                                <td>{{ item.fecha_hora_registro }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <a
                        href="javascript:;"
                        class="btn btn-white"
                        @click="cerrarDialog()"
                        ><i class="fa fa-times"></i> Cerrar</a
                    >
                    <button
                        href="javascript:;"
                        class="btn btn-primary"
                        @click="administrarRegistros()"
                    >
                        Administrar registros <i class="fa fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped></style>
