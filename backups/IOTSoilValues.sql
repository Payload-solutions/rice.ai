-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: IOTSoilValues
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `real_environment_values`
--

DROP TABLE IF EXISTS `real_environment_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `real_environment_values` (
  `soil_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `soil_dates` timestamp NULL DEFAULT current_timestamp(),
  `humidity_soil` double DEFAULT NULL,
  `humidity_environ` double DEFAULT NULL,
  `ph` double DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  `soil_state` bigint(20) DEFAULT 1,
  PRIMARY KEY (`soil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `real_environment_values`
--

LOCK TABLES `real_environment_values` WRITE;
/*!40000 ALTER TABLE `real_environment_values` DISABLE KEYS */;
INSERT INTO `real_environment_values` VALUES
(1,'2023-03-23 20:30:44',13.879,86.817,6.879,75.814,1),
(2,'2023-03-23 20:30:44',13.682,89.766,6.745,66.437,1),
(3,'2023-03-23 20:30:45',13.869,86.661,6.868,68.321,1),
(4,'2023-03-23 20:30:45',13.484,85.946,6.701,79.789,1),
(5,'2023-03-23 20:30:45',13.421,87.727,6.788,74.424,1),
(6,'2023-03-23 20:30:45',13.34,89.841,6.869,61.437,1),
(7,'2023-03-23 20:30:45',13.714,88.168,6.778,69.393,1),
(8,'2023-03-23 20:30:45',13.846,89.969,6.728,69.068,1),
(9,'2023-03-23 20:30:45',13.843,86.471,6.872,66.644,1),
(10,'2023-03-23 20:30:46',13.182,86.682,6.558,66.178,1),
(11,'2023-03-23 20:30:46',13.881,87.248,6.955,78.167,1),
(12,'2023-03-23 20:30:46',13.594,85.882,6.94,68.97,1),
(13,'2023-03-23 20:30:46',13.09,87.541,6.503,73.463,1),
(14,'2023-03-23 20:30:46',13.155,85.205,6.837,63.423,1),
(15,'2023-03-23 20:30:46',13.043,85.614,6.755,77.669,1),
(16,'2023-03-23 20:30:46',13.983,88.391,6.928,64.581,1),
(17,'2023-03-23 20:30:46',13.436,87.45,6.98,72.746,1),
(18,'2023-03-23 20:30:47',13.702,86.425,6.567,70.064,1),
(19,'2023-03-23 20:30:47',13.597,88.944,6.759,60.253,1),
(20,'2023-03-23 20:30:47',13.987,88.62,6.949,63.104,1);
/*!40000 ALTER TABLE `real_environment_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soil_values`
--

DROP TABLE IF EXISTS `soil_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soil_values` (
  `soil_id` bigint(20) DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  `ph` double DEFAULT NULL,
  `dates` longtext DEFAULT NULL,
  `soil_state` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soil_values`
--

LOCK TABLES `soil_values` WRITE;
/*!40000 ALTER TABLE `soil_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `soil_values` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-02  2:13:47
