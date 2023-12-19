-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bike_doctor
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,NULL,1,'2023-11-29 00:00:00','Completed','2023-11-29 14:19:22'),(3,48,NULL,1,'2023-11-29 00:00:00','Booked','2023-11-29 14:21:20'),(5,25,NULL,2,'2023-11-29 00:00:00','Booked','2023-11-29 14:25:04'),(6,33,NULL,3,'2023-12-01 00:00:00','Booked','2023-11-29 14:25:26'),(7,26,NULL,4,'2023-09-10 00:00:00','Booked','2023-11-29 14:25:44');
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
  KEY `FK_CustomerID` (`CustomerID`),
  CONSTRAINT `FK_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike`
--

LOCK TABLES `bike` WRITE;
/*!40000 ALTER TABLE `bike` DISABLE KEYS */;
INSERT INTO `bike` VALUES (1,'Scooty ZR','KA01AB1234','Scooter',1),(2,'Pulsar 150','MH02CD5678','Motorcycle',2),(3,'Activa 6G','DL03EF9012','Scooter',3),(4,'Royal Enfield Classic 350','TN04GH3456','Cruiser',4),(5,'TVS Apache RTR 160','UP05IJ6789','Street',5);
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
  KEY `bills_ibfk_1` (`AppointmentID`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,1000.00,'Yes','2023-11-29 14:27:04');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_view`
--

DROP TABLE IF EXISTS `customer_view`;
/*!50001 DROP VIEW IF EXISTS `customer_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_view` AS SELECT 
 1 AS `CustomerID`,
 1 AS `Username`,
 1 AS `bikeID`,
 1 AS `model`,
 1 AS `ServiceCenterID`,
 1 AS `AppointmentID`,
 1 AS `AppointmentTime`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'rohit_verma','password1','2023-11-29 14:16:35'),(2,'poonam_gupta','securepass2','2023-11-29 14:16:35'),(3,'vijay_kumar','strongpass3','2023-11-29 14:16:35'),(4,'divya_rao','secretcode4','2023-11-29 14:16:35'),(5,'arjun_singh','pass7895','2023-11-29 14:16:35'),(6,'meera_shah','mypassword6','2023-11-29 14:16:35'),(7,'akash_joshi','password4567','2023-11-29 14:16:35'),(8,'sakshi_reddy','passcode1238','2023-11-29 14:16:35'),(9,'vikas_chopra','secure4569','2023-11-29 14:16:35'),(10,'snehal_patel','strongpass10','2023-11-29 14:16:35'),(11,'aradhya_sharma','secretcode11','2023-11-29 14:16:35'),(12,'rajat_mehra','pass123412','2023-11-29 14:16:35'),(13,'anushka_rajan','securepass13','2023-11-29 14:16:35'),(14,'yuvan_singh','strong78914','2023-11-29 14:16:35'),(15,'tanvi_mishra','secretpass15','2023-11-29 14:16:35'),(16,'sumit_kumar','passcode45616','2023-11-29 14:16:35'),(17,'nisha_shetty','mypassword17','2023-11-29 14:16:35'),(18,'rajeev_rana','password78918','2023-11-29 14:16:35'),(19,'sanjana_rai','securepass12319','2023-11-29 14:16:35'),(20,'arjun_gandhi','strong56720','2023-11-29 14:16:35'),(21,'priya_patil','secret78921','2023-11-29 14:16:35'),(22,'vivek_sharma','passcode56722','2023-11-29 14:16:35'),(23,'anita_kapoor','securepass78923','2023-11-29 14:16:35'),(24,'rishi_singhal','strongcode24','2023-11-29 14:16:35'),(25,'pooja_nair','secretcode56725','2023-11-29 14:16:35'),(26,'rajat_saxena','pass1234526','2023-11-29 14:16:35'),(27,'reena_chopra','securepass56727','2023-11-29 14:16:35'),(28,'akash_mittal','strongpass12328','2023-11-29 14:16:35'),(29,'divya_narayan','secretpass56729','2023-11-29 14:16:35'),(30,'nikhil_shah','passcode78930','2023-11-29 14:16:35'),(31,'neha_gupta','securecode31','2023-11-29 14:16:35'),(32,'amit_singh','strongpass78932','2023-11-29 14:16:35'),(33,'nandini_reddy','secret123433','2023-11-29 14:16:35'),(34,'vijay_mehra','passcode123434','2023-11-29 14:16:35'),(35,'ruchi_kapoor','secure78935','2023-11-29 14:16:35'),(36,'abhishek_jha','strong123436','2023-11-29 14:16:35'),(37,'tanu_mittal','secretcode78937','2023-11-29 14:16:35'),(38,'suman_kumar','pass12345638','2023-11-29 14:16:35'),(39,'radha_rao','secure12339','2023-11-29 14:16:35'),(40,'manoj_sharma','strongcode56740','2023-11-29 14:16:35'),(41,'preeti_singh','secretpass12341','2023-11-29 14:16:35'),(42,'arun_jain','passcode34542','2023-11-29 14:16:35'),(43,'maya_nair','securepass34543','2023-11-29 14:16:35'),(44,'rohit_gupta','strongcode78944','2023-11-29 14:16:35'),(45,'priyanka_rajan','secretcode34545','2023-11-29 14:16:35'),(46,'ankit_kapoor','passcode567846','2023-11-29 14:16:35'),(47,'reena_mehra','securepass34547','2023-11-29 14:16:35'),(48,'rajiv_singh','strongpass567848','2023-11-29 14:16:35');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
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
  KEY `fk_customer_id` (`CustomerID`),
  KEY `fk_servicecenter_id` (`ServiceCenterID`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `fk_servicecenter_id` FOREIGN KEY (`ServiceCenterID`) REFERENCES `servicecenters` (`ServiceCenterID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,2,4);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_rating` AFTER INSERT ON `rating` FOR EACH ROW BEGIN
    DECLARE avg_rating FLOAT;

    
    SELECT AVG(Rating) INTO avg_rating
    FROM rating
    WHERE ServiceCenterID = NEW.ServiceCenterID;

    
    UPDATE servicecenters
    SET Rating = avg_rating
    WHERE ServiceCenterID = NEW.ServiceCenterID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `servicecenter_view`
--

DROP TABLE IF EXISTS `servicecenter_view`;
/*!50001 DROP VIEW IF EXISTS `servicecenter_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `servicecenter_view` AS SELECT 
 1 AS `ServiceCenterID`,
 1 AS `AppointmentID`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicecenters`
--

LOCK TABLES `servicecenters` WRITE;
/*!40000 ALTER TABLE `servicecenters` DISABLE KEYS */;
INSERT INTO `servicecenters` VALUES (1,'tech_hub','pass123',NULL,'2023-11-29 14:16:35'),(2,'repair_masters','secure_pass',4,'2023-11-29 14:16:35'),(3,'gadget_gurus','strongpass456',NULL,'2023-11-29 14:16:35'),(4,'quick_fix','secret789',NULL,'2023-11-29 14:16:35'),(5,'smart_service','pass789',NULL,'2023-11-29 14:16:35'),(6,'device_doctors','mypassword',NULL,'2023-11-29 14:16:35'),(7,'tech_support','password456',NULL,'2023-11-29 14:16:35'),(8,'fix_it_fast','passcode123',NULL,'2023-11-29 14:16:35'),(9,'gizmo_genius','secure456',NULL,'2023-11-29 14:16:35'),(10,'express_service','strongcode789',NULL,'2023-11-29 14:16:35');
/*!40000 ALTER TABLE `servicecenters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bike_doctor'
--
/*!50003 DROP PROCEDURE IF EXISTS `BookAppointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookAppointment`(IN p_customerID INT, IN p_serviceCenterID INT, IN p_appointmentTime DATETIME)
BEGIN
    INSERT INTO Appointments(CustomerID, ServiceCenterID, AppointmentTime, Status) VALUES(p_customerID, p_serviceCenterID, p_appointmentTime, 'Booked');
    SELECT 'Appointment booked successfully';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancel_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_appointment`(in cust_id int)
BEGIN
	update appointments set status='cancelled' where customerid=cust_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkBill`(IN P_CustomerID int)
BEGIN
	select concat("Your Total bill is: ",b.amount )
	from bills b, Appointments a 
	where b.AppointmentID=a.AppointmentID and a.CustomerID=P_CustomerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CompleteAppointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CompleteAppointment`(IN p_appointmentID INT, IN p_amount DECIMAL(10, 2))
BEGIN
    UPDATE Appointments SET Status = 'Completed' WHERE AppointmentID = p_appointmentID;
    INSERT INTO Bills(AppointmentID, Amount) VALUES(p_appointmentID, p_amount);
    SELECT 'Appointment completed and bill generated successfully';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CompletePayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CompletePayment`(IN p_AppointmentID int)
BEGIN
	IF exists(select * from bills where appointmentid=p_appointmentID)
	Then
	update bills set paid='Yes' where appointmentId=p_AppointmentID;
	select 'Payment done successfully :)';
	ELSE 
	SELECT 'INVALID APPOINTMENT ID ENTERED!';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateCustomer`(IN p_username VARCHAR(50), IN p_password VARCHAR(255))
BEGIN
    IF EXISTS (SELECT * FROM Customers WHERE Username = p_username) THEN
        SELECT 'Account already created for this username';
    ELSE
        INSERT INTO Customers(Username, Password) VALUES(p_username, p_password);
        SELECT 'Account created successfully for this username';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateServiceCenter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateServiceCenter`(IN p_username VARCHAR(50), IN p_password VARCHAR(255))
BEGIN
    IF EXISTS (SELECT * FROM ServiceCenters WHERE Username = p_username) THEN
        SELECT 'Account already created for this username';
    ELSE
        INSERT INTO ServiceCenters(Username, Password) VALUES(p_username, p_password);
        SELECT 'Account created successfully for this username';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `giveBikeDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `giveBikeDetails`(in b_model varchar(45),in b_numberplate varchar(45), in b_type varchar(45),in cust_id int)
BEGIN
    IF EXISTS (SELECT * FROM BIKE WHERE numberplate = b_numberplate ) THEN
        SELECT 'Bike already registered!!';
    ELSE
        INSERT INTO BIKE(model,numberplate,type,customerID) VALUES(b_model,b_numberplate,b_type,cust_id);
        SELECT 'Bike registered successfully :)';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GiveRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GiveRating`(In p_customerID INT, IN P_ServiceCenterID INT, IN P_Rating FLOAT)
BEGIN
	IF EXISTS (SELECT ServiceCenterID FROM ServiceCenters WHERE ServiceCenterID = P_ServiceCenterID) THEN
		IF P_Rating >=0 AND P_Rating<=5 THEN
			INSERT into rating (customerID,ServiceCenterID,Rating) values(p_customerID,P_ServiceCenterID,P_Rating);
		ELSE
			SELECT 'INVALID ENTER RATING BETWEEN 1 TO 5';
		END IF;
    ELSE
        SELECT 'INVALID ServiceCenterID !!!!';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reviewRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reviewRating`(in p_center_id int)
begin
if exists(select * from servicecenters where servicecenterid=p_center_id)
then

select  username,concat('The rating of this service center is: ',rating) "review"
from servicecenters where ServiceCenterID=p_center_id;
else
select '!! Enter valid center id';
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_appointment`(in cust_id int,in new_time TIMESTAMP)
BEGIN
	update appointments 
    set appointmentTime= new_time 
    where customerID= cust_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_view` AS select `c`.`CustomerID` AS `CustomerID`,`c`.`Username` AS `Username`,`b`.`bikeID` AS `bikeID`,`b`.`model` AS `model`,`a`.`ServiceCenterID` AS `ServiceCenterID`,`a`.`AppointmentID` AS `AppointmentID`,`a`.`AppointmentTime` AS `AppointmentTime` from ((`customers` `c` join `bike` `b` on((`c`.`CustomerID` = `b`.`CustomerID`))) join `appointments` `a` on((`a`.`CustomerID` = `b`.`CustomerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `servicecenter_view`
--

/*!50001 DROP VIEW IF EXISTS `servicecenter_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `servicecenter_view` AS select `a`.`ServiceCenterID` AS `ServiceCenterID`,`a`.`AppointmentID` AS `AppointmentID` from (`servicecenters` `s` join `appointments` `a` on((`s`.`ServiceCenterID` = `a`.`ServiceCenterID`))) */;
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

-- Dump completed on 2023-12-01 14:11:00
