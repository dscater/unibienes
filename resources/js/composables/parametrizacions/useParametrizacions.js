import axios from "axios";
import { onMounted, ref } from "vue";
import { usePage } from "@inertiajs/vue3";

const oParametrizacion = ref({
    id: 0,
    inactividad_cliente: "",
    tipo_cambio: "",
    servidor_correo: "",
    nro_imagenes_pub: "",
    tiempo_pub: "",
    terminos_condiciones: "",
    o_servidor_correo: {
        host: "",
        puerto: "",
        encriptado: "",
        correo: "",
        nombre: "",
        password: "",
        driver: "",
    },
    _method: "POST",
});

export const useParametrizacions = () => {
    const { flash } = usePage().props;
    const getParametrizacions = async () => {
        try {
            const response = await axios.get(
                route("parametrizacions.listado"),
                {
                    headers: { Accept: "application/json" },
                }
            );
            return response.data.parametrizacions;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const getParametrizacionsApi = async (data) => {
        try {
            const response = await axios.get(
                route("parametrizacions.paginado", data),
                {
                    headers: { Accept: "application/json" },
                }
            );
            return response.data.parametrizacions;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };
    const saveParametrizacion = async (data) => {
        try {
            const response = await axios.post(
                route("parametrizacions.store", data),
                {
                    headers: { Accept: "application/json" },
                }
            );
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const deleteParametrizacion = async (id) => {
        try {
            const response = await axios.delete(
                route("parametrizacions.destroy", id),
                {
                    headers: { Accept: "application/json" },
                }
            );
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const setParametrizacion = (item = null) => {
        if (item) {
            oParametrizacion.value.id = item.id;
            oParametrizacion.value.inactividad_cliente =
                item.inactividad_cliente;
            oParametrizacion.value.tipo_cambio = item.tipo_cambio;
            oParametrizacion.value.servidor_correo = item.servidor_correo;
            oParametrizacion.value.nro_imagenes_pub = item.nro_imagenes_pub;
            oParametrizacion.value.tiempo_pub = item.tiempo_pub;
            oParametrizacion.value.terminos_condiciones =
                item.terminos_condiciones;
            oParametrizacion.value.o_servidor_correo = item.o_servidor_correo;
            oParametrizacion.value._method = "PUT";
            return oParametrizacion;
        }
        return false;
    };

    const limpiarParametrizacion = () => {
        oParametrizacion.value.id = 0;
        oParametrizacion.value.inactividad_cliente = "";
        oParametrizacion.value.tipo_cambio = "";
        oParametrizacion.value.servidor_correo = "";
        oParametrizacion.value.nro_imagenes_pub = "";
        oParametrizacion.value.tiempo_pub = "";
        oParametrizacion.value.terminos_condiciones = "";
        oParametrizacion.value.o_servidor_correo = {
            host: "",
            puerto: "",
            encriptado: "",
            correo: "",
            nombre: "",
            password: "",
            driver: "",
        };
        oParametrizacion.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oParametrizacion,
        getParametrizacions,
        getParametrizacionsApi,
        saveParametrizacion,
        deleteParametrizacion,
        setParametrizacion,
        limpiarParametrizacion,
    };
};
