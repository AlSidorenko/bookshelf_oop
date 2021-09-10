CREATE DATABASE  IF NOT EXISTS `kpi_db.bookshelf_oop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kpi_db.bookshelf_oop`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kpi_db.bookshelf_oop
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `author` (
  `id_author` int(11) NOT NULL AUTO_INCREMENT,
  `name_author` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `dates_life` varchar(25) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `photo_author` varchar(255) DEFAULT NULL,
  `link_biography` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Theodore Dreiser','USA','1871 - 1945','MALE','/media/author/Theodore_Dreiser.jpg','https://en.wikipedia.org/wiki/Theodore_Dreiser'),(2,'Jack London','Great Britain','1876 - 1916','MALE','/media/author/Jack_London.jpg','https://en.wikipedia.org/wiki/Jack_London'),(13,'Lesya Ukrainka','Ukraine','1871 - 1913','FEMALE','/media/author/Lesya_Ukrainka.jpg','https://en.wikipedia.org/wiki/Lesya_Ukrainka');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book` (
  `id_book` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_book` varchar(45) DEFAULT NULL,
  `author_book` varchar(45) DEFAULT NULL,
  `genre_book` varchar(45) DEFAULT NULL,
  `link_book` varchar(255) DEFAULT NULL,
  `photo_book` varchar(45) DEFAULT NULL,
  `rating_book` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'The Financier','Theodore Dreiser','BIOGRAPHY','https://en.wikipedia.org/wiki/The_Financier','/media/book/Financier_Dreiser.jpg','HIGH'),(5,'The Genius','Theodore Dreiser','HISTORY','https://en.wikipedia.org/wiki/The_%22Genius%22_(novel)','/media/book/Genius_Dreiser.jpg','HIGH');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-10 22:26:24
