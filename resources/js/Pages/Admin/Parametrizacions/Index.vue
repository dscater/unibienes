<script setup>
import App from "@/Layouts/App.vue";
defineOptions({
    layout: App,
});

import { onMounted, ref } from "vue";
// componentes
import { usePage, Head, useForm } from "@inertiajs/vue3";
const props_page = defineProps({
    parametrizacion: {
        type: Object,
        default: null,
    },
});
const { props } = usePage();

let form = null;
const oServidor = ref({
    host: "smtp.hostinger.com",
    puerto: "587",
    encriptado: "tls",
    correo: "",
    nombre: "",
    password: "",
    driver: "smtp",
});
const oDatosbanco = ref({
    titular: "TITULAR",
    banco: "banco",
    nro_cuenta: "111111111",
    qr: "qr.png",
    url_qr: "qr.png",
});

if (props_page.parametrizacion != null) {
    props_page.parametrizacion["_method"] = "put";

    // servidor
    if (props.parametrizacion.servidor_correo) {
        oServidor.value = JSON.parse(props.parametrizacion.servidor_correo);
    }
    props_page.parametrizacion["host"] = oServidor.value.host;
    props_page.parametrizacion["puerto"] = oServidor.value.puerto;
    props_page.parametrizacion["encriptado"] = oServidor.value.encriptado;
    props_page.parametrizacion["correo"] = oServidor.value.correo;
    props_page.parametrizacion["nombre"] = oServidor.value.nombre;
    props_page.parametrizacion["password"] = oServidor.value.password;
    props_page.parametrizacion["driver"] = oServidor.value.driver;

    // banco
    if (props.parametrizacion.datos_banco) {
        oDatosbanco.value = JSON.parse(props.parametrizacion.datos_banco);
    }
    props_page.parametrizacion["titular"] = oDatosbanco.value?.titular;
    props_page.parametrizacion["banco"] = oDatosbanco.value?.banco;
    props_page.parametrizacion["nro_cuenta"] = oDatosbanco.value?.nro_cuenta;
    props_page.parametrizacion["qr"] = oDatosbanco.value?.qr;
    form = useForm(props_page.parametrizacion);
} else {
    form = useForm({
        _method: "put",
        id: 0,
        inactividad_cliente: "",
        tipo_cambio: "",
        host: "smtp.hostinger.com",
        puerto: "587",
        encriptado: "tls",
        correo: "",
        nombre: "",
        password: "",
        driver: "smtp",
        nro_imagenes_pub: "",
        tiempo_pub: "",
        terminos_condiciones: "",
        titular: "TITULAR",
        banco: "BANCO",
        nro_cuenta: "11111",
        qr: "",
        url_: "",
    });
}

const enviarFormulario = () => {
    form.post(route("parametrizacions.update"), {
        onSuccess: () => {
            // Mostrar mensaje de éxito
            console.log("correcto");
            limpiaRefs();
            file_qr.value.value = null;
            Swal.fire({
                icon: "success",
                title: "Correcto",
                html: `<strong>Proceso realizado con éxito</strong>`,
                showCancelButton: false,
                confirmButtonColor: "#056ee9",
                confirmButtonText: "Aceptar",
            });
        },
        onError: (err, code) => {
            console.log(err);
            console.log(err.response);
            console.log("error");
        },
    });
};
const logo = ref(null);
const file_qr = ref(null);
function cargaArchivo(e, key) {
    form[key] = null;
    form[key] = e.target.files[0];

    // Generar la URL del archivo cargado
    const fileUrl = URL.createObjectURL(form[key]);
    form["url_" + key] = fileUrl;
}
function limpiaRefs() {
    logo.value = null;
}
onMounted(() => {});
</script>
<template>
    <Head title="Parametrización"></Head>
    <h3 class="text-center text-h4">PARAMETRIZACIÓN</h3>
    <div class="row">
        <form @submit.prevent="enviarFormulario()">
            <div class="col-12">
                <div class="row">
                    <div class="col-md-4 form-group mb-3">
                        <label for=""
                            >Tiempo de Inactividad de cuenta de usuario
                            cliente(años)*</label
                        >
                        <input
                            type="number"
                            class="form-control"
                            step="1"
                            v-model="form.inactividad_cliente"
                        />
                        <span
                            class="text-danger"
                            v-if="form.errors?.inactividad_cliente"
                            >{{ form.errors.inactividad_cliente }}</span
                        >
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Tipo de cambio de moneda*</label>
                        <input
                            type="number"
                            class="form-control"
                            v-model="form.tipo_cambio"
                            step="0.01"
                        />
                        <span
                            class="text-danger"
                            v-if="form.errors?.tipo_cambio"
                            >{{ form.errors.tipo_cambio }}</span
                        >
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Cantidad imágenes de publicación*</label>
                        <input
                            type="number"
                            class="form-control"
                            v-model="form.nro_imagenes_pub"
                            step="1"
                        />
                        <span
                            class="text-danger"
                            v-if="form.errors?.nro_imagenes_pub"
                            >{{ form.errors.nro_imagenes_pub }}</span
                        >
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for=""
                            >Tiempo de Publicación después de cierre de subasta
                            (dias)*</label
                        >
                        <input
                            type="number"
                            class="form-control"
                            v-model="form.tiempo_pub"
                            step="1"
                        />
                        <span
                            class="text-danger"
                            v-if="form.errors?.tiempo_pub"
                            >{{ form.errors.tiempo_pub }}</span
                        >
                    </div>
                </div>
                <div class="row">
                    <h5>Servidor de correos</h5>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Host*</label>
                        <input class="form-control" v-model="form.host" />
                        <span class="text-danger" v-if="form.errors?.host">{{
                            form.errors.host
                        }}</span>
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Puerto*</label>
                        <input class="form-control" v-model="form.puerto" />
                        <span class="text-danger" v-if="form.errors?.puerto">{{
                            form.errors.puerto
                        }}</span>
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Encriptado*</label>
                        <input class="form-control" v-model="form.encriptado" />
                        <span
                            class="text-danger"
                            v-if="form.errors?.encriptado"
                            >{{ form.errors.encriptado }}</span
                        >
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Correo*</label>
                        <input class="form-control" v-model="form.correo" />
                        <span class="text-danger" v-if="form.errors?.correo">{{
                            form.errors.correo
                        }}</span>
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Nombre*</label>
                        <input class="form-control" v-model="form.nombre" />
                        <span class="text-danger" v-if="form.errors?.nombre">{{
                            form.errors.nombre
                        }}</span>
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Password*</label>
                        <input class="form-control" v-model="form.password" />
                        <span
                            class="text-danger"
                            v-if="form.errors?.password"
                            >{{ form.errors.password }}</span
                        >
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Driver*</label>
                        <input class="form-control" v-model="form.driver" />
                        <span class="text-danger" v-if="form.errors?.driver">{{
                            form.errors.driver
                        }}</span>
                    </div>
                </div>
                <div class="row">
                    <h5>Datos para el depósito de garantías</h5>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Titular*</label>
                        <input class="form-control" v-model="form.titular" />
                        <span class="text-danger" v-if="form.errors?.titular">{{
                            form.errors.titular
                        }}</span>
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Banco*</label>
                        <input class="form-control" v-model="form.banco" />
                        <span class="text-danger" v-if="form.errors?.banco">{{
                            form.errors.banco
                        }}</span>
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">Nro. de cuenta*</label>
                        <input class="form-control" v-model="form.nro_cuenta" />
                        <span
                            class="text-danger"
                            v-if="form.errors?.nro_cuenta"
                            >{{ form.errors.nro_cuenta }}</span
                        >
                    </div>
                    <div class="col-md-4 form-group mb-3">
                        <label for="">QR*</label>
                        <input
                            type="file"
                            class="form-control"
                            ref="file_qr"
                            @change="cargaArchivo($event, 'qr')"
                        />
                        <span class="text-danger" v-if="form.errors?.qr">{{
                            form.errors.qr
                        }}</span>
                        <img :src="form.url_qr" alt="" class="img_qr" />
                    </div>
                </div>
                <div class="col-md-12 form-group mb-3">
                    <label for="">Terminos y condiciones*</label>
                    <textarea
                        class="form-control"
                        v-model="form.terminos_condiciones"
                    ></textarea>
                    <span
                        class="text-danger"
                        v-if="form.errors?.terminos_condiciones"
                        >{{ form.errors.terminos_condiciones }}</span
                    >
                </div>
            </div>
            <div
                class="col-12"
                v-if="
                    props.auth.user.permisos == '*' ||
                    props.auth.user.permisos.includes('parametrizacion.edit')
                "
            >
                <button type="submit" class="btn btn-primary">
                    Guardar cambios
                </button>
            </div>
        </form>
    </div>
</template>
<style scoped>
.logo_muestra {
    margin-top: 10px;
    width: 100%;
    text-align: center;
}
.logo_muestra img {
    max-width: 100%;
}

.img_qr {
    max-width: 180px;
}
</style>
