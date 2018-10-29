-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2018 a las 19:12:53
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `torosdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `efemeride`
--

CREATE TABLE `efemeride` (
  `idefemeride` int(11) NOT NULL,
  `provincia` varchar(255) DEFAULT '',
  `pueblo` varchar(255) DEFAULT '',
  `tipoevento` varchar(255) DEFAULT '',
  `fechaefemeride` date DEFAULT NULL,
  `ganaderia` varchar(255) DEFAULT '',
  `notas` text,
  `foto` varchar(255) DEFAULT '',
  `cartel` varchar(255) DEFAULT '',
  `fechareal` date DEFAULT NULL,
  `fuente` varchar(255) DEFAULT '',
  `reportaje` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `idimagen` int(11) NOT NULL,
  `idpersonaje` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `nombreimagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persoefe`
--

CREATE TABLE `persoefe` (
  `idefemeride` int(11) NOT NULL,
  `idpersonaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaje`
--

CREATE TABLE `personaje` (
  `idpersonaje` int(11) NOT NULL,
  `nombrepersonaje` varchar(255) DEFAULT '',
  `apellido1` varchar(255) DEFAULT '',
  `apellido2` varchar(255) DEFAULT '',
  `apodo1` varchar(255) DEFAULT '',
  `apodo2` varchar(255) DEFAULT '',
  `nombrecartel` varchar(255) DEFAULT '',
  `fechanacimiento` date DEFAULT NULL,
  `cossio` tinyint(1) DEFAULT NULL,
  `clm` tinyint(1) DEFAULT NULL,
  `completo` tinyint(1) DEFAULT NULL,
  `fechapresentacion` date DEFAULT NULL,
  `fechapicadores` date DEFAULT NULL,
  `fechaalternativa` date DEFAULT NULL,
  `notas` text,
  `fotografia` varchar(255) DEFAULT '',
  `personadecontacto` varchar(255) DEFAULT '',
  `direccion` varchar(255) DEFAULT '',
  `telefono` varchar(255) DEFAULT '',
  `correo` varchar(255) DEFAULT '',
  `biografia` varchar(255) DEFAULT '',
  `provincianacimiento` varchar(255) DEFAULT '',
  `pueblonacimiento` varchar(255) DEFAULT '',
  `provinciaactual` varchar(255) DEFAULT '',
  `puebloactual` varchar(255) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE `profesion` (
  `idprofesion` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesion`
--

INSERT INTO `profesion` (`idprofesion`, `descripcion`) VALUES
(3, 'Principiante'),
(4, 'Novillero'),
(5, 'Banderillero'),
(6, 'Picador'),
(7, 'Matador'),
(8, 'Rejoneador'),
(9, 'Recortador'),
(10, 'Torilero'),
(11, 'Mozo de espadas'),
(12, 'Cómico'),
(13, 'Mayoral'),
(14, 'Ganadero'),
(15, 'Apoderado'),
(16, 'Empresario'),
(17, 'Escritor'),
(18, 'Pintor'),
(19, 'Escultor'),
(20, 'Sastre'),
(21, 'Cuadra de picar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo`
--

CREATE TABLE `trabajo` (
  `idpersonaje` int(11) NOT NULL,
  `idprofesion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombreusuario` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombreusuario`, `contraseña`) VALUES
(1, 'superadmin', 'b640a0ce465fa2a4150c36b305c1c11b'),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `efemeride`
--
ALTER TABLE `efemeride`
  ADD PRIMARY KEY (`idefemeride`);

--
-- Indices de la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`idimagen`,`idpersonaje`),
  ADD KEY `FK_FOTOS_PERSONAJE` (`idimagen`),
  ADD KEY `idpersonaje` (`idpersonaje`);

--
-- Indices de la tabla `persoefe`
--
ALTER TABLE `persoefe`
  ADD PRIMARY KEY (`idefemeride`,`idpersonaje`),
  ADD KEY `FK_PERSOEFE_EFEMERIDE` (`idpersonaje`);

--
-- Indices de la tabla `personaje`
--
ALTER TABLE `personaje`
  ADD PRIMARY KEY (`idpersonaje`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`idprofesion`);

--
-- Indices de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD PRIMARY KEY (`idpersonaje`,`idprofesion`),
  ADD KEY `FK_TRABAJO_PROFESION` (`idprofesion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `efemeride`
--
ALTER TABLE `efemeride`
  MODIFY `idefemeride` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fotos`
--
ALTER TABLE `fotos`
  MODIFY `idimagen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personaje`
--
ALTER TABLE `personaje`
  MODIFY `idpersonaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fotos_ibfk_1` FOREIGN KEY (`idpersonaje`) REFERENCES `personaje` (`idpersonaje`);

--
-- Filtros para la tabla `persoefe`
--
ALTER TABLE `persoefe`
  ADD CONSTRAINT `FK_PERSOEFE_EFEMERIDE` FOREIGN KEY (`idefemeride`) REFERENCES `efemeride` (`idefemeride`),
  ADD CONSTRAINT `FK_PERSOEFE_PERSONAJE` FOREIGN KEY (`idpersonaje`) REFERENCES `personaje` (`idpersonaje`);

--
-- Filtros para la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD CONSTRAINT `FK_TRABAJO_PERSONAJE` FOREIGN KEY (`idpersonaje`) REFERENCES `personaje` (`idpersonaje`),
  ADD CONSTRAINT `FK_TRABAJO_PROFESION` FOREIGN KEY (`idprofesion`) REFERENCES `profesion` (`idprofesion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
