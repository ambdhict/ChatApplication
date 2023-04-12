-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: dbchatsystem
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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

DROP DATABASE IF EXISTS dbchatsystem;
CREATE DATABASE dbchatsystem;
USE dbchatsystem;

--
-- Table structure for table `tblchat`
--

DROP TABLE IF EXISTS `tblchat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblchat` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(250) DEFAULT NULL,
  `userEmail` varchar(250) DEFAULT NULL,
  `userPassword` varchar(100) DEFAULT NULL,
  `userProfile` varchar(100) DEFAULT NULL,
  `userStatus` enum('Disable','Enable') DEFAULT NULL,
  `userCreatedOn` datetime DEFAULT NULL,
  `userVerificationCode` varchar(100) DEFAULT NULL,
  `userLoginStatus` enum('Logout','Login') DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblchat`
--

LOCK TABLES `tblchat` WRITE;
/*!40000 ALTER TABLE `tblchat` DISABLE KEYS */;
INSERT INTO `tblchat` VALUES (1,'Benedict Estrellado','ambdhict22@gmail.com','0','images/1680185566.png','Enable','2023-03-30 16:12:46','d81a1b69f198fcfe5254ff9a219a349d',NULL);
/*!40000 ALTER TABLE `tblchat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmessage`
--

DROP TABLE IF EXISTS `tblmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmessage`
--

LOCK TABLES `tblmessage` WRITE;
/*!40000 ALTER TABLE `tblmessage` DISABLE KEYS */;
INSERT INTO `tblmessage` VALUES (1,'Hello',3,'2023-04-08 12:13:58'),(2,'Hi!!!!',2,'2023-04-08 12:14:25'),(3,'papangit nyo',1,'2023-04-08 12:14:45'),(4,'hahahaha',2,'2023-04-08 12:14:52'),(5,'hjkdsfhjksfhjksdhfjksdhfjkdhsfjkh sdhfjksdhfjksdhfjksh khffjkdhfjkdshfjkh jkhdjkfhsdjkfhjksd djfhsjkfhjksdfh sdkfjhsjkfhjsdkhfjksdh kjhjkdshfjkhsdjkfhsdjkhfjksdhkf',2,'2023-04-08 12:17:13'),(6,'hdsfklhsdk dfhsdklhfjkls skdhfjksdhfkl hfkjdhsfjkhsdjkfh fhsdklhfklshjHJFKLSDHFKLSDH FHDASJDFHdhaskjlhaklsh hdjkashfkahsfkashkdlhhadsjkhdka',1,'2023-04-08 12:17:32'),(7,'hjkdsfhjksfhjksdhfjksdhfjkdhsfjkh sdhfjksdhfjksdhfjksh khffjkdhfjkdshfjkh jkhdjkfhsdjkfhjksd djfhsjkfhjksdfh sdkfjhsjkfhjsdkhfjksdh kjhjkdshfjkhsdjkfhsdjkhfjksdhkf',2,'2023-04-08 12:17:39'),(8,'hdsfklhsdk dfhsdklhfjkls skdhfjksdhfkl hfkjdhsfjkhsdjkfh fhsdklhfklshjHJFKLSDHFKLSDH FHDASJDFHdhaskjlhaklsh hdjkashfkahsfkashkdlhhadsjkhdka',1,'2023-04-08 12:17:47'),(9,'hdsfklhsdk dfhsdklhfjkls skdhfjksdhfkl hfkjdhsfjkhsdjkfh fhsdklhfklshjHJFKLSDHFKLSDH FHDASJDFHdhaskjlhaklsh hdjkashfkahsfkashkdlhhadsjkhdka',1,'2023-04-08 12:17:47'),(10,'hjkdsfhjksfhjksdhfjksdhfjkdhsfjkh sdhfjksdhfjksdhfjksh khffjkdhfjkdshfjkh jkhdjkfhsdjkfhjksd djfhsjkfhjksdfh sdkfjhsjkfhjsdkhfjksdh kjhjkdshfjkhsdjkfhsdjkhfjksdhkf',2,'2023-04-08 12:37:45'),(11,'Hello',3,'2023-04-08 12:37:54'),(12,'hdsfklhsdk dfhsdklhfjkls skdhfjksdhfkl hfkjdhsfjkhsdjkfh fhsdklhfklshjHJFKLSDHFKLSDH FHDASJDFHdhaskjlhaklsh hdjkashfkahsfkashkdlhhadsjkhdka',1,'2023-04-08 12:38:03'),(13,'Hello',3,'2023-04-08 12:55:58'),(14,'Anyare',1,'2023-04-08 01:08:56'),(15,'HAHAHAHAH ewan ko. Lagot',2,'2023-04-08 01:09:09'),(16,'Hahahahahaahah',2,'2023-04-08 01:09:15'),(17,'Okay na ulit hahahaha May mali lang.. bobo kasi ',3,'2023-04-08 01:26:02'),(18,'Hahahahahaha mas bobo ka',2,'2023-04-08 01:26:11'),(19,'Akala ko di na kaya hilutin hahahaha',2,'2023-04-08 01:26:25'),(20,'Basta magaling ako hahahaha',1,'2023-04-08 01:26:39'),(21,'Tangina mo eh di ikaw na hahaha',2,'2023-04-08 01:27:41'),(22,'Basta magaling ako hahahaha',1,'2023-04-08 01:56:37'),(23,'Tara chat na naman ',1,'2023-04-08 05:15:38'),(24,'Hahahahah eh di wow',2,'2023-04-08 05:15:46');
/*!40000 ALTER TABLE `tblmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrooms`
--

DROP TABLE IF EXISTS `tblrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `userMsg` varchar(200) DEFAULT NULL,
  `userCreatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrooms`
--

LOCK TABLES `tblrooms` WRITE;
/*!40000 ALTER TABLE `tblrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(45) NOT NULL,
  `password2` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `profile` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
INSERT INTO `tbluser` VALUES (1,'ben','0','0','ben@gmail.com','','1'),(2,'admin','0','0','admin@gmail.com','','1'),(3,'ran','0','0','ran@gmail.com','','1');
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-12 22:00:48
