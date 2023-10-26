-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: imarket
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `categories_id` int unsigned DEFAULT NULL,
  `title` varchar(145) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categories_categories_idx` (`categories_id`),
  CONSTRAINT `fk_categories_categories` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,'Электроника'),(2,NULL,'Одежда'),(3,NULL,'Книги'),(4,NULL,'Цифровые товары'),(5,1,'Телефоны и смарт-часы'),(6,1,'Ноутбуки'),(7,1,'Телевизоры и видеотехника'),(8,2,'Женщинам'),(9,2,'Мужчинам'),(10,2,'Детям'),(11,7,'Телевизоры'),(12,5,'Смартфоны'),(13,8,'Верхняя одежда'),(14,13,'Пальто');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_info` (
  `customers_id` int unsigned NOT NULL,
  `email` varchar(145) NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password_hash` char(65) DEFAULT NULL,
  PRIMARY KEY (`customers_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  CONSTRAINT `fk_customer_info_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_info`
--

LOCK TABLES `customer_info` WRITE;
/*!40000 ALTER TABLE `customer_info` DISABLE KEYS */;
INSERT INTO `customer_info` VALUES (1,'viktor@ya.ru',79019019191,'2022-08-22 18:20:42','2740ad060aaa09c753a10183359d670d66a4f9b0'),(2,'alya69@mail.ru',79029029292,'2022-08-22 18:22:22','243def05db4de4444210e1998d68aba64312b157'),(3,'syoma@bk.ru',79039039393,'2022-08-22 18:23:36','6b7bcc027ab596c8c174f40f4b685b0690ee1962'),(4,'anna_z@company.com',79049049494,'2022-08-22 18:24:35','30bdd913efa5bfd299c97c2ae0ceb704fa42cf27');
/*!40000 ALTER TABLE `customer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Виктор','1989-08-14',_binary ''),(2,'Алёна','1969-12-10',_binary '\0'),(3,'Семён','2000-01-02',_binary ''),(4,'Анна','1980-08-16',_binary '\0'),(6,'Олег','1999-01-01',_binary '');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int unsigned NOT NULL,
  `products_id` int unsigned NOT NULL,
  `count` int unsigned NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_products_orders1_idx` (`orders_id`),
  KEY `fk_order_products_products1_idx` (`products_id`),
  CONSTRAINT `fk_order_products_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_products_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,1,1,1,15999.00),(2,1,2,1,6999.00),(3,2,1,1,16999.00),(4,2,2,1,5999.00),(5,3,2,2,6712.00),(6,4,3,1,2888.00),(7,5,1,2,17990.00),(8,5,2,5,6712.00),(9,6,3,1,2999.00),(10,7,3,1,2999.00),(11,8,4,1,2399.00);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `customers_id` int unsigned NOT NULL,
  `sum` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_customers1_idx` (`customers_id`),
  CONSTRAINT `fk_orders_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2020-10-10 10:10:00',1,22998.00),(2,'2021-10-10 10:10:00',1,22998.00),(3,'2022-02-02 02:02:00',1,13424.00),(4,'2022-03-09 09:00:00',2,2888.00),(5,'2020-12-31 23:59:59',3,69540.00),(6,'2020-09-01 12:00:00',4,2999.00),(7,'2021-09-01 12:00:00',4,2999.00),(8,'2022-09-01 12:00:00',4,2399.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(145) NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `count` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Xiaomi Redmi Note 11',17990.00,99),(2,'realme C11',6712.00,8),(3,'Пальто Zolla',2999.00,200),(4,'Пальто Zarina',2399.00,100);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_has_categories`
--

DROP TABLE IF EXISTS `products_has_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_has_categories` (
  `products_id` int unsigned NOT NULL,
  `categories_id` int unsigned NOT NULL,
  PRIMARY KEY (`products_id`,`categories_id`),
  KEY `fk_products_has_categories_categories1_idx` (`categories_id`),
  KEY `fk_products_has_categories_products1_idx` (`products_id`),
  CONSTRAINT `fk_products_has_categories_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_products_has_categories_products1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_has_categories`
--

LOCK TABLES `products_has_categories` WRITE;
/*!40000 ALTER TABLE `products_has_categories` DISABLE KEYS */;
INSERT INTO `products_has_categories` VALUES (1,12),(2,12),(3,13),(4,13),(3,14),(4,14);
/*!40000 ALTER TABLE `products_has_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-22 20:11:34
