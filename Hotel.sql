-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel02
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `deposito`
--

DROP TABLE IF EXISTS `deposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposito` (
  `id_deposito` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_deposito`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposito`
--

LOCK TABLES `deposito` WRITE;
/*!40000 ALTER TABLE `deposito` DISABLE KEYS */;
INSERT INTO `deposito` VALUES (4,'Almacén Cocina'),(3,'Depósito Central'),(2,'Depósito Hotel'),(1,'Depósito Norte'),(9,'Depósito Principal'),(10,'Depósito Secundario'),(11,'Depósito Trigger A'),(12,'Depósito Trigger B'),(15,'General'),(16,'Hotel');
/*!40000 ALTER TABLE `deposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden_compra`
--

DROP TABLE IF EXISTS `detalle_orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden_compra` (
  `id_detalle_orden_compra` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `paga_iva` tinyint(1) NOT NULL,
  `porcentaje_iva` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_detalle_orden_compra`),
  KEY `id_orden` (`id_orden`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_orden_compra_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden_compra` (`id_orden`),
  CONSTRAINT `detalle_orden_compra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_compra`
--

LOCK TABLES `detalle_orden_compra` WRITE;
/*!40000 ALTER TABLE `detalle_orden_compra` DISABLE KEYS */;
INSERT INTO `detalle_orden_compra` VALUES (1,3,1,5,140.00,1,21.00),(2,4,1,5,90.00,1,21.00),(3,5,9,8,115.00,1,21.00),(4,6,10,10,75.00,1,21.00),(5,7,10,5,80.00,1,21.00),(6,8,10,7,78.00,1,21.00);
/*!40000 ALTER TABLE `detalle_orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido_cotizacion`
--

DROP TABLE IF EXISTS `detalle_pedido_cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido_cotizacion` (
  `id_detallepedidocotizacion` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `paga_iva` tinyint(1) NOT NULL,
  `porcentaje_iva` decimal(5,2) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detallepedidocotizacion`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_pedido_cotizacion_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido_cotizacion` (`id_pedido`),
  CONSTRAINT `detalle_pedido_cotizacion_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido_cotizacion`
--

LOCK TABLES `detalle_pedido_cotizacion` WRITE;
/*!40000 ALTER TABLE `detalle_pedido_cotizacion` DISABLE KEYS */;
INSERT INTO `detalle_pedido_cotizacion` VALUES (1,1,1,1,1,21.00,0.00),(2,2,1,10,1,21.00,150.00),(3,3,1,5,1,21.00,140.00),(4,4,6,1,1,21.00,0.00),(5,5,1,5,1,21.00,90.00),(6,6,9,5,1,21.00,110.00),(7,7,9,8,1,21.00,115.00),(8,8,10,15,1,21.00,70.00),(9,9,10,20,1,21.00,68.00),(10,10,10,10,1,21.00,75.00),(11,11,10,5,1,21.00,80.00),(12,12,10,7,1,21.00,78.00),(13,13,11,5,1,21.00,100.00),(14,15,2,1,1,21.00,0.00),(15,16,2,1,1,21.00,90.00),(16,5,2,1,1,21.00,87.50),(17,17,2,1,1,21.00,90.00),(18,19,1,1,1,21.00,150.00),(19,19,30,1,1,10.00,12000.00),(20,20,30,1,1,10.00,12000.00),(21,21,30,1,1,10.00,12000.00);
/*!40000 ALTER TABLE `detalle_pedido_cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_transferencia`
--

DROP TABLE IF EXISTS `detalle_transferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_transferencia` (
  `id_detalle_transferencia` int NOT NULL AUTO_INCREMENT,
  `id_transferencia` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_detalle_transferencia`),
  KEY `id_transferencia` (`id_transferencia`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_transferencia_ibfk_1` FOREIGN KEY (`id_transferencia`) REFERENCES `transferencia` (`id_transferencia`),
  CONSTRAINT `detalle_transferencia_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_transferencia`
--

LOCK TABLES `detalle_transferencia` WRITE;
/*!40000 ALTER TABLE `detalle_transferencia` DISABLE KEYS */;
INSERT INTO `detalle_transferencia` VALUES (6,3,11,2),(11,6,2,5),(12,7,2,5),(13,8,2,5),(14,1,1,25),(15,1,1,25),(16,1,1,25),(18,1,1,25),(19,1,1,5),(20,1,1,5);
/*!40000 ALTER TABLE `detalle_transferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Juan Stock'),(2,'Ana Autorizadora'),(3,'Encargado Uno'),(4,'Autorizante Uno'),(5,'Encargado Trigger'),(6,'Autorizante Trigger'),(7,'Juan Pérez'),(8,'María Gómez'),(9,'Carlos'),(10,'María');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (6,'CleanMax'),(4,'EcoClean'),(3,'Genérico'),(8,'Limpex'),(2,'LimpioPlus'),(11,'MarcaX'),(1,'MarcaY'),(7,'MultiClean'),(9,'Soft'),(5,'UltraWhite');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compra`
--

DROP TABLE IF EXISTS `orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `saldo` decimal(12,2) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido_cotizacion` (`id_pedido`),
  CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra`
--

LOCK TABLES `orden_compra` WRITE;
/*!40000 ALTER TABLE `orden_compra` DISABLE KEYS */;
INSERT INTO `orden_compra` VALUES (2,1,1,0.00,0.00,'2025-05-29'),(3,3,2,700.00,700.00,'2025-06-04'),(4,1,1,450.00,450.00,'2025-06-04'),(5,7,9,920.00,920.00,'2025-06-06'),(6,10,10,750.00,0.00,'2025-06-06'),(7,11,10,400.00,150.00,'2025-06-06'),(8,12,10,546.00,546.00,'2025-06-06'),(9,13,1,500.00,500.00,'2025-06-06'),(10,3,2,2000.00,2000.00,'2025-06-06'),(11,1,1,285.00,285.00,'2025-06-06'),(13,1,1,100000.00,100000.00,'2025-06-27');
/*!40000 ALTER TABLE `orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_cotizacion`
--

DROP TABLE IF EXISTS `pedido_cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_cotizacion` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_proveedor` int NOT NULL,
  `estado` enum('pendiente','cotizado','orden_generada') NOT NULL DEFAULT 'pendiente',
  PRIMARY KEY (`id_pedido`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `pedido_cotizacion_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_cotizacion`
--

LOCK TABLES `pedido_cotizacion` WRITE;
/*!40000 ALTER TABLE `pedido_cotizacion` DISABLE KEYS */;
INSERT INTO `pedido_cotizacion` VALUES (1,'2025-05-29',1,'pendiente'),(2,'2025-06-04',1,'pendiente'),(3,'2025-06-04',2,'pendiente'),(4,'2025-06-04',4,'pendiente'),(5,'2025-06-04',1,'cotizado'),(6,'2025-06-06',9,'pendiente'),(7,'2025-06-06',9,'pendiente'),(8,'2025-06-06',10,'pendiente'),(9,'2025-06-06',10,'pendiente'),(10,'2025-06-06',10,'pendiente'),(11,'2025-06-06',10,'pendiente'),(12,'2025-06-06',10,'pendiente'),(13,'2025-06-06',1,'pendiente'),(14,'2025-06-06',1,'pendiente'),(15,'2025-06-11',1,'pendiente'),(16,'2025-06-12',1,'pendiente'),(17,'2025-06-12',2,'pendiente'),(19,'2025-06-26',1,'pendiente'),(20,'2025-06-26',2,'pendiente'),(21,'2025-06-26',3,'pendiente');
/*!40000 ALTER TABLE `pedido_cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `ultimo_costo_unitario` decimal(10,2) NOT NULL,
  `paga_iva` tinyint(1) NOT NULL,
  `porcentaje_iva` decimal(5,2) NOT NULL,
  `id_marca` int NOT NULL,
  `id_tipo_producto` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_marca` (`id_marca`),
  KEY `id_tipo_producto` (`id_tipo_producto`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_producto` (`id_tipo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Detergente Líquido 5L',150.00,1,21.00,1,1),(2,'Lavandina Clásica 2L',90.00,1,21.00,2,2),(3,'Café en grano 1kg',950.00,1,21.00,1,1),(4,'Azúcar refinada 1kg',280.50,1,21.00,1,1),(5,'Shampoo 500ml',380.25,1,10.50,1,1),(6,'Jabón líquido neutro',120.00,1,21.00,4,4),(7,'Desinfectante cítrico',200.00,1,21.00,5,5),(8,'Limpiador Básico',100.00,1,21.00,1,1),(9,'Limpiador Multiuso',120.00,1,21.00,6,6),(10,'Paño absorbente x10',80.00,1,21.00,7,7),(11,'Producto Trigger',100.00,1,21.00,1,1),(12,'Detergente',50.00,1,21.00,1,1),(13,'Toallas',30.00,1,10.50,2,2),(14,'Jabón',25.00,1,21.00,3,3),(30,'Papas fritas gourmet',12000.00,1,10.00,1,30),(31,'Agua mineral',10.50,1,16.00,1,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `linea_credito` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Proveedor Uno','Calle Falsa 123','1111-1111','proveedor1@mail.com',60000.00),(2,'Proveedor Dos','Av. Limpieza 456','2222-2222','proveedor2@mail.com',75000.00),(3,'Proveedor Tres','Boulevard 789','3333-3333','proveedor3@mail.com',60000.00),(4,'Proveedor Eco','Calle Verde 1','4444-0000','eco@mail.com',40000.00),(5,'Proveedor Higiene','Higiene 200','5555-1111','higiene@mail.com',55000.00),(6,'Proveedor Alfa','Calle 1','1111-1111','alfa@mail.com',50000.00),(7,'Proveedor Beta','Calle 2','2222-2222','beta@mail.com',60000.00),(8,'Proveedor Gamma','Calle 3','3333-3333','gamma@mail.com',45000.00),(9,'ProveeMax','Av. Limpieza 123','8888-0000','provee@mail.com',80000.00),(10,'LimpiaYA','Av. Brillo 45','9999-1234','limpia@ya.com',100000.00),(11,'Nuevo Proveedor','Av. Siempre Viva 742','099123456','nuevo@proveedor.com',60000.00),(12,'Proveedor1','Dirección 1','1111','p1@mail.com',10000.00),(13,'Proveedor2','D2','2222','p2@mail.com',9000.00),(14,'Proveedor3','D3','3333','p3@mail.com',9000.00);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_tipo_producto`
--

DROP TABLE IF EXISTS `proveedor_tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_tipo_producto` (
  `id_proveedor` int NOT NULL,
  `id_tipo_producto` int NOT NULL,
  PRIMARY KEY (`id_proveedor`,`id_tipo_producto`),
  KEY `id_tipo_producto` (`id_tipo_producto`),
  CONSTRAINT `proveedor_tipo_producto_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `proveedor_tipo_producto_ibfk_2` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_producto` (`id_tipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_tipo_producto`
--

LOCK TABLES `proveedor_tipo_producto` WRITE;
/*!40000 ALTER TABLE `proveedor_tipo_producto` DISABLE KEYS */;
INSERT INTO `proveedor_tipo_producto` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(1,2),(2,2),(4,4),(5,4),(4,5),(5,5),(1,10),(2,10),(3,10),(1,30),(2,30),(3,30);
/*!40000 ALTER TABLE `proveedor_tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_deposito` int NOT NULL,
  `cantidad` int NOT NULL,
  `stock_minimo` int NOT NULL,
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `id_producto` (`id_producto`,`id_deposito`),
  KEY `id_deposito` (`id_deposito`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`id_deposito`) REFERENCES `deposito` (`id_deposito`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,1,30,2),(2,2,1,10,10),(3,1,2,15,0),(4,3,2,19,2),(5,6,1,120,10),(6,9,1,2,10),(7,9,2,12,10),(8,11,11,4,10),(9,11,12,0,10),(10,11,2,2,0),(11,2,2,23,0),(12,3,1,12,5),(25,5,1,20,5),(28,30,1,50,10);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `id_tipo_producto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_producto`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (3,'Consumo diario'),(5,'Desinfectante'),(1,'Detergente'),(10,'Higiene'),(4,'Jabón líquido'),(2,'Lavandina'),(8,'Limpieza'),(6,'Multiuso'),(7,'Paño absorbente'),(9,'Papelería'),(30,'Snacks importados');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencia`
--

DROP TABLE IF EXISTS `transferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferencia` (
  `id_transferencia` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_deposito_origen` int NOT NULL,
  `id_deposito_destino` int NOT NULL,
  `id_encargado` int NOT NULL,
  `id_autorizante` int NOT NULL,
  PRIMARY KEY (`id_transferencia`),
  KEY `id_deposito_origen` (`id_deposito_origen`),
  KEY `id_deposito_destino` (`id_deposito_destino`),
  KEY `id_encargado` (`id_encargado`),
  KEY `id_autorizante` (`id_autorizante`),
  CONSTRAINT `transferencia_ibfk_1` FOREIGN KEY (`id_deposito_origen`) REFERENCES `deposito` (`id_deposito`),
  CONSTRAINT `transferencia_ibfk_2` FOREIGN KEY (`id_deposito_destino`) REFERENCES `deposito` (`id_deposito`),
  CONSTRAINT `transferencia_ibfk_3` FOREIGN KEY (`id_encargado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `transferencia_ibfk_4` FOREIGN KEY (`id_autorizante`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencia`
--

LOCK TABLES `transferencia` WRITE;
/*!40000 ALTER TABLE `transferencia` DISABLE KEYS */;
INSERT INTO `transferencia` VALUES (1,'2025-05-29',1,2,1,2),(2,'2025-06-04',1,2,1,2),(3,'2025-06-06',1,2,1,2),(4,'2025-06-06',1,2,1,2),(5,'2025-06-06',1,2,1,2),(6,'2025-06-11',1,2,1,2),(7,'2025-06-11',1,2,1,2),(8,'2025-06-11',1,2,1,2),(9,'2025-06-22',1,2,1,1),(10,'2025-06-26',1,2,1,2),(11,'2025-06-26',1,2,1,2);
/*!40000 ALTER TABLE `transferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_ordenes_proveedores`
--

DROP TABLE IF EXISTS `vista_ordenes_proveedores`;
/*!50001 DROP VIEW IF EXISTS `vista_ordenes_proveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ordenes_proveedores` AS SELECT 
 1 AS `id_orden`,
 1 AS `fecha`,
 1 AS `proveedor`,
 1 AS `total`,
 1 AS `saldo`,
 1 AS `monto_pagado`,
 1 AS `estado_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pedidos_pendientes`
--

DROP TABLE IF EXISTS `vista_pedidos_pendientes`;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_pendientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pedidos_pendientes` AS SELECT 
 1 AS `id_pedido`,
 1 AS `fecha`,
 1 AS `proveedor`,
 1 AS `productos_solicitados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_stocks`
--

DROP TABLE IF EXISTS `vista_stocks`;
/*!50001 DROP VIEW IF EXISTS `vista_stocks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_stocks` AS SELECT 
 1 AS `id_producto`,
 1 AS `producto`,
 1 AS `deposito`,
 1 AS `stock_actual`,
 1 AS `stock_minimo`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_ordenes_proveedores`
--

/*!50001 DROP VIEW IF EXISTS `vista_ordenes_proveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ordenes_proveedores` AS select `oc`.`id_orden` AS `id_orden`,`oc`.`fecha` AS `fecha`,`p`.`nombre` AS `proveedor`,`oc`.`total` AS `total`,`oc`.`saldo` AS `saldo`,(`oc`.`total` - `oc`.`saldo`) AS `monto_pagado`,(case when (`oc`.`saldo` = 0) then 'PAGADA' when (`oc`.`saldo` = `oc`.`total`) then 'PENDIENTE' else 'PARCIAL' end) AS `estado_pago` from (`orden_compra` `oc` join `proveedor` `p` on((`oc`.`id_proveedor` = `p`.`id_proveedor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pedidos_pendientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_pendientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pedidos_pendientes` AS select `pc`.`id_pedido` AS `id_pedido`,`pc`.`fecha` AS `fecha`,`pr`.`nombre` AS `proveedor`,count(`dpc`.`id_producto`) AS `productos_solicitados` from (((`pedido_cotizacion` `pc` join `proveedor` `pr` on((`pc`.`id_proveedor` = `pr`.`id_proveedor`))) left join `detalle_pedido_cotizacion` `dpc` on((`pc`.`id_pedido` = `dpc`.`id_pedido`))) left join `orden_compra` `oc` on((`pc`.`id_pedido` = `oc`.`id_pedido`))) where ((`oc`.`id_orden` is null) and (`pc`.`estado` in ('pendiente','cotizado'))) group by `pc`.`id_pedido`,`pc`.`fecha`,`pr`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_stocks`
--

/*!50001 DROP VIEW IF EXISTS `vista_stocks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_stocks` AS select `s`.`id_producto` AS `id_producto`,`p`.`descripcion` AS `producto`,`d`.`nombre` AS `deposito`,`s`.`cantidad` AS `stock_actual`,`s`.`stock_minimo` AS `stock_minimo`,(case when (`s`.`cantidad` <= `s`.`stock_minimo`) then 'REPONER' when (`s`.`cantidad` <= (`s`.`stock_minimo` * 1.5)) then 'ALERTA' else 'OK' end) AS `estado` from ((`stock` `s` join `producto` `p` on((`s`.`id_producto` = `p`.`id_producto`))) join `deposito` `d` on((`s`.`id_deposito` = `d`.`id_deposito`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-26 22:59:03
