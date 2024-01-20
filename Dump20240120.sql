CREATE DATABASE  IF NOT EXISTS `crop_insurance` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crop_insurance`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: crop_insurance
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `t_crop`
--

DROP TABLE IF EXISTS `t_crop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_crop` (
  `crop_id` int NOT NULL AUTO_INCREMENT,
  `crop_name` varchar(45) NOT NULL,
  `season_id` int NOT NULL,
  PRIMARY KEY (`crop_id`),
  KEY `season_id_fk_idx` (`season_id`),
  CONSTRAINT `season_id_fk` FOREIGN KEY (`season_id`) REFERENCES `t_season` (`season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_crop`
--

LOCK TABLES `t_crop` WRITE;
/*!40000 ALTER TABLE `t_crop` DISABLE KEYS */;
INSERT INTO `t_crop` VALUES (1,'Maize',1),(2,'Beans',1),(3,'Rice',2),(4,'Sugarcane',2),(5,'Cotton',1);
/*!40000 ALTER TABLE `t_crop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_insurance`
--

DROP TABLE IF EXISTS `t_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_insurance` (
  `insurance_id` int NOT NULL AUTO_INCREMENT,
  `farmer_name` varchar(50) NOT NULL,
  `aadhar_no` varchar(12) NOT NULL,
  `address` varchar(250) NOT NULL,
  `father_name` varchar(12) NOT NULL,
  `farmer_category` varchar(15) NOT NULL,
  `crop_id` int NOT NULL,
  PRIMARY KEY (`insurance_id`),
  UNIQUE KEY `aadhar_no_UNIQUE` (`aadhar_no`),
  KEY `crop_id_fk_idx` (`crop_id`),
  CONSTRAINT `crop_id_fk` FOREIGN KEY (`crop_id`) REFERENCES `t_crop` (`crop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_insurance`
--

LOCK TABLES `t_insurance` WRITE;
/*!40000 ALTER TABLE `t_insurance` DISABLE KEYS */;
INSERT INTO `t_insurance` VALUES (1,'Foo Bar','1234','Nairobi Kenya ','Snr','Medium',2),(3,'Foo Bar','23456','Nairobi Kenya ','Snr','Large',4);
/*!40000 ALTER TABLE `t_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_season`
--

DROP TABLE IF EXISTS `t_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_season` (
  `season_id` int NOT NULL AUTO_INCREMENT,
  `season_name` varchar(45) NOT NULL,
  PRIMARY KEY (`season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_season`
--

LOCK TABLES `t_season` WRITE;
/*!40000 ALTER TABLE `t_season` DISABLE KEYS */;
INSERT INTO `t_season` VALUES (1,'Kharif'),(2,'Rabi');
/*!40000 ALTER TABLE `t_season` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-20 11:03:44
