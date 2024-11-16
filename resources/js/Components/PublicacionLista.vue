<script setup>
import { ref } from "vue";
import { Link } from "@inertiajs/vue3";

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
        <p class="item-price">Oferta inicial: {{ item.oferta_inicial }}</p>
        <p class="item-desc">Monto garantía: {{ item.monto_garantia }}</p>
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
