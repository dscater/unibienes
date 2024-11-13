-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-11-2024 a las 20:55:49
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `unibienes_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci_exp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dpto_residencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_ci_anverso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_ci_reverso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banco` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nro_cuenta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moneda` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `user_id`, `nombre`, `paterno`, `materno`, `ci`, `complemento`, `ci_exp`, `fono`, `dpto_residencia`, `email`, `foto_ci_anverso`, `foto_ci_reverso`, `banco`, `nro_cuenta`, `moneda`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 3, 'CARLOS', 'MARTINES', 'CHOQUE', '1234567', '', 'LP', '7777777', 'LA PAZ', 'carlos@gmail.com', '131731515614.png', '131731515614.jpg', 'BANCO UNIÓN', '100000121212', 'BOLIVIANOS', '2024-11-13', '2024-11-13 20:33:34', '2024-11-13 20:33:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `razon_social`, `alias`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'UNIBIENES S.A.', 'UB', 'logo.png', '2024-11-09 18:47:19', '2024-11-09 18:47:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 2<br/>nombre: CLIENTE<br/>permisos: 0<br/>created_at: 2024-11-09 14:49:17<br/>updated_at: 2024-11-09 14:49:17<br/>', NULL, 'ROLES', '2024-11-09', '14:49:17', '2024-11-09 18:49:17', '2024-11-09 18:49:17'),
(2, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 3<br/>nombre: SUBASTADOR<br/>permisos: 0<br/>created_at: 2024-11-09 14:49:25<br/>updated_at: 2024-11-09 14:49:25<br/>', NULL, 'ROLES', '2024-11-09', '14:49:25', '2024-11-09 18:49:25', '2024-11-09 18:49:25'),
(3, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 2<br/>usuario: <br/>nombres: JUAN<br/>apellidos: PERES<br/>password: $2y$12$YxC5k7RWd3YQ5YJDQpLIqObcSLUq9dFp4F06lUCP6jNLlQHnFFoWG<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:52:30<br/>updated_at: 2024-11-11 18:52:30<br/>', NULL, 'USUARIOS', '2024-11-11', '18:52:30', '2024-11-11 22:52:30', '2024-11-11 22:52:30'),
(4, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$LnOBPoS4tX9dOqqNCGBqxe.8ARCSLww1RORqJIbD17cmiBA8pndpq<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:53:46<br/>', NULL, 'USUARIOS', '2024-11-11', '18:53:46', '2024-11-11 22:53:46', '2024-11-11 22:53:46'),
(5, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$LnOBPoS4tX9dOqqNCGBqxe.8ARCSLww1RORqJIbD17cmiBA8pndpq<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:53:46<br/>', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$LnOBPoS4tX9dOqqNCGBqxe.8ARCSLww1RORqJIbD17cmiBA8pndpq<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:53:46<br/>', 'USUARIOS', '2024-11-11', '18:57:41', '2024-11-11 22:57:41', '2024-11-11 22:57:41'),
(6, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$LnOBPoS4tX9dOqqNCGBqxe.8ARCSLww1RORqJIbD17cmiBA8pndpq<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:53:46<br/>', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$LnOBPoS4tX9dOqqNCGBqxe.8ARCSLww1RORqJIbD17cmiBA8pndpq<br/>role_id: 3<br/>acceso: 0<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:57:46<br/>', 'USUARIOS', '2024-11-11', '18:57:46', '2024-11-11 22:57:46', '2024-11-11 22:57:46'),
(7, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$LnOBPoS4tX9dOqqNCGBqxe.8ARCSLww1RORqJIbD17cmiBA8pndpq<br/>role_id: 3<br/>acceso: 0<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:57:46<br/>', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$LnOBPoS4tX9dOqqNCGBqxe.8ARCSLww1RORqJIbD17cmiBA8pndpq<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:57:49<br/>', 'USUARIOS', '2024-11-11', '18:57:49', '2024-11-11 22:57:49', '2024-11-11 22:57:49'),
(8, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 3<br/>usuario: MCORTEZ<br/>nombres: MARIA<br/>apellidos: CORTEZ<br/>password: $2y$12$PrR22gifVFrrbSlFA7llQO/fHMXd44rsRNmnXHSw3l3HXlgpuhOxy<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:58:08<br/>updated_at: 2024-11-11 18:58:08<br/>', NULL, 'USUARIOS', '2024-11-11', '18:58:08', '2024-11-11 22:58:08', '2024-11-11 22:58:08'),
(9, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$LnOBPoS4tX9dOqqNCGBqxe.8ARCSLww1RORqJIbD17cmiBA8pndpq<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:57:49<br/>', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$WZgVRPmi0Kk2Oaayiyx2iuJ6N/903xLpnDAWle/AgR0oAXQaiSSAa<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:58:47<br/>', 'USUARIOS', '2024-11-11', '18:58:47', '2024-11-11 22:58:47', '2024-11-11 22:58:47'),
(10, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$WZgVRPmi0Kk2Oaayiyx2iuJ6N/903xLpnDAWle/AgR0oAXQaiSSAa<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:58:47<br/>', 'id: 2<br/>usuario: JPERES<br/>nombres: JUAN<br/>apellidos: PERES MAMANI<br/>password: $2y$12$r4ihm1arJYR1tBZWhM6emeLXy1ZOOSGQiss1N9XPiVSn.pk6d9uGi<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:53:46<br/>updated_at: 2024-11-11 18:59:01<br/>', 'USUARIOS', '2024-11-11', '18:59:01', '2024-11-11 22:59:01', '2024-11-11 22:59:01'),
(11, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN USUARIO', 'id: 3<br/>usuario: MCORTEZ<br/>nombres: MARIA<br/>apellidos: CORTEZ<br/>password: $2y$12$PrR22gifVFrrbSlFA7llQO/fHMXd44rsRNmnXHSw3l3HXlgpuhOxy<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-11<br/>created_at: 2024-11-11 18:58:08<br/>updated_at: 2024-11-11 18:58:08<br/>', NULL, 'USUARIOS', '2024-11-11', '18:59:56', '2024-11-11 22:59:56', '2024-11-11 22:59:56'),
(12, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PUBLICACIÓN', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000<br/>ubicacion: LA PAZ<br/>observaciones: observaciones publicacion uno<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00<br/>monto_garantia: 600<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:47:31<br/>', NULL, 'PUBLICACIONES', '2024-11-12', '23:47:31', '2024-11-13 03:47:31', '2024-11-13 03:47:31'),
(13, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: observaciones publicacion uno<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:47:31<br/>', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'PUBLICACIONES', '2024-11-12', '23:56:49', '2024-11-13 03:56:49', '2024-11-13 03:56:49'),
(14, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'PUBLICACIONES', '2024-11-12', '23:57:11', '2024-11-13 03:57:11', '2024-11-13 03:57:11'),
(15, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'PUBLICACIONES', '2024-11-12', '23:58:56', '2024-11-13 03:58:56', '2024-11-13 03:58:56'),
(16, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'PUBLICACIONES', '2024-11-12', '23:59:15', '2024-11-13 03:59:15', '2024-11-13 03:59:15'),
(17, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'PUBLICACIONES', '2024-11-13', '00:01:12', '2024-11-13 04:01:12', '2024-11-13 04:01:12'),
(18, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'PUBLICACIONES', '2024-11-13', '00:01:24', '2024-11-13 04:01:24', '2024-11-13 04:01:24'),
(19, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PUBLICACIÓN', 'id: 4<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 20000<br/>ubicacion: LA PAZ<br/>observaciones: OBS. PUBLICACION<br/>fecha_limite: 2024-11-20<br/>hora_limite: 10:00<br/>monto_garantia: 10000<br/>created_at: 2024-11-13 14:32:59<br/>updated_at: 2024-11-13 14:32:59<br/>', NULL, 'PUBLICACIONES', '2024-11-13', '14:32:59', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(20, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 4<br/>usuario: APAREDES<br/>nombres: ALBERTO<br/>apellidos: PAREDES<br/>password: $2y$12$NSeoWEEWnGVX75lEk0EfoeRLO5IKrh7AdXhfxFHMjwz6zzaMG2ISu<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 18:13:05<br/>updated_at: 2024-11-13 18:13:05<br/>', NULL, 'USUARIOS', '2024-11-13', '18:13:05', '2024-11-13 22:13:05', '2024-11-13 22:13:05'),
(21, 4, 'CREACIÓN', 'EL USUARIO APAREDES REGISTRO UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-11-20<br/>hora_limite: 12:00<br/>monto_garantia: 1000<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-11-13 18:15:26<br/>', NULL, 'PUBLICACIONES', '2024-11-13', '18:15:26', '2024-11-13 22:15:26', '2024-11-13 22:15:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2024_01_31_165641_create_configuracions_table', 1),
(15, '2024_11_02_153309_create_roles_table', 1),
(16, '2024_11_02_153315_create_modulos_table', 1),
(17, '2024_11_02_153316_create_permisos_table', 1),
(18, '2024_11_02_153317_create_users_table', 1),
(19, '2024_11_02_153318_create_historial_accions_table', 1),
(20, '2024_11_02_153653_create_parametrizacions_table', 1),
(21, '2024_11_02_153834_create_clientes_table', 1),
(22, '2024_11_02_154016_create_publicacions_table', 1),
(23, '2024_11_02_154050_create_publicacion_imagens_table', 1),
(24, '2024_11_02_154054_create_publicacion_detalles_table', 1),
(25, '2024_11_04_143215_create_subastas_table', 1),
(26, '2024_11_04_143347_create_subasta_clientes_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` bigint UNSIGNED NOT NULL,
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `modulo`, `nombre`, `accion`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Parametrización', 'parametrizacion.index', 'VER', 'VER DATOS DE PARAMETRIZACIÓN', '2024-11-09 19:51:26', '2024-11-09 19:51:26'),
(2, 'Parametrización', 'parametrizacion.edit', 'EDITAR', 'EDITAR DATOS DE PARAMETRIZACIÓN', '2024-11-09 19:51:26', '2024-11-09 19:51:26'),
(3, 'Gestión de usuarios', 'usuarios.index', 'VER', 'VER LA LISTA DE USUARIOS', '2024-11-09 19:51:26', '2024-11-09 19:51:26'),
(4, 'Gestión de usuarios', 'usuarios.create', 'CREAR', 'CREAR USUARIOS', '2024-11-09 19:51:26', '2024-11-09 19:51:26'),
(5, 'Gestión de usuarios', 'usuarios.edit', 'EDITAR', 'EDITAR USUARIOS', '2024-11-09 19:51:26', '2024-11-09 19:51:26'),
(6, 'Gestión de usuarios', 'usuarios.destroy', 'ELIMINAR', 'ELIMINAR USUARIOS', '2024-11-09 19:51:26', '2024-11-09 19:51:26'),
(7, 'Roles y Permisos', 'roles.index', 'VER', 'VER LA LISTA DE ROLES Y PERMISOS', '2024-11-09 19:51:26', '2024-11-09 19:51:26'),
(8, 'Roles y Permisos', 'roles.create', 'CREAR', 'CREAR ROLES Y PERMISOS', '2024-11-09 19:51:27', '2024-11-09 19:51:27'),
(9, 'Roles y Permisos', 'roles.edit', 'EDITAR', 'EDITAR ROLES Y PERMISOS', '2024-11-09 19:51:27', '2024-11-09 19:51:27'),
(10, 'Roles y Permisos', 'roles.destroy', 'ELIMINAR', 'ELIMINAR ROLES Y PERMISOS', '2024-11-09 19:51:27', '2024-11-09 19:51:27'),
(11, 'Configuración', 'configuracions.index', 'VER', 'VER INFORMACIÓN DE LA CONFIGURACIÓN DEL SISTEMA', '2024-11-09 19:51:27', '2024-11-09 19:51:27'),
(12, 'Configuración', 'configuracions.edit', 'EDITAR', 'EDITAR LA CONFIGURACIÓN DEL SISTEMA', '2024-11-09 19:51:27', '2024-11-09 19:51:27'),
(13, 'Publicaciones', 'publicacions.index', 'VER', 'VER LA LISTA DE PUBLICACIONES', '2024-11-09 19:51:27', '2024-11-09 19:51:27'),
(14, 'Publicaciones', 'publicacions.create', 'CREAR', 'CREAR PUBLICACIONES', '2024-11-09 19:51:27', '2024-11-09 19:51:27'),
(15, 'Publicaciones', 'publicacions.edit', 'EDITAR', 'EDITAR PUBLICACIONES', '2024-11-09 19:51:27', '2024-11-09 19:51:27'),
(16, 'Publicaciones', 'publicacions.destroy', 'ELIMINAR', 'ELIMINAR PUBLICACIONES', '2024-11-09 19:51:27', '2024-11-09 19:51:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametrizacions`
--

CREATE TABLE `parametrizacions` (
  `id` bigint UNSIGNED NOT NULL,
  `inactividad_cliente` int NOT NULL,
  `tipo_cambio` decimal(24,2) NOT NULL,
  `servidor_correo` json NOT NULL,
  `nro_imagenes_pub` int NOT NULL,
  `tiempo_pub` int NOT NULL,
  `terminos_condiciones` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `modulo_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `role_id`, `modulo_id`, `created_at`, `updated_at`) VALUES
(1, 3, 13, '2024-11-09 20:42:05', '2024-11-09 20:42:05'),
(2, 3, 14, '2024-11-09 20:42:06', '2024-11-09 20:42:06'),
(3, 3, 15, '2024-11-09 20:42:07', '2024-11-09 20:42:07'),
(4, 3, 16, '2024-11-09 20:42:07', '2024-11-09 20:42:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacions`
--

CREATE TABLE `publicacions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `categoria` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moneda` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oferta_inicial` decimal(24,2) NOT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_limite` date NOT NULL,
  `hora_limite` time NOT NULL,
  `monto_garantia` decimal(24,2) NOT NULL,
  `estado_sub` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publicacions`
--

INSERT INTO `publicacions` (`id`, `user_id`, `categoria`, `moneda`, `oferta_inicial`, `ubicacion`, `observaciones`, `fecha_limite`, `hora_limite`, `monto_garantia`, `estado_sub`, `created_at`, `updated_at`) VALUES
(3, 2, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 1000.00, 'LA PAZ', 'OBSERVACIONES PUBLICACION UNO', '2024-12-20', '10:00:00', 600.00, 0, '2024-11-13 03:47:31', '2024-11-13 03:56:49'),
(4, 2, 'OTROS BIENES', 'DÓLARES (USD)', 20000.00, 'LA PAZ', 'OBS. PUBLICACION', '2024-11-20', '10:00:00', 10000.00, 0, '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(5, 4, 'VEHÍCULOS', 'DÓLARES (USD)', 8000.00, 'COCHABAMBA', 'OBS. VEHICULO', '2024-11-20', '12:00:00', 1000.00, 0, '2024-11-13 22:15:26', '2024-11-13 22:15:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion_detalles`
--

CREATE TABLE `publicacion_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `publicacion_id` bigint UNSIGNED NOT NULL,
  `caracteristica` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publicacion_detalles`
--

INSERT INTO `publicacion_detalles` (`id`, `publicacion_id`, `caracteristica`, `detalle`, `created_at`, `updated_at`) VALUES
(7, 3, 'CARACTERISTICA UNO', 'DETALLE UNO', '2024-11-13 03:47:31', '2024-11-13 03:56:49'),
(8, 3, 'CARACTERISTICA DOS', 'DETALLE DOS', '2024-11-13 03:47:31', '2024-11-13 03:56:49'),
(9, 3, 'CARACTERISTICA TRES', 'DETALLE TRES', '2024-11-13 03:47:31', '2024-11-13 03:56:49'),
(10, 4, 'TAMAÑO TERRENO', '900 M2', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(11, 4, 'DIRECCION', 'ZONA LOS OLIVOS', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(12, 4, 'CARACTESITICA3', 'DETALLE 3', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(13, 5, 'CARACTERISTICA1', 'DETALLE1', '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(14, 5, 'CARACTERISTICA2', 'DETALLE2', '2024-11-13 22:15:26', '2024-11-13 22:15:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion_imagens`
--

CREATE TABLE `publicacion_imagens` (
  `id` bigint UNSIGNED NOT NULL,
  `publicacion_id` bigint UNSIGNED NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publicacion_imagens`
--

INSERT INTO `publicacion_imagens` (`id`, `publicacion_id`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 3, '01731455251.png', '2024-11-13 03:47:31', '2024-11-13 03:47:31'),
(5, 3, '31731455936.jpg', '2024-11-13 03:57:11', '2024-11-13 03:58:56'),
(6, 3, '21731456084.jpg', '2024-11-13 03:59:15', '2024-11-13 04:01:24'),
(7, 4, '01731508379.jpg', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(8, 4, '11731508379.jpeg', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(9, 4, '21731508379.jpeg', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(10, 5, '01731521726.jpeg', '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(11, 5, '11731521726.webp', '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(12, 5, '21731521726.jpeg', '2024-11-13 22:15:26', '2024-11-13 22:15:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permisos` int NOT NULL DEFAULT '0',
  `usuarios` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `permisos`, `usuarios`, `created_at`, `updated_at`) VALUES
(1, 'SUPER USUARIO', 1, 0, '2024-11-09 18:47:19', '2024-11-09 18:47:19'),
(2, 'CLIENTE', 0, 0, '2024-11-09 18:49:17', '2024-11-09 18:49:17'),
(3, 'SUBASTADOR', 0, 1, '2024-11-09 18:49:25', '2024-11-09 18:49:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subastas`
--

CREATE TABLE `subastas` (
  `id` bigint UNSIGNED NOT NULL,
  `publicacion_id` bigint UNSIGNED NOT NULL,
  `estado` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subasta_clientes`
--

CREATE TABLE `subasta_clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `subasta_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `garantia` int NOT NULL,
  `puja` decimal(8,2) NOT NULL,
  `comprobante` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `acceso` int NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombres`, `apellidos`, `password`, `role_id`, `acceso`, `foto`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 1, 1, NULL, '2024-11-09', '2024-11-09 18:47:19', '2024-11-09 18:47:19'),
(2, 'JPERES', 'JUAN', 'PERES MAMANI', '$2y$12$r4ihm1arJYR1tBZWhM6emeLXy1ZOOSGQiss1N9XPiVSn.pk6d9uGi', 3, 1, NULL, '2024-11-11', '2024-11-11 22:53:46', '2024-11-11 22:59:01'),
(3, 'carlos@gmail.com', 'CARLOS', 'MARTINES CHOQUE', '$2y$12$2Ta3YiC1ZUWeQpT8wgA0OeqOnhVfpoFVIapyquf1VBlDX/sqaPFAS', 2, 1, NULL, '2024-11-13', '2024-11-13 20:33:34', '2024-11-13 20:33:34'),
(4, 'APAREDES', 'ALBERTO', 'PAREDES', '$2y$12$NSeoWEEWnGVX75lEk0EfoeRLO5IKrh7AdXhfxFHMjwz6zzaMG2ISu', 3, 1, NULL, '2024-11-13', '2024-11-13 22:13:05', '2024-11-13 22:13:05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_accions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permisos_role_id_foreign` (`role_id`),
  ADD KEY `permisos_modulo_id_foreign` (`modulo_id`);

--
-- Indices de la tabla `publicacions`
--
ALTER TABLE `publicacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publicacions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `publicacion_detalles`
--
ALTER TABLE `publicacion_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publicacion_detalles_publicacion_id_foreign` (`publicacion_id`);

--
-- Indices de la tabla `publicacion_imagens`
--
ALTER TABLE `publicacion_imagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publicacion_imagens_publicacion_id_foreign` (`publicacion_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subastas`
--
ALTER TABLE `subastas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subastas_publicacion_id_foreign` (`publicacion_id`);

--
-- Indices de la tabla `subasta_clientes`
--
ALTER TABLE `subasta_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subasta_clientes_subasta_id_foreign` (`subasta_id`),
  ADD KEY `subasta_clientes_cliente_id_foreign` (`cliente_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `publicacions`
--
ALTER TABLE `publicacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `publicacion_detalles`
--
ALTER TABLE `publicacion_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `publicacion_imagens`
--
ALTER TABLE `publicacion_imagens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `subastas`
--
ALTER TABLE `subastas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subasta_clientes`
--
ALTER TABLE `subasta_clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD CONSTRAINT `historial_accions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_modulo_id_foreign` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `permisos_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `publicacions`
--
ALTER TABLE `publicacions`
  ADD CONSTRAINT `publicacions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `publicacion_detalles`
--
ALTER TABLE `publicacion_detalles`
  ADD CONSTRAINT `publicacion_detalles_publicacion_id_foreign` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacions` (`id`);

--
-- Filtros para la tabla `publicacion_imagens`
--
ALTER TABLE `publicacion_imagens`
  ADD CONSTRAINT `publicacion_imagens_publicacion_id_foreign` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacions` (`id`);

--
-- Filtros para la tabla `subastas`
--
ALTER TABLE `subastas`
  ADD CONSTRAINT `subastas_publicacion_id_foreign` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacions` (`id`);

--
-- Filtros para la tabla `subasta_clientes`
--
ALTER TABLE `subasta_clientes`
  ADD CONSTRAINT `subasta_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `subasta_clientes_subasta_id_foreign` FOREIGN KEY (`subasta_id`) REFERENCES `subastas` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
