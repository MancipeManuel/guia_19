-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2024 a las 21:51:48
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basededatos19`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idadministrador` int(11) NOT NULL,
  `nonbreAdmin` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajero`
--

CREATE TABLE `cajero` (
  `idCajero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cajero`
--

INSERT INTO `cajero` (`idCajero`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombreCliente` varchar(45) NOT NULL,
  `documentoCliente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombreCliente`, `documentoCliente`) VALUES
(1, 'hector', '122332');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `idDetalleCompra` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL,
  `facturaCompra_idfacturaCompra` int(11) NOT NULL,
  `facturaCompra_administrador_idadministrador` int(11) NOT NULL,
  `facturaCompra_provehedor_idprovehedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idFacturaDetalle` int(11) NOT NULL,
  `idProductoDetalle` int(11) NOT NULL,
  `subTotalDetalle` int(11) NOT NULL,
  `cantidadDetalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`idFacturaDetalle`, `idProductoDetalle`, `subTotalDetalle`, `cantidadDetalle`) VALUES
(1, 1, 100, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `totalFactura` double NOT NULL,
  `fechaFactura` datetime(6) NOT NULL,
  `idCajero` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `totalFactura`, `fechaFactura`, `idCajero`, `idCliente`) VALUES
(1, 11000, '2000-09-09 00:00:00.000000', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacompra`
--

CREATE TABLE `facturacompra` (
  `idfacturaCompra` int(11) NOT NULL,
  `administrador_idadministrador` int(11) NOT NULL,
  `provehedor_idprovehedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `precioProducto` varchar(45) NOT NULL,
  `cantidadProducto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `precioProducto`, `cantidadProducto`) VALUES
(1, 'aci', '100', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provehedor`
--

CREATE TABLE `provehedor` (
  `idprovehedor` int(11) NOT NULL,
  `nombreProvehedor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idadministrador`);

--
-- Indices de la tabla `cajero`
--
ALTER TABLE `cajero`
  ADD PRIMARY KEY (`idCajero`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`idDetalleCompra`,`Producto_idProducto`,`facturaCompra_idfacturaCompra`,`facturaCompra_administrador_idadministrador`,`facturaCompra_provehedor_idprovehedor`),
  ADD KEY `fk_DetalleCompra_Producto1_idx` (`Producto_idProducto`),
  ADD KEY `fk_DetalleCompra_facturaCompra1_idx` (`facturaCompra_idfacturaCompra`,`facturaCompra_administrador_idadministrador`,`facturaCompra_provehedor_idprovehedor`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idFacturaDetalle`,`idProductoDetalle`),
  ADD KEY `fk_Factura_has_Producto_Producto1_idx` (`idProductoDetalle`),
  ADD KEY `fk_Factura_has_Producto_Factura1_idx` (`idFacturaDetalle`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`,`idCajero`,`idCliente`),
  ADD KEY `fk_Factura_cajero1_idx` (`idCajero`),
  ADD KEY `fk_Factura_Cliente1_idx` (`idCliente`);

--
-- Indices de la tabla `facturacompra`
--
ALTER TABLE `facturacompra`
  ADD PRIMARY KEY (`idfacturaCompra`,`administrador_idadministrador`,`provehedor_idprovehedor`),
  ADD KEY `fk_facturaCompra_administrador1_idx` (`administrador_idadministrador`),
  ADD KEY `fk_facturaCompra_provehedor1_idx` (`provehedor_idprovehedor`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `provehedor`
--
ALTER TABLE `provehedor`
  ADD PRIMARY KEY (`idprovehedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajero`
--
ALTER TABLE `cajero`
  MODIFY `idCajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `fk_DetalleCompra_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DetalleCompra_facturaCompra1` FOREIGN KEY (`facturaCompra_idfacturaCompra`,`facturaCompra_administrador_idadministrador`,`facturaCompra_provehedor_idprovehedor`) REFERENCES `facturacompra` (`idfacturaCompra`, `administrador_idadministrador`, `provehedor_idprovehedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `fk_Factura_has_Producto_Factura1` FOREIGN KEY (`idFacturaDetalle`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_has_Producto_Producto1` FOREIGN KEY (`idProductoDetalle`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_cajero1` FOREIGN KEY (`idCajero`) REFERENCES `cajero` (`idCajero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturacompra`
--
ALTER TABLE `facturacompra`
  ADD CONSTRAINT `fk_facturaCompra_administrador1` FOREIGN KEY (`administrador_idadministrador`) REFERENCES `administrador` (`idadministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_facturaCompra_provehedor1` FOREIGN KEY (`provehedor_idprovehedor`) REFERENCES `provehedor` (`idprovehedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
