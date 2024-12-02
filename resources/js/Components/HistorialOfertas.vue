<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { watch, ref, computed, defineEmits, onMounted } from "vue";
import { useFormater } from "@/composables/useFormater";
const { getFormatoMoneda } = useFormater();

const props = defineProps({
    open_dialog: {
        type: Boolean,
        default: false,
    },
    hideBg: {
        type: Boolean,
        default: true,
    },
    publicacion_id: {
        type: Number,
        default: 0,
    },
});
const dialog = ref(props.open_dialog);
const id_pub = ref(props.publicacion_id);
const aDetalles = ref([]);
watch(
    () => props.open_dialog,
    async (newValue) => {
        dialog.value = newValue;
        if (dialog.value) {
            getHistorialOfertas();

            document
                .getElementsByTagName("body")[0]
                .classList.add("modal-open");
        }
    }
);
watch(
    () => props.publicacion_id,
    async (newValue) => {
        id_pub.value = newValue;
        getHistorialOfertas();
    }
);

const { flash } = usePage().props;

const tituloDialog = computed(() => {
    return `<i class="fa fa-list"></i> Historial de ofertas`;
});

const emits = defineEmits(["cerrar-dialog"]);

watch(dialog, (newVal) => {
    if (!newVal) {
        emits("cerrar-dialog");
    }
});

const getHistorialOfertas = () => {
    axios
        .get(route("subasta_clientes.historialOfertas"), {
            params: {
                publicacion_id: id_pub.value,
            },
        })
        .then((response) => {
            aDetalles.value = response.data;
        });
};

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
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Monto</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in aDetalles">
                                <td>{{ item.fecha_hora_oferta_t }}</td>
                                <td>{{ getFormatoMoneda(item.puja) }}</td>
                            </tr>
                        </tbody>
                    </table>
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
