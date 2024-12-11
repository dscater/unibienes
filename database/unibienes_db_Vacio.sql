-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-12-2024 a las 18:18:40
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
-- Base de datos: `unibienes_db_vacio`
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
  `verificar_comprobante` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `parametrizacions`
--

INSERT INTO `parametrizacions` (`id`, `user_id`, `inactividad_cliente`, `tipo_cambio`, `servidor_correo`, `datos_banco`, `nro_imagenes_pub`, `tiempo_pub`, `terminos_condiciones`, `verificar_comprobante`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 6.96, '{\"host\": \"smtp.hostinger.com\", \"correo\": \"mensaje@emsytsrl.com\", \"driver\": \"smtp\", \"nombre\": \"unibienes\", \"puerto\": \"587\", \"password\": \"8Z@d>&kj^y\", \"encriptado\": \"tls\"}', '{\"qr\": \"1733204666.png\", \"banco\": \"BANCO UNIÓN\", \"titular\": \"NOMBRE TITULAR\", \"nro_cuenta\": \"111110002222\"}', 3, 2, 'Términos y condiciones unibienes', '', '2024-11-16 20:43:43', '2024-12-03 05:44:26');

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
(19, 3, 25, '2024-11-26 07:47:50', '2024-11-26 07:47:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacions`
--

CREATE TABLE `publicacions` (
  `id` bigint UNSIGNED NOT NULL,
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion_detalles`
--

CREATE TABLE `publicacion_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `publicacion_id` bigint UNSIGNED NOT NULL,
  `caracteristica` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `puja` decimal(24,2) NOT NULL,
  `comprobante` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_comprobante` int NOT NULL,
  `estado_puja` int NOT NULL DEFAULT '0',
  `fecha_oferta` date DEFAULT NULL,
  `hora_oferta` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'admin', 'admin', 'admin', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 1, 1, NULL, '2024-11-09', '2024-12-03', 1, '2024-11-09 18:47:19', '2024-12-03 04:12:28');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_ofertas`
--
ALTER TABLE `historial_ofertas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- AUTO_INCREMENT de la tabla `recuperar_passwords`
--
ALTER TABLE `recuperar_passwords`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
