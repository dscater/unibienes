<script setup>
import { usePage, Head, router, Link } from "@inertiajs/vue3";
import { useConfiguracion } from "@/composables/configuracion/useConfiguracion";
const { oConfiguracion } = useConfiguracion();
</script>
<template>
    <!-- BEGIN #footer -->
    <div id="footer" class="footer">
        <!-- BEGIN container -->
        <div class="container">
            <!-- BEGIN row -->
            <div class="row">
                <!-- BEGIN col-3 -->
                <div class="col-lg-3">
                    <img
                        :src="oConfiguracion.url_logo"
                        alt=""
                        class="img_logo"
                    />
                </div>
                <!-- END col-3 -->
                <!-- BEGIN col-3 -->
                <div class="col-lg-3">
                    <h4 class="footer-header">SUBASTAS ELECTRÓNICAS</h4>
                    <ul class="fa-ul mb-lg-4 mb-0 p-0">
                        <li>
                            <i class="fa fa-fw fa-angle-right"></i>
                            <Link
                                class="text-white"
                                :href="route('portal.index')"
                                >Inicio</Link
                            >
                        </li>
                        <li>
                            <i class="fa fa-fw fa-angle-right"></i>
                            <Link
                                class="text-white"
                                :href="route('portal.vehiculos')"
                                >Vehículos</Link
                            >
                        </li>
                        <li>
                            <i class="fa fa-fw fa-angle-right"></i>
                            <Link
                                class="text-white"
                                :href="route('portal.otros_bienes')"
                                >Otros bienes</Link
                            >
                        </li>
                        <li>
                            <i class="fa fa-fw fa-angle-right"></i>
                            <Link
                                class="text-white"
                                :href="route('portal.ecologicos')"
                                >Ecológicos</Link
                            >
                        </li>
                    </ul>
                </div>
                <!-- END col-3 -->
                <!-- BEGIN col-3 -->
                <div class="col-lg-3 pt-5">
                    <h4 class="footer-header">LÍNEA GRATUITA 24/7</h4>
                    <h4 class="footer-header">
                        <i class="fa fa-phone"></i> 800 17 1010
                    </h4>
                </div>
                <!-- END col-3 -->
                <!-- BEGIN col-3 -->
                <div class="col-lg-3">
                    <h4 class="footer-header">ENCUÉNTRANOS</h4>
                    <p class="text-white">
                        <i class="fas fa-map-marker-alt"></i> Calle 10 de
                        Calacoto Edif. Emporium N° 7812, Piso 3 y 5 - Zona Sur -
                        La Paz - Bolivia
                    </p>
                    <h4 class="footer-header">NUESTRAS REDES SOCIALES</h4>
                    <a href="" class="text-white mx-2"
                        ><i class="fab fa-facebook"></i
                    ></a>
                    <a href="" class="text-white mx-2"
                        ><i class="fab fa-instagram"></i
                    ></a>
                    <a href="" class="text-white mx-2"
                        ><i class="fab fa-linkedin"></i
                    ></a>
                    <a href="" class="text-white mx-2"
                        ><i class="fab fa-tiktok"></i
                    ></a>
                    <a href="" class="text-white mx-2"
                        ><i class="fab fa-youtube"></i
                    ></a>
                    <span class="text-white">UNIBIENES S.A.</span>
                </div>
                <!-- END col-3 -->
            </div>
            <!-- END row -->
        </div>
        <!-- END container -->
    </div>
    <!-- END #footer -->
</template>
<style scoped>
.img_logo {
    width: 100%;
}

.footer {
    color: white;
    background-color: var(--principal-portal3);
    box-shadow: none;
}

@media (max-width: 900px) {
    .img_logo {
        width: 100px;
    }
}
</style>
