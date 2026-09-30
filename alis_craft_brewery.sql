-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: ali_craft_brewery
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `beer`
--

DROP TABLE IF EXISTS `beer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beer` (
  `beer_id` int NOT NULL AUTO_INCREMENT,
  `beer_name` varchar(100) NOT NULL,
  `beer_style` varchar(50) NOT NULL,
  `abv` decimal(4,2) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`beer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beer`
--

LOCK TABLES `beer` WRITE;
/*!40000 ALTER TABLE `beer` DISABLE KEYS */;
INSERT INTO `beer` VALUES (1,'Sierra Nevada Pale Ale','Pale Ale',5.60,7.00),(2,'Guinness Draught','Stout',4.20,8.00),(3,'Blue Moon Belgian White','Wheat Beer',5.40,7.00),(4,'Samuel Adams Boston Lager','Lager',5.00,7.00),(5,'Dogfish Head 60 Minute IPA','IPA',6.00,8.00);
/*!40000 ALTER TABLE `beer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredient_id` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(100) NOT NULL,
  `ingredient_type` varchar(50) NOT NULL,
  `unit` varchar(20) NOT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Pale Malt','Grain','lb'),(2,'Cascade Hops','Hop','oz'),(3,'Centennial Hops','Hop','oz'),(4,'Roasted Barley','Grain','lb'),(5,'Wheat Malt','Grain','lb'),(6,'Ale Yeast','Yeast','g');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_batch`
--

DROP TABLE IF EXISTS `production_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_batch` (
  `batch_id` int NOT NULL AUTO_INCREMENT,
  `beer_id` int NOT NULL,
  `batch_date` date NOT NULL,
  `quantity_gallons` decimal(8,2) NOT NULL,
  `batch_status` varchar(30) NOT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `beer_id` (`beer_id`),
  CONSTRAINT `production_batch_ibfk_1` FOREIGN KEY (`beer_id`) REFERENCES `beer` (`beer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_batch`
--

LOCK TABLES `production_batch` WRITE;
/*!40000 ALTER TABLE `production_batch` DISABLE KEYS */;
INSERT INTO `production_batch` VALUES (1,1,'2026-09-01',100.00,'Completed'),(2,2,'2026-09-05',80.00,'Completed'),(3,3,'2026-09-10',120.00,'In Progress'),(4,4,'2026-09-15',90.00,'Completed'),(5,5,'2026-09-20',110.00,'In Progress');
/*!40000 ALTER TABLE `production_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `beer_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `beer_id` (`beer_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`beer_id`) REFERENCES `beer` (`beer_id`),
  CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,1,1,100.00),(2,1,2,10.00),(3,1,3,5.00),(4,2,1,80.00),(5,2,4,15.00),(6,2,6,500.00),(7,3,5,90.00),(8,3,2,8.00),(9,3,6,450.00),(10,4,1,75.00),(11,4,3,6.00),(12,4,6,400.00),(13,5,1,95.00),(14,5,2,12.00),(15,5,3,7.00);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `beer_id` int NOT NULL,
  `sale_date` datetime NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `beer_id` (`beer_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`beer_id`) REFERENCES `beer` (`beer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,'2026-09-25 12:30:00',2,14.00),(2,2,'2026-09-25 13:15:00',3,24.00),(3,3,'2026-09-25 14:00:00',1,8.00),(4,4,'2026-09-26 16:45:00',2,14.00),(5,5,'2026-09-26 18:20:00',4,32.00),(6,1,'2026-09-27 19:10:00',3,21.00),(7,2,'2026-09-27 20:00:00',2,16.00),(8,3,'2026-09-28 17:30:00',2,16.00);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-29 21:22:26
