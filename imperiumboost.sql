-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2020 a las 19:01:03
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `imperiumboost`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adicionales`
--

CREATE TABLE `adicionales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'nombre',
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'descripcion',
  `precio` double(8,2) NOT NULL DEFAULT '0.00',
  `porcentaje` double(8,2) DEFAULT NULL,
  `servicio_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `adicionales`
--

INSERT INTO `adicionales` (`id`, `nombre`, `descripcion`, `precio`, `porcentaje`, `servicio_id`, `created_at`, `updated_at`) VALUES
(1, 'Duo', 'Jugar con el booster', 2.00, 15.00, 1, '2019-08-25 04:01:04', '2019-08-25 04:01:04'),
(2, 'Campeones', 'Boostear con campeones en especifico', 6.00, NULL, 1, '2019-08-25 04:01:31', '2019-08-25 04:01:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adicional_trabajos`
--

CREATE TABLE `adicional_trabajos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adicional_id` bigint(20) UNSIGNED DEFAULT NULL,
  `trabajo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `adicional_trabajos`
--

INSERT INTO `adicional_trabajos` (`id`, `adicional_id`, `trabajo_id`, `created_at`, `updated_at`) VALUES
(1, 2, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(2, NULL, 1, 'Category 2', 'category-2', '2019-08-22 06:39:49', '2019-08-22 06:39:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rank` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `cola` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `servidor` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `rank_season_anterior` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `campeones` int(10) UNSIGNED DEFAULT '12',
  `skins` int(10) UNSIGNED DEFAULT '0',
  `rp` int(10) UNSIGNED DEFAULT '0',
  `lp` int(10) UNSIGNED DEFAULT '0',
  `precio` double(8,2) DEFAULT '0.00',
  `vendido` tinyint(1) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id`, `rank`, `cola`, `servidor`, `rank_season_anterior`, `campeones`, `skins`, `rp`, `lp`, `precio`, `vendido`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Hierro III', 'SoloQ', 'Lan', 'Hierro IV', 30, 12, 45000, 454545, 4998.00, 0, NULL, '2019-12-18 01:01:00', '2019-12-18 02:33:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_compradas`
--

CREATE TABLE `cuentas_compradas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cuenta_id` bigint(20) UNSIGNED NOT NULL,
  `metodo_id` bigint(20) UNSIGNED NOT NULL,
  `precio` double(8,2) NOT NULL,
  `user` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones`
--

CREATE TABLE `cupones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'nombre',
  `porcentaje` double(8,2) DEFAULT '0.00',
  `activacion` date DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `descripcion` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usado` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 5),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 6),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 8),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 10),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 13),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 14),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 11),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'tipo', 'text', 'Tipo', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(60, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(62, 8, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 3),
(63, 8, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 4),
(64, 8, 'precio', 'number', 'Precio', 0, 1, 1, 1, 1, 1, '{}', 5),
(65, 8, 'servicio_id', 'text', 'Servicio Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(66, 8, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{}', 6),
(67, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(68, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(69, 8, 'producto_belongsto_servicio_relationship', 'relationship', 'servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Servicio\",\"table\":\"servicios\",\"type\":\"belongsTo\",\"column\":\"servicio_id\",\"key\":\"id\",\"label\":\"descripcion\",\"pivot_table\":\"adicional_trabajos\",\"pivot\":\"0\",\"taggable\":null}', 9),
(70, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 10, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(72, 10, 'porcentaje', 'number', 'Porcentaje', 0, 1, 1, 1, 1, 1, '{}', 3),
(73, 10, 'activacion', 'date', 'Activacion', 0, 1, 1, 1, 1, 1, '{}', 4),
(74, 10, 'vencimiento', 'date', 'Vencimiento', 0, 1, 1, 1, 1, 1, '{}', 5),
(75, 10, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 6),
(76, 10, 'usado', 'checkbox', 'Usado', 0, 1, 1, 1, 1, 1, '{}', 7),
(77, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(78, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(79, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(80, 11, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 3),
(81, 11, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 4),
(82, 11, 'precio', 'number', 'Precio', 1, 1, 1, 1, 1, 1, '{}', 5),
(83, 11, 'porcentaje', 'number', 'Porcentaje', 0, 1, 1, 1, 1, 1, '{}', 6),
(84, 11, 'servicio_id', 'text', 'Servicio Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(85, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(86, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(87, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(88, 12, 'rank', 'text', 'Rank', 0, 1, 1, 1, 1, 1, '{}', 2),
(89, 12, 'cola', 'text', 'Cola', 0, 1, 1, 1, 1, 1, '{\"default\":\"SoloQ\",\"options\":{\"SoloQ\":\"Solo Q\",\"Flex\":\"Flex 5v5\"}}', 3),
(90, 12, 'servidor', 'text', 'Servidor', 0, 1, 1, 1, 1, 1, '{\"default\":\"la1\",\"options\":{\"la1\":\"LAN\",\"la2\":\"LAS\",\"na1\":\"NA\"}}', 4),
(91, 12, 'rank_season_anterior', 'text', 'Rank Season Anterior', 0, 1, 1, 1, 1, 1, '{}', 5),
(92, 12, 'campeones', 'number', 'Campeones', 0, 1, 1, 1, 1, 1, '{}', 6),
(93, 12, 'skins', 'number', 'Skins', 0, 1, 1, 1, 1, 1, '{}', 7),
(94, 12, 'rp', 'number', 'Rp', 0, 1, 1, 1, 1, 1, '{}', 8),
(95, 12, 'lp', 'number', 'Lp', 0, 1, 1, 1, 1, 1, '{}', 9),
(96, 12, 'precio', 'number', 'Precio', 0, 1, 1, 1, 1, 1, '{}', 10),
(97, 12, 'vendido', 'checkbox', 'Vendido', 0, 1, 1, 1, 1, 1, '{}', 11),
(98, 12, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 12),
(99, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(100, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(101, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(102, 13, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(103, 13, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{}', 3),
(104, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(105, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(106, 11, 'adicionale_belongsto_servicio_relationship', 'relationship', 'servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Servicio\",\"table\":\"servicios\",\"type\":\"belongsTo\",\"column\":\"servicio_id\",\"key\":\"id\",\"label\":\"tipo\",\"pivot_table\":\"adicional_trabajos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(107, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(108, 14, 'codigo', 'text', 'Codigo', 1, 1, 1, 1, 1, 1, '{}', 2),
(109, 14, 'tasa', 'number', 'Tasa', 1, 1, 1, 1, 1, 1, '{}', 3),
(110, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(111, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(238, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(239, 24, 'nota', 'text', 'Nota', 0, 1, 1, 1, 1, 1, '{\"default\":\"Tipo de servicio:  \\n Desde: \\n Hasta: \"}', 10),
(240, 24, 'monto', 'number', 'Monto', 1, 1, 1, 1, 1, 1, '{}', 3),
(241, 24, 'servicio_id', 'text', 'Servicio Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(242, 24, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 7),
(243, 24, 'trabajador_id', 'text', 'Trabajador Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(244, 24, 'cupon_id', 'text', 'Cupon Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(245, 24, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"Por pagar\",\"1\":\"Esperando por trabajador\"}}', 11),
(246, 24, 'cuenta', 'text', 'Cuenta', 0, 1, 1, 1, 1, 1, '{}', 12),
(247, 24, 'contraseña_cuenta', 'text', 'Contraseña Cuenta', 0, 1, 1, 1, 1, 1, '{}', 13),
(248, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 23),
(249, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 24),
(250, 24, 'metodo_id', 'text', 'Metodo Id', 1, 1, 1, 1, 1, 1, '{}', 17),
(251, 24, 'servidor', 'select_dropdown', 'Servidor', 0, 1, 1, 1, 1, 1, '{\"default\":\"la1\",\"options\":{\"la1\":\"LAN\",\"la2\":\"LAS\",\"na1\":\"NA\"}}', 14),
(252, 24, 'nota_cliente', 'text', 'Nota Cliente', 0, 1, 1, 1, 1, 1, '{}', 18),
(253, 24, 'fecha_asignacion_trabajador', 'date', 'Fecha Asignacion Trabajador', 0, 1, 1, 1, 1, 1, '{}', 20),
(254, 24, 'fecha_culminacion_trabajo', 'date', 'Fecha Culminacion Trabajo', 0, 1, 1, 1, 1, 1, '{}', 19),
(255, 24, 'porcentaje_trabajador', 'number', 'Porcentaje Trabajador', 0, 1, 1, 1, 1, 1, '{}', 21),
(256, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 0, '{}', 7),
(258, 1, 'alias', 'text', 'Alias', 0, 1, 1, 1, 1, 1, '{}', 3),
(259, 24, 'trabajo_belongsto_servicio_relationship', 'relationship', 'servicios', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Servicio\",\"table\":\"servicios\",\"type\":\"belongsTo\",\"column\":\"servicio_id\",\"key\":\"id\",\"label\":\"tipo\",\"pivot_table\":\"adicional_trabajos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(260, 24, 'nota_cancelacion', 'text', 'Nota Cancelacion', 0, 1, 1, 1, 0, 1, '{}', 22),
(261, 24, 'trabajo_hasone_user_relationship', 'relationship', 'Usuario', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"adicional_trabajos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(262, 24, 'trabajo_belongsto_user_relationship', 'relationship', 'Trabajador', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"trabajador_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"adicional_trabajos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(263, 24, 'trabajo_belongsto_cupone_relationship', 'relationship', 'cupones', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Cupon\",\"table\":\"cupones\",\"type\":\"belongsTo\",\"column\":\"cupon_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"adicional_trabajos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(264, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(265, 25, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(266, 25, 'saldo', 'text', 'Saldo', 0, 1, 1, 1, 1, 1, '{}', 3),
(267, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(268, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(269, 25, 'saldo_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"adicional_trabajos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(270, 24, 'trabajo_belongsto_metodo_pago_relationship', 'relationship', 'Metodos de Pago', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\MetodoPago\",\"table\":\"metodo_pagos\",\"type\":\"belongsTo\",\"column\":\"metodo_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"adicional_trabajos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(271, 24, 'trabajo_belongstomany_producto_relationship', 'relationship', 'productos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Producto\",\"table\":\"productos\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"producto_trabajos\",\"pivot\":\"1\",\"taggable\":\"on\"}', 25),
(272, 1, 'puntos', 'text', 'Puntos', 0, 1, 1, 1, 1, 1, '{}', 13),
(273, 25, 'trabajo_id', 'text', 'Trabajo Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(274, 25, 'cobrado', 'checkbox', 'Cobrado', 1, 1, 1, 1, 1, 1, '{}', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 0, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-08-22 06:39:48', '2020-01-05 22:58:07'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-08-22 06:39:48', '2019-08-22 06:39:48'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-08-22 06:39:48', '2019-08-22 06:39:48'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(7, 'servicios', 'servicios', 'Servicio', 'Servicios', 'voyager-truck', 'App\\Servicio', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-22 22:33:04', '2019-08-22 22:33:04'),
(8, 'productos', 'productos', 'Producto', 'Productos', 'voyager-treasure', 'App\\Producto', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-22 22:34:54', '2019-08-22 22:34:54'),
(10, 'cupones', 'cupones', 'Cupone', 'Cupones', 'voyager-ticket', 'App\\Cupon', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-22 23:23:23', '2019-08-22 23:23:23'),
(11, 'adicionales', 'adicionales', 'Adicionale', 'Adicionales', 'voyager-dot-3', 'App\\Adicional', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-22 23:25:04', '2019-08-25 03:51:40'),
(12, 'cuentas', 'cuentas', 'Cuenta', 'Cuentas', 'voyager-file-code', 'App\\Cuenta', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-22 23:27:28', '2019-12-18 00:59:48'),
(13, 'metodo_pagos', 'metodo-pagos', 'Metodo Pago', 'Metodo Pagos', NULL, 'App\\MetodoPago', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-23 04:38:35', '2019-08-23 04:38:35'),
(14, 'monedas', 'monedas', 'Moneda', 'Monedas', 'voyager-dollar', 'App\\Moneda', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-09-24 21:22:47', '2019-09-24 21:22:47'),
(24, 'trabajos', 'trabajos', 'Trabajo', 'Trabajos', 'voyager-hammer', 'App\\Trabajo', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"status\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-10-21 18:13:11', '2019-12-17 23:45:37'),
(25, 'saldos', 'saldos', 'Saldo', 'Saldos', 'voyager-dollar', 'App\\Saldo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-12-17 00:20:35', '2020-04-15 22:42:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes_anonimos`
--

CREATE TABLE `mensajes_anonimos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Anonimo',
  `mensaje` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mensajes_anonimos`
--

INSERT INTO `mensajes_anonimos` (`id`, `email`, `name`, `mensaje`, `created_at`, `updated_at`, `admin`) VALUES
(25, 'EnmanuelAlx@gmail.com', 'Enmanuelsillo', 'Hola prro', '2019-12-16 00:30:59', '2019-12-16 00:30:59', NULL),
(26, 'EnmanuelAlx@gmail.com', 'Admin', 'Te contesto desde el modulo para hablar con la gente anonima', '2019-12-16 00:31:24', '2019-12-16 00:31:24', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes_de_trabajo`
--

CREATE TABLE `mensajes_de_trabajo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trabajo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trabajador_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mensajes_de_trabajo`
--

INSERT INTO `mensajes_de_trabajo` (`id`, `message`, `image`, `read`, `from`, `trabajo_id`, `created_at`, `updated_at`, `trabajador_id`) VALUES
(1, 'asdasd', NULL, 1, '2', 9, '2019-11-18 17:24:29', '2019-12-17 00:47:48', NULL),
(2, 'asdasd', NULL, 1, '2', 9, '2019-11-18 16:24:46', '2019-12-17 00:47:48', NULL),
(3, 'asdas', NULL, 1, '2', 9, '2019-11-18 16:25:02', '2019-12-17 00:47:48', NULL),
(4, 'asdasd', NULL, 1, '1', 7, '2019-12-15 00:36:55', '2019-12-15 00:37:02', NULL),
(5, 'Hola papu', NULL, 1, '2', 7, '2019-12-15 00:37:05', '2019-12-15 00:37:35', NULL),
(6, 'Todo fino?', NULL, 1, '1', 7, '2019-12-15 00:37:09', '2019-12-15 00:37:35', NULL),
(7, 'Hola prro', NULL, 1, '1', 8, '2019-12-15 00:37:27', '2019-12-15 00:37:30', NULL),
(8, 'asdasd', NULL, 1, '1', NULL, '2019-12-15 01:59:26', '2019-12-15 01:59:33', 3),
(9, 'Hola papu', NULL, 0, '3', NULL, '2019-12-15 01:59:36', '2019-12-15 01:59:36', 3),
(10, 'todo fino?', NULL, 0, '1', NULL, '2019-12-15 01:59:42', '2019-12-15 01:59:42', 3),
(11, 'Si vale', NULL, 0, '3', NULL, '2019-12-15 01:59:46', '2019-12-15 01:59:46', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-08-22 06:39:48', '2019-08-22 06:39:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-08-22 06:39:48', '2019-08-22 06:39:48', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 16, '2019-08-22 06:39:48', '2020-04-15 15:35:05', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 6, '2019-08-22 06:39:48', '2019-12-15 03:01:45', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-08-22 06:39:48', '2019-08-22 06:39:48', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 17, '2019-08-22 06:39:48', '2020-04-15 15:35:05', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-08-22 06:39:48', '2019-08-22 23:28:21', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-08-22 06:39:49', '2019-08-22 23:28:21', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-08-22 06:39:49', '2019-08-22 23:28:21', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-08-22 06:39:49', '2019-08-22 23:28:21', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 18, '2019-08-22 06:39:49', '2020-04-15 15:35:05', 'voyager.settings.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-08-22 06:39:50', '2019-08-22 23:28:21', 'voyager.hooks', NULL),
(15, 1, 'Servicios', '', '_self', 'voyager-truck', NULL, NULL, 8, '2019-08-22 22:33:05', '2019-12-17 00:26:12', 'voyager.servicios.index', NULL),
(16, 1, 'Productos', '', '_self', 'voyager-treasure', NULL, NULL, 9, '2019-08-22 22:34:54', '2019-12-17 00:26:12', 'voyager.productos.index', NULL),
(17, 1, 'Cupones', '', '_self', 'voyager-ticket', NULL, NULL, 12, '2019-08-22 23:23:23', '2019-12-17 00:26:12', 'voyager.cupones.index', NULL),
(18, 1, 'Adicionales', '', '_self', 'voyager-dot-3', NULL, NULL, 10, '2019-08-22 23:25:04', '2019-12-17 00:26:12', 'voyager.adicionales.index', NULL),
(19, 1, 'Cuentas', '', '_self', 'voyager-file-code', NULL, NULL, 11, '2019-08-22 23:27:28', '2019-12-17 00:26:12', 'voyager.cuentas.index', NULL),
(20, 1, 'Metodo Pagos', '', '_self', 'voyager-credit-cards', '#000000', NULL, 13, '2019-08-23 04:38:36', '2019-12-17 00:26:12', 'voyager.metodo-pagos.index', 'null'),
(21, 1, 'Monedas', '', '_self', 'voyager-dollar', NULL, NULL, 14, '2019-09-24 21:22:48', '2019-12-17 00:26:12', 'voyager.monedas.index', NULL),
(29, 1, 'Trabajos', '', '_self', 'voyager-hammer', NULL, NULL, 3, '2019-10-21 18:13:11', '2019-10-21 18:14:56', 'voyager.trabajos.index', NULL),
(30, 1, 'Chat Trabajadores', '/admin/chatTrabajadores', '_blank', 'voyager-github', '#000000', NULL, 4, '2019-12-15 01:56:29', '2019-12-15 02:33:01', NULL, ''),
(31, 1, 'Chat Anonimos', '/admin/chatAnonimos', '_blank', 'voyager-backpack', '#000000', NULL, 5, '2019-12-15 03:01:23', '2019-12-15 03:01:45', NULL, ''),
(32, 1, 'Saldos', '', '_self', 'voyager-dollar', NULL, NULL, 7, '2019-12-17 00:20:35', '2019-12-17 00:26:12', 'voyager.saldos.index', NULL),
(33, 1, 'Historial de Trabajos', 'admin/history', '_self', 'voyager-news', '#000000', NULL, 15, '2020-04-15 15:31:21', '2020-04-15 15:35:05', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pagos`
--

CREATE TABLE `metodo_pagos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `metodo_pagos`
--

INSERT INTO `metodo_pagos` (`id`, `nombre`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'Uphold', 'metodo-pagos\\April2020\\qex58qoKYjcGSIaD7zkC.webp', '2019-08-23 04:39:00', '2020-04-16 00:40:03'),
(2, 'Paypal', 'metodo-pagos\\April2020\\8fw7lePAsBGfew0xMdNQ.png', '2019-08-23 04:39:00', '2020-04-16 00:39:15'),
(3, 'Skrill', 'metodo-pagos\\August2019\\nFzYccPjy9zO25xDEkQG.png', '2019-08-23 04:40:05', '2019-08-23 04:40:05'),
(4, 'Amazon', 'metodo-pagos\\August2019\\Pq6O1l3KrJ0MIY3IVKk7.png', '2019-08-23 04:40:23', '2019-08-23 04:40:23'),
(5, 'Western union', 'metodo-pagos\\August2019\\Di0iHYihSmKA5PwkArJ3.png', '2019-08-23 04:40:57', '2019-08-23 04:40:57'),
(6, 'Oxxo', 'metodo-pagos\\August2019\\tzP1p63UOswCanRnoshY.png', '2019-08-23 04:41:09', '2019-08-23 04:41:09'),
(7, 'Bitcoin', 'metodo-pagos\\August2019\\SjQOkR3uosfYVFNfsxC5.png', '2019-08-23 04:41:21', '2019-08-23 04:41:21'),
(8, 'Tarjetas de Credito', 'metodo-pagos\\August2019\\vf2ju8AOVE7WLaPL2mg3.png', '2019-08-23 04:41:36', '2019-08-23 04:41:36'),
(9, 'Efecty', 'metodo-pagos\\August2019\\G4qHoWQxGXjJEOJMfpXA.png', '2019-08-23 04:41:54', '2019-08-23 04:41:54'),
(10, 'BCP', 'metodo-pagos\\April2020\\eFS0DqkBuMK2HXRpDdj0.jpg', '2019-08-23 04:42:00', '2020-04-16 00:38:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_12_031739_add_kda_to_users_table', 1),
(28, '2019_08_12_032007_create_servicios_table', 1),
(29, '2019_08_12_032054_create_cupons_table', 1),
(30, '2019_08_12_032213_create_pagos_table', 1),
(31, '2019_08_12_032244_create_trabajos_table', 1),
(32, '2019_08_12_032327_create_productos_table', 1),
(33, '2019_08_12_032434_create_producto_trabajos_table', 1),
(34, '2019_08_12_032518_create_adicionals_table', 1),
(35, '2019_08_12_032604_create_adicional_trabajos_table', 1),
(36, '2019_08_12_032723_create_metodo_pagos_table', 1),
(37, '2019_08_12_032845_add_metodo_pago_to_trabajos_table', 1),
(38, '2019_08_12_032940_create_cuentas_table', 1),
(39, '2019_08_15_172746_create_monedas_table', 1),
(40, '2019_08_16_002813_add_servidor_to_trabajos_table', 1),
(41, '2019_08_26_020350_add_nota_to_trabajos_table', 2),
(42, '2019_08_26_233812_add_fecha_asignacion_trabajador_to_trabajos_table', 3),
(43, '2019_08_28_034132_add_porcentaje_to_trabajos_table', 4),
(44, '2019_09_24_215206_add_subfix_to_monedas_table', 5),
(49, '2019_09_27_161152_create_messages_table', 6),
(50, '2019_11_17_014020_add_alias_to_user_table', 7),
(52, '2019_11_18_144723_add_nota_cancelacion_to_trabajo_table', 8),
(53, '2019_12_06_165629_add_trabajador_id_to_mensajes_de_trabajador_table', 9),
(54, '2019_12_12_025629_create_table_mensajes_anonimos', 9),
(72, '2019_12_15_030958_add_admin_column_to_mensajes_anonimos_table', 10),
(73, '2019_12_16_235256_create_saldos_table', 10),
(74, '2019_12_18_020609_create_cuentas_compradas_table', 10),
(75, '2019_12_21_013851_change_kda_for_puntos_to_user_table', 11),
(77, '2019_12_21_014527_add_trabajo_to_saldos_table', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tasa` double(8,2) NOT NULL DEFAULT '1.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subfix` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`id`, `codigo`, `tasa`, `created_at`, `updated_at`, `subfix`) VALUES
(1, 'US', 1.00, '2019-09-24 21:27:53', '2019-09-24 21:27:53', '$'),
(2, 'AR', 56.89, '2019-09-24 21:28:00', '2019-09-24 21:29:48', 'Peso Argentino'),
(3, 'MX', 19.47, '2019-09-24 21:30:30', '2019-09-24 21:30:30', 'Peso Mexicano'),
(4, 'VE', 21000.00, '2019-09-24 21:31:27', '2019-09-24 21:31:27', 'Bolivares');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-08-22 06:39:50', '2019-08-22 06:39:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `comprobante` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(2, 'browse_bread', NULL, '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(3, 'browse_database', NULL, '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(4, 'browse_media', NULL, '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(5, 'browse_compass', NULL, '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(6, 'browse_menus', 'menus', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(7, 'read_menus', 'menus', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(8, 'edit_menus', 'menus', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(9, 'add_menus', 'menus', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(10, 'delete_menus', 'menus', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(11, 'browse_roles', 'roles', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(12, 'read_roles', 'roles', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(13, 'edit_roles', 'roles', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(14, 'add_roles', 'roles', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(15, 'delete_roles', 'roles', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(16, 'browse_users', 'users', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(17, 'read_users', 'users', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(18, 'edit_users', 'users', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(19, 'add_users', 'users', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(20, 'delete_users', 'users', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(21, 'browse_settings', 'settings', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(22, 'read_settings', 'settings', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(23, 'edit_settings', 'settings', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(24, 'add_settings', 'settings', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(25, 'delete_settings', 'settings', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(26, 'browse_categories', 'categories', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(27, 'read_categories', 'categories', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(28, 'edit_categories', 'categories', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(29, 'add_categories', 'categories', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(30, 'delete_categories', 'categories', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(31, 'browse_posts', 'posts', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(32, 'read_posts', 'posts', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(33, 'edit_posts', 'posts', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(34, 'add_posts', 'posts', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(35, 'delete_posts', 'posts', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(36, 'browse_pages', 'pages', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(37, 'read_pages', 'pages', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(38, 'edit_pages', 'pages', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(39, 'add_pages', 'pages', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(40, 'delete_pages', 'pages', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(41, 'browse_hooks', NULL, '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(42, 'browse_servicios', 'servicios', '2019-08-22 22:33:04', '2019-08-22 22:33:04'),
(43, 'read_servicios', 'servicios', '2019-08-22 22:33:04', '2019-08-22 22:33:04'),
(44, 'edit_servicios', 'servicios', '2019-08-22 22:33:04', '2019-08-22 22:33:04'),
(45, 'add_servicios', 'servicios', '2019-08-22 22:33:04', '2019-08-22 22:33:04'),
(46, 'delete_servicios', 'servicios', '2019-08-22 22:33:04', '2019-08-22 22:33:04'),
(47, 'browse_productos', 'productos', '2019-08-22 22:34:54', '2019-08-22 22:34:54'),
(48, 'read_productos', 'productos', '2019-08-22 22:34:54', '2019-08-22 22:34:54'),
(49, 'edit_productos', 'productos', '2019-08-22 22:34:54', '2019-08-22 22:34:54'),
(50, 'add_productos', 'productos', '2019-08-22 22:34:54', '2019-08-22 22:34:54'),
(51, 'delete_productos', 'productos', '2019-08-22 22:34:54', '2019-08-22 22:34:54'),
(52, 'browse_cupones', 'cupones', '2019-08-22 23:23:23', '2019-08-22 23:23:23'),
(53, 'read_cupones', 'cupones', '2019-08-22 23:23:23', '2019-08-22 23:23:23'),
(54, 'edit_cupones', 'cupones', '2019-08-22 23:23:23', '2019-08-22 23:23:23'),
(55, 'add_cupones', 'cupones', '2019-08-22 23:23:23', '2019-08-22 23:23:23'),
(56, 'delete_cupones', 'cupones', '2019-08-22 23:23:23', '2019-08-22 23:23:23'),
(57, 'browse_adicionales', 'adicionales', '2019-08-22 23:25:04', '2019-08-22 23:25:04'),
(58, 'read_adicionales', 'adicionales', '2019-08-22 23:25:04', '2019-08-22 23:25:04'),
(59, 'edit_adicionales', 'adicionales', '2019-08-22 23:25:04', '2019-08-22 23:25:04'),
(60, 'add_adicionales', 'adicionales', '2019-08-22 23:25:04', '2019-08-22 23:25:04'),
(61, 'delete_adicionales', 'adicionales', '2019-08-22 23:25:04', '2019-08-22 23:25:04'),
(62, 'browse_cuentas', 'cuentas', '2019-08-22 23:27:28', '2019-08-22 23:27:28'),
(63, 'read_cuentas', 'cuentas', '2019-08-22 23:27:28', '2019-08-22 23:27:28'),
(64, 'edit_cuentas', 'cuentas', '2019-08-22 23:27:28', '2019-08-22 23:27:28'),
(65, 'add_cuentas', 'cuentas', '2019-08-22 23:27:28', '2019-08-22 23:27:28'),
(66, 'delete_cuentas', 'cuentas', '2019-08-22 23:27:28', '2019-08-22 23:27:28'),
(67, 'browse_metodo_pagos', 'metodo_pagos', '2019-08-23 04:38:35', '2019-08-23 04:38:35'),
(68, 'read_metodo_pagos', 'metodo_pagos', '2019-08-23 04:38:35', '2019-08-23 04:38:35'),
(69, 'edit_metodo_pagos', 'metodo_pagos', '2019-08-23 04:38:35', '2019-08-23 04:38:35'),
(70, 'add_metodo_pagos', 'metodo_pagos', '2019-08-23 04:38:35', '2019-08-23 04:38:35'),
(71, 'delete_metodo_pagos', 'metodo_pagos', '2019-08-23 04:38:35', '2019-08-23 04:38:35'),
(72, 'browse_monedas', 'monedas', '2019-09-24 21:22:47', '2019-09-24 21:22:47'),
(73, 'read_monedas', 'monedas', '2019-09-24 21:22:47', '2019-09-24 21:22:47'),
(74, 'edit_monedas', 'monedas', '2019-09-24 21:22:47', '2019-09-24 21:22:47'),
(75, 'add_monedas', 'monedas', '2019-09-24 21:22:47', '2019-09-24 21:22:47'),
(76, 'delete_monedas', 'monedas', '2019-09-24 21:22:47', '2019-09-24 21:22:47'),
(82, 'browse_trabajos', 'trabajos', '2019-10-21 18:13:11', '2019-10-21 18:13:11'),
(83, 'read_trabajos', 'trabajos', '2019-10-21 18:13:11', '2019-10-21 18:13:11'),
(84, 'edit_trabajos', 'trabajos', '2019-10-21 18:13:11', '2019-10-21 18:13:11'),
(85, 'add_trabajos', 'trabajos', '2019-10-21 18:13:11', '2019-10-21 18:13:11'),
(86, 'delete_trabajos', 'trabajos', '2019-10-21 18:13:11', '2019-10-21 18:13:11'),
(87, 'browse_saldos', 'saldos', '2019-12-17 00:20:35', '2019-12-17 00:20:35'),
(88, 'read_saldos', 'saldos', '2019-12-17 00:20:35', '2019-12-17 00:20:35'),
(89, 'edit_saldos', 'saldos', '2019-12-17 00:20:35', '2019-12-17 00:20:35'),
(90, 'add_saldos', 'saldos', '2019-12-17 00:20:35', '2019-12-17 00:20:35'),
(91, 'delete_saldos', 'saldos', '2019-12-17 00:20:35', '2019-12-17 00:20:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-08-22 06:39:50', '2019-08-22 06:39:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'nombre',
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'descripcion',
  `precio` double(8,2) DEFAULT '1.00',
  `servicio_id` bigint(20) UNSIGNED DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `servicio_id`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'Hierro IV', '1', 6.00, 1, 'productos\\December2019\\r3SPjBQCrb9nF59S9X2w.png', '2019-08-23 04:18:00', '2019-12-15 00:52:32'),
(2, 'Hierro III', '1.1', 6.00, 1, 'productos\\December2019\\8L8bXBiErlZhyC1wLQcR.png', '2019-08-23 04:19:00', '2019-12-15 00:52:25'),
(3, 'Hierro II', '1.2', 6.00, 1, 'productos\\December2019\\IzJFc6u6XtVPj577OOiO.png', '2019-08-23 04:19:00', '2019-12-15 00:52:15'),
(4, 'Hierro I', '1.3', 6.00, 1, 'productos\\December2019\\sh40IQGjs3Wbd6wt3oOK.png', '2019-08-23 04:19:00', '2019-12-15 00:52:06'),
(5, 'Bronce IV', '2', 8.00, 1, 'productos\\December2019\\y9mGtXkWhXweYunERAw9.png', '2019-08-23 04:23:00', '2019-12-15 00:51:53'),
(6, 'Bronce III', '2.1', 8.00, 1, 'productos\\December2019\\DxB2ikSORTZIXZWxlvrU.png', '2019-08-23 04:23:00', '2019-12-15 00:51:43'),
(7, 'Bronce II', '2.2', 8.00, 1, 'productos\\December2019\\b4rY4TdjWhNBsW3WcELE.png', '2019-08-23 04:24:00', '2019-12-15 00:51:32'),
(8, 'Bronce I', '2.3', 8.00, 1, 'productos\\December2019\\tI2PtZyASIwXY5hj8pIQ.png', '2019-08-23 04:25:00', '2019-12-15 00:51:23'),
(9, 'Plata IV', '3', 10.00, 1, 'productos\\December2019\\dkCUAnlNlcUP2co7F3yl.png', '2019-08-23 04:25:00', '2019-12-15 00:51:11'),
(10, 'Plata III', '3.1', 10.00, 1, 'productos\\December2019\\PwgZ2mA2TRzCXrLBc0gW.png', '2019-08-23 04:25:00', '2019-12-15 00:50:58'),
(11, 'Plata II', '3.2', 10.00, 1, 'productos\\December2019\\XS5j2LCnAx7hPndY7ZmQ.png', '2019-08-23 04:26:00', '2019-12-15 00:50:40'),
(12, 'Plata I', '3.3', 10.00, 1, 'productos\\December2019\\ro28jPA3uCG5LKyRJTzt.png', '2019-08-23 04:26:00', '2019-12-15 00:49:58'),
(13, 'Oro IV', '4', 14.00, 1, 'productos\\December2019\\WACxTPKnL0wM6b2ebcXZ.png', '2019-08-23 04:27:00', '2019-12-15 00:49:33'),
(14, 'Oro III', '4.1', 14.00, 1, 'productos\\December2019\\39ACvdmhS8kFUTNNWMLN.png', '2019-08-23 04:27:00', '2019-12-15 00:49:14'),
(15, 'Oro II', '4.2', 14.00, 1, 'productos\\December2019\\xU4nCvIgAgW9orqJwqR3.png', '2019-08-23 04:27:00', '2019-12-15 00:48:55'),
(16, 'Oro I', '4.3', 14.00, 1, 'productos\\December2019\\LGHAFQFVUq54s87vtjwC.png', '2019-08-23 04:28:00', '2019-12-15 00:48:43'),
(17, 'Platino IV', '5', 18.00, 1, 'productos\\December2019\\lUEIKGwRXOQE5zVb6Bk7.png', '2019-08-23 04:28:00', '2019-12-15 00:48:31'),
(18, 'Platino III', '5.1', 18.00, 1, 'productos\\December2019\\8B4Wn20pIbmTrbMfWR1B.png', '2019-08-23 04:28:00', '2019-12-15 00:48:19'),
(19, 'Platino II', '5.2', 18.00, 1, 'productos\\December2019\\dxX7UFJJFWgUrrj1upuq.png', '2019-08-23 04:29:00', '2019-12-15 00:47:50'),
(20, 'Platino I', '5.3', 18.00, 1, 'productos\\December2019\\glo43Yy7fzS26ypMC6l4.png', '2019-08-23 04:30:00', '2019-12-15 00:47:30'),
(21, 'Diamante IV', '6', 50.00, 1, 'productos\\December2019\\zmHR8YM69SLQVqNJoIaM.png', '2019-08-23 04:30:00', '2019-12-15 00:47:18'),
(22, 'Diamante III', '6.1', 50.00, 1, 'productos\\December2019\\OHLMSYrPkSrl7IiyI9yQ.png', '2019-08-23 04:30:00', '2019-12-15 00:47:09'),
(23, 'Diamante II', '6.2', 50.00, 1, 'productos\\December2019\\nWJzs7S2IlJhPC5mpmd3.png', '2019-08-23 04:31:00', '2019-12-15 00:46:58'),
(24, 'Diamante I', '6.3', 50.00, 1, 'productos\\December2019\\hBlFBCSkT40rNMC8cu4k.png', '2019-08-23 04:31:00', '2019-12-15 00:46:48'),
(25, 'Maestro', '7', 150.00, 1, 'productos\\December2019\\ZHkLKqz7qsXvCg9X8yVW.png', '2019-08-23 04:31:00', '2019-12-15 00:46:32'),
(26, 'Gran Maestro', '8', 200.00, 1, 'productos\\December2019\\MXKQQSeTESmR8AdFZdhj.png', '2019-08-23 04:32:00', '2019-12-15 00:46:21'),
(27, 'Maestria 0', 'Maestria de campeon', 8.00, 2, 'productos\\December2019\\wDMdaD3s3cnQlBb4GPF9.png', '2019-08-25 03:32:00', '2019-12-15 00:45:54'),
(28, 'Maestria 1', 'Maestria de campeon', 8.00, 2, 'productos\\December2019\\51AHeAo1Z6LBepyRXDAE.png', '2019-08-25 03:33:00', '2019-12-15 00:45:44'),
(29, 'Maestria 2', 'Maestria de campeon', 8.00, 2, 'productos\\December2019\\cHgj2myWa3RXcQOMh7XS.png', '2019-08-25 03:33:00', '2019-12-15 00:45:32'),
(30, 'Maestria 3', 'Maestria de campeon', 8.00, 2, 'productos\\December2019\\jDN2QNKh9af0bjIJUrGs.png', '2019-08-25 03:35:00', '2019-12-15 00:45:23'),
(31, 'Maestria 4', 'Maestria de campeon', 8.00, 2, 'productos\\December2019\\TO6vQs4nrkLYV21pOqm8.png', '2019-08-25 03:35:00', '2019-12-15 00:45:15'),
(32, 'Maestria 5', 'Maestria de campeon', 8.00, 2, 'productos\\December2019\\WgieqU2tAZ2UySK3qjvV.png', '2019-08-25 03:35:00', '2019-12-15 00:45:07'),
(33, 'Maestria 6', 'Maestria de campeon', 8.00, 2, 'productos\\December2019\\Ibocz68z9vz48PGsk9XN.png', '2019-08-25 03:36:00', '2019-12-15 00:44:34'),
(34, 'Maestria 7', 'Maestria de campeon', 8.00, 2, 'productos\\December2019\\QAZaLU1tNQge6ZmGhcW3.png', '2019-08-25 03:36:00', '2019-12-15 00:44:15'),
(35, 'Nivel', 'Subir de nivel', 2.00, 3, 'productos\\December2019\\HiaxwlTmR6qYfcZNXBh2.png', '2019-08-25 03:37:00', '2019-12-15 00:44:00'),
(36, 'Honor 0', 'Subir honor', 30.00, 4, 'productos\\December2019\\9YcFu4whArBaOy0C3JQW.png', '2019-08-25 03:38:00', '2019-12-15 00:43:08'),
(37, 'Honor 1', 'Subir honor', 40.00, 4, 'productos\\December2019\\4oErLsyGL9mCgAnaug99.png', '2019-08-25 03:38:00', '2019-12-15 00:43:17'),
(38, 'Honor 2', 'Subir honor', 0.00, 4, 'productos\\December2019\\7JNSYNg9cjiAPIuOkSSz.png', '2019-08-25 03:38:00', '2019-12-15 00:43:28'),
(39, 'Baja prioridad', 'Jugar partidas de baja prioridad', 2.00, 5, 'productos\\December2019\\4A3rhUhKTvut4CTh0pwR.png', '2019-08-25 03:40:00', '2019-12-15 00:43:43'),
(40, 'Posicionamiento', 'Partidas de posicionamiento', 2.00, 6, 'productos\\December2019\\KVaJOzY1bmvYfOxWcQk1.png', '2019-08-25 03:40:00', '2019-12-15 00:42:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_trabajos`
--

CREATE TABLE `producto_trabajos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trabajo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `producto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_trabajos`
--

INSERT INTO `producto_trabajos` (`id`, `trabajo_id`, `producto_id`, `created_at`, `updated_at`) VALUES
(53, 7, 18, NULL, NULL),
(54, 8, 28, NULL, NULL),
(55, 8, 29, NULL, NULL),
(56, 8, 30, NULL, NULL),
(57, 8, 31, NULL, NULL),
(58, 8, 32, NULL, NULL),
(59, 8, 33, NULL, NULL),
(60, 8, 34, NULL, NULL),
(61, 9, 35, NULL, NULL),
(62, 9, 35, NULL, NULL),
(63, 9, 35, NULL, NULL),
(64, 9, 35, NULL, NULL),
(65, 9, 35, NULL, NULL),
(66, 9, 35, NULL, NULL),
(67, 9, 35, NULL, NULL),
(68, 9, 35, NULL, NULL),
(69, 9, 35, NULL, NULL),
(70, 9, 35, NULL, NULL),
(71, 9, 35, NULL, NULL),
(72, 9, 35, NULL, NULL),
(73, 9, 35, NULL, NULL),
(74, 9, 35, NULL, NULL),
(75, 9, 35, NULL, NULL),
(76, 9, 35, NULL, NULL),
(77, 9, 35, NULL, NULL),
(78, 9, 35, NULL, NULL),
(79, 9, 35, NULL, NULL),
(80, 9, 35, NULL, NULL),
(81, 9, 35, NULL, NULL),
(82, 9, 35, NULL, NULL),
(83, 9, 35, NULL, NULL),
(84, 9, 35, NULL, NULL),
(85, 10, 36, NULL, NULL),
(86, 10, 37, NULL, NULL),
(116, 21, 37, NULL, NULL),
(117, 23, 3, NULL, NULL),
(118, 23, 4, NULL, NULL),
(119, 24, 16, NULL, NULL),
(120, 25, 5, NULL, NULL),
(121, 25, 6, NULL, NULL),
(122, 25, 7, NULL, NULL),
(123, 25, 8, NULL, NULL),
(124, 25, 9, NULL, NULL),
(125, 25, 10, NULL, NULL),
(126, 25, 11, NULL, NULL),
(127, 25, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(2, 'user', 'Normal User', '2019-08-22 06:39:49', '2019-08-22 06:39:49'),
(3, 'worker', 'Trabajador', '2019-08-22 23:29:05', '2019-08-22 23:29:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldos`
--

CREATE TABLE `saldos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `saldo` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trabajo_id` bigint(20) UNSIGNED NOT NULL,
  `cobrado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `saldos`
--

INSERT INTO `saldos` (`id`, `user_id`, `saldo`, `created_at`, `updated_at`, `trabajo_id`, `cobrado`) VALUES
(3, 3, 12.00, '2019-12-21 01:53:06', '2019-12-21 01:53:06', 7, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Tipo',
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'descripcion',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `tipo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Elo Boss', 'Elobostear cuenta', '2019-08-22 23:29:23', '2019-08-22 23:29:23'),
(2, 'Maestria', 'Maestria de campeon', '2019-08-22 23:29:35', '2019-08-22 23:29:35'),
(3, 'Nivel', 'Subir de nivel', '2019-08-22 23:29:57', '2019-08-22 23:29:57'),
(4, 'Honores', 'Subir honor', '2019-08-22 23:30:09', '2019-08-22 23:30:09'),
(5, 'Baja prioridad', 'Jugar partidas de baja prioridad', '2019-08-22 23:30:21', '2019-08-22 23:30:21'),
(6, 'Posicionamiento', 'Partidas de posicionamiento', '2019-08-22 23:31:08', '2019-08-22 23:31:08'),
(7, 'Venta de Cuentas', 'Venta de cuentas', '2019-12-18 01:28:53', '2019-12-18 01:28:53'),
(8, 'TFT Boost', 'Boost de tft', '2020-04-15 00:00:00', '2020-04-15 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Imperium Boost', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Bienvenido a Imperium Boost', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nota` longtext COLLATE utf8mb4_unicode_ci,
  `monto` double(8,2) NOT NULL,
  `servicio_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `trabajador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `cuenta` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contraseña_cuenta` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metodo_id` bigint(20) NOT NULL,
  `servidor` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'la1',
  `nota_cliente` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_asignacion_trabajador` date DEFAULT NULL,
  `fecha_culminacion_trabajo` date DEFAULT NULL,
  `porcentaje_trabajador` double(8,2) DEFAULT '50.00',
  `nota_cancelacion` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `trabajos`
--

INSERT INTO `trabajos` (`id`, `nota`, `monto`, `servicio_id`, `user_id`, `trabajador_id`, `cupon_id`, `status`, `cuenta`, `contraseña_cuenta`, `created_at`, `updated_at`, `metodo_id`, `servidor`, `nota_cliente`, `fecha_asignacion_trabajador`, `fecha_culminacion_trabajo`, `porcentaje_trabajador`, `nota_cancelacion`) VALUES
(7, 'Tipo de bost: SoloQ\r\nDesde: Platino III\r\nHasta: Platino II\r\nCampeones seleccionados: Cassiopeia, Corki, Camille\r\n                ', 24.00, 1, 2, 3, NULL, 3, 'Zeirt', NULL, '2019-08-26 04:37:28', '2019-12-21 01:53:06', 2, 'la1', 'No agregar a nadie extraño', '2019-11-18', '2019-11-18', 50.00, NULL),
(8, 'Tipo de servicio: Maestría de Campeón Akali\r\nDesde: Maestria 0\r\nHasta: Maestria 7\r\n', 56.00, 2, 2, 3, NULL, 2, 'Zeirt', NULL, '2019-08-26 04:38:41', '2019-11-05 14:13:29', 3, 'la1', 'Solo jugar top', '2019-11-05', '2019-11-05', 80.00, NULL),
(9, 'Tipo de servicio: Subir cuenta de nivel\r\nDesde: 126\r\nHasta: 150\r\n', 48.00, 3, 2, 3, NULL, 2, 'Zeirt', NULL, '2019-08-26 04:39:18', '2019-08-26 04:39:18', 2, 'la1', NULL, NULL, NULL, 50.00, NULL),
(10, 'Tipo de servicio: Subir honor\r\nDesde: Honor 0\r\nHasta: Honor 2\r\n', 70.00, 4, 2, 4, NULL, -1, 'Zeirt', NULL, '2019-08-26 04:39:41', '2019-11-18 16:22:23', 2, 'la1', NULL, '2019-11-07', '2019-11-29', 20.00, 'Se cancelo por que el cliente requirio un reembolso'),
(21, 'Tipo de servicio: Subir honor\r\nDesde: Honor 1\r\nHasta: Honor 2\r\n', 40.00, 4, 2, NULL, NULL, 1, 'Zeirt', NULL, '2019-11-18 02:32:47', '2019-11-18 16:21:14', 2, NULL, NULL, NULL, NULL, 50.00, NULL),
(23, 'Tipo de servicio:  Elo Boost Desde: Hierro II Hasta: Hierro I', 50.00, 1, 2, 4, NULL, 3, 'Zeirt', '123', '2019-12-17 23:53:27', '2019-12-20 20:05:05', 1, 'la1', 'ASDASD', '2019-12-20', '2019-12-20', 50.00, NULL),
(24, 'Tipo de bost: SoloQ\r\nDesde: Oro I\r\nHasta: Platino IV\r\n', 14.00, 1, 2, NULL, NULL, 0, 'Zeirt', NULL, '2020-04-15 15:05:43', '2020-04-15 15:05:43', 2, 'la1', NULL, NULL, NULL, 50.00, NULL),
(25, 'Tipo de bost: Boost de TFT\r\nDesde: Bronce IV\r\nHasta: Oro IV\r\n', 72.00, 8, 2, NULL, NULL, 0, 'Zeirt', NULL, '2020-04-16 01:10:32', '2020-04-16 01:10:32', 2, 'la1', 'No hables en el chat', NULL, NULL, 50.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-08-22 06:39:50', '2019-08-22 06:39:50'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-08-22 06:39:50', '2019-08-22 06:39:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `puntos` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `alias`, `puntos`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$JRn0mOUAIL9kpHJbcR.s9ehoAA9.18BqLkoi6TDM/M.UABJz47m/q', 'ktSo7vcd2y3dVNS3JbJl7VIuQGKFPOvRLpI9OkM7FxvLtS4GIbjkOcxp262L', NULL, '2019-08-22 06:39:50', '2019-08-22 06:39:50', NULL, NULL),
(2, 2, 'Enmanuel', 'EnmanuelAlx@gmail.com', 'users/2_avatar1576363996.fondo_azul.png', NULL, '$2y$10$JRn0mOUAIL9kpHJbcR.s9ehoAA9.18BqLkoi6TDM/M.UABJz47m/q', NULL, '{\"locale\":\"en\"}', '2019-08-23 04:36:18', '2019-12-15 00:53:16', NULL, NULL),
(3, 3, 'Trabajador', 'trabajador@gmail.com', 'users/3_avatar1566961202.fondo_azul.png', NULL, '$2y$10$GIbVUz.ODLEFz3lAtX8Ntev6M139nQhkmSEoNeaCXV81.BVZdgZtK', NULL, '{\"locale\":\"en\"}', '2019-08-28 03:51:17', '2019-12-21 01:53:06', NULL, 320.00),
(4, 3, 'trabajador2', 'trabajador2@gmail.com', 'users/default.png', NULL, '$2y$10$TCTQdhFHab/BBa6RVSBsieS2KqZUt/XBNLNDFf7XjD2Ha5mNIrYU.', NULL, '{\"locale\":\"en\"}', '2019-11-05 03:18:04', '2019-11-05 03:18:04', NULL, NULL),
(5, 2, 'Alfredo', 'usuario@u.com', 'users/default.png', NULL, '$2y$10$CTSSQcvNy5ByMsCfBYJ8nuMtfyYP0YPtzNiYLNRsgOtG5.Nva/PQm', NULL, '{\"locale\":\"en\"}', '2019-11-07 17:32:39', '2019-11-07 17:32:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adicionales`
--
ALTER TABLE `adicionales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adicionales_servicio_id_foreign` (`servicio_id`);

--
-- Indices de la tabla `adicional_trabajos`
--
ALTER TABLE `adicional_trabajos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adicional_trabajos_adicional_id_foreign` (`adicional_id`),
  ADD KEY `adicional_trabajos_trabajo_id_foreign` (`trabajo_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentas_compradas`
--
ALTER TABLE `cuentas_compradas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuentas_compradas_cuenta_id_foreign` (`cuenta_id`),
  ADD KEY `cuentas_compradas_metodo_id_foreign` (`metodo_id`);

--
-- Indices de la tabla `cupones`
--
ALTER TABLE `cupones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `mensajes_anonimos`
--
ALTER TABLE `mensajes_anonimos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensajes_de_trabajo`
--
ALTER TABLE `mensajes_de_trabajo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mensajes_de_trabajo_trabajo_id_foreign` (`trabajo_id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `metodo_pagos`
--
ALTER TABLE `metodo_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_servicio_id_foreign` (`servicio_id`);

--
-- Indices de la tabla `producto_trabajos`
--
ALTER TABLE `producto_trabajos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_trabajos_trabajo_id_foreign` (`trabajo_id`),
  ADD KEY `producto_trabajos_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `saldos`
--
ALTER TABLE `saldos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saldos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trabajos_servicio_id_foreign` (`servicio_id`),
  ADD KEY `trabajos_user_id_foreign` (`user_id`),
  ADD KEY `trabajos_trabajador_id_foreign` (`trabajador_id`),
  ADD KEY `trabajos_cupon_id_foreign` (`cupon_id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adicionales`
--
ALTER TABLE `adicionales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `adicional_trabajos`
--
ALTER TABLE `adicional_trabajos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cuentas_compradas`
--
ALTER TABLE `cuentas_compradas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cupones`
--
ALTER TABLE `cupones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `mensajes_anonimos`
--
ALTER TABLE `mensajes_anonimos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `mensajes_de_trabajo`
--
ALTER TABLE `mensajes_de_trabajo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `metodo_pagos`
--
ALTER TABLE `metodo_pagos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `producto_trabajos`
--
ALTER TABLE `producto_trabajos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `saldos`
--
ALTER TABLE `saldos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adicionales`
--
ALTER TABLE `adicionales`
  ADD CONSTRAINT `adicionales_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `adicional_trabajos`
--
ALTER TABLE `adicional_trabajos`
  ADD CONSTRAINT `adicional_trabajos_adicional_id_foreign` FOREIGN KEY (`adicional_id`) REFERENCES `adicionales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adicional_trabajos_trabajo_id_foreign` FOREIGN KEY (`trabajo_id`) REFERENCES `trabajos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentas_compradas`
--
ALTER TABLE `cuentas_compradas`
  ADD CONSTRAINT `cuentas_compradas_cuenta_id_foreign` FOREIGN KEY (`cuenta_id`) REFERENCES `cuentas` (`id`),
  ADD CONSTRAINT `cuentas_compradas_metodo_id_foreign` FOREIGN KEY (`metodo_id`) REFERENCES `metodo_pagos` (`id`);

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajes_de_trabajo`
--
ALTER TABLE `mensajes_de_trabajo`
  ADD CONSTRAINT `mensajes_de_trabajo_trabajo_id_foreign` FOREIGN KEY (`trabajo_id`) REFERENCES `trabajos` (`id`);

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `producto_trabajos`
--
ALTER TABLE `producto_trabajos`
  ADD CONSTRAINT `producto_trabajos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `producto_trabajos_trabajo_id_foreign` FOREIGN KEY (`trabajo_id`) REFERENCES `trabajos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `saldos`
--
ALTER TABLE `saldos`
  ADD CONSTRAINT `saldos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD CONSTRAINT `trabajos_cupon_id_foreign` FOREIGN KEY (`cupon_id`) REFERENCES `cupones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trabajos_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trabajos_trabajador_id_foreign` FOREIGN KEY (`trabajador_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trabajos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
