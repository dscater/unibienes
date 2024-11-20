-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-11-2024 a las 05:20:30
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
(1, 3, 'CARLOS', 'MARTINES', 'CHOQUE', '1234567', '', 'LP', '7777777', 'LA PAZ', 'carlos@gmail.com', '131731936498.jpeg', '131731936498.png', 'BANCO UNIÓN', '100000121212', 'BOLIVIANOS', '2024-11-13', '2024-11-13 20:33:34', '2024-11-18 17:28:18'),
(2, 5, 'MARIA', 'PAREDES', 'MAMANI', '44444444', '', 'CB', '67767677', 'CHUQUISACA', 'maria@gmail.com', '151731936654.jpeg', '151731936654.jpeg', 'BANCO UNIÓN', '10000000333333', 'BOLIVIANOS', '2024-11-16', '2024-11-16 19:36:05', '2024-11-18 17:30:54'),
(3, 7, 'PABLO', 'MARTINEZ', 'RAMIRES', '43343434', '', 'TJ', '676767676', 'ORURO', 'pablo@gmail.com', '171732077398.jpeg', '171732077398.png', 'BANCO UNION', '10000023232', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:36:38', '2024-11-20 08:36:38'),
(4, 8, 'CARMEN', 'GONZALES', 'GONZALES', '4344334', '', 'LP', '78787878', 'LA PAZ', 'carmen@gmail.com', '181732077496.jpeg', '181732077496.jpeg', 'BANCO MERCANTIL', '100000222', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:38:16', '2024-11-20 08:38:16'),
(5, 9, 'TATIANA', 'CARVAJAL', 'RAMIRES', '3343455', '', 'LP', '6565666', 'LA PAZ', 'tatiana@gmail.com', '191732077596.jpeg', '191732077596.png', 'BANCO BISA', '1444444', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:39:56', '2024-11-20 08:39:56'),
(6, 10, 'SOFIA', 'PAREDES', 'PAREDES', '56565656', '', 'PD', '6555555', 'PANDO', 'sofia@gmail.com', '1101732077704.jpeg', '1101732077704.jpeg', 'BANCO UNION', '100000333444', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:41:44', '2024-11-20 08:41:44'),
(7, 11, 'MARTIN', 'MAMANI', 'MAMANI', '4334343', '', 'LP', '6666666', 'LA PAZ', 'martin@gmail.com', '1111732077783.jpeg', '1111732077783.png', 'BANCO UNION', '1000033266', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:43:03', '2024-11-20 08:43:03'),
(8, 12, 'CARLA', 'RAMIRES', 'CONDORI', '32323322', '', 'OR', '6666666', 'ORURO', 'carla@gmail.com', '1121732078001.jpeg', '1121732078001.png', 'BANCO UNIÓN', '1000665555', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:46:41', '2024-11-20 08:46:41'),
(9, 13, 'FRANZ', 'CONDORI', 'CONDORI', '3343434', '', 'LP', '6665555', 'LA PAZ', 'franz@gmail.com', '1131732078159.jpeg', '1131732078159.jpeg', 'BANCO UNIÓN', '100000003333331', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:49:19', '2024-11-20 08:49:19'),
(10, 14, 'MARTIN', 'COLQUE', 'CONDORI', '44444441', '', 'CB', '6777777', 'LA PAZ', 'martinc@gmail.com', '1141732078711.jpeg', '1141732078711.jpeg', 'BANCO UNIÓN', '100000003332', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:58:31', '2024-11-20 08:58:31');

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
(21, 4, 'CREACIÓN', 'EL USUARIO APAREDES REGISTRO UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-11-20<br/>hora_limite: 12:00<br/>monto_garantia: 1000<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-11-13 18:15:26<br/>', NULL, 'PUBLICACIONES', '2024-11-13', '18:15:26', '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(22, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>estado_sub: 0<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'id: 3<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBSERVACIONES PUBLICACION UNO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 600.00<br/>estado_sub: 0<br/>created_at: 2024-11-12 23:47:31<br/>updated_at: 2024-11-12 23:56:49<br/>', 'PUBLICACIONES', '2024-11-14', '22:32:03', '2024-11-15 02:32:03', '2024-11-15 02:32:03'),
(23, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 4<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 20000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBS. PUBLICACION<br/>fecha_limite: 2024-11-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 10000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 14:32:59<br/>updated_at: 2024-11-13 14:32:59<br/>', 'id: 4<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 20000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBS. PUBLICACION<br/>fecha_limite: 2024-11-20<br/>hora_limite: 10:00:00<br/>monto_garantia: 10000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 14:32:59<br/>updated_at: 2024-11-13 14:32:59<br/>', 'PUBLICACIONES', '2024-11-15', '15:52:34', '2024-11-15 19:52:34', '2024-11-15 19:52:34'),
(24, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-11-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-11-13 18:15:26<br/>', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-11-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-11-13 18:15:26<br/>', 'PUBLICACIONES', '2024-11-19', '23:48:07', '2024-11-20 03:48:07', '2024-11-20 03:48:07'),
(25, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-11-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-11-13 18:15:26<br/>', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-11-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-11-13 18:15:26<br/>', 'PUBLICACIONES', '2024-11-19', '23:48:52', '2024-11-20 03:48:52', '2024-11-20 03:48:52'),
(26, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 6<br/>usuario: MPAREDES<br/>nombres: MARCOS<br/>apellidos: PAREDES<br/>password: $2y$12$DHvmogz6tfn9yImxpTn.1.EPmH1B7SHaT5iGOyhiSjKx.Tzrd8ZDe<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-20<br/>ultima_sesion: <br/>status: <br/>created_at: 2024-11-20 01:37:37<br/>updated_at: 2024-11-20 01:37:37<br/>', NULL, 'USUARIOS', '2024-11-20', '01:37:38', '2024-11-20 05:37:38', '2024-11-20 05:37:38'),
(27, 6, 'CREACIÓN', 'EL USUARIO MPAREDES REGISTRO UNA PUBLICACIÓN', 'id: 6<br/>user_id: 6<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 1000<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00<br/>monto_garantia: 5000<br/>estado_sub: <br/>created_at: 2024-11-20 04:08:13<br/>updated_at: 2024-11-20 04:08:13<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '04:08:13', '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(28, 6, 'MODIFICACIÓN', 'EL USUARIO MPAREDES MODIFICÓ UNA PUBLICACIÓN', 'id: 6<br/>user_id: 6<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 5000.00<br/>estado_sub: 0<br/>created_at: 2024-11-20 04:08:13<br/>updated_at: 2024-11-20 04:08:13<br/>', 'id: 6<br/>user_id: 6<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 5000.00<br/>estado_sub: 0<br/>created_at: 2024-11-20 04:08:13<br/>updated_at: 2024-11-20 04:08:13<br/>', 'PUBLICACIONES', '2024-11-20', '04:11:09', '2024-11-20 08:11:09', '2024-11-20 08:11:09'),
(29, 6, 'MODIFICACIÓN', 'EL USUARIO MPAREDES MODIFICÓ UNA PUBLICACIÓN', 'id: 6<br/>user_id: 6<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 5000.00<br/>estado_sub: 0<br/>created_at: 2024-11-20 04:08:13<br/>updated_at: 2024-11-20 04:08:13<br/>', 'id: 6<br/>user_id: 6<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 1000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 5000.00<br/>estado_sub: 0<br/>created_at: 2024-11-20 04:08:13<br/>updated_at: 2024-11-20 04:08:13<br/>', 'PUBLICACIONES', '2024-11-20', '04:11:17', '2024-11-20 08:11:17', '2024-11-20 08:11:17'),
(30, 4, 'CREACIÓN', 'EL USUARIO APAREDES REGISTRO UNA PUBLICACIÓN', 'id: 7<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 20000<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS<br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00<br/>monto_garantia: 10000<br/>estado_sub: <br/>created_at: 2024-11-20 04:13:24<br/>updated_at: 2024-11-20 04:13:24<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '04:13:24', '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(31, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ROLE', 'id: 1<br/>nombre: SUPER USUARIO<br/>permisos: 1<br/>usuarios: 0<br/>created_at: 2024-11-09 14:47:19<br/>updated_at: 2024-11-09 14:47:19<br/>', 'id: 1<br/>nombre: SUPER USUARIO<br/>permisos: 1<br/>usuarios: 0<br/>created_at: 2024-11-09 14:47:19<br/>updated_at: 2024-11-09 14:47:19<br/>', 'ROLES', '2024-11-20', '05:17:14', '2024-11-20 09:17:14', '2024-11-20 09:17:14');

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
(26, '2024_11_04_143347_create_subasta_clientes_table', 1),
(27, '2024_11_15_215421_create_notificacions_table', 2),
(28, '2024_11_15_215426_create_notificacion_users_table', 2),
(29, '2024_11_18_141518_create_recuperar_passwords_table', 3);

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
(1, 'Parametrización', 'parametrizacion.index', 'VER', 'VER DATOS DE PARAMETRIZACIÓN', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(2, 'Parametrización', 'parametrizacion.edit', 'EDITAR', 'EDITAR DATOS DE PARAMETRIZACIÓN', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(3, 'Gestión de usuarios', 'usuarios.index', 'VER', 'VER LA LISTA DE USUARIOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(4, 'Gestión de usuarios', 'usuarios.create', 'CREAR', 'CREAR USUARIOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(5, 'Gestión de usuarios', 'usuarios.edit', 'EDITAR', 'EDITAR USUARIOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(6, 'Gestión de usuarios', 'usuarios.destroy', 'ELIMINAR', 'ELIMINAR USUARIOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(7, 'Roles y Permisos', 'roles.index', 'VER', 'VER LA LISTA DE ROLES Y PERMISOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(8, 'Roles y Permisos', 'roles.create', 'CREAR', 'CREAR ROLES Y PERMISOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(9, 'Roles y Permisos', 'roles.edit', 'EDITAR', 'EDITAR ROLES Y PERMISOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(10, 'Roles y Permisos', 'roles.destroy', 'ELIMINAR', 'ELIMINAR ROLES Y PERMISOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(11, 'Configuración', 'configuracions.index', 'VER', 'VER INFORMACIÓN DE LA CONFIGURACIÓN DEL SISTEMA', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(12, 'Configuración', 'configuracions.edit', 'EDITAR', 'EDITAR LA CONFIGURACIÓN DEL SISTEMA', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(13, 'Publicaciones', 'publicacions.index', 'VER', 'VER LA LISTA DE PUBLICACIONES', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(14, 'Publicaciones', 'publicacions.create', 'CREAR', 'CREAR PUBLICACIONES', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(15, 'Publicaciones', 'publicacions.edit', 'EDITAR', 'EDITAR PUBLICACIONES', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(16, 'Publicaciones', 'publicacions.destroy', 'ELIMINAR', 'ELIMINAR PUBLICACIONES', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(17, 'Publicaciones', 'publicacions.todos', 'TODAS LAS PUBLICACIONES', 'VER TODAS LAS PUBLICACIONES', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(18, 'Reportes', 'reportes.publicacions', 'REPORTE PUBLICACIONES', 'GENERAR REPORTES DE PUBLICACIONES', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(19, 'Reportes', 'reportes.subasta_clientes', 'REPORTE CLIENTES POR SUBASTA', 'GENERAR REPORTES DE LOS CLIENTES POR CADA UNA DE LAS SUBASTAS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(20, 'Reportes', 'reportes.clientes', 'REPORTE DE CLIENTES', 'GENERAR REPORTES DE LOS CLIENTES REGISTRADOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacions`
--

CREATE TABLE `notificacions` (
  `id` bigint UNSIGNED NOT NULL,
  `descripcion` varchar(900) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registro_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificacions`
--

INSERT INTO `notificacions` (`id`, `descripcion`, `fecha`, `hora`, `modulo`, `registro_id`, `created_at`, `updated_at`) VALUES
(1, 'CARLOS MARTINES CHOQUE REGISTRO SU COMPROBANTE', '2024-11-15', '22:23:00', 'SUBASTA CLIENTE', 1, '2024-11-16 02:23:49', '2024-11-16 02:23:49'),
(2, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-11-16', '15:37:00', 'SUBASTA CLIENTE', 2, '2024-11-16 19:37:08', '2024-11-16 19:37:08'),
(3, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-11-16', '15:43:00', 'SUBASTA CLIENTE', 3, '2024-11-16 19:43:37', '2024-11-16 19:43:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_users`
--

CREATE TABLE `notificacion_users` (
  `id` bigint UNSIGNED NOT NULL,
  `notificacion_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `visto` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificacion_users`
--

INSERT INTO `notificacion_users` (`id`, `notificacion_id`, `user_id`, `visto`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2024-11-16 02:23:49', '2024-11-16 02:26:24'),
(2, 2, 2, 1, '2024-11-16 19:37:08', '2024-11-16 19:37:23'),
(3, 3, 2, 1, '2024-11-16 19:43:37', '2024-11-16 20:06:27');

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

--
-- Volcado de datos para la tabla `parametrizacions`
--

INSERT INTO `parametrizacions` (`id`, `inactividad_cliente`, `tipo_cambio`, `servidor_correo`, `nro_imagenes_pub`, `tiempo_pub`, `terminos_condiciones`, `created_at`, `updated_at`) VALUES
(1, 1, 6.96, '{\"host\": \"smtp.gmail.com\", \"correo\": \"correosyseventos@gmail.com\", \"driver\": \"smtp\", \"nombre\": \"unibienes\", \"puerto\": \"465\", \"password\": \"plgfbgxjaqsyciai\", \"encriptado\": \"ssl\"}', 3, 2, 'Terminos y condiciones unibienes', '2024-11-16 20:43:43', '2024-11-18 20:36:02');

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
(4, 3, 16, '2024-11-09 20:42:07', '2024-11-09 20:42:07'),
(7, 3, 18, '2024-11-17 01:24:49', '2024-11-17 01:24:49'),
(8, 3, 19, '2024-11-17 01:24:49', '2024-11-17 01:24:49');

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
(3, 2, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 1000.00, 'LA PAZ', 'OBSERVACIONES PUBLICACION UNO', '2024-11-16', '16:58:00', 600.00, 3, '2024-11-13 03:47:31', '2024-11-18 20:37:51'),
(4, 2, 'OTROS BIENES', 'DÓLARES (USD)', 20000.00, 'LA PAZ', 'OBS. PUBLICACION', '2024-11-20', '10:00:00', 10000.00, 1, '2024-11-13 18:32:59', '2024-11-15 19:52:40'),
(5, 4, 'VEHÍCULOS', 'DÓLARES (USD)', 8000.00, 'COCHABAMBA', 'OBS. VEHICULO', '2024-11-20', '12:00:00', 1000.00, 0, '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(6, 6, 'VEHÍCULOS', 'DÓLARES (USD)', 1000.00, 'LA PAZ', 'OBS', '2024-11-30', '12:00:00', 5000.00, 1, '2024-11-20 08:08:13', '2024-11-20 08:11:44'),
(7, 4, 'VEHÍCULOS', 'DÓLARES (USD)', 20000.00, 'COCHABAMBA', 'OBS', '2024-11-30', '12:00:00', 10000.00, 1, '2024-11-20 08:13:24', '2024-11-20 08:13:28');

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
(14, 5, 'CARACTERISTICA2', 'DETALLE2', '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(15, 4, 'CARACTERISTICA 4', 'DETALLE 4', '2024-11-15 19:52:34', '2024-11-15 19:52:34'),
(16, 4, 'CARACTERISTICA 5', 'DETALLE 5', '2024-11-15 19:52:34', '2024-11-15 19:52:34'),
(17, 6, 'MOTOR', '2000CC', '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(18, 6, 'PUERTAS', '5', '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(19, 6, 'COLOR', 'ROJO', '2024-11-20 08:11:09', '2024-11-20 08:11:09'),
(20, 7, 'PUERTAS', '5', '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(21, 7, 'COLOR', 'NEGRO', '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(22, 7, 'MOTOR', '4000CC', '2024-11-20 08:13:24', '2024-11-20 08:13:24');

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
(1, 3, '01731455251.jpg', '2024-11-13 03:47:31', '2024-11-13 03:47:31'),
(5, 3, '31731455936.jpeg', '2024-11-13 03:57:11', '2024-11-13 03:58:56'),
(6, 3, '21731456084.jpeg', '2024-11-13 03:59:15', '2024-11-13 04:01:24'),
(7, 4, '01731508379.jpg', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(8, 4, '11731508379.jpeg', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(9, 4, '21731508379.jpeg', '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(10, 5, '01731521726.jpeg', '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(11, 5, '11731521726.webp', '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(12, 5, '21731521726.jpeg', '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(13, 6, '01732075693.jpeg', '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(14, 6, '11732075693.webp', '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(15, 6, '21732075693.jpeg', '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(16, 7, '01732076004.jpg', '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(17, 7, '11732076004.jpeg', '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(18, 7, '21732076004.jpeg', '2024-11-20 08:13:24', '2024-11-20 08:13:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperar_passwords`
--

CREATE TABLE `recuperar_passwords` (
  `id` bigint UNSIGNED NOT NULL,
  `cod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recuperar_passwords`
--

INSERT INTO `recuperar_passwords` (`id`, `cod`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dTkMMd', 3, 0, '2024-11-18 19:21:04', '2024-11-18 19:21:04');

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

--
-- Volcado de datos para la tabla `subastas`
--

INSERT INTO `subastas` (`id`, `publicacion_id`, `estado`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 3, 2, '2024-11-14', '2024-11-15 02:45:15', '2024-11-17 00:59:54'),
(2, 4, 1, '2024-11-15', '2024-11-15 19:52:40', '2024-11-15 19:52:40'),
(3, 6, 1, '2024-11-20', '2024-11-20 08:11:44', '2024-11-20 08:11:44'),
(4, 7, 1, '2024-11-20', '2024-11-20 08:13:28', '2024-11-20 08:13:28');

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
  `estado_comprobante` int NOT NULL,
  `estado_puja` int NOT NULL DEFAULT '0',
  `fecha_oferta` date DEFAULT NULL,
  `hora_oferta` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subasta_clientes`
--

INSERT INTO `subasta_clientes` (`id`, `subasta_id`, `cliente_id`, `garantia`, `puja`, `comprobante`, `estado_comprobante`, `estado_puja`, `fecha_oferta`, `hora_oferta`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1013.00, '11731709429.png', 1, 2, NULL, NULL, '2024-11-15 23:55:18', '2024-11-17 00:59:54'),
(2, 1, 2, 1, 1012.00, '21731771428.pdf', 1, 0, NULL, NULL, '2024-11-16 19:37:08', '2024-11-16 19:42:45'),
(3, 2, 2, 1, 20001.00, '21731771817.pdf', 1, 1, NULL, NULL, '2024-11-16 19:43:37', '2024-11-20 05:47:34');

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
  `ultima_sesion` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombres`, `apellidos`, `password`, `role_id`, `acceso`, `foto`, `fecha_registro`, `ultima_sesion`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 1, 1, NULL, '2024-11-09', '2024-11-20', 1, '2024-11-09 18:47:19', '2024-11-20 04:12:58'),
(2, 'JPERES', 'JUAN', 'PERES MAMANI', '$2y$12$r4ihm1arJYR1tBZWhM6emeLXy1ZOOSGQiss1N9XPiVSn.pk6d9uGi', 3, 1, NULL, '2024-11-11', '2024-11-20', 1, '2024-11-11 22:53:46', '2024-11-20 05:37:10'),
(3, 'carlos@gmail.com', 'CARLOS', 'MARTINES CHOQUE', '$2y$12$gHVL0X8zeL7mZXZ3uftNWOuAK3SumYhoBNNJzUQNPeD7dd94Q46ke', 2, 1, '1731796210_carlos@gmail.com.jpg', '2024-11-13', '2024-11-20', 1, '2024-11-13 20:33:34', '2024-11-20 05:37:01'),
(4, 'APAREDES', 'ALBERTO', 'PAREDES', '$2y$12$NSeoWEEWnGVX75lEk0EfoeRLO5IKrh7AdXhfxFHMjwz6zzaMG2ISu', 3, 1, NULL, '2024-11-13', '2024-11-20', 1, '2024-11-13 22:13:05', '2024-11-20 08:12:18'),
(5, 'maria@gmail.com', 'MARIA', 'PAREDES MAMANI', '$2y$12$gHVL0X8zeL7mZXZ3uftNWOuAK3SumYhoBNNJzUQNPeD7dd94Q46ke', 2, 1, '1732079915_maria@gmail.com.jpg', '2024-11-16', '2024-11-20', 1, '2024-11-16 19:36:05', '2024-11-20 09:18:35'),
(6, 'MPAREDES', 'MARCOS', 'PAREDES', '$2y$12$DHvmogz6tfn9yImxpTn.1.EPmH1B7SHaT5iGOyhiSjKx.Tzrd8ZDe', 3, 1, NULL, '2024-11-20', '2024-11-20', 1, '2024-11-20 05:37:37', '2024-11-20 05:37:46'),
(7, 'pablo@gmail.com', 'PABLO', 'MARTINEZ RAMIRES', '$2y$12$hOZda1iFWdM3zEBqhKNpk.0n0T6IDHU1B7o2c1q6.bKkpoVorkvR.', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:36:38', '2024-11-20 08:36:38'),
(8, 'carmen@gmail.com', 'CARMEN', 'GONZALES GONZALES', '$2y$12$0L7M00Gx5b1dOphdTtdCZuaPurzrM16iHNc7BqtTChW.r./5PAAMW', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:38:16', '2024-11-20 08:38:16'),
(9, 'tatiana@gmail.com', 'TATIANA', 'CARVAJAL RAMIRES', '$2y$12$4WSIWN81cdMWeNzdblSqt.46dK89aX7DnxrSvVRsVSOWSeU1kVXii', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:39:56', '2024-11-20 08:39:56'),
(10, 'sofia@gmail.com', 'SOFIA', 'PAREDES PAREDES', '$2y$12$lfqHr2Dk.FrKf4vws75b0eqjh2ZFwKj5qmzh7klMz.TFTw1r6noZK', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:41:44', '2024-11-20 08:41:44'),
(11, 'martin@gmail.com', 'MARTIN', 'MAMANI MAMANI', '$2y$12$WOVjkEsxbI7nkV5tLpwjmuLNPxUnyWxuyuzhi5109yBSzetSW.8wK', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:43:03', '2024-11-20 08:43:03'),
(12, 'carla@gmail.com', 'CARLA', 'RAMIRES CONDORI', '$2y$12$VBzB2cpGPIRyWyJo.FXt7.bp6NUd5WgzHq4c2qNMaOXL/Vlcjuz8W', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:46:41', '2024-11-20 08:46:41'),
(13, 'franz@gmail.com', 'FRANZ', 'CONDORI CONDORI', '$2y$12$W40YzEEAW31UDbLvKoBOI.Y5bAhL/eMlnv6g8HyF2B579NEX9NN5O', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:49:19', '2024-11-20 08:49:19'),
(14, 'martinc@gmail.com', 'MARTIN', 'COLQUE CONDORI', '$2y$12$pMHhVbJfoSN/2Dr1VVttgu3Iu9Z.bn/jWTpLf.iyZVZXnn9g90PNS', 2, 1, '1732079991_martinc@gmail.com.jpg', '2024-11-20', NULL, 1, '2024-11-20 08:58:31', '2024-11-20 09:19:51');

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
-- Indices de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificacion_users_notificacion_id_foreign` (`notificacion_id`),
  ADD KEY `notificacion_users_user_id_foreign` (`user_id`);

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
-- Indices de la tabla `recuperar_passwords`
--
ALTER TABLE `recuperar_passwords`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `publicacions`
--
ALTER TABLE `publicacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `publicacion_detalles`
--
ALTER TABLE `publicacion_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `publicacion_imagens`
--
ALTER TABLE `publicacion_imagens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `recuperar_passwords`
--
ALTER TABLE `recuperar_passwords`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `subastas`
--
ALTER TABLE `subastas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `subasta_clientes`
--
ALTER TABLE `subasta_clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
-- Filtros para la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  ADD CONSTRAINT `notificacion_users_notificacion_id_foreign` FOREIGN KEY (`notificacion_id`) REFERENCES `notificacions` (`id`),
  ADD CONSTRAINT `notificacion_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
