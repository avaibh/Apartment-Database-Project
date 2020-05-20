CREATE DATABASE  IF NOT EXISTS `Apartments` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Apartments`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Apartments
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartment` (
  `aID` char(9) NOT NULL,
  `aptNum` varchar(4) NOT NULL,
  `bedNum` char(1) DEFAULT NULL,
  `bathNum` char(1) DEFAULT NULL,
  `size` varchar(6) DEFAULT NULL,
  `rent` varchar(5) DEFAULT NULL,
  `bID` char(9) NOT NULL,
  `owner` char(9) NOT NULL,
  `leaseID` char(9) DEFAULT NULL,
  PRIMARY KEY (`aID`),
  KEY `bID` (`bID`),
  KEY `owner` (`owner`),
  KEY `leaseID` (`leaseID`),
  CONSTRAINT `apartment_ibfk_1` FOREIGN KEY (`bID`) REFERENCES `building` (`bID`),
  CONSTRAINT `apartment_ibfk_2` FOREIGN KEY (`owner`) REFERENCES `person` (`pID`),
  CONSTRAINT `apartment_ibfk_3` FOREIGN KEY (`leaseID`) REFERENCES `lease` (`leaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` VALUES ('283871491','12','3','1','2200','12000','224464836','110951449','881938445'),('285579472','7','1','0','500','2000','430731998','287858332','597568852'),('318223066','3','2','1','800','2750','111111111','352394456','202782283'),('405465105','8','4','1','1200','3000','138972306','927937906','332507563'),('532287020','2','4','1','3450','8000','999999999','631791606','300376372'),('564812988','1','2','2','1000','4500','874120742','528180904','619014930'),('736920737','4','2','1','2500','2250','874120742','528180904','191238068'),('889232111','6','4','2','4500','15000','962163458','258252896','285750125');
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `accNum` char(9) NOT NULL,
  `routeNum` char(9) NOT NULL,
  `bank` varchar(12) DEFAULT NULL,
  `pID` char(9) NOT NULL,
  PRIMARY KEY (`accNum`,`routeNum`),
  KEY `accNum` (`accNum`),
  KEY `routeNum` (`routeNum`),
  KEY `pID` (`pID`),
  CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `person` (`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES ('100061298','021000021','JP Morgan','631791606'),('104618090','042000031','America Bank','927937906'),('113672086','022900002','Chicago Bank','352394456'),('113782241','021000021','JP Morgan','975001548'),('118872142','040000097','CA Bank','646342650'),('121530783','020500005','M&T Bank','768598709'),('136110252','022900002','Chicago Bank','799120078'),('136783826','020500005','M&T Bank','122281063'),('145105265','022900002','Chicago Bank','975001548'),('152363168','033980000','TX Bank','399912770'),('154948937','040500002','Florida Bank','175471905'),('167701923','023800000','CITI Bank','632360372'),('168783903','030000819','WA Bank','528180904'),('168948227','042000031','AmericanBank','287858332'),('171454663','020500005','M&T Bank','258252896'),('182845795','023800000','CITI Bank','110951449'),('186898174','021000021','JP Morgan','528180904');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `bID` char(9) NOT NULL,
  `name` char(24) NOT NULL,
  `street` varchar(64) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `state` char(24) NOT NULL,
  `zip` char(5) NOT NULL,
  `descr` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('111111111','Daydream Lookout','Jefferson Street','Seattle','WA','98104','Full bathroom with good closet space and heating light.'),('138972306','Forsaken Strand Tower','Lake Way','Miami','FL','33014','Fully equipped with Washer/Dryer. Stainless Steel Appliances. Split Central A/C Units.'),('224464836','Fusion Tower','Wall Street','New York','NY','10005','\"Hardwood, High Ceilings, Renovated, Marble Bath, Granite Kitchen\"'),('304215280','Endurance Pillar','Melrose Avenue','Los Angeles','CA','90038','Central A/C. High ceiling. Full bathroom with good closet space and heating light.'),('373620673','Landscape Building','Canal Street','New York','NY','10013','\"Doorman, Elevator, Health Club, Garage, Lounge, Valet, Roof Deck\"'),('430731998','Diamond Tower','Main Street','Houston','TX','77030','\"Doorman, Elevator, Health Club, Garage, Lounge, Valet, Roof Deck\"'),('485255541','World Center','Washington Street','San Francisco','CA','94118','\"Doorman, Elevator, Health Club, Garage, Lounge, Valet, Roof Deck\"'),('874120742','Phantom Peak Tower','Chicago Avenue','Chicago','IL','60622','Fully equipped with Washer/Dryer. Stainless Steel Appliances. Split Central A/C Units.'),('962163458','Calypso Spire','34th Street','New York','NY','10001','\"Hardwood, High Ceilings, Renovated, Marble Bath, Granite Kitchen\"'),('999999999','Mirage Place','Hollywood Boulevard','Los Angeles','CA','90028','\"Hardwood, High Ceilings, Renovated, Marble Bath, Granite Kitchen\"');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lease`
--

DROP TABLE IF EXISTS `lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lease` (
  `leaseID` char(9) NOT NULL,
  `term` char(2) NOT NULL,
  `inDate` date DEFAULT NULL,
  `ownerID` char(9) NOT NULL,
  `tenantID` char(9) NOT NULL,
  PRIMARY KEY (`leaseID`),
  KEY `ownerID` (`ownerID`),
  KEY `tenantID` (`tenantID`),
  CONSTRAINT `lease_ibfk_1` FOREIGN KEY (`ownerID`) REFERENCES `person` (`pID`),
  CONSTRAINT `lease_ibfk_2` FOREIGN KEY (`tenantID`) REFERENCES `person` (`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease`
--

LOCK TABLES `lease` WRITE;
/*!40000 ALTER TABLE `lease` DISABLE KEYS */;
INSERT INTO `lease` VALUES ('191238068','24','2019-11-06','528180904','768598709'),('202782283','24','2019-11-23','352394456','528180904'),('285750125','12','2020-04-19','258252896','631791606'),('300376372','12','2019-01-23','631791606','799120078'),('332507563','24','2019-10-23','927937906','175471905'),('597568852','6','2019-04-02','287858332','399912770'),('619014930','12','2019-06-03','528180904','975001548'),('881938445','12','2019-08-01','110951449','631791606');
/*!40000 ALTER TABLE `lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `pID` char(9) NOT NULL,
  `lastname` char(12) NOT NULL,
  `firstname` char(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('110951449','Eliana','Lang','Lang.Eliana@gmail.com','2904387676'),('122281063','Samara','Booker','Booker.Samara@hotmail.com','6393765553'),('175471905','Fernando','Marshall','Marshall.Fernando@yahoo.com',' '),('258252896','Porter','Frost',' ','7077400384'),('287858332','Jolie','Pennington','Pennington.Jolie@gmail.com','4929346412'),('352394456','Cassidy','Jackson','Jackson.Cassidy@yahoo.com','3104582537'),('399912770','Warren','Barrett','Barrett.Warren@yahoo.com','3412475835'),('528180904','Janet','Kerr','Kerr.Janet@yahoo.com','4863752692'),('631791606','Nash','Mcmahon','Mcmahon.Nash@hotmail.com','5922176811'),('632360372','Tyree','Woodard','Woodard.Tyree@hotmail.com','8961938784'),('646342650','Xander','Benton','Benton.Xander@yahoo.com','4422831787'),('768598709','Kaylen','Donovan','Donovan.Kaylen@gmail.com','5647330639'),('799120078','Leonardo','Huang','Huang.Leonardo@yahoo.com',' '),('927937906','Madyson','Harrison',' ','2861518510'),('975001548','Ada','Barrera','Barrera.Ada@hotmail.com',' ');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-02  9:50:52
