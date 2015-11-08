-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: mydb
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE mydb;

--
-- Table structure for table `almacen_insumo`
--

DROP TABLE IF EXISTS almacen_insumo;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE almacen_insumo (
  idAlmacen int(11) NOT NULL,
  cantidad double NOT NULL,
  unidad_medida char(4) NOT NULL,
  idInsumo int(11) NOT NULL,
  PRIMARY KEY (idAlmacen),
  KEY fk_almacen_insumo_insumo1_idx (idInsumo),
  CONSTRAINT fk_almacen_insumo_insumo1 FOREIGN KEY (idInsumo) REFERENCES insumo (idInsumo) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen_insumo`
--

LOCK TABLES almacen_insumo WRITE;
/*!40000 ALTER TABLE almacen_insumo DISABLE KEYS */;
/*!40000 ALTER TABLE almacen_insumo ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bebida`
--

DROP TABLE IF EXISTS bebida;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE bebida (
  idBebida int(11) NOT NULL,
  nombre varchar(45) NOT NULL,
  precio varchar(45) NOT NULL,
  descripcion text NOT NULL,
  idMarcaBebida int(11) NOT NULL,
  idTipoBebida int(11) NOT NULL,
  cantidad int(11) NOT NULL,
  PRIMARY KEY (idBebida),
  KEY fk_bebida_marca_bebida1_idx (idMarcaBebida),
  KEY fk_bebida_tipo_bebida1_idx (idTipoBebida),
  CONSTRAINT fk_bebida_marca_bebida1 FOREIGN KEY (idMarcaBebida) REFERENCES marca_bebida (idMarcaBebida) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_bebida_tipo_bebida1 FOREIGN KEY (idTipoBebida) REFERENCES tipo_bebida (idTipoBebida) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebida`
--

LOCK TABLES bebida WRITE;
/*!40000 ALTER TABLE bebida DISABLE KEYS */;
/*!40000 ALTER TABLE bebida ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bebida_pedido`
--

DROP TABLE IF EXISTS bebida_pedido;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE bebida_pedido (
  idBebidaPedido int(11) NOT NULL AUTO_INCREMENT,
  idBebida int(11) NOT NULL,
  idPedido int(11) NOT NULL,
  estado char(1) NOT NULL,
  PRIMARY KEY (idBebidaPedido),
  KEY fk_bebida_pedido_bebida1_idx (idBebida),
  KEY fk_bebida_pedido_pedido_almacenb1_idx (idPedido),
  CONSTRAINT fk_bebida_pedido_bebida1 FOREIGN KEY (idBebida) REFERENCES bebida (idBebida) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_bebida_pedido_pedido_almacenb1 FOREIGN KEY (idPedido) REFERENCES pedido_almacenb (idPedido) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebida_pedido`
--

LOCK TABLES bebida_pedido WRITE;
/*!40000 ALTER TABLE bebida_pedido DISABLE KEYS */;
/*!40000 ALTER TABLE bebida_pedido ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS cliente;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE cliente (
  idCliente int(11) NOT NULL AUTO_INCREMENT,
  nombres varchar(30) NOT NULL,
  apellidos varchar(30) NOT NULL,
  email varchar(45) DEFAULT NULL,
  Oservacion text,
  PRIMARY KEY (idCliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES cliente WRITE;
/*!40000 ALTER TABLE cliente DISABLE KEYS */;
/*!40000 ALTER TABLE cliente ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS forma_pago;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE forma_pago (
  idFormaPago int(11) NOT NULL AUTO_INCREMENT,
  formaPago varchar(50) NOT NULL,
  descripcion text NOT NULL,
  PRIMARY KEY (idFormaPago)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES forma_pago WRITE;
/*!40000 ALTER TABLE forma_pago DISABLE KEYS */;
INSERT INTO forma_pago (idFormaPago, formaPago, descripcion) VALUES (1,'Credito','Este tipo de pago consiste en pagar a traves de monedas o billetes');
/*!40000 ALTER TABLE forma_pago ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS insumo;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE insumo (
  idInsumo int(11) NOT NULL AUTO_INCREMENT,
  insumo varchar(45) NOT NULL,
  idTipo_insumo int(11) NOT NULL,
  PRIMARY KEY (idInsumo)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES insumo WRITE;
/*!40000 ALTER TABLE insumo DISABLE KEYS */;
INSERT INTO insumo (idInsumo, insumo, idTipo_insumo) VALUES (1,'Arroz',1);
INSERT INTO insumo (idInsumo, insumo, idTipo_insumo) VALUES (2,'Leche',6);
INSERT INTO insumo (idInsumo, insumo, idTipo_insumo) VALUES (3,'Mantequilla',6);
INSERT INTO insumo (idInsumo, insumo, idTipo_insumo) VALUES (4,'Bonito',5);
INSERT INTO insumo (idInsumo, insumo, idTipo_insumo) VALUES (5,'Pollo',4);
INSERT INTO insumo (idInsumo, insumo, idTipo_insumo) VALUES (6,'Queso',6);
INSERT INTO insumo (idInsumo, insumo, idTipo_insumo) VALUES (7,'Papa',2);
/*!40000 ALTER TABLE insumo ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca_bebida`
--

DROP TABLE IF EXISTS marca_bebida;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE marca_bebida (
  idMarcaBebida int(11) NOT NULL AUTO_INCREMENT,
  nombreMarca varchar(45) NOT NULL,
  descripcion text NOT NULL,
  PRIMARY KEY (idMarcaBebida)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca_bebida`
--

LOCK TABLES marca_bebida WRITE;
/*!40000 ALTER TABLE marca_bebida DISABLE KEYS */;
/*!40000 ALTER TABLE marca_bebida ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS mesa;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE mesa (
  idMesa int(11) NOT NULL AUTO_INCREMENT,
  mesa char(3) NOT NULL,
  maxComensales tinyint(4) NOT NULL,
  estado tinyint(1) NOT NULL,
  descripcion text,
  PRIMARY KEY (idMesa),
  UNIQUE KEY mesa (mesa)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES mesa WRITE;
/*!40000 ALTER TABLE mesa DISABLE KEYS */;
INSERT INTO mesa (idMesa, mesa, maxComensales, estado, descripcion) VALUES (1,'A',6,1,'La mesa se encuentra en la parte izquierda de la entrada del restaurante.');
INSERT INTO mesa (idMesa, mesa, maxComensales, estado, descripcion) VALUES (2,'B',4,1,'Esta mesa se encuentra ubicada en la parte derecha de la entrada del restaurante.');
INSERT INTO mesa (idMesa, mesa, maxComensales, estado, descripcion) VALUES (3,'C',5,0,'Esta mesa se encuentra en la parte derecha del restaurante en la segunda fila.');
INSERT INTO mesa (idMesa, mesa, maxComensales, estado, descripcion) VALUES (4,'D',5,1,'Esta mesa se encuentra en la parte derecha del restaurante en la fila numero 4.');
INSERT INTO mesa (idMesa, mesa, maxComensales, estado, descripcion) VALUES (5,'E',6,0,'Esta mesa se encuentra en la parte izquierda del restaurante. Numero de fila: 4.');
/*!40000 ALTER TABLE mesa ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS pedido;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE pedido (
  idPedido int(11) NOT NULL AUTO_INCREMENT,
  fecha date NOT NULL,
  `time` time NOT NULL,
  estado tinyint(1) NOT NULL,
  idMesa int(11) NOT NULL,
  PRIMARY KEY (idPedido),
  KEY fk_pedido_mesa_idx (idMesa),
  CONSTRAINT fk_pedido_mesa FOREIGN KEY (idMesa) REFERENCES mesa (idMesa) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES pedido WRITE;
/*!40000 ALTER TABLE pedido DISABLE KEYS */;
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (1,'2015-10-13','02:45:12',0,3);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (2,'2015-10-13','02:45:40',0,4);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (3,'2015-10-13','838:59:59',0,2);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (24,'2015-10-22','10:39:22',0,3);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (25,'2015-10-22','11:19:45',0,3);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (31,'2015-10-22','14:43:32',0,1);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (32,'2015-10-22','14:48:19',0,3);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (33,'2015-10-22','14:50:44',0,1);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (34,'2015-10-23','08:52:48',0,1);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (35,'2015-10-23','09:36:31',1,1);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (36,'2015-10-23','09:37:11',1,2);
INSERT INTO pedido (idPedido, fecha, time, estado, idMesa) VALUES (39,'2015-10-24','17:21:12',1,4);
/*!40000 ALTER TABLE pedido ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_almacenb`
--

DROP TABLE IF EXISTS pedido_almacenb;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE pedido_almacenb (
  idPedido int(11) NOT NULL,
  cantidad int(11) NOT NULL,
  precioUnidad decimal(10,2) NOT NULL,
  precioTotal decimal(10,2) NOT NULL,
  fechaPedido date NOT NULL,
  fechaEntrega date DEFAULT NULL,
  observacion text,
  idBebida int(11) NOT NULL,
  idProveedor int(11) NOT NULL,
  PRIMARY KEY (idPedido),
  KEY fk_pedido_almacenb_proveedor1_idx (idProveedor),
  CONSTRAINT fk_pedido_almacenb_proveedor1 FOREIGN KEY (idProveedor) REFERENCES proveedor (idProveedor) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_almacenb`
--

LOCK TABLES pedido_almacenb WRITE;
/*!40000 ALTER TABLE pedido_almacenb DISABLE KEYS */;
/*!40000 ALTER TABLE pedido_almacenb ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_almaceni`
--

DROP TABLE IF EXISTS pedido_almaceni;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE pedido_almaceni (
  idPedido int(11) NOT NULL AUTO_INCREMENT,
  cantidad double NOT NULL,
  unidad char(4) NOT NULL,
  precioUnidad decimal(10,2) NOT NULL,
  precioTotal decimal(10,2) NOT NULL,
  fechaPedido date NOT NULL,
  fechaEntrega date DEFAULT NULL,
  idAlmacen int(11) NOT NULL,
  idProveedor int(11) NOT NULL,
  observacion text,
  PRIMARY KEY (idPedido),
  KEY fk_pedido_almaceni_proveedor1_idx (idProveedor),
  CONSTRAINT fk_pedido_almaceni_proveedor1 FOREIGN KEY (idProveedor) REFERENCES proveedor (idProveedor) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_almaceni`
--

LOCK TABLES pedido_almaceni WRITE;
/*!40000 ALTER TABLE pedido_almaceni DISABLE KEYS */;
/*!40000 ALTER TABLE pedido_almaceni ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato`
--

DROP TABLE IF EXISTS plato;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE plato (
  idplato int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(45) NOT NULL,
  precio decimal(6,2) NOT NULL,
  descripcion text NOT NULL,
  imagen varchar(150) NOT NULL,
  idTipoPlato int(11) NOT NULL,
  PRIMARY KEY (idplato),
  UNIQUE KEY imagen_UNIQUE (imagen),
  KEY fk_plato_tipo_plato1_idx (idTipoPlato),
  CONSTRAINT fk_plato_tipo_plato1 FOREIGN KEY (idTipoPlato) REFERENCES tipo_plato (idTipoPlato) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato`
--

LOCK TABLES plato WRITE;
/*!40000 ALTER TABLE plato DISABLE KEYS */;
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (1,'Warak Enab',12.59,'Hojas de parra rellenas de arroz con un toque de tomate, perejil, hierbabuena y cebolla.','warak_enab.jpg',5);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (2,'Labne',14.25,'Yogur cremoso natural del chef con hierbabuena fresca, aderezado con aceite de oliva virgen extra.','labne.jpg',5);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (3,'Muhammara',45.20,'Crema de pimientos rojos, nueces y esencia de granada aderezado con aceite de oliva.','muhammara.jpg',5);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (4,'Mutabbal ',12.58,'Crema de berenjenas ahumadas con yogur cremoso natural y un toque de salsa de sésamo.','mutabbal.jpg',5);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (5,'Hommos',16.25,'Crema de garbanzos con salsa de sésamo, un toque de limón y aderezada con aceite de oliva virgen extra.','hommos.jpg',5);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (6,'Tzaziki',40.20,'Ensalada a base de yogur y pepino finamente picado con un toque de hierbabuena y ajo','tzatziki.jpg',3);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (7,'Fattush',28.24,'Ensalada con tomate, pepino, pimientos verdes, hierbabuena y crujiente de pan de pita aderezado con “summac”.','fattush.jpg',3);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (8,'Tabbule',14.78,'Ensalada a base de perejil finamente picado con tomate, cebolla y sémola de trigo aliñado con limón y aceite de oliva virgen extra','tabbule.jpg',3);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (9,'Mehallabieh',12.25,'Cuajada libanesa casera con pistachos y aderezada con almíbar y agua de azahar','mhallabie.jpg',1);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (10,'Othmalieh',12.30,'Masa de fideos horneados con crema de leche libanesa','othmalieh.jpg',1);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (11,'Baklava',7.89,'Milhojas de pasta filo rellena de nueces molidas y sirope.','baklava.jpg',1);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (12,'Batata harra',14.10,'Patatas salteadas con ajo, cilantro fresco y un toque de limón','batata_harra.jpg',6);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (13,'Arayes',15.20,'Pan de pita tostado al carbón relleno de carne picada y queso fundido.','arayes.jpg',6);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (14,'Hommos bil-lahme',12.10,'Crema de garbanzos y salsa de sésamo cubierta de carne de ternera y piñones.','hommos_lahme.jpg',6);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (15,'Falafel',12.45,'Croquetas vegetales del chef hechas a base de garbanzos y perejil acompañadas de salsa “tahine”.','falafel.jpg',6);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (16,'Kibbe',13.64,'Croquetas elaboradas con una masa de sémola de trigo y rellenas de carne picada y piñones.','kibbe.jpg',6);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (17,'Sfiha',10.64,'Pizza árabe elaborada con la masa del chef y cubierta de carne de ternera y tomate.','sfiha.jpg',6);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (18,'Fatayer bil-sabanegh',12.36,'Empanadillas elaboradas con la masa del chef rellenas de espinacas y un toque de “sumac”.','fatayer_sabanegh.jpg',6);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (19,'fatayer bil-jibne',10.14,'Empanadillas elaboradas con la masa del chef rellenas de queso fresco de oveja.','fatayer_jibne.jpg',6);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (20,'Fatayer bil-lahme',15.42,'Empanadillas elaboradas con la masa del chef rellenas de carne picada y un toque de especias.','fatayer_lahme.jpg',6);
INSERT INTO plato (idplato, nombre, precio, descripcion, imagen, idTipoPlato) VALUES (21,'Sambusek bil-jibne',9.56,'Triángulos de hojaldre fritos rellenos de queso.','sambusek.jpg',6);
/*!40000 ALTER TABLE plato ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato_insumo`
--

DROP TABLE IF EXISTS plato_insumo;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE plato_insumo (
  idInsumo int(11) NOT NULL,
  idplato int(11) NOT NULL,
  cantidad double(5,2) NOT NULL,
  unidadMedida int(4) NOT NULL,
  KEY unidadMedida (unidadMedida),
  CONSTRAINT plato_insumo_ibfk_1 FOREIGN KEY (unidadMedida) REFERENCES unidadmedida (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato_insumo`
--

LOCK TABLES plato_insumo WRITE;
/*!40000 ALTER TABLE plato_insumo DISABLE KEYS */;
INSERT INTO plato_insumo (idInsumo, idplato, cantidad, unidadMedida) VALUES (1,1,0.50,1);
INSERT INTO plato_insumo (idInsumo, idplato, cantidad, unidadMedida) VALUES (2,1,0.25,1);
INSERT INTO plato_insumo (idInsumo, idplato, cantidad, unidadMedida) VALUES (3,1,0.50,1);
INSERT INTO plato_insumo (idInsumo, idplato, cantidad, unidadMedida) VALUES (6,1,0.20,1);
INSERT INTO plato_insumo (idInsumo, idplato, cantidad, unidadMedida) VALUES (6,2,0.50,3);
INSERT INTO plato_insumo (idInsumo, idplato, cantidad, unidadMedida) VALUES (3,2,0.10,1);
INSERT INTO plato_insumo (idInsumo, idplato, cantidad, unidadMedida) VALUES (7,2,0.15,1);
INSERT INTO plato_insumo (idInsumo, idplato, cantidad, unidadMedida) VALUES (1,2,0.30,1);
/*!40000 ALTER TABLE plato_insumo ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato_pedido`
--

DROP TABLE IF EXISTS plato_pedido;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE plato_pedido (
  idPlatoPedido int(11) NOT NULL AUTO_INCREMENT,
  idPedido int(11) NOT NULL,
  idplato int(11) NOT NULL,
  estado char(1) NOT NULL,
  PRIMARY KEY (idPlatoPedido),
  KEY fk_plato_pedido_pedido_idx (idPedido),
  KEY fk_plato_pedido_plato_idx (idplato),
  CONSTRAINT fk_plato_pedido_pedido FOREIGN KEY (idPedido) REFERENCES pedido (idPedido) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_plato_pedido_plato FOREIGN KEY (idplato) REFERENCES plato (idplato) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato_pedido`
--

LOCK TABLES plato_pedido WRITE;
/*!40000 ALTER TABLE plato_pedido DISABLE KEYS */;
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (1,25,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (2,26,14,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (3,31,14,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (4,31,15,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (5,32,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (6,32,3,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (7,33,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (8,33,11,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (9,32,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (10,33,14,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (11,34,9,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (12,34,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (13,36,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (16,33,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (17,33,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (18,33,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (19,39,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (20,40,1,'0');
INSERT INTO plato_pedido (idPlatoPedido, idPedido, idplato, estado) VALUES (21,36,1,'0');
/*!40000 ALTER TABLE plato_pedido ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato_staff`
--

DROP TABLE IF EXISTS plato_staff;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE plato_staff (
  idStaff int(11) NOT NULL,
  plato_idplato int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato_staff`
--

LOCK TABLES plato_staff WRITE;
/*!40000 ALTER TABLE plato_staff DISABLE KEYS */;
/*!40000 ALTER TABLE plato_staff ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS proveedor;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE proveedor (
  idProveedor int(11) NOT NULL,
  nombres varchar(30) NOT NULL,
  apellidos varchar(30) NOT NULL,
  ruc int(11) NOT NULL,
  institucion varchar(45) NOT NULL,
  movil char(9) NOT NULL,
  telefono char(6) DEFAULT NULL,
  email varchar(45) NOT NULL,
  PRIMARY KEY (idProveedor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES proveedor WRITE;
/*!40000 ALTER TABLE proveedor DISABLE KEYS */;
/*!40000 ALTER TABLE proveedor ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS staff;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE staff (
  idStaff int(11) NOT NULL AUTO_INCREMENT,
  nombres varchar(30) NOT NULL,
  apellidos varchar(30) NOT NULL,
  email varchar(45) NOT NULL,
  direccion varchar(45) NOT NULL,
  dni char(8) NOT NULL,
  alias varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL,
  movil char(9) NOT NULL,
  telefono char(6) DEFAULT NULL,
  idUser int(3) NOT NULL,
  PRIMARY KEY (idStaff)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES staff WRITE;
/*!40000 ALTER TABLE staff DISABLE KEYS */;
INSERT INTO staff (idStaff, nombres, apellidos, email, direccion, dni, alias, password, movil, telefono, idUser) VALUES (1,'Alexander Paúl','Arévalo Garavito','lex_94@outlook.com','Mercado Jarrín Mz. H lote 2','61152516','garalex','48da268e29e90b0a1e0d23b541296c6c','979008620','378520',1);
INSERT INTO staff (idStaff, nombres, apellidos, email, direccion, dni, alias, password, movil, telefono, idUser) VALUES (2,'Jose Danit','Machado Berru','danit_17@outlook.com','Jr. Junin 478','9874561','danit15','8abc3055cc46205d136e5a56fee482dc','978565412','378955',2);
INSERT INTO staff (idStaff, nombres, apellidos, email, direccion, dni, alias, password, movil, telefono, idUser) VALUES (3,'Milagros','Hurtado Hernandez','mili45@hotmail.com','Av. Ramón Castilla 589','615478','hurtado15','ce14663d1413b2165f1b1ef65133c697','978569845','345689',2);
INSERT INTO staff (idStaff, nombres, apellidos, email, direccion, dni, alias, password, movil, telefono, idUser) VALUES (4,'Tatiana Smith','Lopez Valdiviezo','tatiana1525@gmail.com','Jr. Cuzco 158','6458978','tati1584','d7c6f7cc1cd394cfeb361d89e34ecb5b','987456321',NULL,3);
INSERT INTO staff (idStaff, nombres, apellidos, email, direccion, dni, alias, password, movil, telefono, idUser) VALUES (5,'Kelia Anais','Castillo Palacios','anais1587@outlook.com','Jr. Circunvalacion 1478','65478968','ana1478','4a9355bb25d05872f0fe94d88d8b5d6f','985236478','378569',3);
INSERT INTO staff (idStaff, nombres, apellidos, email, direccion, dni, alias, password, movil, telefono, idUser) VALUES (6,'Diego Andersen','Granda Morales','diego154@gmail.com','Jr. Junin 1547','68956789','diego1524','1f6c341f325fc5e0a347e5c668aea425','965477898','347895',3);
/*!40000 ALTER TABLE staff ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_bebida`
--

DROP TABLE IF EXISTS tipo_bebida;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE tipo_bebida (
  idTipoBebida int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(45) NOT NULL,
  descripcion text NOT NULL,
  PRIMARY KEY (idTipoBebida)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_bebida`
--

LOCK TABLES tipo_bebida WRITE;
/*!40000 ALTER TABLE tipo_bebida DISABLE KEYS */;
/*!40000 ALTER TABLE tipo_bebida ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_insumo`
--

DROP TABLE IF EXISTS tipo_insumo;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE tipo_insumo (
  idTipo_insumo int(11) NOT NULL AUTO_INCREMENT,
  tipo_insumo varchar(45) NOT NULL,
  descripcion text NOT NULL,
  PRIMARY KEY (idTipo_insumo)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_insumo`
--

LOCK TABLES tipo_insumo WRITE;
/*!40000 ALTER TABLE tipo_insumo DISABLE KEYS */;
INSERT INTO tipo_insumo (idTipo_insumo, tipo_insumo, descripcion) VALUES (1,'Cereales','comprende a los cereales que son parte de los platos del restaurante');
INSERT INTO tipo_insumo (idTipo_insumo, tipo_insumo, descripcion) VALUES (2,'Tuberculos','comprende tuberculos que son parte de los platos del restaurante');
INSERT INTO tipo_insumo (idTipo_insumo, tipo_insumo, descripcion) VALUES (3,'Menestras','comprende los diferentes tipos de menestra que existen y usan para preparar los mas ricos platos del menu');
INSERT INTO tipo_insumo (idTipo_insumo, tipo_insumo, descripcion) VALUES (4,'Carnes','Comprende las diferentes tipos de carnes que se utilizan para preparar los ricos platos del menu. Incluye visceras entre otros.');
INSERT INTO tipo_insumo (idTipo_insumo, tipo_insumo, descripcion) VALUES (5,'Pescados y Mariscos','Comprende los mas ricos pescadosque se usan para preparar los platos deliciosos del menu.');
INSERT INTO tipo_insumo (idTipo_insumo, tipo_insumo, descripcion) VALUES (6,'Lacteos','Incluye leche, mantequilla entre otros insumos que son usados para preparar los ricos platos del menu');
/*!40000 ALTER TABLE tipo_insumo ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_plato`
--

DROP TABLE IF EXISTS tipo_plato;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE tipo_plato (
  idTipoPlato int(11) NOT NULL AUTO_INCREMENT,
  tipoPlato varchar(45) NOT NULL,
  descripcion mediumtext NOT NULL,
  PRIMARY KEY (idTipoPlato)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_plato`
--

LOCK TABLES tipo_plato WRITE;
/*!40000 ALTER TABLE tipo_plato DISABLE KEYS */;
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (1,'Postres','Tipo de platos exquisitos de tipo postres como mazamorra morada, pie de limon, etc.');
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (2,'Caldos y sopas','De tipo sopas al gusto del cliente');
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (3,'Verduras y ensaladas','platos de los mas diversos que tienen como base las verduras.');
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (4,'Pastas','platos de los mas diversos tipos.');
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (5,'Entrantes frios','Platos del menu del tipo Entrantes frios');
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (6,'Entrantes calientes','Los mas diversos tipos de platos entrantes calientes');
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (7,'Segundos','tipos de platos del nivel segundos');
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (8,'Primeros','tipos de platos del nivel primeros');
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (9,'Pescados y Mariscos','Platos que tienen como base peces de los mas diversos.');
INSERT INTO tipo_plato (idTipoPlato, tipoPlato, descripcion) VALUES (10,'Carnes','tipos de platos de los mas diversos que tienen como base carne.');
/*!40000 ALTER TABLE tipo_plato ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_staff`
--

DROP TABLE IF EXISTS tipo_staff;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE tipo_staff (
  idUser int(3) NOT NULL AUTO_INCREMENT,
  tipoUser varchar(45) NOT NULL,
  descripcion text NOT NULL,
  PRIMARY KEY (idUser)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_staff`
--

LOCK TABLES tipo_staff WRITE;
/*!40000 ALTER TABLE tipo_staff DISABLE KEYS */;
INSERT INTO tipo_staff (idUser, tipoUser, descripcion) VALUES (1,'Administrador','Esta tipo de usuario tiene como función observar las estadísticas acerca de las ventas que se realizan al mes en el restaurante \"Lo Nuestro\".');
INSERT INTO tipo_staff (idUser, tipoUser, descripcion) VALUES (2,'Camarero','Esta tipo de usuario se dedica a entregar los móviles a los clientes para que estos puedan realizar sus pedidos. Iniciara sesión y luego se ello elegirá la mesa a la cual atenderá.');
INSERT INTO tipo_staff (idUser, tipoUser, descripcion) VALUES (3,'Cheff','Este usuario será capaz de visualizar los pedidos en tiempo real, y por lo tanto será el usuario que sea capaz de decir que tal plato ya está entregado.');
/*!40000 ALTER TABLE tipo_staff ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadmedida`
--

DROP TABLE IF EXISTS unidadmedida;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE unidadmedida (
  id int(4) NOT NULL AUTO_INCREMENT,
  nombreU varchar(15) NOT NULL,
  unidad char(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY unidad (unidad),
  UNIQUE KEY nombreU (nombreU)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadmedida`
--

LOCK TABLES unidadmedida WRITE;
/*!40000 ALTER TABLE unidadmedida DISABLE KEYS */;
INSERT INTO unidadmedida (id, nombreU, unidad) VALUES (1,'kilogramo','kg');
INSERT INTO unidadmedida (id, nombreU, unidad) VALUES (2,'Unidad','UN');
INSERT INTO unidadmedida (id, nombreU, unidad) VALUES (3,'Litro','L');
/*!40000 ALTER TABLE unidadmedida ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS venta;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE venta (
  idventa int(11) NOT NULL AUTO_INCREMENT,
  total decimal(8,2) NOT NULL,
  idPedido int(11) NOT NULL,
  idFormaPago int(11) NOT NULL,
  PRIMARY KEY (idventa),
  KEY fk_venta_forma_pago_idx (idFormaPago),
  KEY fk_venta_pedido_idx (idPedido),
  CONSTRAINT fk_venta_forma_pago FOREIGN KEY (idFormaPago) REFERENCES forma_pago (idFormaPago) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_venta_pedido FOREIGN KEY (idPedido) REFERENCES pedido (idPedido) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES venta WRITE;
/*!40000 ALTER TABLE venta DISABLE KEYS */;
/*!40000 ALTER TABLE venta ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-08 14:12:52
