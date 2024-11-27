<script setup>
import { ref } from "vue";
import { Link } from "@inertiajs/vue3";
import { useFormater } from "@/composables/useFormater";
const { getFormatoMoneda } = useFormater();
const props = defineProps({
    publicacion: {
        type: Object,
        default: null,
    },
});

const item = ref(props.publicacion);
</script>
<template>
    <Link
        :href="route('publicacions.publicacionPortal', item.id)"
        class="item-image"
    >
        <img :src="item.publicacion_imagens[0].url_imagen" alt="" />
    </Link>
    <div class="item-info">
        <h4 class="item-title">
            {{ item.ubicacion }}
        </h4>
        <p class="item-price">
            Oferta inicial: {{ getFormatoMoneda(item.oferta_inicial) }}
        </p>
        <p class="item-desc">
            Monto garantía: {{ getFormatoMoneda(item.monto_garantia) }}
        </p>
        <p class="item-desc">
            {{ item.moneda }}
        </p>
        <p class="w-100">
            <Link
                class="btn btn-primary btn-sm"
                :href="route('publicacions.publicacionPortal', item.id)"
            >
                <i class="fa fa-arrow-right"></i>
            </Link>
        </p>
    </div>
</template>
<style scoped>
.item-image {
    min-height: 180px;
    padding: 0px !important;
    width: 100%;
    background-color: blue;
    overflow: hidden;
}

.item-image img {
    border-radius: 3px 3px 0px 0px;
    object-fit: cover;
    height: 100%;
    width: 100%;
}
</style>
