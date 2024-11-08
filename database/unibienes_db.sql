-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-11-2024 a las 21:14:59
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
(1, 'UNIBIENES S.A.', 'UB', '1731083884_1.png', NULL, '2024-11-08 20:38:04');

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
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 2<br/>nombre: ROLE 2<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:16<br/>updated_at: 2024-11-08 20:48:16<br/>', NULL, 'ROLES', '2024-11-08', '20:48:16', '2024-11-09 00:48:16', '2024-11-09 00:48:16'),
(2, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 3<br/>nombre: ROLE 3<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:37<br/>updated_at: 2024-11-08 20:48:37<br/>', NULL, 'ROLES', '2024-11-08', '20:48:37', '2024-11-09 00:48:37', '2024-11-09 00:48:37'),
(3, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 4<br/>nombre: 4<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:40<br/>updated_at: 2024-11-08 20:48:40<br/>', NULL, 'ROLES', '2024-11-08', '20:48:40', '2024-11-09 00:48:40', '2024-11-09 00:48:40'),
(4, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 5<br/>nombre: 5<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:43<br/>updated_at: 2024-11-08 20:48:43<br/>', NULL, 'ROLES', '2024-11-08', '20:48:43', '2024-11-09 00:48:43', '2024-11-09 00:48:43'),
(5, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 6<br/>nombre: 6<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:46<br/>updated_at: 2024-11-08 20:48:46<br/>', NULL, 'ROLES', '2024-11-08', '20:48:46', '2024-11-09 00:48:46', '2024-11-09 00:48:46'),
(6, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 7<br/>nombre: 7<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:48<br/>updated_at: 2024-11-08 20:48:48<br/>', NULL, 'ROLES', '2024-11-08', '20:48:48', '2024-11-09 00:48:48', '2024-11-09 00:48:48'),
(7, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 8<br/>nombre: 8<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:51<br/>updated_at: 2024-11-08 20:48:51<br/>', NULL, 'ROLES', '2024-11-08', '20:48:51', '2024-11-09 00:48:51', '2024-11-09 00:48:51'),
(8, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 9<br/>nombre: 9<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:54<br/>updated_at: 2024-11-08 20:48:54<br/>', NULL, 'ROLES', '2024-11-08', '20:48:54', '2024-11-09 00:48:54', '2024-11-09 00:48:54'),
(9, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 10<br/>nombre: 10<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:59<br/>updated_at: 2024-11-08 20:48:59<br/>', NULL, 'ROLES', '2024-11-08', '20:48:59', '2024-11-09 00:48:59', '2024-11-09 00:48:59'),
(10, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 11<br/>nombre: 11<br/>permisos: 0<br/>created_at: 2024-11-08 20:49:02<br/>updated_at: 2024-11-08 20:49:02<br/>', NULL, 'ROLES', '2024-11-08', '20:49:02', '2024-11-09 00:49:02', '2024-11-09 00:49:02'),
(11, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 11<br/>nombre: 11<br/>permisos: 0<br/>created_at: 2024-11-08 20:49:02<br/>updated_at: 2024-11-08 20:49:02<br/>', NULL, 'ROLES', '2024-11-08', '21:11:25', '2024-11-09 01:11:25', '2024-11-09 01:11:25'),
(12, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 10<br/>nombre: 10<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:59<br/>updated_at: 2024-11-08 20:48:59<br/>', NULL, 'ROLES', '2024-11-08', '21:11:32', '2024-11-09 01:11:32', '2024-11-09 01:11:32'),
(13, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 9<br/>nombre: 9<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:54<br/>updated_at: 2024-11-08 20:48:54<br/>', NULL, 'ROLES', '2024-11-08', '21:11:34', '2024-11-09 01:11:34', '2024-11-09 01:11:34'),
(14, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 8<br/>nombre: 8<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:51<br/>updated_at: 2024-11-08 20:48:51<br/>', NULL, 'ROLES', '2024-11-08', '21:11:37', '2024-11-09 01:11:37', '2024-11-09 01:11:37'),
(15, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 7<br/>nombre: 7<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:48<br/>updated_at: 2024-11-08 20:48:48<br/>', NULL, 'ROLES', '2024-11-08', '21:11:39', '2024-11-09 01:11:39', '2024-11-09 01:11:39'),
(16, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 6<br/>nombre: 6<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:46<br/>updated_at: 2024-11-08 20:48:46<br/>', NULL, 'ROLES', '2024-11-08', '21:11:43', '2024-11-09 01:11:43', '2024-11-09 01:11:43'),
(17, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 5<br/>nombre: 5<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:43<br/>updated_at: 2024-11-08 20:48:43<br/>', NULL, 'ROLES', '2024-11-08', '21:11:46', '2024-11-09 01:11:46', '2024-11-09 01:11:46'),
(18, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 4<br/>nombre: 4<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:40<br/>updated_at: 2024-11-08 20:48:40<br/>', NULL, 'ROLES', '2024-11-08', '21:11:49', '2024-11-09 01:11:49', '2024-11-09 01:11:49'),
(19, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 3<br/>nombre: ROLE 3<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:37<br/>updated_at: 2024-11-08 20:48:37<br/>', NULL, 'ROLES', '2024-11-08', '21:11:52', '2024-11-09 01:11:52', '2024-11-09 01:11:52'),
(20, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ROLE', 'id: 2<br/>nombre: ROLE 2<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:16<br/>updated_at: 2024-11-08 20:48:16<br/>', 'id: 2<br/>nombre: ROLE 2<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:16<br/>updated_at: 2024-11-08 20:48:16<br/>', 'ROLES', '2024-11-08', '21:12:35', '2024-11-09 01:12:35', '2024-11-09 01:12:35'),
(21, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ROLE', 'id: 2<br/>nombre: ROLE 2<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:16<br/>updated_at: 2024-11-08 20:48:16<br/>', 'id: 2<br/>nombre: ROLE 2<br/>permisos: 0<br/>created_at: 2024-11-08 20:48:16<br/>updated_at: 2024-11-08 20:48:16<br/>', 'ROLES', '2024-11-08', '21:12:48', '2024-11-09 01:12:48', '2024-11-09 01:12:48'),
(22, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 12<br/>nombre: SUBASTADOR<br/>permisos: 0<br/>created_at: 2024-11-08 21:12:53<br/>updated_at: 2024-11-08 21:12:53<br/>', NULL, 'ROLES', '2024-11-08', '21:12:53', '2024-11-09 01:12:53', '2024-11-09 01:12:53'),
(23, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ROLE', 'id: 12<br/>nombre: SUBASTADOR<br/>permisos: 0<br/>created_at: 2024-11-08 21:12:53<br/>updated_at: 2024-11-08 21:12:53<br/>', NULL, 'ROLES', '2024-11-08', '21:12:57', '2024-11-09 01:12:57', '2024-11-09 01:12:57'),
(24, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ROLE', 'id: 3<br/>nombre: SUBASTADOR<br/>permisos: 0<br/>created_at: 2024-11-08 21:13:10<br/>updated_at: 2024-11-08 21:13:10<br/>', NULL, 'ROLES', '2024-11-08', '21:13:10', '2024-11-09 01:13:10', '2024-11-09 01:13:10');

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
(1, '2024_01_31_165641_create_configuracions_table', 1),
(2, '2024_11_02_153309_create_roles_table', 1),
(3, '2024_11_02_153315_create_permisos_table', 1),
(4, '2024_11_02_153315_create_users_table', 1),
(5, '2024_11_02_153316_create_historial_accions_table', 1),
(6, '2024_11_02_153653_create_parametrizacions_table', 1),
(7, '2024_11_02_153834_create_clientes_table', 1),
(8, '2024_11_02_154016_create_publicacions_table', 1),
(9, '2024_11_02_154050_create_publicacion_imagens_table', 1),
(10, '2024_11_02_154054_create_publicacion_detalles_table', 1),
(11, '2024_11_04_143215_create_subastas_table', 1),
(12, '2024_11_04_143347_create_subasta_clientes_table', 1);

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
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `hora_limite` date NOT NULL,
  `monto_garantia` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permisos` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `permisos`, `created_at`, `updated_at`) VALUES
(1, 'SUPER USUARIO', 1, NULL, NULL),
(2, 'ROLE 2', 0, '2024-11-09 00:48:16', '2024-11-09 00:48:16'),
(3, 'SUBASTADOR', 0, '2024-11-09 01:13:10', '2024-11-09 01:13:10');

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
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombres`, `apellidos`, `password`, `role_id`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 1, 1, '2024-11-04', NULL, NULL);

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
-- Indices de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permisos_role_id_foreign` (`role_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicacions`
--
ALTER TABLE `publicacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicacion_detalles`
--
ALTER TABLE `publicacion_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicacion_imagens`
--
ALTER TABLE `publicacion_imagens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
