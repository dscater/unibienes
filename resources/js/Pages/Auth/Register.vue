<script>
import Login from "@/Layouts/Login.vue";
import { onMounted, ref, computed } from "vue";
export default {
    layout: Login,
};
</script>
<script setup>
import { Head, Link, useForm, usePage } from "@inertiajs/vue3";

import { useConfiguracion } from "@/composables/configuracion/useConfiguracion";
const { props } = usePage();
const { oConfiguracion } = useConfiguracion();
const form = useForm({
    nombre: "",
    paterno: "",
    materno: "",
    ci: "",
    complemento: "",
    ci_exp: "",
    fono: "",
    dpto_residencia: "",
    email: "",
    foto_ci_anverso: "",
    foto_ci_reverso: "",
    banco: "",
    nro_cuenta: "",
    moneda: "",
    password: "",
    password_confirmation: "",
    terminos: false,
});

const errors = ref([]);

const listExpedido = [
    { value: "LP", label: "La Paz" },
    { value: "CB", label: "Cochabamba" },
    { value: "SC", label: "Santa Cruz" },
    { value: "CH", label: "Chuquisaca" },
    { value: "OR", label: "Oruro" },
    { value: "PT", label: "Potosi" },
    { value: "TJ", label: "Tarija" },
    { value: "PD", label: "Pando" },
    { value: "BN", label: "Beni" },
];

const listUbicacions = [
    { value: "LA PAZ", label: "La Paz" },
    { value: "COCHABAMBA", label: "Cochabamba" },
    { value: "SANTA CRUZ", label: "Santa Cruz" },
    { value: "CHUQUISACA", label: "Chuquisaca" },
    { value: "ORURO", label: "Oruro" },
    { value: "POTOSI", label: "Potosi" },
    { value: "TARIJA", label: "Tarija" },
    { value: "PANDO", label: "Pando" },
    { value: "BENI", label: "Beni" },
];

var url_assets = "";
var url_principal = "";

const validando = ref(false);
const validado = ref(false);
const muestraCheck = ref(false);

const validarForm1 = () => {
    validando.value = true;

    axios
        .post(route("registro.validaForm1"), form.data())
        .then((response) => {
            muestraCheck.value = true;
            form.usuario = form.email;
            setTimeout(() => {
                muestraCheck.value = false;
                validando.value = false;
                validado.value = true;
            }, 1500);
        })
        .catch((error) => {
            console.log(error.response);
            if (error.response.data.errors) {
                const errors = error.response.data.errors;
                form.errors = {};
                for (const field in errors) {
                    if (errors.hasOwnProperty(field)) {
                        form.errors[field] = errors[field][0]; // Asignar solo el primer error
                    }
                }
            }
            muestraCheck.value = false;
            validando.value = false;
            validado.value = false;
        });
};

function cargaArchivo(e, key) {
    const file = e.target.files[0];
    if (file) {
        form[key] = file;
    } else {
        form[key] = "";
    }
}

const volverAForm1 = () => {
    muestraCheck.value = false;
    validado.value = false;
};

const txtBtnValidar = computed(() => {
    if (muestraCheck.value) {
        return `Validar <i class="text-success fa fa-check-circle"></i>`;
    }

    if (validando.value) {
        return `Validando <i class="fa fa-spinner fa-spin"></i>`;
    }

    return `Validar <i class="fa fa-check"></i>`;
});

const submit = () => {
    if (validado) {
        form.post(route("register"), {
            onFinish: () => {
                form.reset("password");
                form.reset("password_confirmation");
            },
        });
    }
};

onMounted(() => {
    url_assets = props.url_assets;
    url_principal = props.url_principal;
});
</script>

<template>
    <Head title="Registro"></Head>
    <div class="contenedor_login">
        <div id="app" class="app">
            <div class="login login-v2 fw-bold">
                <div class="login-cover">
                    <div
                        class="login-cover-img"
                        data-id="login-cover-image"
                    ></div>
                    <div class="login-cover-bg"></div>
                </div>
                <div class="login-container">
                    <div class="w-100 text-center">
                        <img
                            :src="oConfiguracion.url_logo"
                            alt="Logo"
                            class="logo_login"
                            lazy
                        />
                    </div>
                    <!-- BEGIN login-header -->
                    <div class="login-header">
                        <div class="brand">
                            <div class="d-flex align-items-center">
                                <b>Registrate</b>
                            </div>
                        </div>
                    </div>
                    <!-- END login-header -->
                    <!-- BEGIN login-content -->
                    <div class="login-content">
                        <form @submit.prevent="submit()">
                            <div class="row" v-show="!validado">
                                <div class="col-12">
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="nombre"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Nombre(s)"
                                            v-model="form.nombre"
                                            autofocus
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Nombre(s)*</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.nombre"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.nombre
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="paterno"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Apellido Paterno"
                                            v-model="form.paterno"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Apellido Paterno*</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.paterno"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.paterno
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="materno"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Apellido Materno"
                                            v-model="form.materno"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Apellido Materno</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.materno"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.materno
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="ci"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Documento de identidad"
                                            v-model="form.ci"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Documento de identidad*</label
                                        >
                                    </div>
                                    <div class="w-100" v-if="form.errors?.ci">
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.ci
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="complemento"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Complemento"
                                            v-model="form.complemento"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Complemento</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.complemento"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.complemento
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <select
                                            name="ci_exp"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Lugar de expedición"
                                            v-model="form.ci_exp"
                                        >
                                            <option value="">
                                                - Seleccione -
                                            </option>
                                            <option
                                                v-for="item in listExpedido"
                                                :value="item.value"
                                            >
                                                {{ item.label }}
                                            </option>
                                        </select>
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Lugar de expedición*</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.ci_exp"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.ci_exp
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="fono"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Número de Celular"
                                            v-model="form.fono"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Número de Celular*</label
                                        >
                                    </div>
                                    <div class="w-100" v-if="form.errors?.fono">
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.fono
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <select
                                            name="dpto_residencia"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Departamento donde recides"
                                            v-model="form.dpto_residencia"
                                        >
                                            <option value="">
                                                - Seleccione -
                                            </option>
                                            <option
                                                v-for="item in listUbicacions"
                                                :value="item.value"
                                            >
                                                {{ item.label }}
                                            </option>
                                        </select>
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Departamento donde recides*</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.dpto_residencia"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.dpto_residencia
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="email"
                                            name="email"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Correo electrónico"
                                            v-model="form.email"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Correo electrónico*</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.email"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.email
                                            }}</strong>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row" v-show="validado">
                                <div class="col-12">
                                    <h4>Datos complementario</h4>
                                    <div class="form-group mb-15px">
                                        <label
                                            class="text-white d-flex align-items-center text-gray-600 fs-13px"
                                            >Foto del C.I. anverso(PDF o
                                            Imagen)*</label
                                        >
                                        <input
                                            type="file"
                                            name="foto_ci_anverso"
                                            class="form-control border-0"
                                            placeholder="Foto del C.I. anverso(PDF o Imagen)"
                                            @change="
                                                cargaArchivo(
                                                    $event,
                                                    'foto_ci_anverso'
                                                )
                                            "
                                        />
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.foto_ci_anverso"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.foto_ci_anverso
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-group mb-20px">
                                        <label
                                            class="text-white d-flex align-items-center text-gray-600 fs-13px"
                                            >Foto del C.I. reverso(PDF o
                                            Imagen)*</label
                                        >
                                        <input
                                            type="file"
                                            name="foto_ci_reverso"
                                            class="form-control border-0"
                                            placeholder="Foto del C.I. reverso (PDF o Imagen)"
                                            @change="
                                                cargaArchivo(
                                                    $event,
                                                    'foto_ci_reverso'
                                                )
                                            "
                                        />
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.foto_ci_reverso"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.foto_ci_reverso
                                            }}</strong>
                                        </span>
                                    </div>
                                    <h4>Datos para devolución</h4>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="banco"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Banco"
                                            v-model="form.banco"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Banco*</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.banco"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.banco
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="nro_cuenta"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Número de cuenta"
                                            v-model="form.nro_cuenta"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Número de cuenta*</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.nro_cuenta"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.nro_cuenta
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="moneda"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Moneda de cuenta Bancaria"
                                            v-model="form.moneda"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Moneda de cuenta Bancaria*</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.moneda"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.moneda
                                            }}</strong>
                                        </span>
                                    </div>
                                    <h4 class="mt-20px">Crea tu usuario</h4>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="text"
                                            name="usuario"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Nombre de usuario"
                                            v-model="form.usuario"
                                            readonly
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Nombre de usuario*</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.usuario"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.usuario
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px">
                                        <input
                                            type="password"
                                            name="password"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Contraseña"
                                            v-model="form.password"
                                            autocomplete="false"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Contraseña</label
                                        >
                                    </div>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.password"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.password
                                            }}</strong>
                                        </span>
                                    </div>
                                    <div class="form-floating mt-20px mb-15px">
                                        <input
                                            type="password"
                                            name="password_confirmation"
                                            class="form-control fs-13px h-45px border-0"
                                            placeholder="Confirmar Contraseña"
                                            v-model="form.password_confirmation"
                                            autocomplete="false"
                                        />
                                        <label
                                            for="name"
                                            class="d-flex align-items-center text-gray-600 fs-13px"
                                            >Confirmar Contraseña</label
                                        >
                                    </div>
                                    <b
                                        ><span class="text-danger">*</span> El
                                        titular de cuenta debe ser quien se
                                        registra en el presente formulario</b
                                    >
                                    <label
                                        for="terminos"
                                        class="d-block mt-15px d-flex align-center gap-1 justify-content-center"
                                    >
                                        <input
                                            type="checkbox"
                                            id="terminos"
                                            v-model="form.terminos"
                                        />
                                        Acepto los
                                        <a href="" class="text-white"
                                            >términos y condiciones</a
                                        >
                                    </label>
                                    <div
                                        class="w-100"
                                        v-if="form.errors?.terminos"
                                    >
                                        <span
                                            class="invalid-feedback alert alert-danger"
                                            style="display: block"
                                            role="alert"
                                        >
                                            <strong>{{
                                                form.errors.terminos
                                            }}</strong>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-15px">
                                <div class="input-group justify-content-center">
                                    <button
                                        v-show="validado"
                                        type="button"
                                        class="btn btn-default h-45px btn-lg"
                                        @click="volverAForm1"
                                    >
                                        <i class="fa fa-arrow-left"></i>
                                    </button>
                                    <button
                                        @click="validarForm1"
                                        v-show="!validado"
                                        type="button"
                                        class="btn btn-theme h-45px btn-lg"
                                        v-html="txtBtnValidar"
                                    ></button>
                                    <button
                                        v-show="validado"
                                        type="submit"
                                        class="btn btn-theme h-45px btn-lg"
                                    >
                                        Registrar
                                    </button>
                                </div>
                            </div>
                            <div class="mt-20px">
                                <Link
                                    :href="route('login')"
                                    class="text-white d-block w-100 text-center"
                                    >Ya tengo una cuenta</Link
                                >
                            </div>
                            <div class="mt-20px mb-20px">
                                <a
                                    :href="route('portal.index')"
                                    class="text-white d-block w-100 text-center"
                                    >Volver al portal</a
                                >
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.contenedor_login {
    justify-content: center;
    width: 100%;
    height: 100%;
}

.logo_login {
    width: 100%;
}

.login-cover .login-cover-bg {
    /* background: linear-gradient(to bottom, #153f59, #94b8d7); */
    background: var(--principal);
}
</style>
