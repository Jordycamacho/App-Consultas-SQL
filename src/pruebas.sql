-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-07-2023 a las 11:14:35
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `CODIGOCLIENTE` varchar(4) NOT NULL,
  `EMPRESA` varchar(20) DEFAULT NULL,
  `DIRECCION` varchar(20) DEFAULT NULL,
  `POBLACION` varchar(20) DEFAULT NULL,
  `TELEFONO` int NOT NULL,
  `RESPONSABLE` varchar(20) DEFAULT NULL,
  `HISTORIAL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGOCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`CODIGOCLIENTE`, `EMPRESA`, `DIRECCION`, `POBLACION`, `TELEFONO`, `RESPONSABLE`, `HISTORIAL`) VALUES
('EF34', 'JENOB', 'callee pipo 34', 'Madrid', 650294586, 'Pepe', 'flojo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `CODIGOARTICULO` varchar(4) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `SECCION` varchar(11) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `NOMBREARTICULO` varchar(20) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `PRECIO` double NOT NULL,
  `FECHA` date DEFAULT NULL,
  `IMPORTADO` varchar(20) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `PAISORIGEN` varchar(20) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `FOTO` varchar(20) CHARACTER SET utf16 COLLATE utf16_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`CODIGOARTICULO`, `SECCION`, `NOMBREARTICULO`, `PRECIO`, `FECHA`, `IMPORTADO`, `PAISORIGEN`, `FOTO`) VALUES
('KF45', 'Seccion1', 'uija', 34, NULL, 'Peru', 'Baticano', NULL),
('KF45', 'Seccion1', 'uija', 34, NULL, 'Peru', 'Baticano', NULL),
('KF45', 'Seccion1', 'uija', 34, NULL, 'Peru', 'Baticano', NULL),
('JM30', 'Seccion2', 'AK-47', 3445, NULL, 'Suisa', 'EEUU', NULL),
('JM30', 'Seccion2', 'AK-47', 3445, NULL, 'Suisa', 'EEUU', NULL),
('JM30', 'Seccion2', 'AK-47', 3445, NULL, 'Suisa', 'EEUU', NULL),
('MK09', 'Seccion3', 'Agua dulce', 3445, NULL, 'Congo', 'Bolibia', NULL),
('MK09', 'Seccion3', 'Agua dulce', 3445, NULL, 'Congo', 'Bolibia', NULL),
('MK09', 'Seccion3', 'Agua dulce', 3445, NULL, 'Congo', 'Bolibia', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
