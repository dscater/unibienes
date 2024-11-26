import axios from "axios";
import { onMounted, reactive } from "vue";
import { usePage } from "@inertiajs/vue3";

const oPublicacion = reactive({
    id: 0,
    categoria: "",
    moneda: "",
    oferta_inicial: "",
    ubicacion: "",
    observaciones: "",
    fecha_limite: "",
    hora_limite: "",
    fecha_hora_limite:"",
    monto_garantia: "",
    publicacion_detalles: [],
    publicacion_imagens: [],
    eliminados_detalles: [],
    eliminados_imagens: [],
    _method: "POST",
});

export const usePublicacions = () => {
    const { flash } = usePage().props;
    const getPublicacions = async () => {
        try {
            const response = await axios.get(route("publicacions.listado"), {
                headers: { Accept: "application/json" },
            });
            return response.data.publicacions;
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

    const getPublicacionsApi = async (data) => {
        try {
            const response = await axios.get(
                route("publicacions.paginado", data),
                {
                    headers: { Accept: "application/json" },
                }
            );
            return response.data.publicacions;
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
    const savePublicacion = async (data) => {
        try {
            const response = await axios.post(
                route("publicacions.store", data),
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

    const deletePublicacion = async (id) => {
        try {
            const response = await axios.delete(
                route("publicacions.destroy", id),
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

    const setPublicacion = (item = null) => {
        if (item) {
            oPublicacion.id = item.id;
            oPublicacion.categoria = item.categoria;
            oPublicacion.moneda = item.moneda;
            oPublicacion.oferta_inicial = item.oferta_inicial;
            oPublicacion.ubicacion = item.ubicacion;
            oPublicacion.observaciones = item.observaciones;
            oPublicacion.fecha_limite = item.fecha_limite;
            oPublicacion.hora_limite = item.hora_limite;
            oPublicacion.fecha_hora_limite = item.fecha_hora_limite;
            oPublicacion.fecha_hora_limite_am = item.fecha_hora_limite_am;
            oPublicacion.monto_garantia = item.monto_garantia;
            oPublicacion.publicacion_detalles = item.publicacion_detalles;
            oPublicacion.publicacion_imagens = item.publicacion_imagens;
            oPublicacion._method = "PUT";
            return oPublicacion;
        }
        return false;
    };

    const limpiarPublicacion = () => {
        oPublicacion.id = 0;
        oPublicacion.categoria = "";
        oPublicacion.moneda = "";
        oPublicacion.oferta_inicial = "";
        oPublicacion.ubicacion = "";
        oPublicacion.observaciones = "";
        oPublicacion.fecha_limite = "";
        oPublicacion.hora_limite = "";
        oPublicacion.monto_garantia = "";
        oPublicacion.publicacion_detalles = [];
        oPublicacion.publicacion_imagens = [];
        oPublicacion.eliminados_detalles = [];
        oPublicacion.eliminados_imagens = [];
        oPublicacion._method = "POST";
    };

    onMounted(() => {});

    return {
        oPublicacion,
        getPublicacions,
        getPublicacionsApi,
        savePublicacion,
        deletePublicacion,
        setPublicacion,
        limpiarPublicacion,
    };
};
