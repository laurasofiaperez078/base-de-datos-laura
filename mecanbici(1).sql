-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2026 a las 23:17:00
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mecanbici`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compras`
--

CREATE TABLE `carrito_compras` (
  `id_carrito` int(10) NOT NULL,
  `cantidad_productos` int(11) DEFAULT NULL,
  `id_productos` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito_compras`
--

INSERT INTO `carrito_compras` (`id_carrito`, `cantidad_productos`, `id_productos`, `id_usuario`) VALUES
(25940, 5, NULL, NULL),
(36942, 3, NULL, NULL),
(364790, 3, NULL, NULL),
(5697420, 100, NULL, NULL),
(68426545, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(10) NOT NULL,
  `nombre_categoria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`) VALUES
(897524, 'cascos'),
(1585255, 'guantes'),
(3974530, 'rodilleras'),
(36489520, 'llantas'),
(68524865, 'rines');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `id_comprobante` int(10) NOT NULL,
  `estado_pago` varchar(50) DEFAULT NULL,
  `fecha_pago` datetime(6) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`id_comprobante`, `estado_pago`, `fecha_pago`, `id_factura`) VALUES
(269873, 'No pagado', '0000-00-00 00:00:00.000000', NULL),
(369875, 'No pagado', '0000-00-00 00:00:00.000000', NULL),
(387523, 'pagado', '0000-00-00 00:00:00.000000', NULL),
(1247896, 'pagado', '0000-00-00 00:00:00.000000', NULL),
(6598623, 'Pagado', '0000-00-00 00:00:00.000000', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id_factura` int(10) NOT NULL,
  `costo_total` decimal(10,2) DEFAULT NULL,
  `fecha_generacion` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`id_factura`, `costo_total`, `fecha_generacion`, `id_usuario`) VALUES
(159736, 78000.00, '0000-00-00', NULL),
(354892, 10000.00, '0000-00-00', NULL),
(2598234, 15600.00, '0000-00-00', NULL),
(5489234, 15800.00, '0000-00-00', NULL),
(7495213, 89000.00, '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matenimiento`
--

CREATE TABLE `matenimiento` (
  `id_mantenimiento` int(10) NOT NULL,
  `fecha_solicitud` datetime(6) DEFAULT NULL,
  `descripcion_falla` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_productos` int(10) NOT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `descripcion_detallada` text DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `imagen_URL` varchar(225) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `id_reporte` int(10) NOT NULL,
  `tipo_reporte` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(10) NOT NULL,
  `nombre_rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(35478087, 'ingeniera'),
(1027525986, 'jefe'),
(1031812151, 'administradora');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(10) NOT NULL,
  `nombre_servicio` varchar(100) DEFAULT NULL,
  `costo_servicio` decimal(10,2) DEFAULT NULL,
  `estado_servicio` varchar(50) DEFAULT NULL,
  `id_mantenimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(10) NOT NULL,
  `cantidad_disponible` int(11) DEFAULT NULL,
  `id_productos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id_stock`, `cantidad_disponible`, `id_productos`) VALUES
(12654, 5, NULL),
(597621, 10, NULL),
(598732, 1, NULL),
(687465, 20, NULL),
(2654483, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mantenmiento`
--

CREATE TABLE `tipo_mantenmiento` (
  `id_matenimiento` int(10) NOT NULL,
  `nombre_tipo_mantenimiento` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `contraseña` varchar(225) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_completo`, `correo_electronico`, `contraseña`, `id_rol`) VALUES
(2589631, 'Abel Perez Buitrago', 'abelperezbuitrago1972@gmail.com', 'abelperez8521', NULL),
(1031812151, 'Laura Sofia Perez Mazabuel', 'laurasofiaperez078@gmail.com', 'laurasofiaperez078@_', NULL),
(1036984620, 'Karla Manuela Sanchez Lopez', 'manuelasanchez853@gmail.com', 'lopezsanchesmanuela895', NULL),
(1478523690, 'Ruth Areliz Mazabuel Lopez', 'ruthmazabuel771@gmail.com', 'ruthlopez01@', NULL),
(1530489521, 'Maria Alejandra Panqueba Perez', 'marialejandraperez@gmail.com', 'panquebaperez5623', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_productos` (`id_productos`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`id_comprobante`),
  ADD KEY `fk_factura` (`id_factura`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_id_usuario` (`id_usuario`);

--
-- Indices de la tabla `matenimiento`
--
ALTER TABLE `matenimiento`
  ADD PRIMARY KEY (`id_mantenimiento`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_productos`),
  ADD KEY `fk_id_categoria` (`id_categoria`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`id_reporte`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `fk_id_mantenimiento` (`id_mantenimiento`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `fk_id_productos` (`id_productos`);

--
-- Indices de la tabla `tipo_mantenmiento`
--
ALTER TABLE `tipo_mantenmiento`
  ADD PRIMARY KEY (`id_matenimiento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_rol` (`id_rol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD CONSTRAINT `id_productos` FOREIGN KEY (`id_productos`) REFERENCES `producto` (`id_productos`),
  ADD CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD CONSTRAINT `fk_factura` FOREIGN KEY (`id_factura`) REFERENCES `facturacion` (`id_factura`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `fk_id_mantenimiento` FOREIGN KEY (`id_mantenimiento`) REFERENCES `matenimiento` (`id_mantenimiento`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_id_productos` FOREIGN KEY (`id_productos`) REFERENCES `producto` (`id_productos`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
