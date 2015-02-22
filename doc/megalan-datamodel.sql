-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: megalan
-- ------------------------------------------------------
-- Server version	5.5.40-1

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
-- Table structure for table `Adres`
--

DROP TABLE IF EXISTS `Adres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `straat` varchar(145) DEFAULT NULL,
  `pandnummer` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `stad` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adres`
--

LOCK TABLES `Adres` WRITE;
/*!40000 ALTER TABLE `Adres` DISABLE KEYS */;
INSERT INTO `Adres` VALUES (8,'Teststraat','23','1111AB','Teststad');
/*!40000 ALTER TABLE `Adres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bestelling`
--

DROP TABLE IF EXISTS `Bestelling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bestelling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deelnemer` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bestellingdeelnemer_idx` (`deelnemer`),
  KEY `bestellingproduct_idx` (`product`),
  CONSTRAINT `bestellingdeelnemer` FOREIGN KEY (`deelnemer`) REFERENCES `Deelnemer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bestellingproduct` FOREIGN KEY (`product`) REFERENCES `Product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bestelling`
--

LOCK TABLES `Bestelling` WRITE;
/*!40000 ALTER TABLE `Bestelling` DISABLE KEYS */;
INSERT INTO `Bestelling` VALUES (53,17,1),(54,17,5),(55,17,6),(56,17,8),(57,17,12);
/*!40000 ALTER TABLE `Bestelling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deelnemer`
--

DROP TABLE IF EXISTS `Deelnemer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Deelnemer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persoon` int(11) DEFAULT NULL,
  `adres` int(11) DEFAULT NULL,
  `rekening` int(11) DEFAULT NULL,
  `opmerking` text,
  `sessie` int(11) DEFAULT NULL,
  `besteld` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deelnemerpersoon_idx` (`persoon`),
  KEY `deelnemeradres_idx` (`adres`),
  KEY `deelnemerrekening_idx` (`rekening`),
  KEY `deelnemersessie_idx` (`sessie`),
  CONSTRAINT `deelnemersessie` FOREIGN KEY (`sessie`) REFERENCES `Sessie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `deelnemeradres` FOREIGN KEY (`adres`) REFERENCES `Adres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `deelnemerpersoon` FOREIGN KEY (`persoon`) REFERENCES `Persoon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `deelnemerrekening` FOREIGN KEY (`rekening`) REFERENCES `Rekening` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deelnemer`
--

LOCK TABLES `Deelnemer` WRITE;
/*!40000 ALTER TABLE `Deelnemer` DISABLE KEYS */;
INSERT INTO `Deelnemer` VALUES (17,14,8,3,'Testing',NULL,'');
/*!40000 ALTER TABLE `Deelnemer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persoon`
--

DROP TABLE IF EXISTS `Persoon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Persoon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(145) DEFAULT NULL,
  `tussenvoegsel` varchar(145) DEFAULT NULL,
  `achternaam` varchar(145) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persoon`
--

LOCK TABLES `Persoon` WRITE;
/*!40000 ALTER TABLE `Persoon` DISABLE KEYS */;
INSERT INTO `Persoon` VALUES (14,'Test','van','Inschrijving','teh@borreh.nl');
/*!40000 ALTER TABLE `Persoon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prijs` decimal(19,4) DEFAULT NULL,
  `categorie` int(11) DEFAULT NULL,
  `naam` int(11) DEFAULT NULL,
  `minpp` int(11) DEFAULT NULL,
  `maxpp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productcategorie_idx` (`categorie`),
  KEY `productnaam_idx` (`naam`),
  CONSTRAINT `productcategorie` FOREIGN KEY (`categorie`) REFERENCES `ProductCategorie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productnaam` FOREIGN KEY (`naam`) REFERENCES `Vertaling` (`betekenis`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,-5.0000,1,1,0,1),(2,-5.0000,1,2,0,1),(3,-5.0000,1,3,0,1),(4,-5.0000,1,4,0,1),(5,6.0000,2,5,0,1),(6,6.0000,2,6,0,1),(7,4.0000,2,7,0,1),(8,5.0000,3,8,0,1),(9,0.0000,4,9,0,10),(11,0.0000,3,11,0,1),(12,0.0000,4,15,0,1),(13,0.0000,4,16,0,1),(14,0.0000,4,17,0,1);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductCategorie`
--

DROP TABLE IF EXISTS `ProductCategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductCategorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` int(11) DEFAULT NULL,
  `minpp` int(11) DEFAULT NULL,
  `maxpp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorienaam_idx` (`naam`),
  CONSTRAINT `categorienaam` FOREIGN KEY (`naam`) REFERENCES `Vertaling` (`betekenis`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductCategorie`
--

LOCK TABLES `ProductCategorie` WRITE;
/*!40000 ALTER TABLE `ProductCategorie` DISABLE KEYS */;
INSERT INTO `ProductCategorie` VALUES (1,12,0,1),(2,13,1,3),(3,14,0,15),(4,18,0,3);
/*!40000 ALTER TABLE `ProductCategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rekening`
--

DROP TABLE IF EXISTS `Rekening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rekening` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tnv` varchar(145) DEFAULT NULL,
  `plaats` varchar(145) DEFAULT NULL,
  `nummer` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rekening`
--

LOCK TABLES `Rekening` WRITE;
/*!40000 ALTER TABLE `Rekening` DISABLE KEYS */;
INSERT INTO `Rekening` VALUES (3,'T Est','Testtown','123');
/*!40000 ALTER TABLE `Rekening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sessie`
--

DROP TABLE IF EXISTS `Sessie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sessie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taalcode` varchar(45) DEFAULT NULL,
  `cookie` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sessie`
--

LOCK TABLES `Sessie` WRITE;
/*!40000 ALTER TABLE `Sessie` DISABLE KEYS */;
INSERT INTO `Sessie` VALUES (12,'en','6l/NZt3C5Emy05nRn2O63Q==');
/*!40000 ALTER TABLE `Sessie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vertaling`
--

DROP TABLE IF EXISTS `Vertaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vertaling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `betekenis` int(11) DEFAULT NULL,
  `inhoud` varchar(145) DEFAULT NULL,
  `taalcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `betekenis` (`betekenis`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vertaling`
--

LOCK TABLES `Vertaling` WRITE;
/*!40000 ALTER TABLE `Vertaling` DISABLE KEYS */;
INSERT INTO `Vertaling` VALUES (1,1,'FMF','nl'),(2,2,'CB','nl'),(3,3,'IDUN','nl'),(4,4,'Cover','nl'),(5,5,'Vrijdag','nl'),(6,6,'Zaterdag','nl'),(7,7,'Zondag','nl'),(8,8,'Vervoersservice','nl'),(9,9,'PC','nl'),(10,10,'Extra PC','nl'),(11,11,'Gigabit Dibbs','nl'),(16,1,'FMF','en'),(17,2,'CB','en'),(18,3,'IDUN','en'),(19,4,'Cover','en'),(20,5,'Friday','en'),(21,6,'Saturday','en'),(22,7,'Sunday','en'),(23,8,'Computer Transport Service','en'),(24,9,'Computer','en'),(25,10,'Additional Computer','en'),(26,11,'Dibbs on Gigabit connection','en'),(31,12,'Lid van...','nl'),(32,12,'Member of...','en'),(33,13,'Aanwezig op...','nl'),(34,13,'Present on...','en'),(35,14,'Logistiek','nl'),(36,14,'Transportation and placement','en'),(37,15,'Laptop','nl'),(38,15,'Laptop','en'),(39,16,'Server','nl'),(40,16,'Server','en'),(41,17,'Gaming console and Television','en'),(42,17,'Spelcomputer en TV','nl'),(43,18,'Hardware','nl'),(44,18,'Hardware','en');
/*!40000 ALTER TABLE `Vertaling` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-22 12:42:02
