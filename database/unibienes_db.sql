-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-03-2025 a las 20:38:32
-- Versión del servidor: 8.0.30
-- Versión de PHP: 7.3.29

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
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci_exp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dpto_residencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_ci_anverso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_ci_reverso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banco` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nro_cuenta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `moneda` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `user_id`, `nombre`, `paterno`, `materno`, `ci`, `complemento`, `ci_exp`, `fono`, `dpto_residencia`, `email`, `foto_ci_anverso`, `foto_ci_reverso`, `banco`, `nro_cuenta`, `moneda`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 3, 'CARLOS', 'MARTINES', 'CHOQUE', '1234567', '', 'LP', '7777777', 'LA PAZ', 'carlos@gmail.com', '131733780057.png', '131733780057.jpeg', 'BANCO DE CRÉDITO DE BOLIVIA S.A.', '100000121212', 'BOLIVIANOS', '2024-11-13', '2024-11-13 20:33:34', '2024-12-09 21:37:36'),
(2, 5, 'MARIA', 'PAREDES', 'MAMANI', '44444444', '', 'CB', '67767677', 'CHUQUISACA', 'maria@gmail.com', '151731936654.jpeg', '151731936654.jpeg', 'BANCO NACIONAL DE BOLIVIA S.A.', '10000000333333', 'BOLIVIANOS', '2024-11-16', '2024-11-16 19:36:05', '2024-11-26 07:26:04'),
(3, 7, 'PABLO', 'MARTINEZ', 'RAMIRES', '43343434', '', 'TJ', '676767676', 'ORURO', 'pablo@gmail.com', '171732077398.jpeg', '171732077398.png', 'BANCO DE LA NACIÓN ARGENTINA', '10000023232', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:36:38', '2024-12-02 16:13:50'),
(4, 8, 'CARMEN', 'GONZALES', 'GONZALES', '4344334', '', 'LP', '78787878', 'LA PAZ', 'carmen@gmail.com', '181732077496.jpeg', '181732077496.jpeg', 'BANCO MERCANTIL', '100000222', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:38:16', '2024-11-20 08:38:16'),
(5, 9, 'TATIANA', 'CARVAJAL', 'RAMIRES', '3343455', '', 'LP', '6565666', 'LA PAZ', 'tatiana@gmail.com', '191732077596.jpeg', '191732077596.png', 'BANCO BISA', '1444444', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:39:56', '2024-11-20 08:39:56'),
(6, 10, 'SOFIA', 'PAREDES', 'PAREDES', '56565656', '', 'PD', '6555555', 'PANDO', 'sofia@gmail.com', '1101732077704.jpeg', '1101732077704.jpeg', 'BANCO UNION', '100000333444', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:41:44', '2024-11-20 08:41:44'),
(7, 11, 'MARTIN', 'MAMANI', 'MAMANI', '4334343', '', 'LP', '6666666', 'LA PAZ', 'martin@gmail.com', '1111732077783.jpeg', '1111732077783.png', 'BANCO UNION', '1000033266', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:43:03', '2024-11-20 08:43:03'),
(8, 12, 'CARLA', 'RAMIRES', 'CONDORI', '32323322', '', 'OR', '6666666', 'ORURO', 'carla@gmail.com', '1121732078001.jpeg', '1121732078001.png', 'BANCO UNIÓN', '1000665555', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:46:41', '2024-11-20 08:46:41'),
(9, 13, 'FRANZ', 'CONDORI', 'CONDORI', '3343434', '', 'LP', '6665555', 'LA PAZ', 'franz@gmail.com', '1131732078159.jpeg', '1131732078159.jpeg', 'BANCO UNIÓN', '100000003333331', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:49:19', '2024-11-20 08:49:19'),
(10, 14, 'MARTIN', 'COLQUE', 'CONDORI', '44444441', '', 'CB', '6777777', 'LA PAZ', 'martinc@gmail.com', '1141732078711.jpeg', '1141732078711.jpeg', 'BANCO UNIÓN', '100000003332', 'BOLIVIANOS', '2024-11-20', '2024-11-20 08:58:31', '2024-11-20 08:58:31'),
(11, 16, 'PAMELA', 'ORTEGA', 'CASTRO', '1020301', '', 'LP', '76522487', 'LA PAZ', 'pamela12@gmail.com', '1161732124572.pdf', '1161732124572.pdf', 'MERCANTIL', '42558564712457', 'BOLIVIANOS', '2024-11-20', '2024-11-20 21:42:52', '2024-11-20 21:42:52'),
(12, 17, 'RODRIGO', 'MEDINA', 'PACOSILLO', '1020302', '', 'LP', '76522487', 'LA PAZ', 'rodrigo12@gmail.com', '1171732124802.pdf', '1171732124802.pdf', 'BANCO ECONÓMICO', '200000148596', 'BOLIVIANOS', '2024-11-20', '2024-11-20 21:46:42', '2024-11-20 21:46:42'),
(13, 18, 'MARCELO', 'APAZA', 'QUINO', '4050601', '', 'LP', '76588745', 'LA PAZ', 'marcelo12@gmail.com', '1181732203024.pdf', '1181732203024.pdf', 'MERCANTIL', '4522525225452', 'BOLIVIANOS', '2024-11-21', '2024-11-21 19:30:24', '2024-11-21 19:30:24'),
(14, 19, 'CARLOS', 'MEDRANO', 'MONTES', '7080901', '', 'LP', '79855624', 'LA PAZ', 'carlos12@gmail.com', '1191732203295.pdf', '1191732203295.pdf', 'BANCO UNIÓN', '58000524852', 'BOLIVIANOS', '2024-11-21', '2024-11-21 19:34:55', '2024-11-21 19:34:55'),
(15, 20, 'RAMIRO', 'FERNANDEZ', 'LOPEZ', '7080907', '', 'LP', '78487798', 'LA PAZ', 'ramiro12@gmail.com', '1201732226612.pdf', '1201732226612.pdf', 'BANCO UNIÓN', '2338451298415', 'BOLIVIANOS', '2024-11-21', '2024-11-22 02:03:32', '2024-11-22 02:03:32'),
(16, 21, 'PEDRO', 'MARQUEZ', 'SOLANO', '66666677', '', 'LP', '67767677', 'LA PAZ', 'pedromarquezsolano@gmail.com', '1211733544160.jpeg', '2211733544160.png', 'BANCO NACIONAL DE BOLIVIA S.A.', '100000003335555', 'BOLIVIANOS', '2024-12-07', '2024-12-07 04:02:41', '2024-12-07 04:23:25'),
(17, 22, 'FRANZ', 'MARTINES', 'CORDOVA', '1234567', 'A', 'SC', '67767677', 'SANTA CRUZ', 'franzmartinez@gmail.com', '1221733546589.jpeg', '2221733546589.png', 'BANCO GANADERO S.A.', '10000000333221', 'BOLIVIANOS', '2024-12-07', '2024-12-07 04:43:09', '2024-12-07 04:43:09'),
(18, 23, 'ASD', 'ASD', 'ASD', '12312323', '', 'LP', '67767677', 'LA PAZ', 'asd@gmail.com', '1231733584624.jpeg', '2231733584624.jpeg', 'BANCO NACIONAL DE BOLIVIA S.A.', '10000000333333', 'BOLIVIANOS', '2024-12-07', '2024-12-07 15:17:04', '2024-12-07 15:17:04'),
(19, 24, 'SANDRO', 'BALTAZAR', '', '3434345', 'A', 'PT', '543454545', 'POTOSI', 'sandro@gmail.com', '1241733778473.jpg', '2241733778473.jpeg', 'BANCO BISA S.A.', '43534534', 'BOLIVIANOS', '2024-12-09', '2024-12-09 21:07:53', '2024-12-09 21:07:53'),
(20, 25, 'FERNANDA', 'MARQUEZ', '', '3434345', '', 'CB', '54454545', 'TARIJA', 'fernandamarquez@gmail.com', '1251733778583.jpeg', '2251733778583.jpeg', 'BANCO PARA EL FOMENTO A INICIATIVAS ECONÓMICAS S.A.', '1111444444', 'BOLIVIANOS', '2024-12-09', '2024-12-09 21:09:43', '2024-12-09 21:09:43'),
(21, 26, 'SERGIO', 'CACERES', '', '12312323', 'F1', 'LP', '433434334', 'PANDO', 'sergio@gmail.com', '1261733778639.jpg', '2261733778639.jpeg', 'BANCO NACIONAL DE BOLIVIA S.A.', '23232323', 'BOLIVIANOS', '2024-12-09', '2024-12-09 21:10:39', '2024-12-09 21:10:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `user_id`, `razon_social`, `alias`, `logo`, `created_at`, `updated_at`) VALUES
(1, 1, 'UNIBIENES S.A.', 'UNIBIENES S.A.', 'logo.png', '2024-11-09 18:47:19', '2024-11-21 18:55:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(31, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ROLE', 'id: 1<br/>nombre: SUPER USUARIO<br/>permisos: 1<br/>usuarios: 0<br/>created_at: 2024-11-09 14:47:19<br/>updated_at: 2024-11-09 14:47:19<br/>', 'id: 1<br/>nombre: SUPER USUARIO<br/>permisos: 1<br/>usuarios: 0<br/>created_at: 2024-11-09 14:47:19<br/>updated_at: 2024-11-09 14:47:19<br/>', 'ROLES', '2024-11-20', '05:17:14', '2024-11-20 09:17:14', '2024-11-20 09:17:14'),
(32, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 15<br/>usuario: VALDEZ<br/>nombres: FRANCISCO<br/>apellidos: MORENO<br/>password: $2y$12$4xzLxvpipRljq64SjmMHf.j44MWDk7DUrediKbAVtr/ZgEh8kVFA6<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-20<br/>ultima_sesion: <br/>status: <br/>created_at: 2024-11-20 17:19:43<br/>updated_at: 2024-11-20 17:19:43<br/>', NULL, 'USUARIOS', '2024-11-20', '17:19:43', '2024-11-20 21:19:43', '2024-11-20 21:19:43'),
(33, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 15<br/>usuario: VALDEZ<br/>nombres: FRANCISCO<br/>apellidos: MORENO<br/>password: $2y$12$4xzLxvpipRljq64SjmMHf.j44MWDk7DUrediKbAVtr/ZgEh8kVFA6<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-20<br/>ultima_sesion: <br/>status: 1<br/>created_at: 2024-11-20 17:19:43<br/>updated_at: 2024-11-20 17:19:43<br/>', 'id: 15<br/>usuario: JMORENO<br/>nombres: FRANCISCO<br/>apellidos: MORENO<br/>password: $2y$12$4xzLxvpipRljq64SjmMHf.j44MWDk7DUrediKbAVtr/ZgEh8kVFA6<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-20<br/>ultima_sesion: <br/>status: 1<br/>created_at: 2024-11-20 17:19:43<br/>updated_at: 2024-11-20 17:21:24<br/>', 'USUARIOS', '2024-11-20', '17:21:24', '2024-11-20 21:21:24', '2024-11-20 21:21:24'),
(34, 15, 'CREACIÓN', 'EL USUARIO JMORENO REGISTRO UNA PUBLICACIÓN', 'id: 8<br/>user_id: 15<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 150000<br/>ubicacion: LA PAZ<br/>observaciones: VEHÍCULO<br/>fecha_limite: 2024-11-22<br/>hora_limite: 18:00<br/>monto_garantia: 20000<br/>estado_sub: <br/>created_at: 2024-11-20 17:28:57<br/>updated_at: 2024-11-20 17:28:57<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '17:28:57', '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(35, 15, 'CREACIÓN', 'EL USUARIO JMORENO REGISTRO UNA PUBLICACIÓN', 'id: 9<br/>user_id: 15<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 100000<br/>ubicacion: LA PAZ<br/>observaciones: VEHÍCULO<br/>fecha_limite: 2024-11-22<br/>hora_limite: 18:00<br/>monto_garantia: 10000<br/>estado_sub: <br/>created_at: 2024-11-20 17:32:37<br/>updated_at: 2024-11-20 17:32:37<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '17:32:37', '2024-11-20 21:32:37', '2024-11-20 21:32:37'),
(36, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 15<br/>usuario: JMORENO<br/>nombres: FRANCISCO<br/>apellidos: MORENO<br/>password: $2y$12$4xzLxvpipRljq64SjmMHf.j44MWDk7DUrediKbAVtr/ZgEh8kVFA6<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-20<br/>ultima_sesion: 2024-11-20<br/>status: 1<br/>created_at: 2024-11-20 17:19:43<br/>updated_at: 2024-11-20 17:22:59<br/>', 'id: 15<br/>usuario: FMORENO<br/>nombres: FRANCISCO<br/>apellidos: MORENO<br/>password: $2y$12$4xzLxvpipRljq64SjmMHf.j44MWDk7DUrediKbAVtr/ZgEh8kVFA6<br/>role_id: 3<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-11-20<br/>ultima_sesion: 2024-11-20<br/>status: 1<br/>created_at: 2024-11-20 17:19:43<br/>updated_at: 2024-11-20 17:48:13<br/>', 'USUARIOS', '2024-11-20', '17:48:13', '2024-11-20 21:48:13', '2024-11-20 21:48:13'),
(37, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 10<br/>user_id: 15<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 120000<br/>ubicacion: LA PAZ<br/>observaciones: VEHÍCULO SEMINUEVO<br/>fecha_limite: 2024-11-22<br/>hora_limite: 18:00<br/>monto_garantia: 5000<br/>estado_sub: <br/>created_at: 2024-11-20 17:53:43<br/>updated_at: 2024-11-20 17:53:43<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '17:53:43', '2024-11-20 21:53:43', '2024-11-20 21:53:43'),
(38, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 11<br/>user_id: 15<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 250000<br/>ubicacion: LA PAZ<br/>observaciones: 30000<br/>fecha_limite: 2024-11-25<br/>hora_limite: 18:00<br/>monto_garantia: 20000<br/>estado_sub: <br/>created_at: 2024-11-20 17:56:08<br/>updated_at: 2024-11-20 17:56:08<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '17:56:08', '2024-11-20 21:56:08', '2024-11-20 21:56:08'),
(39, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 12<br/>user_id: 15<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 150000<br/>ubicacion: LA PAZ<br/>observaciones: CASA TIPO VIVIENDA<br/>fecha_limite: 2024-11-18<br/>hora_limite: 18:00<br/>monto_garantia: 20000<br/>estado_sub: <br/>created_at: 2024-11-20 17:59:08<br/>updated_at: 2024-11-20 17:59:08<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '17:59:08', '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(40, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 13<br/>user_id: 15<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 100000<br/>ubicacion: ORURO<br/>observaciones: VEHÍCULO<br/>fecha_limite: 2024-11-25<br/>hora_limite: 18:00<br/>monto_garantia: 5000<br/>estado_sub: <br/>created_at: 2024-11-20 19:38:27<br/>updated_at: 2024-11-20 19:38:27<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '19:38:27', '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(41, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 14<br/>user_id: 15<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 200000<br/>ubicacion: LA PAZ<br/>observaciones: VEHÍCULO SEMINUEVO<br/>fecha_limite: 2024-11-25<br/>hora_limite: 18:00<br/>monto_garantia: 20000<br/>estado_sub: <br/>created_at: 2024-11-20 19:40:18<br/>updated_at: 2024-11-20 19:40:18<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '19:40:18', '2024-11-20 23:40:18', '2024-11-20 23:40:18'),
(42, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 15<br/>user_id: 15<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 150000<br/>ubicacion: SANTA CRUZ<br/>observaciones: VEHÍCULO SEMINUEVO<br/>fecha_limite: 2024-11-25<br/>hora_limite: 18:00<br/>monto_garantia: 15000<br/>estado_sub: <br/>created_at: 2024-11-20 19:43:30<br/>updated_at: 2024-11-20 19:43:30<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '19:43:30', '2024-11-20 23:43:30', '2024-11-20 23:43:30'),
(43, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 16<br/>user_id: 15<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 250000<br/>ubicacion: LA PAZ<br/>observaciones: CASA<br/>fecha_limite: 2024-11-25<br/>hora_limite: 18:00<br/>monto_garantia: 30000<br/>estado_sub: <br/>created_at: 2024-11-20 19:46:52<br/>updated_at: 2024-11-20 19:46:52<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '19:46:52', '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(44, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 17<br/>user_id: 15<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 150000<br/>ubicacion: LA PAZ<br/>observaciones: CASA<br/>fecha_limite: 2024-11-25<br/>hora_limite: 18:00<br/>monto_garantia: 15000<br/>estado_sub: <br/>created_at: 2024-11-20 19:49:33<br/>updated_at: 2024-11-20 19:49:33<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '19:49:33', '2024-11-20 23:49:33', '2024-11-20 23:49:33'),
(45, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 18<br/>user_id: 15<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 180000<br/>ubicacion: COCHABAMBA<br/>observaciones: CASA<br/>fecha_limite: 2024-11-25<br/>hora_limite: 18:00<br/>monto_garantia: 25000<br/>estado_sub: <br/>created_at: 2024-11-20 19:51:55<br/>updated_at: 2024-11-20 19:51:55<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '19:51:55', '2024-11-20 23:51:55', '2024-11-20 23:51:55'),
(46, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 19<br/>user_id: 15<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 140000<br/>ubicacion: LA PAZ<br/>observaciones: CASA<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00<br/>monto_garantia: 20000<br/>estado_sub: <br/>created_at: 2024-11-20 19:54:18<br/>updated_at: 2024-11-20 19:54:18<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '19:54:18', '2024-11-20 23:54:18', '2024-11-20 23:54:18'),
(47, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 20<br/>user_id: 15<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 120000<br/>ubicacion: CHUQUISACA<br/>observaciones: CASA<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00<br/>monto_garantia: 12000<br/>estado_sub: <br/>created_at: 2024-11-20 19:56:30<br/>updated_at: 2024-11-20 19:56:30<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '19:56:30', '2024-11-20 23:56:30', '2024-11-20 23:56:30'),
(48, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 21<br/>user_id: 15<br/>categoria: ECOLÓGICO<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 50000<br/>ubicacion: LA PAZ<br/>observaciones: TERRENO FÉRTIL<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00<br/>monto_garantia: 5000<br/>estado_sub: <br/>created_at: 2024-11-20 19:59:24<br/>updated_at: 2024-11-20 19:59:24<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '19:59:24', '2024-11-20 23:59:24', '2024-11-20 23:59:24'),
(49, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 22<br/>user_id: 15<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 30000<br/>ubicacion: LA PAZ<br/>observaciones: TERRENO<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00<br/>monto_garantia: 3000<br/>estado_sub: <br/>created_at: 2024-11-20 20:01:32<br/>updated_at: 2024-11-20 20:01:32<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '20:01:32', '2024-11-21 00:01:32', '2024-11-21 00:01:32'),
(50, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 23<br/>user_id: 15<br/>categoria: ECOLÓGICO<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 60000<br/>ubicacion: COCHABAMBA<br/>observaciones: LOTE DE TERRENO<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00<br/>monto_garantia: 6000<br/>estado_sub: <br/>created_at: 2024-11-20 20:03:48<br/>updated_at: 2024-11-20 20:03:48<br/>', NULL, 'PUBLICACIONES', '2024-11-20', '20:03:48', '2024-11-21 00:03:48', '2024-11-21 00:03:48'),
(51, 15, 'CREACIÓN', 'EL USUARIO FMORENO REGISTRO UNA PUBLICACIÓN', 'id: 24<br/>user_id: 15<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 200000<br/>ubicacion: LA PAZ<br/>observaciones: VEHÍCULO SEMINUEVO<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00<br/>monto_garantia: 20000<br/>estado_sub: <br/>created_at: 2024-11-21 15:26:49<br/>updated_at: 2024-11-21 15:26:49<br/>', NULL, 'PUBLICACIONES', '2024-11-21', '15:26:49', '2024-11-21 19:26:49', '2024-11-21 19:26:49'),
(52, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PUBLICACIÓN', 'id: 25<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 123<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00<br/>monto_garantia: 2<br/>estado_sub: <br/>created_at: 2024-11-26 04:07:27<br/>updated_at: 2024-11-26 04:07:27<br/>', NULL, 'PUBLICACIONES', '2024-11-26', '04:07:27', '2024-11-26 08:07:27', '2024-11-26 08:07:27'),
(53, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 25<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 123.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 2.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:07:27<br/>updated_at: 2024-11-26 04:07:27<br/>', NULL, 'PUBLICACIONES', '2024-11-26', '04:12:00', '2024-11-26 08:12:00', '2024-11-26 08:12:00'),
(54, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 25<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 123.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 2.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:07:27<br/>updated_at: 2024-11-26 04:07:27<br/>', NULL, 'PUBLICACIONES', '2024-11-26', '04:12:55', '2024-11-26 08:12:55', '2024-11-26 08:12:55'),
(55, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 25<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 123.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 2.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:07:27<br/>updated_at: 2024-11-26 04:07:27<br/>', NULL, 'PUBLICACIONES', '2024-11-26', '04:15:38', '2024-11-26 08:15:38', '2024-11-26 08:15:38'),
(56, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 25<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 123.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 2.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:07:27<br/>updated_at: 2024-11-26 04:07:27<br/>', NULL, 'PUBLICACIONES', '2024-11-26', '04:16:58', '2024-11-26 08:16:58', '2024-11-26 08:16:58'),
(57, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 25<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 123.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 2.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:07:27<br/>updated_at: 2024-11-26 04:07:27<br/>', NULL, 'PUBLICACIONES', '2024-11-26', '04:17:32', '2024-11-26 08:17:32', '2024-11-26 08:17:32'),
(58, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 25<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 123.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 2.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:07:27<br/>updated_at: 2024-11-26 04:07:27<br/>', NULL, 'PUBLICACIONES', '2024-11-26', '04:18:28', '2024-11-26 08:18:28', '2024-11-26 08:18:28'),
(59, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 25<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 10000<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-11-30<br/>hora_limite: 12:00:00<br/>monto_garantia: 5000<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:07:27<br/>updated_at: 2024-11-26 04:22:20<br/>', NULL, 'PUBLICACIONES', '2024-11-26', '04:22:20', '2024-11-26 08:22:20', '2024-11-26 08:22:20'),
(60, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PUBLICACIÓN', 'id: 26<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 2000<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-10<br/>hora_limite: 12:00<br/>monto_garantia: 400<br/>estado_sub: <br/>created_at: 2024-11-26 04:28:21<br/>updated_at: 2024-11-26 04:28:21<br/>', NULL, 'PUBLICACIONES', '2024-11-26', '04:28:21', '2024-11-26 08:28:21', '2024-11-26 08:28:21'),
(61, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PUBLICACIÓN', 'id: 27<br/>user_id: 2<br/>categoria: ECOLÓGICO<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 4000<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-10<br/>hora_limite: 12:00<br/>monto_garantia: 2000<br/>estado_sub: <br/>created_at: 2024-12-02 12:08:30<br/>updated_at: 2024-12-02 12:08:30<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '12:08:30', '2024-12-02 16:08:30', '2024-12-02 16:08:30'),
(62, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 26<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 2000.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-10<br/>hora_limite: 12:00:00<br/>monto_garantia: 400.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:28:21<br/>updated_at: 2024-11-26 04:28:21<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '12:09:43', '2024-12-02 16:09:43', '2024-12-02 16:09:43'),
(63, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 26<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 2000.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-10<br/>hora_limite: 12:00:00<br/>monto_garantia: 400.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:28:21<br/>updated_at: 2024-11-26 04:28:21<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '12:13:26', '2024-12-02 16:13:26', '2024-12-02 16:13:26'),
(64, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 26<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 2000.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-10<br/>hora_limite: 12:00:00<br/>monto_garantia: 400.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:28:21<br/>updated_at: 2024-11-26 04:28:21<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '12:13:52', '2024-12-02 16:13:52', '2024-12-02 16:13:52'),
(65, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 26<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 2000.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-10<br/>hora_limite: 12:00:00<br/>monto_garantia: 400.00<br/>estado_sub: 0<br/>created_at: 2024-11-26 04:28:21<br/>updated_at: 2024-11-26 04:28:21<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '12:17:16', '2024-12-02 16:17:16', '2024-12-02 16:17:16'),
(66, 4, 'CREACIÓN', 'EL USUARIO APAREDES REGISTRO UNA PUBLICACIÓN', 'id: 28<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 20000<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00<br/>monto_garantia: 7000<br/>estado_sub: <br/>created_at: 2024-12-02 13:54:14<br/>updated_at: 2024-12-02 13:54:14<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '13:54:14', '2024-12-02 17:54:14', '2024-12-02 17:54:14'),
(67, 4, 'MODIFICACIÓN', 'EL USUARIO APAREDES MODIFICÓ UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-12-02 14:49:07<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '14:49:07', '2024-12-02 18:49:07', '2024-12-02 18:49:07'),
(68, 4, 'MODIFICACIÓN', 'EL USUARIO APAREDES MODIFICÓ UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-12-02 14:49:07<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '14:49:23', '2024-12-02 18:49:23', '2024-12-02 18:49:23'),
(69, 4, 'MODIFICACIÓN', 'EL USUARIO APAREDES MODIFICÓ UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-12-02 14:49:07<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '14:49:58', '2024-12-02 18:49:58', '2024-12-02 18:49:58'),
(70, 4, 'MODIFICACIÓN', 'EL USUARIO APAREDES MODIFICÓ UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-12-02 14:49:07<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '14:55:19', '2024-12-02 18:55:19', '2024-12-02 18:55:19'),
(71, 4, 'MODIFICACIÓN', 'EL USUARIO APAREDES MODIFICÓ UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-12-02 14:49:07<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '15:03:37', '2024-12-02 19:03:37', '2024-12-02 19:03:37'),
(72, 4, 'MODIFICACIÓN', 'EL USUARIO APAREDES MODIFICÓ UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-12-02 14:49:07<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '11:37:45', '2024-12-02 15:37:45', '2024-12-02 15:37:45'),
(73, 4, 'MODIFICACIÓN', 'EL USUARIO APAREDES MODIFICÓ UNA PUBLICACIÓN', 'id: 5<br/>user_id: 4<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 8000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: OBS. VEHICULO<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 1000.00<br/>estado_sub: 0<br/>created_at: 2024-11-13 18:15:26<br/>updated_at: 2024-12-02 14:49:07<br/>', NULL, 'PUBLICACIONES', '2024-12-02', '11:37:55', '2024-12-02 15:37:55', '2024-12-02 15:37:55'),
(74, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PUBLICACIÓN', 'id: 29<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 50000<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00<br/>monto_garantia: 20000<br/>estado_sub: <br/>created_at: 2024-12-03 00:37:53<br/>updated_at: 2024-12-03 00:37:53<br/>', NULL, 'PUBLICACIONES', '2024-12-03', '00:37:53', '2024-12-03 04:37:53', '2024-12-03 04:37:53'),
(75, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 27<br/>user_id: 2<br/>categoria: ECOLÓGICO<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 4000.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-03<br/>hora_limite: 02:01<br/>monto_garantia: 2000.00<br/>estado_sub: 0<br/>created_at: 2024-12-02 12:08:30<br/>updated_at: 2024-12-03 00:49:56<br/>', NULL, 'PUBLICACIONES', '2024-12-03', '00:49:56', '2024-12-03 04:49:56', '2024-12-03 04:49:56'),
(76, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 27<br/>user_id: 2<br/>categoria: ECOLÓGICO<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 4000.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-04<br/>hora_limite: 12:00<br/>monto_garantia: 2000.00<br/>estado_sub: 0<br/>created_at: 2024-12-02 12:08:30<br/>updated_at: 2024-12-03 00:50:02<br/>', NULL, 'PUBLICACIONES', '2024-12-03', '00:50:02', '2024-12-03 04:50:02', '2024-12-03 04:50:02'),
(77, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 27<br/>user_id: 2<br/>categoria: ECOLÓGICO<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 4000.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-04<br/>hora_limite: 12:00:00<br/>monto_garantia: 2000<br/>estado_sub: 0<br/>created_at: 2024-12-02 12:08:30<br/>updated_at: 2024-12-03 00:52:34<br/>', NULL, 'PUBLICACIONES', '2024-12-03', '00:52:34', '2024-12-03 04:52:34', '2024-12-03 04:52:34'),
(78, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 29<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 50000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 20000.00<br/>estado_sub: 0<br/>created_at: 2024-12-03 00:37:53<br/>updated_at: 2024-12-03 00:37:53<br/>', NULL, 'PUBLICACIONES', '2024-12-03', '00:53:11', '2024-12-03 04:53:11', '2024-12-03 04:53:11'),
(79, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 29<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 50000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 20000.00<br/>estado_sub: 0<br/>created_at: 2024-12-03 00:37:53<br/>updated_at: 2024-12-03 00:37:53<br/>', NULL, 'PUBLICACIONES', '2024-12-03', '00:56:28', '2024-12-03 04:56:28', '2024-12-03 04:56:28'),
(80, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 29<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 35000<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 20000.00<br/>estado_sub: 0<br/>created_at: 2024-12-03 00:37:53<br/>updated_at: 2024-12-03 01:45:26<br/>', NULL, 'PUBLICACIONES', '2024-12-03', '01:45:26', '2024-12-03 05:45:26', '2024-12-03 05:45:26'),
(81, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PUBLICACIÓN', 'id: 30<br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 10000<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-12-04<br/>hora_limite: 10:00<br/>monto_garantia: 5000<br/>estado_sub: <br/>created_at: 2024-12-03 11:33:59<br/>updated_at: 2024-12-03 11:33:59<br/>', NULL, 'PUBLICACIONES', '2024-12-03', '11:33:59', '2024-12-03 15:33:59', '2024-12-03 15:33:59'),
(82, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PUBLICACIÓN', 'id: 31<br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 10000<br/>ubicacion: SANTA CRUZ<br/>observaciones: <br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00<br/>monto_garantia: 5000<br/>estado_sub: <br/>created_at: 2024-12-07 00:44:10<br/>updated_at: 2024-12-07 00:44:10<br/>', NULL, 'PUBLICACIONES', '2024-12-07', '00:44:11', '2024-12-07 04:44:11', '2024-12-07 04:44:11'),
(83, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:06:30<br/>', 'id: 1<br/>user_id: 3<br/>nombre: <br/>paterno: <br/>materno: <br/>ci: <br/>complemento: <br/>ci_exp: <br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:23:30<br/>', 'CLIENTES', '2024-12-09', '17:23:30', '2024-12-09 21:23:30', '2024-12-09 21:23:30'),
(84, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: <br/>paterno: <br/>materno: <br/>ci: <br/>complemento: <br/>ci_exp: <br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:23:30<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'CLIENTES', '2024-12-09', '17:25:13', '2024-12-09 21:25:13', '2024-12-09 21:25:13'),
(85, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'CLIENTES', '2024-12-09', '17:25:22', '2024-12-09 21:25:22', '2024-12-09 21:25:22');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(86, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'CLIENTES', '2024-12-09', '17:27:21', '2024-12-09 21:27:21', '2024-12-09 21:27:21'),
(87, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'CLIENTES', '2024-12-09', '17:30:14', '2024-12-09 21:30:14', '2024-12-09 21:30:14'),
(88, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'CLIENTES', '2024-12-09', '17:31:02', '2024-12-09 21:31:02', '2024-12-09 21:31:02'),
(89, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'CLIENTES', '2024-12-09', '17:31:12', '2024-12-09 21:31:12', '2024-12-09 21:31:12'),
(90, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'CLIENTES', '2024-12-09', '17:31:54', '2024-12-09 21:31:54', '2024-12-09 21:31:54'),
(91, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131731936498.jpeg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:25:13<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733779992.jpg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:33:12<br/>', 'CLIENTES', '2024-12-09', '17:33:12', '2024-12-09 21:33:12', '2024-12-09 21:33:12'),
(92, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733779992.jpg<br/>foto_ci_reverso: 131731936498.png<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:33:12<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:34:17<br/>', 'CLIENTES', '2024-12-09', '17:34:17', '2024-12-09 21:34:17', '2024-12-09 21:34:17'),
(93, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:34:17<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINESS<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:34:36<br/>', 'CLIENTES', '2024-12-09', '17:34:36', '2024-12-09 21:34:36', '2024-12-09 21:34:36'),
(94, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINESS<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:34:36<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:34:41<br/>', 'CLIENTES', '2024-12-09', '17:34:41', '2024-12-09 21:34:41', '2024-12-09 21:34:41'),
(95, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:34:41<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:34:41<br/>', 'CLIENTES', '2024-12-09', '17:36:36', '2024-12-09 21:36:36', '2024-12-09 21:36:36'),
(96, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:34:41<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 4344334<br/>complemento: F<br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:37:18<br/>', 'CLIENTES', '2024-12-09', '17:37:18', '2024-12-09 21:37:18', '2024-12-09 21:37:18'),
(97, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 4344334<br/>complemento: F<br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:37:18<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: F<br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:37:27<br/>', 'CLIENTES', '2024-12-09', '17:37:27', '2024-12-09 21:37:27', '2024-12-09 21:37:27'),
(98, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: F<br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:37:27<br/>', 'id: 1<br/>user_id: 3<br/>nombre: CARLOS<br/>paterno: MARTINES<br/>materno: CHOQUE<br/>ci: 1234567<br/>complemento: <br/>ci_exp: LP<br/>fono: 7777777<br/>dpto_residencia: LA PAZ<br/>email: carlos@gmail.com<br/>foto_ci_anverso: 131733780057.png<br/>foto_ci_reverso: 131733780057.jpeg<br/>banco: BANCO DE CRÉDITO DE BOLIVIA S.A.<br/>nro_cuenta: 100000121212<br/>moneda: BOLIVIANOS<br/>fecha_registro: 2024-11-13<br/>created_at: 2024-11-13 16:33:34<br/>updated_at: 2024-12-09 17:37:36<br/>', 'CLIENTES', '2024-12-09', '17:37:36', '2024-12-09 21:37:36', '2024-12-09 21:37:36'),
(99, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 4<br/>nombre: ADMINISTRADOR<br/>permisos: 0<br/>usuarios: <br/>created_at: 2024-12-09 19:57:55<br/>updated_at: 2024-12-09 19:57:55<br/>', NULL, 'ROLES', '2024-12-09', '19:57:55', '2024-12-09 23:57:55', '2024-12-09 23:57:55'),
(100, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 27<br/>usuario: FPAREDES<br/>nombres: FERNANDO<br/>apellidos: PAREDES<br/>password: $2y$12$e8pNAaUdRynS3MUpWevhiO6XTaZXVfNBG6hDwXqbhFcHMA8yi0il2<br/>role_id: 4<br/>acceso: 1<br/>foto: <br/>fecha_registro: 2024-12-09<br/>ultima_sesion: <br/>status: <br/>created_at: 2024-12-09 19:58:09<br/>updated_at: 2024-12-09 19:58:09<br/>', NULL, 'USUARIOS', '2024-12-09', '19:58:09', '2024-12-09 23:58:09', '2024-12-09 23:58:09'),
(101, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA PUBLICACIÓN', 'id: 23<br/>user_id: 15<br/>categoria: ECOLÓGICO<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 60000.00<br/>ubicacion: COCHABAMBA<br/>observaciones: LOTE DE TERRENO<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00:00<br/>monto_garantia: 6000.00<br/>estado_sub: 6<br/>created_at: 2024-11-20 20:03:48<br/>updated_at: 2024-12-11 13:55:03<br/>', NULL, 'PUBLICACIONES', '2024-12-11', '13:55:03', '2024-12-11 17:55:03', '2024-12-11 17:55:03'),
(102, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA PUBLICACIÓN', 'id: 22<br/>user_id: 15<br/>categoria: ECOLÓGICO<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 30000.00<br/>ubicacion: LA PAZ<br/>observaciones: TERRENO<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00:00<br/>monto_garantia: 3000.00<br/>estado_sub: 6<br/>created_at: 2024-11-20 20:01:32<br/>updated_at: 2024-12-11 14:07:55<br/>', NULL, 'PUBLICACIONES', '2024-12-11', '14:07:55', '2024-12-11 18:07:55', '2024-12-11 18:07:55'),
(103, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA PUBLICACIÓN', 'id: 22<br/>user_id: 15<br/>categoria: ECOLÓGICO<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 30000.00<br/>ubicacion: LA PAZ<br/>observaciones: TERRENO<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00:00<br/>monto_garantia: 3000.00<br/>estado_sub: 6<br/>created_at: 2024-11-20 20:01:32<br/>updated_at: 2024-12-11 14:09:46<br/>', NULL, 'PUBLICACIONES', '2024-12-11', '14:09:46', '2024-12-11 18:09:46', '2024-12-11 18:09:46'),
(104, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA PUBLICACIÓN', 'id: 22<br/>user_id: 15<br/>categoria: ECOLÓGICO<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 30000.00<br/>ubicacion: LA PAZ<br/>observaciones: TERRENO<br/>fecha_limite: 2024-11-26<br/>hora_limite: 18:00:00<br/>monto_garantia: 3000.00<br/>estado_sub: 6<br/>created_at: 2024-11-20 20:01:32<br/>updated_at: 2024-12-11 14:10:48<br/>', NULL, 'PUBLICACIONES', '2024-12-11', '14:10:48', '2024-12-11 18:10:48', '2024-12-11 18:10:48'),
(105, 2, 'CREACIÓN', 'EL USUARIO JPERES REGISTRO UNA PUBLICACIÓN', 'id: 32<br/>nro: <br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 50000<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-23<br/>hora_limite: 12:00<br/>monto_garantia: 20000<br/>estado_sub: <br/>created_at: 2024-12-16 09:35:27<br/>updated_at: 2024-12-16 09:35:27<br/>', NULL, 'PUBLICACIONES', '2024-12-16', '09:35:27', '2024-12-16 13:35:27', '2024-12-16 13:35:27'),
(106, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA PUBLICACIÓN', 'id: 32<br/>nro: <br/>user_id: 2<br/>categoria: VEHÍCULOS<br/>moneda: BOLIVIANOS (BS)<br/>oferta_inicial: 50000.00<br/>ubicacion: LA PAZ<br/>observaciones: <br/>fecha_limite: 2024-12-23<br/>hora_limite: 12:00:00<br/>monto_garantia: 20000.00<br/>estado_sub: 6<br/>created_at: 2024-12-16 09:35:27<br/>updated_at: 2024-12-16 09:38:11<br/>', NULL, 'PUBLICACIONES', '2024-12-16', '09:38:11', '2024-12-16 13:38:11', '2024-12-16 13:38:11'),
(107, 2, 'MODIFICACIÓN', 'EL USUARIO JPERES MODIFICÓ UNA PUBLICACIÓN', 'id: 29<br/>nro: <br/>user_id: 2<br/>categoria: OTROS BIENES<br/>moneda: DÓLARES (USD)<br/>oferta_inicial: 35000.00<br/>ubicacion: LA PAZ<br/>observaciones: OBS<br/>fecha_limite: 2024-12-20<br/>hora_limite: 12:00:00<br/>monto_garantia: 20000.00<br/>estado_sub: 0<br/>created_at: 2024-12-03 00:37:53<br/>updated_at: 2024-12-03 01:45:26<br/>', NULL, 'PUBLICACIONES', '2024-12-17', '08:36:17', '2024-12-17 12:36:17', '2024-12-17 12:36:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_ofertas`
--

CREATE TABLE `historial_ofertas` (
  `id` bigint UNSIGNED NOT NULL,
  `subasta_cliente_id` bigint UNSIGNED NOT NULL,
  `subasta_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `puja` decimal(24,2) NOT NULL,
  `fecha_oferta` date DEFAULT NULL,
  `hora_oferta` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_ofertas`
--

INSERT INTO `historial_ofertas` (`id`, `subasta_cliente_id`, `subasta_id`, `cliente_id`, `puja`, `fecha_oferta`, `hora_oferta`, `created_at`, `updated_at`) VALUES
(1, 15, 21, 2, 3000.00, '2024-12-02', '13:47:22', '2024-12-02 17:47:22', '2024-12-02 17:47:22'),
(2, 16, 21, 1, 3001.00, '2024-12-02', '13:48:00', '2024-12-02 17:47:32', '2024-12-02 17:47:32'),
(3, 17, 22, 1, 20000.00, '2024-12-02', '13:56:00', '2024-12-02 17:56:06', '2024-12-02 17:56:06'),
(4, 18, 22, 3, 20500.00, '2024-12-02', '13:58:00', '2024-12-02 17:58:22', '2024-12-02 17:58:22'),
(5, 18, 22, 3, 20501.00, '2024-12-02', '13:58:52', '2024-12-02 17:58:52', '2024-12-02 17:58:52'),
(6, 16, 21, 1, 3006.00, '2024-12-02', '13:33:00', '2024-12-02 17:33:07', '2024-12-02 17:33:07'),
(7, 15, 21, 2, 3007.00, '2024-12-02', '13:34:00', '2024-12-02 17:34:31', '2024-12-02 17:34:31'),
(8, 15, 21, 2, 3008.00, '2024-12-02', '13:35:00', '2024-12-02 17:35:45', '2024-12-02 17:35:45'),
(9, 15, 21, 2, 3009.00, '2024-12-02', '13:37:00', '2024-12-02 17:37:59', '2024-12-02 17:37:59'),
(10, 16, 21, 1, 3010.00, '2024-12-02', '13:38:00', '2024-12-02 17:38:21', '2024-12-02 17:38:21'),
(11, 15, 21, 2, 3011.00, '2024-12-02', '13:42:00', '2024-12-02 17:42:15', '2024-12-02 17:42:15'),
(12, 16, 21, 1, 3012.00, '2024-12-02', '13:49:00', '2024-12-02 17:49:52', '2024-12-02 17:49:52'),
(13, 15, 21, 2, 3013.00, '2024-12-02', '13:52:00', '2024-12-02 17:52:19', '2024-12-02 17:52:19'),
(14, 16, 21, 1, 3014.00, '2024-12-02', '13:53:00', '2024-12-02 17:53:16', '2024-12-02 17:53:16'),
(15, 15, 21, 2, 3015.00, '2024-12-02', '13:54:00', '2024-12-02 17:54:12', '2024-12-02 17:54:12'),
(16, 16, 21, 1, 3016.00, '2024-12-02', '13:54:00', '2024-12-02 17:54:50', '2024-12-02 17:54:50'),
(17, 16, 21, 1, 3017.00, '2024-12-02', '13:56:00', '2024-12-02 17:56:37', '2024-12-02 17:56:37'),
(18, 15, 21, 2, 3018.00, '2024-12-02', '13:56:00', '2024-12-02 17:56:42', '2024-12-02 17:56:42'),
(19, 16, 21, 1, 3019.00, '2024-12-02', '13:59:00', '2024-12-02 17:59:38', '2024-12-02 17:59:38'),
(20, 15, 21, 2, 3020.00, '2024-12-02', '13:59:00', '2024-12-02 17:59:49', '2024-12-02 17:59:49'),
(21, 17, 22, 1, 20502.00, '2024-12-02', '14:04:00', '2024-12-02 18:04:28', '2024-12-02 18:04:28'),
(22, 18, 22, 3, 20503.00, '2024-12-02', '14:04:00', '2024-12-02 18:04:43', '2024-12-02 18:04:43'),
(23, 19, 23, 1, 4000.00, '2024-12-03', '01:01:00', '2024-12-03 05:01:02', '2024-12-03 05:01:02'),
(24, 20, 23, 2, 4001.00, '2024-12-03', '01:05:00', '2024-12-03 05:05:07', '2024-12-03 05:05:07'),
(25, 19, 23, 1, 4500.00, '2024-12-03', '01:05:00', '2024-12-03 05:05:30', '2024-12-03 05:05:30'),
(26, 26, 24, 19, 10000.00, '2024-12-09', '20:09:00', '2024-12-10 00:09:42', '2024-12-10 00:09:42'),
(27, 26, 24, 19, 10001.00, '2024-12-09', '20:15:00', '2024-12-10 00:15:17', '2024-12-10 00:15:17'),
(28, 25, 24, 20, 10002.00, '2024-12-09', '20:16:00', '2024-12-10 00:16:24', '2024-12-10 00:16:24'),
(29, 26, 24, 19, 10003.00, '2024-12-09', '20:17:00', '2024-12-10 00:17:10', '2024-12-10 00:17:10'),
(30, 25, 24, 20, 10004.00, '2024-12-09', '20:17:00', '2024-12-10 00:17:39', '2024-12-10 00:17:39'),
(31, 27, 22, 2, 20504.00, '2024-12-13', '11:37:00', '2024-12-13 15:37:18', '2024-12-13 15:37:18'),
(32, 29, 26, 1, 35000.00, '2024-12-17', '08:43:00', '2024-12-17 12:43:43', '2024-12-17 12:43:43'),
(33, 28, 26, 2, 35001.00, '2024-12-17', '08:43:00', '2024-12-17 12:43:51', '2024-12-17 12:43:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` bigint UNSIGNED NOT NULL,
  `modulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `accion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(20, 'Reportes', 'reportes.clientes', 'REPORTE DE CLIENTES', 'GENERAR REPORTES DE LOS CLIENTES REGISTRADOS', '2024-11-18 16:10:12', '2024-11-18 16:10:12'),
(21, 'Clientes', 'clientes.index', 'VER', 'VER LA LISTA DE CLIENTES', NULL, NULL),
(22, 'Clientes', 'clientes.edit', 'EDITAR CLIENTE', 'MODIFICAR LA CONTRASEÑA DE LOS CLIENTES', NULL, NULL),
(23, 'Clientes', 'clientes.destroy', 'ELIMINAR', 'ELIMINAR CLIENTES', NULL, NULL),
(24, 'Publicaciones', 'publicacions.aprobar_comprobante', 'APROBAR COMPROBANTES DE PAGOS', 'APROBAR COMPROBANTE DE PAGO', NULL, NULL),
(25, 'Publicaciones', 'publicacions.rechazar_comprobante', 'RECHAZAR COMPROBANTES DE PAGOS', 'RECHAZAR COMPROBANTE DE PAGO', NULL, NULL),
(26, 'Publicaciones', 'publicacions.destroy_habilitado', 'ELIMINAR HABILITADOS', 'ELIMINAR PUBLICACIONES HABILITADAS', '2024-11-18 16:10:12', '2024-11-18 16:10:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacions`
--

CREATE TABLE `notificacions` (
  `id` bigint UNSIGNED NOT NULL,
  `descripcion` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `modulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(3, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-11-16', '15:43:00', 'SUBASTA CLIENTE', 3, '2024-11-16 19:43:37', '2024-11-16 19:43:37'),
(4, 'PAMELA ORTEGA CASTRO REGISTRO SU COMPROBANTE', '2024-11-20', '17:43:00', 'SUBASTA CLIENTE', 4, '2024-11-20 21:43:41', '2024-11-20 21:43:41'),
(5, 'RODRIGO MEDINA PACOSILLO REGISTRO SU COMPROBANTE', '2024-11-20', '17:47:00', 'SUBASTA CLIENTE', 5, '2024-11-20 21:47:00', '2024-11-20 21:47:00'),
(6, 'MARCELO APAZA QUINO REGISTRO SU COMPROBANTE', '2024-11-21', '15:31:00', 'SUBASTA CLIENTE', 6, '2024-11-21 19:31:04', '2024-11-21 19:31:04'),
(7, 'CARLOS MEDRANO MONTES REGISTRO SU COMPROBANTE', '2024-11-21', '15:35:00', 'SUBASTA CLIENTE', 7, '2024-11-21 19:35:27', '2024-11-21 19:35:27'),
(8, 'CARLOS MEDRANO MONTES REGISTRO SU COMPROBANTE', '2024-11-21', '21:39:00', 'SUBASTA CLIENTE', 8, '2024-11-22 01:39:01', '2024-11-22 01:39:01'),
(9, 'RAMIRO FERNANDEZ LOPEZ REGISTRO SU COMPROBANTE', '2024-11-21', '22:03:00', 'SUBASTA CLIENTE', 9, '2024-11-22 02:03:44', '2024-11-22 02:03:44'),
(10, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-11-21', '23:54:00', 'SUBASTA CLIENTE', 10, '2024-11-22 03:54:18', '2024-11-22 03:54:18'),
(11, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-11-22', '03:45:00', 'SUBASTA CLIENTE', 11, '2024-11-22 07:45:57', '2024-11-22 07:45:57'),
(12, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-11-26', '03:38:00', 'SUBASTA CLIENTE', 12, '2024-11-26 07:38:53', '2024-11-26 07:38:53'),
(13, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-11-26', '04:31:00', 'SUBASTA CLIENTE', 13, '2024-11-26 08:31:52', '2024-11-26 08:31:52'),
(14, 'CARLOS MARTINES CHOQUE REGISTRO SU COMPROBANTE', '2024-11-26', '04:33:00', 'SUBASTA CLIENTE', 14, '2024-11-26 08:33:09', '2024-11-26 08:33:09'),
(15, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-11-27', '20:35:00', 'SUBASTA CLIENTE', 13, '2024-11-28 00:35:28', '2024-11-28 00:35:28'),
(16, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-12-02', '13:20:00', 'SUBASTA CLIENTE', 15, '2024-12-02 17:20:34', '2024-12-02 17:20:34'),
(17, 'CARLOS MARTINES CHOQUE REGISTRO SU COMPROBANTE', '2024-12-02', '13:32:00', 'SUBASTA CLIENTE', 16, '2024-12-02 17:32:35', '2024-12-02 17:32:35'),
(18, 'CARLOS MARTINES CHOQUE REGISTRO SU COMPROBANTE', '2024-12-02', '13:55:00', 'SUBASTA CLIENTE', 17, '2024-12-02 17:55:26', '2024-12-02 17:55:26'),
(19, 'PABLO MARTINEZ RAMIRES REGISTRO SU COMPROBANTE', '2024-12-02', '13:56:00', 'SUBASTA CLIENTE', 18, '2024-12-02 17:56:19', '2024-12-02 17:56:19'),
(20, 'CARLOS MARTINES CHOQUE REGISTRO SU COMPROBANTE', '2024-12-03', '00:57:00', 'SUBASTA CLIENTE', 19, '2024-12-03 04:57:09', '2024-12-03 04:57:09'),
(21, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-12-03', '01:03:00', 'SUBASTA CLIENTE', 20, '2024-12-03 05:03:10', '2024-12-03 05:03:10'),
(22, 'PEDRO MARQUEZ SOLANO REGISTRO SU COMPROBANTE', '2024-12-07', '00:53:00', 'SUBASTA CLIENTE', 21, '2024-12-07 04:53:32', '2024-12-07 04:53:32'),
(23, 'FRANZ MARTINES CORDOVA REGISTRO SU COMPROBANTE', '2024-12-07', '00:54:00', 'SUBASTA CLIENTE', 22, '2024-12-07 04:54:25', '2024-12-07 04:54:25'),
(24, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-12-07', '01:32:00', 'SUBASTA CLIENTE', 23, '2024-12-07 05:32:28', '2024-12-07 05:32:28'),
(25, 'CARLOS MARTINES CHOQUE REGISTRO SU COMPROBANTE', '2024-12-09', '16:17:00', 'SUBASTA CLIENTE', 24, '2024-12-09 20:17:48', '2024-12-09 20:17:48'),
(26, 'FERNANDA MARQUEZ REGISTRO SU COMPROBANTE', '2024-12-09', '20:07:00', 'SUBASTA CLIENTE', 25, '2024-12-10 00:07:04', '2024-12-10 00:07:04'),
(27, 'SANDRO BALTAZAR REGISTRO SU COMPROBANTE', '2024-12-09', '20:07:00', 'SUBASTA CLIENTE', 26, '2024-12-10 00:07:28', '2024-12-10 00:07:28'),
(28, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-12-13', '11:36:00', 'SUBASTA CLIENTE', 27, '2024-12-13 15:36:52', '2024-12-13 15:36:52'),
(29, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-12-17', '08:36:00', 'SUBASTA CLIENTE', 28, '2024-12-17 12:36:51', '2024-12-17 12:36:51'),
(30, 'CARLOS MARTINES CHOQUE REGISTRO SU COMPROBANTE', '2024-12-17', '08:41:00', 'SUBASTA CLIENTE', 29, '2024-12-17 12:41:57', '2024-12-17 12:41:57'),
(31, 'MARIA PAREDES MAMANI REGISTRO SU COMPROBANTE', '2024-12-17', '08:45:00', 'SUBASTA CLIENTE', 30, '2024-12-17 12:45:48', '2024-12-17 12:45:48'),
(32, 'CARLOS MARTINES CHOQUE REGISTRO SU COMPROBANTE', '2024-12-17', '08:47:00', 'SUBASTA CLIENTE', 31, '2024-12-17 12:47:17', '2024-12-17 12:47:17');

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
(3, 3, 2, 1, '2024-11-16 19:43:37', '2024-11-16 20:06:27'),
(4, 4, 15, 1, '2024-11-20 21:43:41', '2024-11-20 21:48:31'),
(5, 5, 15, 1, '2024-11-20 21:47:00', '2024-11-20 21:48:53'),
(6, 6, 15, 1, '2024-11-21 19:31:04', '2024-11-21 19:31:51'),
(7, 7, 15, 1, '2024-11-21 19:35:27', '2024-11-21 19:36:04'),
(8, 8, 15, 1, '2024-11-22 01:39:01', '2024-11-22 01:52:26'),
(9, 9, 15, 1, '2024-11-22 02:03:44', '2024-11-22 02:04:03'),
(10, 10, 15, 0, '2024-11-22 03:54:18', '2024-11-22 03:54:18'),
(11, 11, 15, 0, '2024-11-22 07:45:57', '2024-11-22 07:45:57'),
(12, 12, 15, 0, '2024-11-26 07:38:53', '2024-11-26 07:38:53'),
(13, 13, 2, 1, '2024-11-26 08:31:52', '2024-11-26 08:31:57'),
(14, 14, 2, 1, '2024-11-26 08:33:09', '2024-11-26 08:33:15'),
(15, 15, 2, 1, '2024-11-28 00:35:28', '2024-11-28 01:05:45'),
(16, 16, 2, 1, '2024-12-02 17:20:34', '2024-12-02 17:23:19'),
(17, 17, 2, 1, '2024-12-02 17:32:35', '2024-12-02 16:14:39'),
(18, 18, 4, 1, '2024-12-02 17:55:26', '2024-12-02 17:57:04'),
(19, 19, 4, 1, '2024-12-02 17:56:19', '2024-12-02 17:57:01'),
(20, 20, 2, 0, '2024-12-03 04:57:09', '2024-12-03 04:57:09'),
(21, 21, 2, 1, '2024-12-03 05:03:10', '2024-12-03 05:03:18'),
(22, 22, 2, 0, '2024-12-07 04:53:32', '2024-12-07 04:53:32'),
(23, 23, 2, 1, '2024-12-07 04:54:25', '2024-12-14 16:36:09'),
(24, 24, 2, 1, '2024-12-07 05:32:28', '2024-12-14 16:36:07'),
(25, 25, 2, 1, '2024-12-09 20:17:48', '2024-12-14 16:36:05'),
(26, 26, 2, 1, '2024-12-10 00:07:04', '2024-12-14 16:36:03'),
(27, 27, 2, 1, '2024-12-10 00:07:28', '2024-12-14 14:06:53'),
(28, 28, 4, 0, '2024-12-13 15:36:52', '2024-12-13 15:36:52'),
(29, 29, 2, 0, '2024-12-17 12:36:51', '2024-12-17 12:36:51'),
(30, 30, 2, 0, '2024-12-17 12:41:57', '2024-12-17 12:41:57'),
(31, 31, 2, 0, '2024-12-17 12:45:48', '2024-12-17 12:45:48'),
(32, 32, 2, 1, '2024-12-17 12:47:17', '2024-12-17 13:00:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametrizacions`
--

CREATE TABLE `parametrizacions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `inactividad_cliente` int NOT NULL,
  `tipo_cambio` decimal(24,2) NOT NULL,
  `servidor_correo` json NOT NULL,
  `datos_banco` json NOT NULL,
  `nro_imagenes_pub` int NOT NULL,
  `tiempo_pub` int NOT NULL,
  `terminos_condiciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verificar_comprobante` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comp_rechazado` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `parametrizacions`
--

INSERT INTO `parametrizacions` (`id`, `user_id`, `inactividad_cliente`, `tipo_cambio`, `servidor_correo`, `datos_banco`, `nro_imagenes_pub`, `tiempo_pub`, `terminos_condiciones`, `verificar_comprobante`, `comp_rechazado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 6.96, '{\"host\": \"smtp.hostinger.com\", \"correo\": \"mensaje@emsytsrl.com\", \"driver\": \"smtp\", \"nombre\": \"unibienes\", \"puerto\": \"587\", \"password\": \"8Z@d>&kj^y\", \"encriptado\": \"tls\"}', '{\"qr\": \"1733204666.png\", \"banco\": \"BANCO UNIÓN\", \"titular\": \"NOMBRE TITULAR\", \"nro_cuenta\": \"111110002222\"}', 3, 2, '<h4>TÉRMINOS Y CONDICIONES </h4>\n<p><strong>1. Adhesión.</strong> El proponente, de manera libre y voluntaria, se adhiere a los términos y condiciones aquí señalados. </p>\n<p><strong>2. Medio formal de comunicaciones.</strong> Todos los actos relacionados a la subasta electrónica serán comunicados única y exclusivamente a través del correo electrónico. </p>\n<p><strong>3. Catálogo de Lotes y Bienes Recuperados Individuales.</strong> El proponente podrá consultar, a través del catálogo electrónico alojado en el Portal Oficial de Subastas de UNIBIENES S.A., los Bienes Recuperados a subastarse, el plazo para la recepción de ofertas y la ubicación de estas. </p>\n<p><strong>4. Exhibición de las Bienes Recuperados a subastar.</strong> Los proponentes podrán observar las Bienes Recuperados físicamente en los días y horas señalados en el Portal Oficial de Subastas de UNIBIENES S.A. de igual forma los \n    proponentes, deberán cumplir con las medidas de seguridad correspondientes, previo a su ingreso a los predios almacenados por UNIBIENES S.A. donde se encuentren las Bienes Recuperados de su interés. </p>\n<p><strong>5. Pago de Garantía.</strong> El proponente deberá realizar el depósito de garantía a la cuenta establecida de UNIBIENES S.A., a través de cualquiera de las entidades financieras correspondientes o mediante servicios de banca electrónica.</p>\n<p><strong>6. Registro de Ofertas.</strong> Los proponentes registrarán sus ofertas a través del Portal Oficial de Subastas. Para los fines de adjudicación del Lote o Bien Recuperado Individual, únicamente serán consideradas las propuestas presentadas dentro del plazo establecido según convocatoria.</p>\n<p><strong>7. Adjudicación.</strong> Será declarado ganador el proponente que haya ofertado el precio más alto por el Bien Recuperado a momento del cierre de ofertas en el Portal Oficial de Subastas.</p>\n<p><strong>8. Pago de la Oferta por Bienes Recuperados.</strong> El proponente deberá realizar el pago del monto ofertado por el Bien Recuperado a la cuenta establecida por UNIBIENES S.A. a través de cualquier entidad financiera o mediante servicios de banca electrónica.</p>\n<p>El pago de la oferta por el Bien Recuperado deberá realizarse en un plazo máximo de tres (3) días hábiles, computables a partir de la entrega de la nota de adjudicación al proponente. En caso que el proponente no realice el pago, le otorga a UNIBIENES S.A. la facultad para ejecutar la garantía depositada.</p>\n<p><strong>9. Adjudicación.</strong> Realizado el pago del monto ofertado, UNIBIENES S.A. verificará y notificará la recepción del pago al proponente adjudicado, a través del correo electrónico, o cualquier otro medio verificable.</p>\n<p><strong>10. Retiro de las Bienes Recuperados adjudicados.</strong> El proponente adjudicado deberá retirar las Bienes Recuperados adjudicados del almacén de UNIBIENES S.A. en un plazo no mayor a quince (15) días hábiles, computables a partir del cambio de nombre del bien sujeto a registro o notificación de recepción del pago (para bienes no sujetos a registro).</p>\n<p>En caso de no retirar los bienes recuperados adjudicados dentro de los quince (15) días, se deberá pagar los costos de guardaje por día adicional computables desde el día hábil dieciséis (16). Si el Bien Recuperado no es retirado dentro de los treinta (30) días hábiles siguientes, el proponente adjudicado deberá abonar a cuentas de la Compañía un 3% adicional mensual del monto total de la adjudicación por incumplimiento a los plazos de retiro de los bienes recuperados adjudicados. Si los costos de guardaje y el porcentaje de abono por no recojo (incumplimiento a plazos de recojo) ascienden al monto de la oferta pagada por el bien recuperado adjudicado, el proponente acepta perder el derecho a la adjudicación del bien recuperado y UNIBIENES S.A. podrá disponer del bien recuperado no adjudicado.</p>\n<p><strong>11. Privacidad de información.</strong> La información personal proporcionada por el proponente, tendrá carácter confidencial.</p>\n<p><strong>12. Restricciones.</strong> UNIBIENES S.A. se reserva el derecho de aplicar restricciones a los proponentes ante la verificación de consulta en listas especiales o la evidencia de comportamientos prohibidos que afecten a los proponentes o intereses de UNIBIENES S.A.</p>\n<p><strong>13. Responsabilidades.</strong> UNIBIENES S.A. no asume responsabilidad alguna por cualquier acción o perjuicio que pudiera resultar por la calidad, funcionalidad o información introducida en el Portal Oficial de Subastas y que pudieren derivar en la reprogramación de periodos de oferta, suspensión o finalización excepcional de la subasta.</p>\n<p>El proponente acepta que al realizar transacciones vía internet con UNIBIENES S.A. lo hace bajo su propio riesgo, en ningún caso UNIBIENES S.A. se hace responsable por lucro cesante o por cualquier otro perjuicio que haya podido sufrir, debido a las transacciones realizadas o no realizadas.</p>\n<p><strong>14. Devolución de Garantía.</strong> UNIBIENES S.A. procederá a la devolución del depósito de garantía al proponente no adjudicado en un plazo de siete (7) días hábiles aproximadamente.</p>\n<p><strong>15. Soporte técnico para el uso del Portal Oficial de Subastas.</strong> El proponente podrá solicitar a UNIBIENES S.A., soporte técnico a través de los medios de contacto formales por problemas o errores en el uso del Portal Oficial de Subastas.</p>\n<p><strong>16. Modificación.</strong> UNIBIENES S.A. podrá modificar los Términos y Condiciones sin previo aviso, siendo estos cambios aplicables a todas las operaciones efectuados en el Portal Oficial de la Subastas de UNIBIENES S.A. según el periodo de vigencia de los procesos.</p>', 'Estamos verificando tu comprobante y te enviaremos un correo de confirmación para que pueda realizar tus ofertas/pujas. Cualquiera información comunicarse al <strong>77256805</strong>', 'TU COMPROBANTE FUE RECHAZADO, ENVÍANOS UN COMPROBANTE LEGIBLE. CUALQUIER CONSULTA O DUDA COMUNÍCATE AL SIGUIENTE CORREO ELECTRÓNICO INSTITUCIONAL: XXXXXXXXXXXXXX@UNIBIENES.COM.BO Y EN CASO DE NO RECIBIR UNA REPUESTA PRONTA COMUNÍCATE AL SIGUIENTE NÚMERO XXXXX</br>\n<p><b>Nueva linea</b></p>', '2024-11-16 20:43:43', '2024-12-16 14:30:35');

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
(8, 3, 19, '2024-11-17 01:24:49', '2024-11-17 01:24:49'),
(14, 3, 21, '2024-11-22 07:59:22', '2024-11-22 07:59:22'),
(18, 3, 24, '2024-11-26 07:47:46', '2024-11-26 07:47:46'),
(19, 3, 25, '2024-11-26 07:47:50', '2024-11-26 07:47:50'),
(20, 4, 1, '2024-12-09 23:58:15', '2024-12-09 23:58:15'),
(21, 4, 2, '2024-12-09 23:58:16', '2024-12-09 23:58:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacions`
--

CREATE TABLE `publicacions` (
  `id` bigint UNSIGNED NOT NULL,
  `nro` bigint DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `categoria` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `moneda` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `oferta_inicial` decimal(24,2) NOT NULL,
  `ubicacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `publicacions` (`id`, `nro`, `user_id`, `categoria`, `moneda`, `oferta_inicial`, `ubicacion`, `observaciones`, `fecha_limite`, `hora_limite`, `monto_garantia`, `estado_sub`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 1000.00, 'LA PAZ', 'OBSERVACIONES PUBLICACION UNO', '2024-11-16', '16:58:00', 600.00, 3, '2024-11-13 03:47:31', '2024-12-17 13:34:48'),
(4, 2, 2, 'OTROS BIENES', 'DÓLARES (USD)', 20000.00, 'LA PAZ', 'OBS. PUBLICACION', '2024-11-20', '10:00:00', 10000.00, 3, '2024-11-13 18:32:59', '2024-12-17 14:29:07'),
(5, NULL, 4, 'VEHÍCULOS', 'DÓLARES (USD)', 8000.00, 'COCHABAMBA', 'OBS. VEHICULO', '2024-12-20', '12:00:00', 1000.00, 0, '2024-11-13 22:15:26', '2024-12-02 18:49:07'),
(6, 3, 6, 'VEHÍCULOS', 'DÓLARES (USD)', 1000.00, 'LA PAZ', 'OBS', '2024-11-30', '12:00:00', 5000.00, 3, '2024-11-20 08:08:13', '2024-12-16 13:31:24'),
(7, 4, 4, 'VEHÍCULOS', 'DÓLARES (USD)', 20000.00, 'COCHABAMBA', 'OBS', '2024-11-30', '12:00:00', 10000.00, 3, '2024-11-20 08:13:24', '2024-12-16 13:31:24'),
(8, 5, 15, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 150000.00, 'LA PAZ', 'VEHÍCULO', '2024-11-22', '18:00:00', 20000.00, 3, '2024-11-20 21:28:57', '2024-12-16 13:31:24'),
(9, 6, 15, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 100000.00, 'LA PAZ', 'VEHÍCULO', '2024-11-22', '18:00:00', 10000.00, 3, '2024-11-20 21:32:37', '2024-12-16 13:31:24'),
(10, 7, 15, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 120000.00, 'LA PAZ', 'VEHÍCULO SEMINUEVO', '2024-11-22', '18:00:00', 5000.00, 3, '2024-11-20 21:53:43', '2024-12-16 13:31:24'),
(11, 8, 15, 'OTROS BIENES', 'BOLIVIANOS (BS)', 250000.00, 'LA PAZ', '30000', '2024-11-25', '18:00:00', 20000.00, 3, '2024-11-20 21:56:08', '2024-12-16 13:31:24'),
(12, 9, 15, 'OTROS BIENES', 'BOLIVIANOS (BS)', 150000.00, 'LA PAZ', 'CASA TIPO VIVIENDA', '2024-11-18', '18:00:00', 20000.00, 3, '2024-11-20 21:59:08', '2024-12-16 13:31:24'),
(13, 10, 15, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 100000.00, 'ORURO', 'VEHÍCULO', '2024-11-25', '18:00:00', 5000.00, 3, '2024-11-20 23:38:27', '2024-12-16 13:31:24'),
(14, 11, 15, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 200000.00, 'LA PAZ', 'VEHÍCULO SEMINUEVO', '2024-11-25', '18:00:00', 20000.00, 3, '2024-11-20 23:40:18', '2024-12-16 13:31:24'),
(15, 12, 15, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 150000.00, 'SANTA CRUZ', 'VEHÍCULO SEMINUEVO', '2024-11-25', '18:00:00', 15000.00, 3, '2024-11-20 23:43:30', '2024-12-16 13:31:24'),
(16, NULL, 15, 'OTROS BIENES', 'BOLIVIANOS (BS)', 250000.00, 'LA PAZ', 'CASA', '2024-11-25', '18:00:00', 30000.00, 0, '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(17, 13, 15, 'OTROS BIENES', 'BOLIVIANOS (BS)', 150000.00, 'LA PAZ', 'CASA', '2024-11-25', '18:00:00', 15000.00, 3, '2024-11-20 23:49:33', '2024-12-16 13:31:24'),
(18, 14, 15, 'OTROS BIENES', 'BOLIVIANOS (BS)', 180000.00, 'COCHABAMBA', 'CASA', '2024-11-25', '18:00:00', 25000.00, 3, '2024-11-20 23:51:55', '2024-12-16 13:31:24'),
(19, 15, 15, 'OTROS BIENES', 'BOLIVIANOS (BS)', 140000.00, 'LA PAZ', 'CASA', '2024-11-26', '18:00:00', 20000.00, 3, '2024-11-20 23:54:18', '2024-12-16 13:31:24'),
(20, NULL, 15, 'OTROS BIENES', 'BOLIVIANOS (BS)', 120000.00, 'CHUQUISACA', 'CASA', '2024-11-26', '18:00:00', 12000.00, 0, '2024-11-20 23:56:30', '2024-11-20 23:56:30'),
(21, 16, 15, 'ECOLÓGICO', 'BOLIVIANOS (BS)', 50000.00, 'LA PAZ', 'TERRENO FÉRTIL', '2024-11-26', '18:00:00', 5000.00, 3, '2024-11-20 23:59:24', '2024-12-16 13:31:24'),
(22, 17, 15, 'ECOLÓGICO', 'BOLIVIANOS (BS)', 30000.00, 'LA PAZ', 'TERRENO', '2024-11-26', '18:00:00', 3000.00, 3, '2024-11-21 00:01:32', '2024-12-16 13:31:24'),
(23, 18, 15, 'ECOLÓGICO', 'BOLIVIANOS (BS)', 60000.00, 'COCHABAMBA', 'LOTE DE TERRENO', '2024-11-26', '18:00:00', 6000.00, 3, '2024-11-21 00:03:48', '2024-12-16 13:31:24'),
(24, 19, 15, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 200000.00, 'LA PAZ', 'VEHÍCULO SEMINUEVO', '2024-12-14', '12:35:00', 20000.00, 3, '2024-11-21 19:26:49', '2024-12-16 13:31:24'),
(25, 20, 2, 'VEHÍCULOS', 'DÓLARES (USD)', 10000.00, 'LA PAZ', '', '2024-11-30', '12:00:00', 5000.00, 3, '2024-11-26 08:07:27', '2024-12-17 14:29:07'),
(26, 21, 2, 'OTROS BIENES', 'BOLIVIANOS (BS)', 2000.00, 'LA PAZ', '', '2024-12-02', '14:00:00', 400.00, 3, '2024-11-26 08:28:21', '2024-12-17 14:29:07'),
(27, 22, 2, 'ECOLÓGICO', 'DÓLARES (USD)', 4000.00, 'LA PAZ', '', '2024-12-04', '12:00:00', 2000.00, 3, '2024-12-02 16:08:30', '2024-12-17 14:29:07'),
(28, 23, 4, 'VEHÍCULOS', 'DÓLARES (USD)', 20000.00, 'LA PAZ', '', '2024-12-13', '11:38:00', 7000.00, 3, '2024-12-02 17:54:14', '2024-12-16 13:31:24'),
(29, 25, 2, 'OTROS BIENES', 'DÓLARES (USD)', 35000.00, 'LA PAZ', 'OBS', '2024-12-20', '12:00:00', 20000.00, 1, '2024-12-03 04:37:53', '2024-12-17 12:36:28'),
(30, 26, 2, 'VEHÍCULOS', 'DÓLARES (USD)', 10000.00, 'LA PAZ', 'OBS', '2024-12-20', '10:00:00', 5000.00, 1, '2024-12-03 15:33:59', '2024-12-17 12:44:00'),
(31, 24, 2, 'OTROS BIENES', 'DÓLARES (USD)', 10000.00, 'SANTA CRUZ', '', '2024-12-20', '12:00:00', 5000.00, 1, '2024-12-07 04:44:10', '2024-12-16 13:31:24'),
(32, NULL, 2, 'VEHÍCULOS', 'BOLIVIANOS (BS)', 50000.00, 'LA PAZ', '', '2024-12-23', '12:00:00', 20000.00, 6, '2024-12-16 13:35:27', '2024-12-16 13:38:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion_detalles`
--

CREATE TABLE `publicacion_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `publicacion_id` bigint UNSIGNED NOT NULL,
  `caracteristica` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(13, 5, 'PUERTAS', '5', '2024-11-13 22:15:26', '2024-12-02 18:49:23'),
(14, 5, 'MOTOR', '2200CC', '2024-11-13 22:15:26', '2024-12-02 18:49:23'),
(15, 4, 'CARACTERISTICA 4', 'DETALLE 4', '2024-11-15 19:52:34', '2024-11-15 19:52:34'),
(16, 4, 'CARACTERISTICA 5', 'DETALLE 5', '2024-11-15 19:52:34', '2024-11-15 19:52:34'),
(17, 6, 'MOTOR', '2000CC', '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(18, 6, 'PUERTAS', '5', '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(19, 6, 'COLOR', 'ROJO', '2024-11-20 08:11:09', '2024-11-20 08:11:09'),
(20, 7, 'PUERTAS', '5', '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(21, 7, 'COLOR', 'NEGRO', '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(22, 7, 'MOTOR', '4000CC', '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(23, 8, 'VEHÍCULO RAV 4', 'SEMINUEVO', '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(24, 8, 'TRACCIÓN', '4X2', '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(25, 8, 'MOTOR', '2500CC', '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(26, 8, 'COLOR', 'BLANCO', '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(27, 8, 'PUERTAS', '5 PUERTAS', '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(28, 8, 'MODELO', '2021', '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(29, 9, 'VEHÍCULO NISAN', 'SEMINUEVO', '2024-11-20 21:32:37', '2024-11-20 21:32:37'),
(30, 9, 'MOTOR', '1500CC', '2024-11-20 21:32:37', '2024-11-20 21:32:37'),
(31, 9, 'COLOR', 'BLANCO', '2024-11-20 21:32:37', '2024-11-20 21:32:37'),
(32, 9, 'MODELO', '2020', '2024-11-20 21:32:37', '2024-11-20 21:32:37'),
(33, 9, 'PUERTAS', '5 PUERTAS', '2024-11-20 21:32:37', '2024-11-20 21:32:37'),
(34, 10, 'VEHÍCULO SUZUKI', 'SEMINUEVO', '2024-11-20 21:53:43', '2024-11-20 21:53:43'),
(35, 10, 'MOTOR', '1500CC', '2024-11-20 21:53:43', '2024-11-20 21:53:43'),
(36, 10, 'PUERTAS', '5 PUERTAS', '2024-11-20 21:53:43', '2024-11-20 21:53:43'),
(37, 10, 'COLOR', 'BLANCO', '2024-11-20 21:53:43', '2024-11-20 21:53:43'),
(38, 10, 'MODELO', '2018', '2024-11-20 21:53:43', '2024-11-20 21:53:43'),
(39, 11, 'CASA', 'VIVIENDA', '2024-11-20 21:56:08', '2024-11-20 21:56:08'),
(40, 11, 'PISOS', '2 PISOS', '2024-11-20 21:56:08', '2024-11-20 21:56:08'),
(41, 11, 'HABITACIONES', '5 HABITACIONES', '2024-11-20 21:56:08', '2024-11-20 21:56:08'),
(42, 11, 'PARQUEO', '2 VEHÍCULOS', '2024-11-20 21:56:08', '2024-11-20 21:56:08'),
(43, 11, 'SERVICIOS', 'LUZ, AGUA, GAS E INTERNET', '2024-11-20 21:56:08', '2024-11-20 21:56:08'),
(44, 12, 'CASA', 'TIPO VIVIENDA', '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(45, 12, 'SUPERFICIE', '500MT2', '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(46, 12, 'PISOS', '2 PLANTAS', '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(47, 12, 'HABITACIONES', '4 HABITACIONES', '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(48, 12, 'PARQUEO', '2 VEHÍCULOS', '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(49, 12, 'JARDÍN', 'JARDÍN DE 10MT2', '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(50, 13, 'VEHÍCULO', 'TOYOTA', '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(51, 13, 'MODELO', '1992', '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(52, 13, 'MARCA', 'TOYOTA', '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(53, 13, 'MOTOR', '1500CC', '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(54, 13, 'COLOR', 'BLANCO', '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(55, 13, 'PUERTAS', '5 PUERTAS', '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(56, 14, 'VEHÍCULO', 'VAGONETA', '2024-11-20 23:40:18', '2024-11-20 23:40:18'),
(57, 14, 'MARCA', 'TOYOTA', '2024-11-20 23:40:18', '2024-11-20 23:40:18'),
(58, 14, 'MOTOR', '2500CC', '2024-11-20 23:40:18', '2024-11-20 23:40:18'),
(59, 14, 'COLOR', 'GRIS', '2024-11-20 23:40:18', '2024-11-20 23:40:18'),
(60, 14, 'MODELO', '2018', '2024-11-20 23:40:18', '2024-11-20 23:40:18'),
(61, 15, 'VEHÍCULO', 'MINUBUS VAN', '2024-11-20 23:43:30', '2024-11-20 23:43:30'),
(62, 15, 'MOTOR', '2500CC', '2024-11-20 23:43:30', '2024-11-20 23:43:30'),
(63, 15, 'MODELO', '2016', '2024-11-20 23:43:30', '2024-11-20 23:43:30'),
(64, 15, 'COLOR', 'BLANCO', '2024-11-20 23:43:30', '2024-11-20 23:43:30'),
(65, 15, 'PUERTAS', '5 PUERTAS', '2024-11-20 23:43:30', '2024-11-20 23:43:30'),
(66, 16, 'CASA', 'VIVIENDA', '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(67, 16, 'SUPERFICIE', '4500 MT2', '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(68, 16, 'PISOS', '2 PISOS', '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(69, 16, 'HABITACIONES', '4 HABITACIONES', '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(70, 16, 'SERVICIOS', 'TODOS LOS SERVICIOS', '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(71, 17, 'CASA', 'COMERCIAL', '2024-11-20 23:49:33', '2024-11-20 23:49:33'),
(72, 17, 'SUPERFICIE', '300 MT2', '2024-11-20 23:49:33', '2024-11-20 23:49:33'),
(73, 17, 'PISOS', '3 PISOS', '2024-11-20 23:49:33', '2024-11-20 23:49:33'),
(74, 17, 'DEPARTAMENTOS', '3 DEPARTAMENTOS', '2024-11-20 23:49:33', '2024-11-20 23:49:33'),
(75, 17, 'SERVICIOS', 'TODOS LOS SERVICIOS', '2024-11-20 23:49:33', '2024-11-20 23:49:33'),
(76, 18, 'CASA', 'VIVIENDA', '2024-11-20 23:51:55', '2024-11-20 23:51:55'),
(77, 18, 'SUPERFICE', '500 MT2', '2024-11-20 23:51:55', '2024-11-20 23:51:55'),
(78, 18, 'PISOS', '2 PISOS', '2024-11-20 23:51:55', '2024-11-20 23:51:55'),
(79, 18, 'HABITACIONES', '6 HABITACIONES', '2024-11-20 23:51:55', '2024-11-20 23:51:55'),
(80, 18, 'SERVICIOS', 'AGUA, LUZ E INTERNET', '2024-11-20 23:51:55', '2024-11-20 23:51:55'),
(81, 19, 'CASA', 'VIVIENDA', '2024-11-20 23:54:18', '2024-11-20 23:54:18'),
(82, 19, 'SUPERFICE', '350 MT2', '2024-11-20 23:54:18', '2024-11-20 23:54:18'),
(83, 19, 'HABITACIONES', '6 HABITACIONES', '2024-11-20 23:54:18', '2024-11-20 23:54:18'),
(84, 19, 'SERVICIOS', 'TODOS LOS SERVICIOS', '2024-11-20 23:54:18', '2024-11-20 23:54:18'),
(85, 20, 'CASA', 'VIVIENDA', '2024-11-20 23:56:30', '2024-11-20 23:56:30'),
(86, 20, 'SUPERFICIE', '400 MT2', '2024-11-20 23:56:30', '2024-11-20 23:56:30'),
(87, 20, 'SERVICIOS', 'TODOS LOS SERVICIOS', '2024-11-20 23:56:30', '2024-11-20 23:56:30'),
(88, 21, 'TERRENO', 'LOTE', '2024-11-20 23:59:24', '2024-11-20 23:59:24'),
(89, 21, 'SUPERFICIE', '2 HA', '2024-11-20 23:59:24', '2024-11-20 23:59:24'),
(90, 21, 'TIPO DE TERRENO', 'AGRICOLA', '2024-11-20 23:59:24', '2024-11-20 23:59:24'),
(91, 22, 'LOTE', 'AGRÍCOLA', '2024-11-21 00:01:32', '2024-11-21 00:01:32'),
(92, 22, 'SUPERFICIE', '5 HA', '2024-11-21 00:01:32', '2024-11-21 00:01:32'),
(93, 22, 'TIPO DE TERRENO', 'AGRÍCOLA', '2024-11-21 00:01:32', '2024-11-21 00:01:32'),
(94, 23, 'LOTE DE TERRENO', 'PRODUCCIÓN', '2024-11-21 00:03:48', '2024-11-21 00:03:48'),
(95, 23, 'SUPERFICIE', '20 HA', '2024-11-21 00:03:48', '2024-11-21 00:03:48'),
(96, 23, 'UBICACIÓN', 'EN PLENO CAMINO', '2024-11-21 00:03:48', '2024-11-21 00:03:48'),
(97, 24, 'VEHÍCULO', 'RAV 4', '2024-11-21 19:26:49', '2024-11-21 19:26:49'),
(98, 24, 'MODELO', '2022', '2024-11-21 19:26:49', '2024-11-21 19:26:49'),
(99, 24, 'COLOR', 'BLANCO', '2024-11-21 19:26:49', '2024-11-21 19:26:49'),
(100, 24, 'MOTOR', '2500CC', '2024-11-21 19:26:49', '2024-11-21 19:26:49'),
(101, 25, 'COLOR', 'BLANCO', '2024-11-26 08:07:27', '2024-11-26 08:22:20'),
(102, 25, 'PUERTAS', '5', '2024-11-26 08:07:27', '2024-11-26 08:22:20'),
(103, 25, 'MOTOR', '2000CC', '2024-11-26 08:07:27', '2024-11-26 08:22:20'),
(104, 26, 'C1', 'D1', '2024-11-26 08:28:21', '2024-11-26 08:28:21'),
(105, 26, 'C2', 'D2', '2024-11-26 08:28:21', '2024-11-26 08:28:21'),
(106, 26, 'C3', 'D3', '2024-11-26 08:28:21', '2024-11-26 08:28:21'),
(107, 27, 'CAR1', 'DET1', '2024-12-02 16:08:30', '2024-12-02 16:08:30'),
(108, 27, 'CAR2', 'DET2', '2024-12-02 16:08:30', '2024-12-02 16:08:30'),
(109, 27, 'CAR3', 'DET3', '2024-12-02 16:08:30', '2024-12-02 16:08:30'),
(110, 28, 'COLOR', 'AZUL', '2024-12-02 17:54:14', '2024-12-02 17:54:14'),
(111, 28, 'PUERTAS', '4', '2024-12-02 17:54:14', '2024-12-02 17:54:14'),
(112, 28, 'MOTOR', '3000CC', '2024-12-02 17:54:14', '2024-12-02 17:54:14'),
(113, 5, 'COLOR', 'ROJO', '2024-12-02 18:49:07', '2024-12-02 18:49:23'),
(114, 5, 'C4', 'D4', '2024-12-02 18:55:19', '2024-12-02 18:55:19'),
(115, 5, 'C5', 'D5', '2024-12-02 18:55:19', '2024-12-02 15:37:55'),
(116, 29, 'C1', 'D1', '2024-12-03 04:37:53', '2024-12-03 04:37:53'),
(117, 29, 'C2', 'D2', '2024-12-03 04:37:53', '2024-12-03 04:37:53'),
(118, 29, 'C3', 'D3', '2024-12-03 04:37:53', '2024-12-03 04:37:53'),
(119, 29, 'C4', 'D4', '2024-12-03 04:53:11', '2024-12-03 04:53:11'),
(120, 29, 'C5', 'D5', '2024-12-03 04:53:11', '2024-12-03 04:53:11'),
(121, 30, 'C1', 'D1', '2024-12-03 15:33:59', '2024-12-03 15:33:59'),
(122, 30, 'C2', 'D2', '2024-12-03 15:33:59', '2024-12-03 15:33:59'),
(123, 30, 'C3', 'D3', '2024-12-03 15:33:59', '2024-12-03 15:33:59'),
(124, 31, 'CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1CAR1', 'DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1DET1', '2024-12-07 04:44:10', '2024-12-07 04:44:10'),
(125, 31, 'CAR2', 'DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2DET2', '2024-12-07 04:44:10', '2024-12-07 04:44:10'),
(126, 31, 'CAR3', 'DET3', '2024-12-07 04:44:10', '2024-12-07 04:44:10'),
(127, 32, 'C1', 'D1', '2024-12-16 13:35:27', '2024-12-16 13:35:27'),
(128, 32, 'C2', 'D2', '2024-12-16 13:35:27', '2024-12-16 13:35:27'),
(129, 32, 'C3', 'D3', '2024-12-16 13:35:27', '2024-12-16 13:35:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion_imagens`
--

CREATE TABLE `publicacion_imagens` (
  `id` bigint UNSIGNED NOT NULL,
  `publicacion_id` bigint UNSIGNED NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publicacion_imagens`
--

INSERT INTO `publicacion_imagens` (`id`, `publicacion_id`, `imagen`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, '01731455251.jpg', 1, '2024-11-13 03:47:31', '2024-11-13 03:47:31'),
(5, 3, '31731455936.jpeg', 1, '2024-11-13 03:57:11', '2024-11-13 03:58:56'),
(6, 3, '21731456084.jpeg', 1, '2024-11-13 03:59:15', '2024-11-13 04:01:24'),
(7, 4, '01731508379.jpg', 1, '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(8, 4, '11731508379.jpeg', 1, '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(9, 4, '21731508379.jpeg', 1, '2024-11-13 18:32:59', '2024-11-13 18:32:59'),
(10, 5, '01731521726.jpeg', 1, '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(11, 5, '11731521726.webp', 1, '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(12, 5, '21731521726.jpeg', 1, '2024-11-13 22:15:26', '2024-11-13 22:15:26'),
(13, 6, '01732075693.jpeg', 1, '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(14, 6, '11732075693.webp', 1, '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(15, 6, '21732075693.jpeg', 1, '2024-11-20 08:08:13', '2024-11-20 08:08:13'),
(16, 7, '01732076004.jpg', 1, '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(17, 7, '11732076004.jpeg', 1, '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(18, 7, '21732076004.jpeg', 1, '2024-11-20 08:13:24', '2024-11-20 08:13:24'),
(19, 8, '01732123737.jpg', 1, '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(20, 8, '11732123737.jpg', 1, '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(21, 8, '21732123737.jpg', 1, '2024-11-20 21:28:57', '2024-11-20 21:28:57'),
(22, 9, '01732123957.jpg', 1, '2024-11-20 21:32:37', '2024-11-20 21:32:37'),
(23, 9, '11732123957.jpg', 1, '2024-11-20 21:32:37', '2024-11-20 21:32:37'),
(24, 9, '21732123957.jpg', 1, '2024-11-20 21:32:37', '2024-11-20 21:32:37'),
(25, 10, '01732125223.jpg', 1, '2024-11-20 21:53:43', '2024-11-20 21:53:43'),
(26, 10, '11732125223.jpg', 1, '2024-11-20 21:53:43', '2024-11-20 21:53:43'),
(27, 10, '21732125223.jpg', 1, '2024-11-20 21:53:43', '2024-11-20 21:53:43'),
(28, 11, '01732125368.jpg', 1, '2024-11-20 21:56:08', '2024-11-20 21:56:08'),
(29, 11, '11732125368.jpg', 1, '2024-11-20 21:56:08', '2024-11-20 21:56:08'),
(30, 11, '21732125368.jpg', 1, '2024-11-20 21:56:08', '2024-11-20 21:56:08'),
(31, 12, '01732125548.jpg', 1, '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(32, 12, '11732125548.jpg', 1, '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(33, 12, '21732125548.jpg', 1, '2024-11-20 21:59:08', '2024-11-20 21:59:08'),
(34, 13, '01732131507.jpg', 1, '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(35, 13, '11732131507.jpg', 1, '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(36, 13, '21732131507.jpg', 1, '2024-11-20 23:38:27', '2024-11-20 23:38:27'),
(37, 14, '01732131618.jpg', 1, '2024-11-20 23:40:18', '2024-11-20 23:40:18'),
(38, 14, '11732131618.jpg', 1, '2024-11-20 23:40:18', '2024-11-20 23:40:18'),
(39, 14, '21732131618.jpg', 1, '2024-11-20 23:40:18', '2024-11-20 23:40:18'),
(40, 15, '01732131810.jpg', 1, '2024-11-20 23:43:30', '2024-11-20 23:43:30'),
(41, 15, '11732131810.jpg', 1, '2024-11-20 23:43:30', '2024-11-20 23:43:30'),
(42, 15, '21732131810.jpg', 1, '2024-11-20 23:43:30', '2024-11-20 23:43:30'),
(43, 16, '01732132012.jpg', 1, '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(44, 16, '11732132012.jpg', 1, '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(45, 16, '21732132012.jpg', 1, '2024-11-20 23:46:52', '2024-11-20 23:46:52'),
(46, 17, '01732132173.jpg', 1, '2024-11-20 23:49:33', '2024-11-20 23:49:33'),
(47, 17, '11732132173.jpg', 1, '2024-11-20 23:49:33', '2024-11-20 23:49:33'),
(48, 17, '21732132173.jpg', 1, '2024-11-20 23:49:33', '2024-11-20 23:49:33'),
(49, 18, '01732132315.jpg', 1, '2024-11-20 23:51:55', '2024-11-20 23:51:55'),
(50, 18, '11732132315.jpg', 1, '2024-11-20 23:51:55', '2024-11-20 23:51:55'),
(51, 18, '21732132315.jpg', 1, '2024-11-20 23:51:55', '2024-11-20 23:51:55'),
(52, 19, '01732132458.jpg', 1, '2024-11-20 23:54:18', '2024-11-20 23:54:18'),
(53, 19, '11732132458.jpg', 1, '2024-11-20 23:54:18', '2024-11-20 23:54:18'),
(54, 19, '21732132458.jpg', 1, '2024-11-20 23:54:18', '2024-11-20 23:54:18'),
(55, 20, '01732132590.png', 1, '2024-11-20 23:56:30', '2024-11-20 23:56:30'),
(56, 20, '11732132590.jpg', 1, '2024-11-20 23:56:30', '2024-11-20 23:56:30'),
(57, 20, '21732132590.png', 1, '2024-11-20 23:56:30', '2024-11-20 23:56:30'),
(58, 21, '01732132764.jpg', 1, '2024-11-20 23:59:24', '2024-11-20 23:59:24'),
(59, 21, '11732132764.jpg', 1, '2024-11-20 23:59:24', '2024-11-20 23:59:24'),
(60, 21, '21732132764.jpg', 1, '2024-11-20 23:59:24', '2024-11-20 23:59:24'),
(61, 22, '01732132892.jpg', 0, '2024-11-21 00:01:32', '2024-12-11 18:07:55'),
(62, 22, '11732132892.jpg', 0, '2024-11-21 00:01:32', '2024-12-11 18:07:55'),
(63, 22, '21732132892.jpg', 0, '2024-11-21 00:01:32', '2024-12-11 18:07:55'),
(64, 23, '01732133028.jpeg', 0, '2024-11-21 00:03:48', '2024-12-11 17:55:03'),
(65, 23, '11732133028.jpeg', 0, '2024-11-21 00:03:48', '2024-12-11 17:55:03'),
(66, 23, '21732133028.jpg', 0, '2024-11-21 00:03:48', '2024-12-11 17:55:03'),
(67, 24, '01732202809.jpg', 1, '2024-11-21 19:26:49', '2024-11-21 19:26:49'),
(68, 24, '11732202809.jpg', 1, '2024-11-21 19:26:49', '2024-11-21 19:26:49'),
(69, 24, '21732202809.jpg', 1, '2024-11-21 19:26:49', '2024-11-21 19:26:49'),
(77, 25, '01732594940.jpg', 1, '2024-11-26 08:22:20', '2024-11-26 08:22:20'),
(78, 25, '11732594940.jpg', 1, '2024-11-26 08:22:20', '2024-11-26 08:22:20'),
(79, 25, '21732594940.jpg', 1, '2024-11-26 08:22:20', '2024-11-26 08:22:20'),
(83, 27, '01733141310.jpg', 1, '2024-12-02 16:08:30', '2024-12-02 16:08:30'),
(84, 27, '11733141310.jpg', 1, '2024-12-02 16:08:30', '2024-12-02 16:08:30'),
(85, 27, '21733141310.jpg', 1, '2024-12-02 16:08:30', '2024-12-02 16:08:30'),
(86, 27, '31733141310.jpg', 1, '2024-12-02 16:08:30', '2024-12-02 16:08:30'),
(94, 26, '01733141836.webp', 1, '2024-12-02 16:17:16', '2024-12-02 16:17:16'),
(95, 26, '11733141836.webp', 1, '2024-12-02 16:17:16', '2024-12-02 16:17:16'),
(96, 26, '21733141836.webp', 1, '2024-12-02 16:17:16', '2024-12-02 16:17:16'),
(97, 28, '01733147654.jpeg', 1, '2024-12-02 17:54:14', '2024-12-02 17:54:14'),
(98, 28, '11733147654.jpg', 1, '2024-12-02 17:54:14', '2024-12-02 17:54:14'),
(99, 28, '21733147654.jpg', 1, '2024-12-02 17:54:14', '2024-12-02 17:54:14'),
(100, 5, '31733150998.jpg', 1, '2024-12-02 18:49:58', '2024-12-02 18:49:58'),
(104, 30, '01733240039.jpeg', 1, '2024-12-03 15:33:59', '2024-12-03 15:33:59'),
(105, 30, '11733240039.jpeg', 1, '2024-12-03 15:33:59', '2024-12-03 15:33:59'),
(106, 30, '21733240039.webp', 1, '2024-12-03 15:33:59', '2024-12-03 15:33:59'),
(107, 31, '01733546650.jpg', 1, '2024-12-07 04:44:10', '2024-12-07 04:44:10'),
(108, 31, '11733546650.jpg', 1, '2024-12-07 04:44:10', '2024-12-07 04:44:10'),
(109, 31, '21733546650.jpg', 1, '2024-12-07 04:44:10', '2024-12-07 04:44:10'),
(110, 32, '01734356127.jpeg', 0, '2024-12-16 13:35:27', '2024-12-16 13:38:11'),
(111, 32, '11734356127.jpeg', 0, '2024-12-16 13:35:27', '2024-12-16 13:38:11'),
(112, 32, '21734356127.jpg', 0, '2024-12-16 13:35:27', '2024-12-16 13:38:11'),
(113, 29, '01734438977.jpg', 1, '2024-12-17 12:36:17', '2024-12-17 12:36:17'),
(114, 29, '11734438977.webp', 1, '2024-12-17 12:36:17', '2024-12-17 12:36:17'),
(115, 29, '21734438977.webp', 1, '2024-12-17 12:36:17', '2024-12-17 12:36:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperar_passwords`
--

CREATE TABLE `recuperar_passwords` (
  `id` bigint UNSIGNED NOT NULL,
  `cod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recuperar_passwords`
--

INSERT INTO `recuperar_passwords` (`id`, `cod`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dTkMMd', 3, 0, '2024-11-18 19:21:04', '2024-11-18 19:21:04'),
(2, 'FcOWKU', 5, 0, '2024-12-07 06:29:55', '2024-12-09 21:39:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(3, 'SUBASTADOR', 0, 1, '2024-11-09 18:49:25', '2024-11-09 18:49:25'),
(4, 'ADMINISTRADOR', 0, 1, '2024-12-09 23:57:55', '2024-12-09 23:57:55');

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
(2, 4, 2, '2024-11-15', '2024-11-15 19:52:40', '2024-11-22 03:45:52'),
(3, 6, 0, '2024-11-20', '2024-11-20 08:11:44', '2024-11-22 03:40:15'),
(4, 7, 0, '2024-11-20', '2024-11-20 08:13:28', '2024-11-22 03:45:59'),
(5, 8, 0, '2024-11-20', '2024-11-20 21:30:40', '2024-11-26 09:10:15'),
(6, 9, 2, '2024-11-20', '2024-11-20 21:33:01', '2024-11-26 07:39:20'),
(7, 10, 0, '2024-11-20', '2024-11-20 21:56:20', '2024-11-26 09:10:15'),
(8, 11, 0, '2024-11-20', '2024-11-20 21:56:25', '2024-11-26 07:38:36'),
(9, 12, 0, '2024-11-20', '2024-11-20 21:59:16', '2024-11-22 07:34:14'),
(10, 13, 0, '2024-11-20', '2024-11-20 23:38:35', '2024-11-26 09:10:15'),
(11, 14, 0, '2024-11-20', '2024-11-20 23:40:40', '2024-11-26 09:10:15'),
(12, 15, 0, '2024-11-20', '2024-11-20 23:43:36', '2024-11-26 07:09:20'),
(13, 17, 0, '2024-11-20', '2024-11-20 23:49:40', '2024-11-26 07:38:37'),
(14, 18, 0, '2024-11-20', '2024-11-20 23:52:08', '2024-11-26 07:38:36'),
(15, 19, 2, '2024-11-20', '2024-11-20 23:54:26', '2024-11-27 23:44:33'),
(16, 21, 0, '2024-11-20', '2024-11-20 23:59:33', '2024-11-27 23:44:30'),
(17, 22, 0, '2024-11-20', '2024-11-21 00:01:41', '2024-11-27 23:44:30'),
(18, 23, 0, '2024-11-20', '2024-11-21 00:03:55', '2024-11-27 23:44:30'),
(19, 24, 2, '2024-11-21', '2024-11-21 19:27:26', '2024-11-27 23:44:34'),
(20, 25, 2, '2024-11-26', '2024-11-26 08:20:45', '2024-12-02 16:05:38'),
(21, 26, 2, '2024-12-02', '2024-12-02 16:17:24', '2024-12-02 18:00:02'),
(22, 28, 2, '2024-12-02', '2024-12-02 17:54:21', '2024-12-13 15:30:04'),
(23, 27, 2, '2024-12-03', '2024-12-03 04:56:20', '2024-12-07 07:38:06'),
(24, 31, 1, '2024-12-07', '2024-12-07 04:46:21', '2024-12-07 04:46:21'),
(25, 32, 1, '2024-12-16', '2024-12-16 13:37:20', '2024-12-16 13:37:20'),
(26, 29, 1, '2024-12-17', '2024-12-17 12:36:28', '2024-12-17 12:36:28'),
(27, 30, 1, '2024-12-17', '2024-12-17 12:44:00', '2024-12-17 12:44:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subasta_clientes`
--

CREATE TABLE `subasta_clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `subasta_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `garantia` int NOT NULL,
  `puja` decimal(24,2) NOT NULL,
  `comprobante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_comprobante` int NOT NULL,
  `estado_puja` int NOT NULL DEFAULT '0',
  `fecha_oferta` date DEFAULT NULL,
  `hora_oferta` time DEFAULT NULL,
  `devolucion` int NOT NULL DEFAULT '0',
  `descripcion_devolucion` text COLLATE utf8mb4_unicode_ci,
  `fecha_devolucion` date DEFAULT NULL,
  `hora_devolucion` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subasta_clientes`
--

INSERT INTO `subasta_clientes` (`id`, `subasta_id`, `cliente_id`, `garantia`, `puja`, `comprobante`, `estado_comprobante`, `estado_puja`, `fecha_oferta`, `hora_oferta`, `devolucion`, `descripcion_devolucion`, `fecha_devolucion`, `hora_devolucion`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1013.00, '11731709429.png', 1, 2, '2024-11-15', '10:09:39', 0, NULL, NULL, NULL, '2024-11-15 23:55:18', '2024-11-17 00:59:54'),
(2, 1, 2, 1, 1012.00, '21731771428.pdf', 1, 0, '2024-11-16', '08:09:43', 1, NULL, '2024-12-17', '10:24:00', '2024-11-16 19:37:08', '2024-12-17 14:24:30'),
(3, 2, 2, 1, 20001.00, '21731771817.pdf', 1, 2, '2024-11-16', '09:09:47', 0, NULL, NULL, NULL, '2024-11-16 19:43:37', '2024-11-22 03:45:52'),
(4, 6, 11, 1, 100100.00, '111732124621.pdf', 1, 0, '2024-11-20', '17:49:00', 0, NULL, NULL, NULL, '2024-11-20 21:43:41', '2024-11-20 21:50:14'),
(5, 6, 12, 1, 100200.00, '121732124820.pdf', 1, 2, '2024-11-20', '17:50:00', 0, NULL, NULL, NULL, '2024-11-20 21:47:00', '2024-11-26 07:39:16'),
(6, 19, 13, 1, 200500.00, '131732203064.pdf', 1, 0, '2024-11-21', '15:33:00', 0, NULL, NULL, NULL, '2024-11-21 19:31:04', '2024-11-22 02:05:02'),
(7, 19, 14, 1, 200900.00, '141732203327.pdf', 1, 2, '2024-11-21', '22:05:00', 0, NULL, NULL, NULL, '2024-11-21 19:35:27', '2024-11-27 23:44:28'),
(8, 7, 14, 1, 0.00, '141732225141.pdf', 1, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-11-22 01:39:01', '2024-11-22 01:54:20'),
(9, 19, 15, 1, 200800.00, '151732226624.pdf', 1, 0, '2024-11-21', '22:04:00', 0, NULL, NULL, NULL, '2024-11-22 02:03:44', '2024-11-22 02:05:02'),
(10, 19, 2, 1, 0.00, '21732233257.pdf', 1, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-11-22 03:54:17', '2024-11-22 04:06:19'),
(11, 12, 2, 1, 0.00, '21732247157.pdf', 0, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-11-22 07:45:57', '2024-11-22 07:45:57'),
(12, 15, 2, 1, 140000.00, '21732592333.pdf', 1, 2, '2024-11-26', '03:40:00', 0, NULL, NULL, NULL, '2024-11-26 07:38:53', '2024-11-27 23:44:28'),
(13, 20, 2, 1, 10000.00, '21732739728.png', 2, 0, '2024-11-26', '04:32:00', 0, NULL, NULL, NULL, '2024-11-26 08:31:52', '2024-11-30 01:28:54'),
(14, 20, 1, 1, 10001.00, '11732595589.pdf', 1, 2, '2024-11-26', '04:33:00', 0, NULL, NULL, NULL, '2024-11-26 08:33:09', '2024-12-02 16:05:36'),
(15, 21, 2, 1, 3020.00, '21733145634.pdf', 1, 2, '2024-12-02', '13:59:00', 0, NULL, NULL, NULL, '2024-12-02 17:20:34', '2024-12-02 17:59:59'),
(16, 21, 1, 1, 3019.00, '11733146355.pdf', 1, 0, '2024-12-02', '13:59:00', 1, NULL, '2024-12-17', '10:15:00', '2024-12-02 17:32:35', '2024-12-17 14:15:30'),
(17, 22, 1, 1, 20502.00, '11733147726.pdf', 1, 0, '2024-12-02', '14:04:00', 0, NULL, NULL, NULL, '2024-12-02 17:55:26', '2024-12-02 18:04:28'),
(18, 22, 3, 1, 20503.00, '31733147779.png', 1, 0, '2024-12-02', '14:04:00', 0, NULL, NULL, NULL, '2024-12-02 17:56:19', '2024-12-13 15:29:59'),
(19, 23, 1, 1, 4500.00, '11733201829.png', 1, 2, '2024-12-03', '01:05:00', 0, NULL, NULL, NULL, '2024-12-03 04:57:09', '2024-12-07 07:38:03'),
(20, 23, 2, 1, 4001.00, '21733202190.pdf', 1, 0, '2024-12-03', '01:05:00', 1, 'descripcion devolucion', '2024-12-17', '10:17:00', '2024-12-03 05:03:10', '2024-12-17 14:17:46'),
(21, 24, 16, 1, 0.00, '161733547212.pdf', 0, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-12-07 04:53:32', '2024-12-07 04:53:32'),
(22, 24, 17, 1, 0.00, '171733547265.png', 2, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-12-07 04:54:25', '2024-12-07 06:44:24'),
(23, 24, 2, 1, 0.00, '21733549548.pdf', 1, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-12-07 05:32:28', '2024-12-07 06:17:52'),
(24, 24, 1, 1, 0.00, '11733775468.png', 0, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-12-09 20:17:48', '2024-12-09 20:17:48'),
(25, 24, 20, 1, 10004.00, '201733789224.pdf', 1, 1, '2024-12-09', '20:17:00', 0, NULL, NULL, NULL, '2024-12-10 00:07:04', '2024-12-10 00:17:39'),
(26, 24, 19, 1, 10003.00, '191733789248.pdf', 1, 0, '2024-12-09', '20:17:00', 0, NULL, NULL, NULL, '2024-12-10 00:07:28', '2024-12-10 00:17:10'),
(27, 22, 2, 1, 20504.00, '21734104212.pdf', 1, 2, '2024-12-13', '11:37:00', 0, NULL, NULL, NULL, '2024-12-13 15:36:52', '2024-12-13 15:37:59'),
(28, 26, 2, 1, 35001.00, '21734439011.pdf', 1, 1, '2024-12-17', '08:43:00', 0, NULL, NULL, NULL, '2024-12-17 12:36:51', '2024-12-17 12:43:51'),
(29, 26, 1, 1, 35000.00, '11734439317.pdf', 1, 0, '2024-12-17', '08:43:00', 0, NULL, NULL, NULL, '2024-12-17 12:41:57', '2024-12-17 12:43:43'),
(30, 27, 2, 1, 0.00, '21734439548.pdf', 0, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-12-17 12:45:48', '2024-12-17 12:45:48'),
(31, 27, 1, 1, 0.00, '11734439637.pdf', 1, 0, NULL, NULL, 0, NULL, NULL, NULL, '2024-12-17 12:47:17', '2024-12-17 12:47:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `acceso` int NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 'admin', 'admin', 'admin', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 1, 1, NULL, '2024-11-09', '2024-12-18', 1, '2024-11-09 18:47:19', '2024-12-18 16:25:42'),
(2, 'JPERES', 'JUAN', 'PERES MAMANI', '$2y$12$36K0jnlnyAJiaJ.aSSDQoeVzBpZzhDXCtPqHMQ8LrSe5dKy/TS.TO', 3, 1, '1732740859_2.jpg', '2024-11-11', '2024-12-17', 1, '2024-11-11 22:53:46', '2024-12-17 12:21:30'),
(3, 'carlos@gmail.com', 'CARLOS', 'MARTINES CHOQUE', '$2y$12$gHVL0X8zeL7mZXZ3uftNWOuAK3SumYhoBNNJzUQNPeD7dd94Q46ke', 2, 1, '1731796210_carlos@gmail.com.jpg', '2024-11-13', '2024-12-17', 1, '2024-11-13 20:33:34', '2024-12-17 12:41:45'),
(4, 'APAREDES', 'ALBERTO', 'PAREDES', '$2y$12$NSeoWEEWnGVX75lEk0EfoeRLO5IKrh7AdXhfxFHMjwz6zzaMG2ISu', 3, 1, NULL, '2024-11-13', '2024-12-02', 1, '2024-11-13 22:13:05', '2024-12-02 17:53:18'),
(5, 'maria@gmail.com', 'MARIA', 'PAREDES MAMANI', '$2y$12$PPiB1npLDn/PeZxqkGMXBeD0qFSia1PfxRPVum6NHcpaoTAIgRmqi', 2, 1, '1732079915_maria@gmail.com.jpg', '2024-11-16', '2024-12-17', 1, '2024-11-16 19:36:05', '2024-12-17 12:35:39'),
(6, 'MPAREDES', 'MARCOS', 'PAREDES', '$2y$12$DHvmogz6tfn9yImxpTn.1.EPmH1B7SHaT5iGOyhiSjKx.Tzrd8ZDe', 3, 1, NULL, '2024-11-20', '2024-11-20', 1, '2024-11-20 05:37:37', '2024-11-20 05:37:46'),
(7, 'pablo@gmail.com', 'PABLO', 'MARTINEZ RAMIRES', '$2y$12$hOZda1iFWdM3zEBqhKNpk.0n0T6IDHU1B7o2c1q6.bKkpoVorkvR.', 2, 1, NULL, '2024-11-20', '2024-12-02', 1, '2024-11-20 08:36:38', '2024-12-02 17:52:46'),
(8, 'carmen@gmail.com', 'CARMEN', 'GONZALES GONZALES', '$2y$12$0L7M00Gx5b1dOphdTtdCZuaPurzrM16iHNc7BqtTChW.r./5PAAMW', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:38:16', '2024-11-20 08:38:16'),
(9, 'tatiana@gmail.com', 'TATIANA', 'CARVAJAL RAMIRES', '$2y$12$4WSIWN81cdMWeNzdblSqt.46dK89aX7DnxrSvVRsVSOWSeU1kVXii', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:39:56', '2024-11-20 08:39:56'),
(10, 'sofia@gmail.com', 'SOFIA', 'PAREDES PAREDES', '$2y$12$lfqHr2Dk.FrKf4vws75b0eqjh2ZFwKj5qmzh7klMz.TFTw1r6noZK', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:41:44', '2024-11-20 08:41:44'),
(11, 'martin@gmail.com', 'MARTIN', 'MAMANI MAMANI', '$2y$12$WOVjkEsxbI7nkV5tLpwjmuLNPxUnyWxuyuzhi5109yBSzetSW.8wK', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:43:03', '2024-11-20 08:43:03'),
(12, 'carla@gmail.com', 'CARLA', 'RAMIRES CONDORI', '$2y$12$VBzB2cpGPIRyWyJo.FXt7.bp6NUd5WgzHq4c2qNMaOXL/Vlcjuz8W', 2, 1, NULL, '2024-11-20', NULL, 1, '2024-11-20 08:46:41', '2024-11-20 08:46:41'),
(13, 'franz@gmail.com', 'FRANZ', 'CONDORI CONDORI', '$2y$12$W40YzEEAW31UDbLvKoBOI.Y5bAhL/eMlnv6g8HyF2B579NEX9NN5O', 2, 1, NULL, '2024-11-20', '2024-12-09', 1, '2024-11-20 08:49:19', '2024-12-09 21:00:16'),
(14, 'martinc@gmail.com', 'MARTIN', 'COLQUE CONDORI', '$2y$12$pMHhVbJfoSN/2Dr1VVttgu3Iu9Z.bn/jWTpLf.iyZVZXnn9g90PNS', 2, 1, '1732079991_martinc@gmail.com.jpg', '2024-11-20', NULL, 1, '2024-11-20 08:58:31', '2024-11-20 09:19:51'),
(15, 'FMORENO', 'FRANCISCO', 'MORENO', '$2y$12$4xzLxvpipRljq64SjmMHf.j44MWDk7DUrediKbAVtr/ZgEh8kVFA6', 3, 1, NULL, '2024-11-20', '2024-12-11', 1, '2024-11-20 21:19:43', '2024-12-11 18:14:39'),
(16, 'pamela12@gmail.com', 'PAMELA', 'ORTEGA CASTRO', '$2y$12$XMcwKm1Vh5b4AHBGU31IWefewh7wWgKzKS14RN909gBLYbRjD4FXq', 2, 1, NULL, '2024-11-20', '2024-11-20', 1, '2024-11-20 21:42:52', '2024-11-20 21:49:23'),
(17, 'rodrigo12@gmail.com', 'RODRIGO', 'MEDINA PACOSILLO', '$2y$12$HEAJUuktmUJI3cfEMgTiY.zm0vdajrJcHC3ng4Z0g4Miu1EP0k/RW', 2, 1, NULL, '2024-11-20', '2024-11-20', 1, '2024-11-20 21:46:42', '2024-11-20 21:50:00'),
(18, 'marcelo12@gmail.com', 'MARCELO', 'APAZA QUINO', '$2y$12$rWNOgYivg6Eol6V5L.Z5QOQ2pS3kNhsHgAebagI7YFlF3Iidr3pgi', 2, 1, NULL, '2024-11-21', '2024-11-21', 1, '2024-11-21 19:30:24', '2024-11-21 19:32:40'),
(19, 'carlos12@gmail.com', 'CARLOS', 'MEDRANO MONTES', '$2y$12$vki4qr47qVfCJlnIZBjfruOJVJcSEPU3vh80fAZbqzC2zB7JI.D2C', 2, 1, NULL, '2024-11-21', '2024-11-21', 1, '2024-11-21 19:34:55', '2024-11-21 19:36:40'),
(20, 'ramiro12@gmail.com', 'RAMIRO', 'FERNANDEZ LOPEZ', '$2y$12$YVzu96U4TUCckhd7G.mKUufFGPBoDgTWxI93YGYC9RChV9pFsVrwG', 2, 1, NULL, '2024-11-21', '2024-11-21', 1, '2024-11-22 02:03:32', '2024-11-22 02:04:19'),
(21, 'pedromarquezsolano@gmail.com', 'PEDRO', 'MARQUEZ SOLANO', '$2y$12$17VUIE5uom4i0BwKbE5iOeilpGoQ/49xDLaVS2wpRwHE78Z.H7ubW', 2, 1, '1733545477_21.png', '2024-12-07', NULL, 1, '2024-12-07 04:02:40', '2024-12-07 04:24:37'),
(22, 'franzmartinez@gmail.com', 'FRANZ', 'MARTINES CORDOVA', '$2y$12$d1S4ablslqEETd.tZ6.14ewIqpnETYSHQ0T4zXjfDzkcnuqz0PR8m', 2, 1, NULL, '2024-12-07', '2024-12-16', 1, '2024-12-07 04:43:09', '2024-12-16 14:11:06'),
(23, 'asd@gmail.com', 'ASD', 'ASD ASD', '$2y$12$iNicax6glaArdLBR5WRT6Oc4N5l/BZbUDo6CTlevOi/Ag6hvKSUgm', 2, 1, NULL, '2024-12-07', NULL, 1, '2024-12-07 15:17:04', '2024-12-07 15:17:04'),
(24, 'sandro@gmail.com', 'SANDRO', 'BALTAZAR', '$2y$12$s7112lHPXnbJzCOSibrvreYtb7i0DFD0q/ObWFljgE1A8UW4fbvQm', 2, 1, NULL, '2024-12-09', '2024-12-09', 1, '2024-12-09 21:07:53', '2024-12-10 00:07:20'),
(25, 'fernandamarquez@gmail.com', 'FERNANDA', 'MARQUEZ', '$2y$12$uLkoxJWNyXOtnRFYLIuofOxpHI5qzHQSJXccGbafr1vUbePQVDxLq', 2, 1, NULL, '2024-12-09', '2024-12-09', 1, '2024-12-09 21:09:43', '2024-12-10 00:06:54'),
(26, 'sergio@gmail.com', 'SERGIO', 'CACERES', '$2y$12$JBpCLZIPlWxiWQodFRqrt.5KYRqJHvc0/zVrGO5CZpMynFAm0BVUO', 2, 1, NULL, '2024-12-09', NULL, 1, '2024-12-09 21:10:39', '2024-12-09 21:10:39'),
(27, 'FPAREDES', 'FERNANDO', 'PAREDES', '$2y$12$e8pNAaUdRynS3MUpWevhiO6XTaZXVfNBG6hDwXqbhFcHMA8yi0il2', 4, 1, NULL, '2024-12-09', '2024-12-09', 1, '2024-12-09 23:58:09', '2024-12-09 23:58:22');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `configuracions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_accions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `historial_ofertas`
--
ALTER TABLE `historial_ofertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_ofertas_subasta_cliente_id_foreign` (`subasta_cliente_id`),
  ADD KEY `historial_ofertas_subasta_id_foreign` (`subasta_id`),
  ADD KEY `historial_ofertas_cliente_id_foreign` (`cliente_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `parametrizacions_user_id_foreign` (`user_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `recuperar_passwords_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `historial_ofertas`
--
ALTER TABLE `historial_ofertas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `publicacions`
--
ALTER TABLE `publicacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `publicacion_detalles`
--
ALTER TABLE `publicacion_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT de la tabla `publicacion_imagens`
--
ALTER TABLE `publicacion_imagens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `recuperar_passwords`
--
ALTER TABLE `recuperar_passwords`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `subastas`
--
ALTER TABLE `subastas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `subasta_clientes`
--
ALTER TABLE `subasta_clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD CONSTRAINT `configuracions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD CONSTRAINT `historial_accions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `historial_ofertas`
--
ALTER TABLE `historial_ofertas`
  ADD CONSTRAINT `historial_ofertas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `historial_ofertas_subasta_cliente_id_foreign` FOREIGN KEY (`subasta_cliente_id`) REFERENCES `subasta_clientes` (`id`),
  ADD CONSTRAINT `historial_ofertas_subasta_id_foreign` FOREIGN KEY (`subasta_id`) REFERENCES `subastas` (`id`);

--
-- Filtros para la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  ADD CONSTRAINT `notificacion_users_notificacion_id_foreign` FOREIGN KEY (`notificacion_id`) REFERENCES `notificacions` (`id`),
  ADD CONSTRAINT `notificacion_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  ADD CONSTRAINT `parametrizacions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
-- Filtros para la tabla `recuperar_passwords`
--
ALTER TABLE `recuperar_passwords`
  ADD CONSTRAINT `recuperar_passwords_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
