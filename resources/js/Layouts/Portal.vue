<script setup>
import { ref } from "vue";
import { usePage } from "@inertiajs/vue3";
import Navbar from "./includes_portal/Navbar.vue";
import Footer from "./includes_portal/Footer.vue";
const { props: props_page } = usePage();

const url_asset = ref(props_page.url_assets);
</script>
<template>
    <!-- BEGIN #app -->
    <div id="app" class="fade show">
        <Navbar></Navbar>
        <slot></slot>
        <Footer></Footer>
    </div>
    <!-- END #app -->
</template>
