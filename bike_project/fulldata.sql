CREATE DATABASE  IF NOT EXISTS `mini_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mini_project`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mini_project
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `bikeID` int DEFAULT NULL,
  `ServiceCenterID` int DEFAULT NULL,
  `AppointmentTime` datetime NOT NULL,
  `Status` enum('Booked','Completed','Cancelled') NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AppointmentID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ServiceCenterID` (`ServiceCenterID`),
  KEY `bikeID` (`bikeID`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`ServiceCenterID`) REFERENCES `servicecenters` (`ServiceCenterID`),
  CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`bikeID`) REFERENCES `bike` (`bikeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,NULL,53,'2023-11-30 12:30:10','Cancelled','2023-11-29 13:01:05');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike`
--

DROP TABLE IF EXISTS `bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bike` (
  `bikeID` int NOT NULL AUTO_INCREMENT,
  `model` varchar(45) DEFAULT NULL,
  `numberplate` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`bikeID`),
  UNIQUE KEY `numberplate_UNIQUE` (`numberplate`),
  KEY `FK_CustomerID_idx` (`CustomerID`),
  CONSTRAINT `FK_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike`
--

LOCK TABLES `bike` WRITE;
/*!40000 ALTER TABLE `bike` DISABLE KEYS */;
INSERT INTO `bike` VALUES (1,'Scooty ZR','KA01AB1234','Scooter',1),(2,'Pulsar 150','MH02CD5678','Motorcycle',2),(3,'Activa 6G','DL03EF9012','Scooter',3),(4,'Royal Enfield Classic 350','TN04GH3456','Cruiser',4),(5,'TVS Apache RTR 160','UP05IJ6789','Street',5),(6,'bullet','MH1243','electric',NULL);
/*!40000 ALTER TABLE `bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `AppointmentID` int DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Paid` enum('Yes','No') DEFAULT 'No',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BillID`),
  KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'rohit_verma','password1','2023-11-28 14:09:32'),(2,'poonam_gupta','securepass2','2023-11-28 14:09:32'),(3,'vijay_kumar','strongpass3','2023-11-28 14:09:32'),(4,'divya_rao','secretcode4','2023-11-28 14:09:32'),(5,'arjun_singh','pass7895','2023-11-28 14:09:32'),(6,'meera_shah','mypassword6','2023-11-28 14:09:32'),(7,'akash_joshi','password4567','2023-11-28 14:09:32'),(8,'sakshi_reddy','passcode1238','2023-11-28 14:09:32'),(9,'vikas_chopra','secure4569','2023-11-28 14:09:32'),(10,'snehal_patel','strongpass10','2023-11-28 14:09:32'),(11,'aradhya_sharma','secretcode11','2023-11-28 14:09:32'),(12,'rajat_mehra','pass123412','2023-11-28 14:09:32'),(13,'anushka_rajan','securepass13','2023-11-28 14:09:32'),(14,'yuvan_singh','strong78914','2023-11-28 14:09:32'),(15,'tanvi_mishra','secretpass15','2023-11-28 14:09:32'),(16,'sumit_kumar','passcode45616','2023-11-28 14:09:32'),(17,'nisha_shetty','mypassword17','2023-11-28 14:09:32'),(18,'rajeev_rana','password78918','2023-11-28 14:09:32'),(19,'sanjana_rai','securepass12319','2023-11-28 14:09:32'),(20,'arjun_gandhi','strong56720','2023-11-28 14:09:32'),(21,'priya_patil','secret78921','2023-11-28 14:09:32'),(22,'vivek_sharma','passcode56722','2023-11-28 14:09:32'),(23,'anita_kapoor','securepass78923','2023-11-28 14:09:32'),(24,'rishi_singhal','strongcode24','2023-11-28 14:09:32'),(25,'pooja_nair','secretcode56725','2023-11-28 14:09:32'),(26,'rajat_saxena','pass1234526','2023-11-28 14:09:32'),(27,'reena_chopra','securepass56727','2023-11-28 14:09:32'),(28,'akash_mittal','strongpass12328','2023-11-28 14:09:32'),(29,'divya_narayan','secretpass56729','2023-11-28 14:09:32'),(30,'nikhil_shah','passcode78930','2023-11-28 14:09:32'),(31,'neha_gupta','securecode31','2023-11-28 14:09:32'),(32,'amit_singh','strongpass78932','2023-11-28 14:09:32'),(33,'nandini_reddy','secret123433','2023-11-28 14:09:32'),(34,'vijay_mehra','passcode123434','2023-11-28 14:09:32'),(35,'ruchi_kapoor','secure78935','2023-11-28 14:09:32'),(36,'abhishek_jha','strong123436','2023-11-28 14:09:32'),(37,'tanu_mittal','secretcode78937','2023-11-28 14:09:32'),(38,'suman_kumar','pass12345638','2023-11-28 14:09:32'),(39,'radha_rao','secure12339','2023-11-28 14:09:32'),(40,'manoj_sharma','strongcode56740','2023-11-28 14:09:32'),(41,'preeti_singh','secretpass12341','2023-11-28 14:09:32'),(42,'arun_jain','passcode34542','2023-11-28 14:09:32'),(43,'maya_nair','securepass34543','2023-11-28 14:09:32'),(44,'rohit_gupta','strongcode78944','2023-11-28 14:09:32'),(45,'priyanka_rajan','secretcode34545','2023-11-28 14:09:32'),(46,'ankit_kapoor','passcode567846','2023-11-28 14:09:32'),(47,'reena_mehra','securepass34547','2023-11-28 14:09:32'),(48,'rajiv_singh','strongpass567848','2023-11-28 14:09:32'),(50,'abhishek','password','2023-11-29 08:23:22'),(52,'shubhas','password','2023-11-29 08:25:54');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `event` varchar(20) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data1` varchar(45) DEFAULT NULL,
  `data2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'insert',NULL,'50',NULL),(2,'insert','2023-11-29 08:25:54','52',NULL);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `Rating_id` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `ServiceCenterID` int DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  PRIMARY KEY (`Rating_id`),
  KEY `fk_customer_id_idx` (`CustomerID`),
  KEY `fk_servicecenter_id_idx` (`ServiceCenterID`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `fk_servicecenter_id` FOREIGN KEY (`ServiceCenterID`) REFERENCES `servicecenters` (`ServiceCenterID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,53,4),(2,1,53,5),(3,1,54,5);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicecenters`
--

DROP TABLE IF EXISTS `servicecenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicecenters` (
  `ServiceCenterID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Rating` float DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ServiceCenterID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicecenters`
--

LOCK TABLES `servicecenters` WRITE;
/*!40000 ALTER TABLE `servicecenters` DISABLE KEYS */;
INSERT INTO `servicecenters` VALUES (53,'electronics_expert','password123',4.5,'2023-11-28 14:43:20'),(54,'gadget_guru','secure_pass',5,'2023-11-28 14:43:20'),(55,'tech_masters','strongpass456',NULL,'2023-11-28 14:43:20'),(56,'quick_fix_center','secret789',NULL,'2023-11-28 14:43:20'),(57,'smart_device_service','pass789',NULL,'2023-11-28 14:43:20');
/*!40000 ALTER TABLE `servicecenters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29 19:36:14
