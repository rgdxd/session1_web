CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `diagnostic_measures`
--

DROP TABLE IF EXISTS `diagnostic_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_measures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `recommendations` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic_measures`
--

LOCK TABLES `diagnostic_measures` WRITE;
/*!40000 ALTER TABLE `diagnostic_measures` DISABLE KEYS */;
INSERT INTO `diagnostic_measures` VALUES (1,'2024-02-05','Психология','АнтиДепрессия','Слушать врача');
/*!40000 ALTER TABLE `diagnostic_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disease` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (1,'гайморит');
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `passport_number` int DEFAULT NULL,
  `passport_series` int DEFAULT NULL,
  `date_of_bith` date DEFAULT NULL,
  `phonenumber` varchar(12) DEFAULT NULL,
  `gender` varchar(3) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'asd','asd','asd',12454,51512,'2000-01-01','+79515936977','муж','kak','1234');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitalization`
--

DROP TABLE IF EXISTS `hospitalization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitalization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitalization`
--

LOCK TABLES `hospitalization` WRITE;
/*!40000 ALTER TABLE `hospitalization` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospitalization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measuser_doctor`
--

DROP TABLE IF EXISTS `measuser_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measuser_doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NOT NULL,
  `measuser_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adfxcvzxzc_idx` (`doctor_id`),
  KEY `twrsgvsfaz\_idx` (`measuser_id`),
  CONSTRAINT `adfxcvzxzc` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `twrsgvsfaz\` FOREIGN KEY (`measuser_id`) REFERENCES `diagnostic_measures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measuser_doctor`
--

LOCK TABLES `measuser_doctor` WRITE;
/*!40000 ALTER TABLE `measuser_doctor` DISABLE KEYS */;
INSERT INTO `measuser_doctor` VALUES (1,1,1);
/*!40000 ALTER TABLE `measuser_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medcard`
--

DROP TABLE IF EXISTS `medcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medcard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL,
  `date_of_last_request` date DEFAULT NULL,
  `date_of_the_next_visit` date DEFAULT NULL,
  `anamnesis` varchar(255) DEFAULT NULL,
  `recommendations` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medcard`
--

LOCK TABLES `medcard` WRITE;
/*!40000 ALTER TABLE `medcard` DISABLE KEYS */;
INSERT INTO `medcard` VALUES (5,1245656,'2000-01-01','2010-10-01','2010-10-05','jhfjf','7456745asda'),(6,24124,'2000-01-01','2020-10-11','2023-01-10','sgffsg','sgfsgf');
/*!40000 ALTER TABLE `medcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medcard_diseases`
--

DROP TABLE IF EXISTS `medcard_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medcard_diseases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medcard_id` int NOT NULL,
  `diseases_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sdgfzxxz_idx` (`medcard_id`),
  KEY `kghhhfg_idx` (`diseases_id`),
  CONSTRAINT `kghhhfg` FOREIGN KEY (`diseases_id`) REFERENCES `diseases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sdgfzxxz` FOREIGN KEY (`medcard_id`) REFERENCES `medcard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medcard_diseases`
--

LOCK TABLES `medcard_diseases` WRITE;
/*!40000 ALTER TABLE `medcard_diseases` DISABLE KEYS */;
INSERT INTO `medcard_diseases` VALUES (5,5,1),(6,6,1);
/*!40000 ALTER TABLE `medcard_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `passport_number` int DEFAULT NULL,
  `passport_series` int DEFAULT NULL,
  `date_of_bith` date DEFAULT NULL,
  `gender` varchar(3) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phonenumber` varchar(12) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `medcard_id` int NOT NULL,
  `policy_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_idx` (`policy_id`),
  KEY `mecard_idx` (`medcard_id`),
  CONSTRAINT `asdfas` FOREIGN KEY (`medcard_id`) REFERENCES `medcard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hdhgfgfhd` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'dvffd','askd','aksda','askdk',4325,212356,'2000-01-01','жен','aksdkas','+71284921941','alsdlasd',5,2);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_hospitalization`
--

DROP TABLE IF EXISTS `patient_hospitalization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_hospitalization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `hospitalization_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bvcxbxcvbvxc_idx` (`patient_id`),
  KEY `ncnxcvb_idx` (`hospitalization_id`),
  CONSTRAINT `bvcxbxcvbvxc` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ncnxcvb` FOREIGN KEY (`hospitalization_id`) REFERENCES `hospitalization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_hospitalization`
--

LOCK TABLES `patient_hospitalization` WRITE;
/*!40000 ALTER TABLE `patient_hospitalization` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_hospitalization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_measures`
--

DROP TABLE IF EXISTS `patient_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_measures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medcard_id` int NOT NULL,
  `measures_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bxcvbcx_idx` (`medcard_id`),
  KEY `.jhghfdfdssd_idx` (`measures_id`),
  CONSTRAINT `.jhghfdfdssd` FOREIGN KEY (`measures_id`) REFERENCES `diagnostic_measures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bxcvbcx` FOREIGN KEY (`medcard_id`) REFERENCES `medcard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_measures`
--

LOCK TABLES `patient_measures` WRITE;
/*!40000 ALTER TABLE `patient_measures` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` int DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (2,4325234,'2024-11-01');
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medication` varchar(45) DEFAULT NULL,
  `reception_format` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Ношпа','2 раза в день, 1 таблетку');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_medcard`
--

DROP TABLE IF EXISTS `recipe_medcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_medcard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `medcard_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xcbxcv_idx` (`recipe_id`),
  KEY `jhgfdsa_idx` (`medcard_id`),
  CONSTRAINT `jhgfdsa` FOREIGN KEY (`medcard_id`) REFERENCES `medcard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `xcbxcv` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_medcard`
--

LOCK TABLES `recipe_medcard` WRITE;
/*!40000 ALTER TABLE `recipe_medcard` DISABLE KEYS */;
INSERT INTO `recipe_medcard` VALUES (1,1,6);
/*!40000 ALTER TABLE `recipe_medcard` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-08  9:50:52
