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
    detalles: {
        type: Array,
        default: [],
    },
    hideBg: {
        type: Boolean,
        default: true,
    },
});

const dialog = ref(props.open_dialog);
const oPublicacion = ref(props.publicacion);
const aDetalles = ref(props.detalles);
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

const { flash } = usePage().props;

const tituloDialog = computed(() => {
    return `<i class="fa fa-list"></i> Detalles de la subasta`;
});

const emits = defineEmits(["cerrar-dialog"]);

watch(dialog, (newVal) => {
    if (!newVal) {
        emits("cerrar-dialog");
    }
});

const cerrarDialog = () => {
    dialog.value = false;
    if (props.hideBg) {
        document.getElementsByTagName("body")[0].classList.remove("modal-open");
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
                    <div class="row">
                        <div class="col-3 font-weight-bold border">MONEDA</div>
                        <div class="col-9 border">
                            {{ oPublicacion.moneda }}
                        </div>
                        <div class="col-3 font-weight-bold border">
                            FECHA LÍMITE PARA REALIZAR OFERTAS/PUJAS
                        </div>
                        <div class="col-9 border">
                            {{ oPublicacion.fecha_hora_limite_am }}
                        </div>
                        <div v-for="item in aDetalles" class="col-12">
                            <div class="row">
                                <div class="col-3 font-weight-bold border">
                                    <p>{{ item.caracteristica }}</p>
                                </div>
                                <div class="col-9 border">
                                    <p>{{ item.detalle }}</p>
                                </div>
                            </div>
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
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
div.col-3 {
    background-color: rgb(250, 250, 250);
    text-align: right;
}
div.col-3,
div.col-9{
    vertical-align: middle;
}

p {
    word-wrap: break-word;
    overflow-wrap: break-word;
    white-space: normal;
    word-break: keep-all;
}
</style>
