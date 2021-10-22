CREATE DATABASE  IF NOT EXISTS `loja_de_entregas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `loja_de_entregas`;
-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: loja_de_entregas
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `telefone` varchar(15) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `endereço` varchar(100) NOT NULL,
  `ponto_referencia` varchar(100) NOT NULL,
  `nascimento` date DEFAULT NULL,
  PRIMARY KEY (`telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1111111111','luciano da silva','rua avo do ovo','em frente o policlinica','1989-07-08'),('1212121211','lucas alves da silva','rua arara azul','em frente o mercado do zé','1998-12-22'),('2222222222','valdir da silva','rua dos assaltos','em frente ao salao de beleza','1991-02-09'),('3333333333','leo fabio silva','rua de ninguem','em frente ao um estudio de tatoo','1995-04-14'),('4444444444','lucinha  maria da silva','rua sao pedro','em frente a rua da praia','1978-05-20'),('5555555555','maria ose da silva','rua algodao da rosa','em frente o ponto de onibus','1993-01-26'),('6666666666','lucas jose da silva','rua por do sol','em frente a igreja','1992-12-16'),('7777777777','matheus kawan da silva','rua dos pescador','em frente o feira do zé','1990-07-24'),('8888888888','lucas fernandes da silva','rua arara branca','em frente o mercado do luiz','1978-08-12'),('9999999999','jesica lucia da silva','rua sao jorge','em frente a estaçao de onibus','1995-02-26');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `endereço` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregador`
--

DROP TABLE IF EXISTS `entregador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregador` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `rg` varchar(100) NOT NULL,
  `celular` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregador`
--

LOCK TABLES `entregador` WRITE;
/*!40000 ALTER TABLE `entregador` DISABLE KEYS */;
/*!40000 ALTER TABLE `entregador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pedido` (
  `id_marmita` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `quntidade` int(11) DEFAULT NULL,
  KEY `FK_id_marmita` (`id_marmita`),
  KEY `FK_id_pedido` (`id_pedido`),
  CONSTRAINT `FK_id_marmita` FOREIGN KEY (`id_marmita`) REFERENCES `marmita` (`id`),
  CONSTRAINT `FK_id_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `nivel_acesso` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'matheus.gmail.com','12345689','servidor'),(2,'lucy.gmail.com','12345689','servidor'),(3,'lucynha.gmail.com','42376511','faxina'),(4,'maria.gmail.com','98765442','atedente'),(5,'lucy.gmail.com','12345689','servidor'),(6,'lucynha.gmail.com','42376511','faxina'),(7,'maria.gmail.com','98765442','atedente'),(8,'lucy.gmail.com','12345689','servidor'),(9,'lucynha.gmail.com','42376511','faxina'),(10,'maria.gmail.com','98765442','atedente'),(11,'lucy.gmail.com','12345689','servidor'),(12,'lucynha.gmail.com','42376511','faxina'),(13,'maria.gmail.com','98765442','atedente'),(14,'maria.gmail.com','98765442','atedente');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marmita`
--

DROP TABLE IF EXISTS `marmita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marmita` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descriçao` mediumtext DEFAULT NULL,
  `tamanho` varchar(100) DEFAULT NULL,
  `valor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marmita`
--

LOCK TABLES `marmita` WRITE;
/*!40000 ALTER TABLE `marmita` DISABLE KEYS */;
/*!40000 ALTER TABLE `marmita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `telefone_cliente` varchar(15) NOT NULL,
  `id_entregador` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `taxa_entrega` varchar(100) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_id_entregador` (`id_entregador`),
  CONSTRAINT `FK_id_entregador` FOREIGN KEY (`id_entregador`) REFERENCES `entregador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'loja_de_entregas'
--

--
-- Dumping routines for database 'loja_de_entregas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-21 22:17:51
