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
                <div class="col-lg-3 offset-lg-3">
                    <h4 class="footer-header">
                        {{ oConfiguracion.razon_social }}
                    </h4>
                    <img
                        :src="oConfiguracion.url_logo"
                        alt=""
                        class="img_logo"
                    />
                </div>
                <!-- END col-3 -->
                <!-- BEGIN col-3 -->
                <div class="col-lg-3">
                    <h4 class="footer-header">Menú</h4>
                    <ul class="fa-ul mb-lg-4 mb-0 p-0">
                        <li>
                            <i class="fa fa-fw fa-angle-right"></i>
                            <Link :href="route('portal.index')">Inicio</Link>
                        </li>
                        <li>
                            <i class="fa fa-fw fa-angle-right"></i>
                            <a href="#">Vehículos</a>
                        </li>
                        <li>
                            <i class="fa fa-fw fa-angle-right"></i>
                            <a href="#">Otros bienes</a>
                        </li>
                        <li>
                            <i class="fa fa-fw fa-angle-right"></i>
                            <a href="#">Ecológicos</a>
                        </li>
                    </ul>
                </div>
                <!-- END col-3 -->
            </div>
            <!-- END row -->
        </div>
        <!-- END container -->
    </div>
    <!-- END #footer -->

    <!-- BEGIN #footer-copyright -->
    <div id="footer-copyright" class="footer-copyright">
        <!-- BEGIN container -->
        <div class="container">
            <div class="copyright">
                Copyright &copy; {{ new Date().getFullYear() }} . Todos los
                derechos reservados.
            </div>
        </div>
        <!-- END container -->
    </div>
    <!-- END #footer-copyright -->
</template>
<style scoped>
.img_logo {
    width: 100%;
}
</style>
