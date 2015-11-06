-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2015 a las 21:18:32
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen_insumo`
--

CREATE TABLE IF NOT EXISTS `almacen_insumo` (
  `idAlmacen` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `unidad_medida` char(4) NOT NULL,
  `idInsumo` int(11) NOT NULL,
  PRIMARY KEY (`idAlmacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebida`
--

CREATE TABLE IF NOT EXISTS `bebida` (
  `idBebida` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `idMarcaBebida` int(11) NOT NULL,
  `idTipoBebida` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idBebida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bebida_pedido`
--

CREATE TABLE IF NOT EXISTS `bebida_pedido` (
  `idBebidaPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idBebida` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`idBebidaPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `Oservacion` text,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE IF NOT EXISTS `forma_pago` (
  `idFormaPago` int(11) NOT NULL AUTO_INCREMENT,
  `formaPago` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idFormaPago`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`idFormaPago`, `formaPago`, `descripcion`) VALUES
(1, 'Credito', 'Este tipo de pago consiste en pagar a traves de monedas o billetes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo`
--

CREATE TABLE IF NOT EXISTS `insumo` (
  `idInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `insumo` varchar(45) NOT NULL,
  `idTipo_insumo` int(11) NOT NULL,
  PRIMARY KEY (`idInsumo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `insumo`
--

INSERT INTO `insumo` (`idInsumo`, `insumo`, `idTipo_insumo`) VALUES
(1, 'Arroz', 1),
(2, 'Leche', 6),
(3, 'Mantequilla', 6),
(4, 'Bonito', 5),
(5, 'Pollo', 4),
(6, 'Queso', 6),
(7, 'Papa', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_bebida`
--

CREATE TABLE IF NOT EXISTS `marca_bebida` (
  `idMarcaBebida` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMarca` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idMarcaBebida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE IF NOT EXISTS `mesa` (
  `idMesa` int(11) NOT NULL AUTO_INCREMENT,
  `mesa` char(3) NOT NULL,
  `maxComensales` tinyint(4) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`idMesa`),
  UNIQUE KEY `mesa` (`mesa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`idMesa`, `mesa`, `maxComensales`, `estado`, `descripcion`) VALUES
(1, 'A', 6, 1, 'La mesa se encuentra en la parte izquierda de la entrada del restaurante.'),
(2, 'B', 4, 1, 'Esta mesa se encuentra ubicada en la parte derecha de la entrada del restaurante.'),
(3, 'C', 5, 0, 'Esta mesa se encuentra en la parte derecha del restaurante en la segunda fila.'),
(4, 'D', 5, 1, 'Esta mesa se encuentra en la parte derecha del restaurante en la fila numero 4.'),
(5, 'E', 6, 0, 'Esta mesa se encuentra en la parte izquierda del restaurante. Numero de fila: 4.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `time` time NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `idMesa` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `fecha`, `time`, `estado`, `idMesa`) VALUES
(1, '2015-10-13', '02:45:12', 0, 3),
(2, '2015-10-13', '02:45:40', 0, 4),
(3, '2015-10-13', '838:59:59', 0, 2),
(24, '2015-10-22', '10:39:22', 0, 3),
(25, '2015-10-22', '11:19:45', 0, 3),
(31, '2015-10-22', '14:43:32', 0, 1),
(32, '2015-10-22', '14:48:19', 0, 3),
(33, '2015-10-22', '14:50:44', 0, 1),
(34, '2015-10-23', '08:52:48', 0, 1),
(35, '2015-10-23', '09:36:31', 1, 1),
(36, '2015-10-23', '09:37:11', 1, 2),
(39, '2015-10-24', '17:21:12', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_almacenb`
--

CREATE TABLE IF NOT EXISTS `pedido_almacenb` (
  `idPedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnidad` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `fechaPedido` date NOT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `observacion` text,
  `idBebida` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_almaceni`
--

CREATE TABLE IF NOT EXISTS `pedido_almaceni` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `unidad` char(4) NOT NULL,
  `precioUnidad` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `fechaPedido` date NOT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `idAlmacen` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `observacion` text,
  PRIMARY KEY (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE IF NOT EXISTS `plato` (
  `idplato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `idTipoPlato` int(11) NOT NULL,
  PRIMARY KEY (`idplato`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`idplato`, `nombre`, `precio`, `descripcion`, `imagen`, `idTipoPlato`) VALUES
(1, 'Warak Enab', '12.59', 'Hojas de parra rellenas de arroz con un toque de tomate, perejil, hierbabuena y cebolla.', 'warak_enab.jpg', 5),
(2, 'Labne', '14.25', 'Yogur cremoso natural del chef con hierbabuena fresca, aderezado con aceite de oliva virgen extra.', 'labne.jpg', 5),
(3, 'Muhammara', '45.20', 'Crema de pimientos rojos, nueces y esencia de granada aderezado con aceite de oliva.', 'muhammara.jpg', 5),
(4, 'Mutabbal ', '12.58', 'Crema de berenjenas ahumadas con yogur cremoso natural y un toque de salsa de sésamo.', 'mutabbal.jpg', 5),
(5, 'Hommos', '16.25', 'Crema de garbanzos con salsa de sésamo, un toque de limón y aderezada con aceite de oliva virgen extra.', 'hommos.jpg', 5),
(6, 'Tzaziki', '40.20', 'Ensalada a base de yogur y pepino finamente picado con un toque de hierbabuena y ajo', 'tzatziki.jpg', 3),
(7, 'Fattush', '28.24', 'Ensalada con tomate, pepino, pimientos verdes, hierbabuena y crujiente de pan de pita aderezado con “summac”.', 'fattush.jpg', 3),
(8, 'Tabbule', '14.78', 'Ensalada a base de perejil finamente picado con tomate, cebolla y sémola de trigo aliñado con limón y aceite de oliva virgen extra', 'tabbule.jpg', 3),
(9, 'Mehallabieh', '12.25', 'Cuajada libanesa casera con pistachos y aderezada con almíbar y agua de azahar', 'mhallabie.jpg', 1),
(10, 'Othmalieh', '12.30', 'Masa de fideos horneados con crema de leche libanesa', 'othmalieh.jpg', 1),
(11, 'Baklava', '7.89', 'Milhojas de pasta filo rellena de nueces molidas y sirope.', 'baklava.jpg', 1),
(12, 'Batata harra', '14.10', 'Patatas salteadas con ajo, cilantro fresco y un toque de limón', 'batata_harra.jpg', 6),
(13, 'Arayes', '15.20', 'Pan de pita tostado al carbón relleno de carne picada y queso fundido.', 'arayes.jpg', 6),
(14, 'Hommos bil-lahme', '12.10', 'Crema de garbanzos y salsa de sésamo cubierta de carne de ternera y piñones.', 'hommos_lahme.jpg', 6),
(15, 'Falafel', '12.45', 'Croquetas vegetales del chef hechas a base de garbanzos y perejil acompañadas de salsa “tahine”.', 'falafel.jpg', 6),
(16, 'Kibbe', '13.64', 'Croquetas elaboradas con una masa de sémola de trigo y rellenas de carne picada y piñones.', 'kibbe.jpg', 6),
(17, 'Sfiha', '10.64', 'Pizza árabe elaborada con la masa del chef y cubierta de carne de ternera y tomate.', 'sfiha.jpg', 6),
(18, 'Fatayer bil-sabanegh', '12.36', 'Empanadillas elaboradas con la masa del chef rellenas de espinacas y un toque de “sumac”.', 'fatayer_sabanegh.jpg', 6),
(19, 'fatayer bil-jibne', '10.14', 'Empanadillas elaboradas con la masa del chef rellenas de queso fresco de oveja.', 'fatayer_jibne.jpg', 6),
(20, 'Fatayer bil-lahme', '15.42', 'Empanadillas elaboradas con la masa del chef rellenas de carne picada y un toque de especias.', 'fatayer_lahme.jpg', 6),
(21, 'Sambusek bil-jibne', '9.56', 'Triángulos de hojaldre fritos rellenos de queso.', 'sambusek.jpg', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato_insumo`
--

CREATE TABLE IF NOT EXISTS `plato_insumo` (
  `idInsumo` int(11) NOT NULL,
  `idplato` int(11) NOT NULL,
  `cantidad` double(5,2) NOT NULL,
  `unidadMedida` int(4) NOT NULL,
  KEY `unidadMedida` (`unidadMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plato_insumo`
--

INSERT INTO `plato_insumo` (`idInsumo`, `idplato`, `cantidad`, `unidadMedida`) VALUES
(1, 1, 0.50, 1),
(2, 1, 0.25, 1),
(3, 1, 0.50, 1),
(6, 1, 0.20, 1),
(6, 2, 0.50, 3),
(3, 2, 0.10, 1),
(7, 2, 0.15, 1),
(1, 2, 0.30, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato_pedido`
--

CREATE TABLE IF NOT EXISTS `plato_pedido` (
  `idPlatoPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) NOT NULL,
  `idplato` int(11) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`idPlatoPedido`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `plato_pedido`
--

INSERT INTO `plato_pedido` (`idPlatoPedido`, `idPedido`, `idplato`, `estado`) VALUES
(1, 25, 1, '0'),
(2, 26, 14, '0'),
(3, 31, 14, '0'),
(4, 31, 15, '0'),
(5, 32, 1, '0'),
(6, 32, 3, '0'),
(7, 33, 1, '0'),
(8, 33, 11, '0'),
(9, 32, 1, '0'),
(10, 33, 14, '0'),
(11, 34, 9, '0'),
(12, 34, 1, '0'),
(13, 36, 1, '0'),
(16, 33, 1, '0'),
(17, 33, 1, '0'),
(18, 33, 1, '0'),
(19, 39, 1, '0'),
(20, 40, 1, '0'),
(21, 36, 1, '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato_staff`
--

CREATE TABLE IF NOT EXISTS `plato_staff` (
  `idStaff` int(11) NOT NULL,
  `plato_idplato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `ruc` int(11) NOT NULL,
  `institucion` varchar(45) NOT NULL,
  `movil` char(9) NOT NULL,
  `telefono` char(6) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `idStaff` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `email` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `dni` char(8) NOT NULL,
  `alias` varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL,
  `movil` char(9) NOT NULL,
  `telefono` char(6) DEFAULT NULL,
  `idUser` int(3) NOT NULL,
  PRIMARY KEY (`idStaff`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `staff`
--

INSERT INTO `staff` (`idStaff`, `nombres`, `apellidos`, `email`, `direccion`, `dni`, `alias`, `password`, `movil`, `telefono`, `idUser`) VALUES
(1, 'Alexander Paúl', 'Arévalo Garavito', 'lex_94@outlook.com', 'Mercado Jarrín Mz. H lote 2', '61152516', 'garalex', '48da268e29e90b0a1e0d23b541296c6c', '979008620', '378520', 1),
(2, 'Jose Danit', 'Machado Berru', 'danit_17@outlook.com', 'Jr. Junin 478', '9874561', 'danit15', '8abc3055cc46205d136e5a56fee482dc', '978565412', '378955', 2),
(3, 'Milagros', 'Hurtado Hernandez', 'mili45@hotmail.com', 'Av. Ramón Castilla 589', '615478', 'hurtado15', 'ce14663d1413b2165f1b1ef65133c697', '978569845', '345689', 2),
(4, 'Tatiana Smith', 'Lopez Valdiviezo', 'tatiana1525@gmail.com', 'Jr. Cuzco 158', '6458978', 'tati1584', 'd7c6f7cc1cd394cfeb361d89e34ecb5b', '987456321', NULL, 3),
(5, 'Kelia Anais', 'Castillo Palacios', 'anais1587@outlook.com', 'Jr. Circunvalacion 1478', '65478968', 'ana1478', '4a9355bb25d05872f0fe94d88d8b5d6f', '985236478', '378569', 3),
(6, 'Diego Andersen', 'Granda Morales', 'diego154@gmail.com', 'Jr. Junin 1547', '68956789', 'diego1524', '1f6c341f325fc5e0a347e5c668aea425', '965477898', '347895', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_bebida`
--

CREATE TABLE IF NOT EXISTS `tipo_bebida` (
  `idTipoBebida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idTipoBebida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_insumo`
--

CREATE TABLE IF NOT EXISTS `tipo_insumo` (
  `idTipo_insumo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_insumo` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idTipo_insumo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tipo_insumo`
--

INSERT INTO `tipo_insumo` (`idTipo_insumo`, `tipo_insumo`, `descripcion`) VALUES
(1, 'Cereales', 'comprende a los cereales que son parte de los platos del restaurante'),
(2, 'Tuberculos', 'comprende tuberculos que son parte de los platos del restaurante'),
(3, 'Menestras', 'comprende los diferentes tipos de menestra que existen y usan para preparar los mas ricos platos del menu'),
(4, 'Carnes', 'Comprende las diferentes tipos de carnes que se utilizan para preparar los ricos platos del menu. Incluye visceras entre otros.'),
(5, 'Pescados y Mariscos', 'Comprende los mas ricos pescadosque se usan para preparar los platos deliciosos del menu.'),
(6, 'Lacteos', 'Incluye leche, mantequilla entre otros insumos que son usados para preparar los ricos platos del menu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_plato`
--

CREATE TABLE IF NOT EXISTS `tipo_plato` (
  `idTipoPlato` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPlato` varchar(45) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  PRIMARY KEY (`idTipoPlato`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tipo_plato`
--

INSERT INTO `tipo_plato` (`idTipoPlato`, `tipoPlato`, `descripcion`) VALUES
(1, 'Postres', 'Tipo de platos exquisitos de tipo postres como mazamorra morada, pie de limon, etc.'),
(2, 'Caldos y sopas', 'De tipo sopas al gusto del cliente'),
(3, 'Verduras y ensaladas', 'platos de los mas diversos que tienen como base las verduras.'),
(4, 'Pastas', 'platos de los mas diversos tipos.'),
(5, 'Entrantes frios', 'Platos del menu del tipo Entrantes frios'),
(6, 'Entrantes calientes', 'Los mas diversos tipos de platos entrantes calientes'),
(7, 'Segundos', 'tipos de platos del nivel segundos'),
(8, 'Primeros', 'tipos de platos del nivel primeros'),
(9, 'Pescados y Mariscos', 'Platos que tienen como base peces de los mas diversos.'),
(10, 'Carnes', 'tipos de platos de los mas diversos que tienen como base carne.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_staff`
--

CREATE TABLE IF NOT EXISTS `tipo_staff` (
  `idUser` int(3) NOT NULL AUTO_INCREMENT,
  `tipoUser` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipo_staff`
--

INSERT INTO `tipo_staff` (`idUser`, `tipoUser`, `descripcion`) VALUES
(1, 'Administrador', 'Esta tipo de usuario tiene como función observar las estadísticas acerca de las ventas que se realizan al mes en el restaurante "Lo Nuestro".'),
(2, 'Camarero', 'Esta tipo de usuario se dedica a entregar los móviles a los clientes para que estos puedan realizar sus pedidos. Iniciara sesión y luego se ello elegirá la mesa a la cual atenderá.'),
(3, 'Cheff', 'Este usuario será capaz de visualizar los pedidos en tiempo real, y por lo tanto será el usuario que sea capaz de decir que tal plato ya está entregado.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadmedida`
--

CREATE TABLE IF NOT EXISTS `unidadmedida` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nombreU` varchar(15) NOT NULL,
  `unidad` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidad` (`unidad`),
  UNIQUE KEY `nombreU` (`nombreU`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `unidadmedida`
--

INSERT INTO `unidadmedida` (`id`, `nombreU`, `unidad`) VALUES
(1, 'kilogramo', 'kg'),
(2, 'Unidad', 'UN'),
(3, 'Litro', 'L');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(8,2) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idFormaPago` int(11) NOT NULL,
  PRIMARY KEY (`idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `plato_insumo`
--
ALTER TABLE `plato_insumo`
  ADD CONSTRAINT `plato_insumo_ibfk_1` FOREIGN KEY (`unidadMedida`) REFERENCES `unidadmedida` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
