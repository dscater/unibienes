<script setup>
import { usePage, Head, router, Link } from "@inertiajs/vue3";
import { onMounted, ref } from "vue";
import { useConfiguracion } from "@/composables/configuracion/useConfiguracion";
const { oConfiguracion } = useConfiguracion();

const { props: props_page } = usePage();
const user = ref(props_page.auth?.user);
const url_asset = ref(props_page.url_assets);

const route_current = ref("");

router.on("navigate", (event) => {
    route_current.value = route().current();
});

const logout = () => {
    axios
        .post(route("logout"))
        .then((response) => {
            window.location.reload();
        })
        .catch((error) => {
            console.log(error.response);
        });

    // router.post(route("logout"), {
    //     onFinish: () => {
    //         window.location.reload();
    //     },
    // });
};

var handleHeaderFixedTop = function () {
    if ($('#header[data-fixed-top="true"]').length !== 0) {
        // var headerScrolltop = $('#top-nav').height();
        var headerScrolltop = $("#header").height();
        var targetPaddingTop = $("#header").height();
        $(window).on("scroll", function () {
            if ($(window).scrollTop() >= headerScrolltop) {
                $("body").css("padding-top", targetPaddingTop);
                $("#header").addClass("header-fixed");
            } else {
                $("#header").removeClass("header-fixed");
                $("body").css("padding-top", "0");
            }
        });
    }
};

onMounted(() => {
    handleHeaderFixedTop();
    window.addEventListener("load", () => {
        handleHeaderFixedTop();
    });
});
</script>
<template>
    <Head title="Inicio"></Head>
    <!-- BEGIN #header -->
    <div
        id="header"
        class="header bg-principal text-white"
        data-fixed-top="true"
    >
        <!-- BEGIN container -->
        <div class="container">
            <!-- BEGIN header-container -->
            <div class="header-container">
                <!-- BEGIN navbar-toggle -->
                <button
                    type="button"
                    class="navbar-toggle collapsed text-white"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbar-collapse"
                >
                    <span class="icon-bar text-white"></span>
                    <span class="icon-bar text-white"></span>
                    <span class="icon-bar text-white"></span>
                </button>
                <!-- END navbar-toggle -->
                <!-- BEGIN header-logo -->
                <div class="header-logo">
                    <a :href="route('portal.index')">
                        <img :src="oConfiguracion.url_logo" alt="" />
                        <span
                            class="brand-text ml-1 text-white font-weight-bold"
                            >{{ oConfiguracion.razon_social }}</span
                        >
                    </a>
                </div>
                <!-- END header-logo -->
                <!-- BEGIN header-nav -->
                <div class="header-nav">
                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav justify-content-center text-white">
                            <li
                                :class="[
                                    route_current == 'portal.index'
                                        ? 'active'
                                        : '',
                                ]"
                            >
                                <Link :href="route('portal.index')"
                                    >Inicio</Link
                                >
                            </li>
                            <li
                                :class="[
                                    route_current == 'portal.vehiculos'
                                        ? 'active'
                                        : '',
                                ]"
                            >
                                <Link :href="route('portal.vehiculos')"
                                    >Vehículos</Link
                                >
                            </li>
                            <li
                                :class="[
                                    route_current == 'portal.otros_bienes'
                                        ? 'active'
                                        : '',
                                ]"
                            >
                                <Link :href="route('portal.otros_bienes')"
                                    >Otros bienes</Link
                                >
                            </li>
                            <li
                                :class="[
                                    route_current == 'portal.ecologicos'
                                        ? 'active'
                                        : '',
                                ]"
                            >
                                <Link :href="route('portal.ecologicos')"
                                    >Ecológico</Link
                                >
                            </li>
                            <li
                                v-if="user && user.role_id == 2"
                                :class="[
                                    route_current == 'portal.mis_subastas'
                                        ? 'active'
                                        : '',
                                ]"
                            >
                                <Link :href="route('portal.mis_subastas')"
                                    >Mis subastas</Link
                                >
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- END header-nav -->
                <!-- BEGIN header-nav -->
                <div class="header-nav">
                    <ul class="nav justify-content-end flex-row text-white">
                        <li v-if="!user">
                            <a :href="route('registro')">
                                <i class="fa fa-edit"></i>
                                <span class="d-none d-xl-inline">
                                    Registrate</span
                                >
                            </a>
                        </li>
                        <li v-if="!user">
                            <a :href="route('login')">
                                <i class="fa fa-sign-in"></i>
                                <span class="d-none d-xl-inline"> Acceder</span>
                            </a>
                        </li>
                        <li class="dropdown dropdown-hover" v-if="user">
                            <a href="#" data-bs-toggle="dropdown">
                                <img
                                    :src="user.url_foto"
                                    alt=""
                                    class="user-img"
                                />
                                <span class="d-none d-xl-inline">{{
                                    user.usuario
                                }}</span>
                                <b class="caret"></b>
                                <span class="arrow top"></span>
                            </a>
                            <div class="dropdown-menu">
                                <Link
                                    v-if="user.role_id != 2"
                                    :href="route('profile.edit')"
                                    class="dropdown-item"
                                    href=""
                                    >Perfil</Link
                                >
                                <Link
                                    v-if="user.role_id == 2"
                                    :href="route('profile.profile_cliente')"
                                    class="dropdown-item"
                                    href=""
                                    >Perfil</Link
                                >
                                <a
                                    class="dropdown-item"
                                    href="#"
                                    @click.prevent="logout"
                                    >Cerrar sesión</a
                                >
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- END header-nav -->
            </div>
            <!-- END header-container -->
        </div>
        <!-- END container -->
    </div>
    <!-- END #header -->
</template>
