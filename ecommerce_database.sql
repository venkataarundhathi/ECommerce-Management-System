CREATE DATABASE  IF NOT EXISTS `ecommerce_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce_db`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_db
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `street` varchar(150) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pincode` varchar(15) DEFAULT NULL,
  `address_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_customer` (`customer_id`),
  CONSTRAINT `fk_address_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'12-1','MG Road','Guntur','Andhra Pradesh','522001','Home'),(2,2,'45-2','Main Road','Vijayawada','Andhra Pradesh','520001','Home'),(3,3,'8-15','Benz Circle','Vijayawada','Andhra Pradesh','520010','Home'),(4,4,'22-6','Lakshmipuram','Guntur','Andhra Pradesh','522007','Home'),(5,5,'10-4','Beach Road','Visakhapatnam','Andhra Pradesh','530001','Home');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `created_date` date NOT NULL,
  `cart_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_customer` (`customer_id`),
  CONSTRAINT `fk_cart_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (16,1,'2026-11-10','Active'),(17,2,'2026-11-11','Active'),(18,3,'2026-11-12','Active'),(19,4,'2026-11-13','Active'),(20,5,'2026-11-14','Active');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `fk_cart_items_cart` (`cart_id`),
  KEY `fk_cart_items_product` (`product_id`),
  CONSTRAINT `fk_cart_items_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `fk_cart_items_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `chk_cart_items_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,16,1,1),(3,17,3,1),(5,18,5,1),(7,19,7,1),(9,20,9,1);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Laptop','Portable computers for personal and professional use'),(2,'Smartphone','Smartphones with different features and specifications'),(3,'Tablet','Touchscreen portable computing devices'),(4,'Television','Smart televisions for home entertainment'),(5,'Desktop','Desktop computers for personal and professional use');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `registration_date` date NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Rahul Kumar','rahul@gmail.com','9876543210','hash001','2026-11-01'),(2,'Priya Sharma','priya@gmail.com','9876543211','hash002','2026-11-02'),(3,'Anil Reddy','anil@gmail.com','9876543212','hash003','2026-11-03'),(4,'Sneha Rao','sneha@gmail.com','9876543213','hash004','2026-11-04'),(5,'Kiran Kumar','kiran@gmail.com','9876543214','hash005','2026-11-05');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_order_view`
--

DROP TABLE IF EXISTS `customer_order_view`;
/*!50001 DROP VIEW IF EXISTS `customer_order_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_order_view` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_name`,
 1 AS `order_id`,
 1 AS `order_date`,
 1 AS `total_amount`,
 1 AS `order_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer_review`
--

DROP TABLE IF EXISTS `customer_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_item_id` int NOT NULL,
  `rating` int NOT NULL,
  `review_description` varchar(1000) DEFAULT NULL,
  `review_date` date NOT NULL,
  `verification_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_review_customer` (`customer_id`),
  KEY `fk_review_product` (`product_id`),
  KEY `fk_review_order_item` (`order_item_id`),
  CONSTRAINT `fk_review_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_review_order_item` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`order_item_id`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `chk_review_rating` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_review`
--

LOCK TABLES `customer_review` WRITE;
/*!40000 ALTER TABLE `customer_review` DISABLE KEYS */;
INSERT INTO `customer_review` VALUES (1,1,1,1,5,'Excellent laptop with good performance.','2026-11-22','Verified'),(2,2,3,2,4,'Good smartphone with useful features.','2026-11-22','Verified'),(3,3,5,3,5,'Very useful tablet with clear display.','2026-11-22','Verified'),(4,4,7,4,4,'Good television with clear picture quality.','2026-11-22','Verified'),(5,5,9,5,5,'Excellent desktop for daily work.','2026-11-22','Verified');
/*!40000 ALTER TABLE `customer_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `courier_name` varchar(100) DEFAULT NULL,
  `dispatch_date` date DEFAULT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `actual_delivery_date` date DEFAULT NULL,
  `delivery_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `fk_delivery_order` (`order_id`),
  CONSTRAINT `fk_delivery_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,'TRK1001','Blue Dart','2026-11-15','2026-11-18','2026-11-17','Delivered'),(2,2,'TRK1002','Delhivery','2026-11-16','2026-11-20',NULL,'In Transit'),(3,3,'TRK1003','DTDC','2026-11-18','2026-11-23',NULL,'Processing'),(4,4,'TRK1004','Blue Dart',NULL,'2026-11-25',NULL,'Pending'),(5,5,'TRK1005','Delhivery','2026-11-19','2026-11-22','2026-11-21','Delivered');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `available_quantity` int NOT NULL DEFAULT '0',
  `minimum_stock_level` int NOT NULL DEFAULT '0',
  `last_updated` date DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `fk_inventory_product` (`product_id`),
  CONSTRAINT `fk_inventory_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `chk_inventory_quantities` CHECK (((`available_quantity` >= 0) and (`minimum_stock_level` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,25,5,'2026-11-22'),(3,3,30,5,'2026-11-22'),(5,5,15,3,'2026-11-22'),(7,7,12,3,'2026-11-22'),(9,9,15,3,'2026-11-22');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_order_items_order` (`order_id`),
  KEY `fk_order_items_product` (`product_id`),
  CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `chk_order_items_quantity` CHECK ((`quantity` > 0)),
  CONSTRAINT `chk_order_items_subtotal` CHECK ((`subtotal` >= 0)),
  CONSTRAINT `chk_order_items_unit_price` CHECK ((`unit_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,65000.00,65000.00),(2,2,3,1,75000.00,75000.00),(3,3,5,1,60000.00,60000.00),(4,4,7,1,45000.00,45000.00),(5,5,9,1,50000.00,50000.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `address_id` int NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `order_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customer` (`customer_id`),
  KEY `fk_orders_address` (`address_id`),
  CONSTRAINT `fk_orders_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `chk_orders_total` CHECK ((`total_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2026-11-15',65000.00,'Delivered'),(2,2,2,'2026-11-16',75000.00,'Shipped'),(3,3,3,'2026-11-17',60000.00,'Processing'),(4,4,4,'2026-11-18',45000.00,'Pending'),(5,5,5,'2026-11-19',50000.00,'Delivered');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` decimal(12,2) NOT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `transaction_reference` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payment_order` (`order_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `chk_payment_amount` CHECK ((`payment_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'UPI','2026-11-15',65000.00,'Successful','TXN1001'),(2,2,'Credit Card','2026-11-16',75000.00,'Successful','TXN1002'),(3,3,'Debit Card','2026-11-17',60000.00,'Successful','TXN1003'),(4,4,'UPI','2026-11-18',45000.00,'Pending','TXN1004'),(5,5,'Net Banking','2026-11-19',50000.00,'Successful','TXN1005');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `model_number` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `launch_date` date DEFAULT NULL,
  `product_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_product_category` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `chk_product_price` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Laptop','HP-PAV-001','Laptop for programming and everyday work',65000.00,'2025-01-15','Available'),(3,2,'Smartphone','SAM-S25-001','Smartphone with advanced camera and performance',75000.00,'2025-03-01','Available'),(5,3,'Tablet','APP-IPAD-001','Tablet for education and productivity',60000.00,'2025-03-12','Available'),(7,4,'Television','SAM-TV-001','Smart television for home entertainment',45000.00,'2025-01-20','Available'),(9,5,'Desktop','HP-DES-001','Desktop computer for office and personal use',50000.00,'2025-01-25','Available');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_details_view`
--

DROP TABLE IF EXISTS `product_details_view`;
/*!50001 DROP VIEW IF EXISTS `product_details_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_details_view` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `category_name`,
 1 AS `price`,
 1 AS `available_quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product_specification`
--

DROP TABLE IF EXISTS `product_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_specification` (
  `specification_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `processor` varchar(150) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `ram_gb` int DEFAULT NULL,
  `storage` varchar(50) DEFAULT NULL,
  `storage_gb` int DEFAULT NULL,
  `display_size` varchar(50) DEFAULT NULL,
  `resolution` varchar(50) DEFAULT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `battery_capacity` varchar(60) DEFAULT NULL,
  `battery_hours` decimal(5,2) DEFAULT NULL,
  `additional_features` varchar(1000) DEFAULT NULL,
  `processor_tier` int DEFAULT NULL,
  PRIMARY KEY (`specification_id`),
  KEY `fk_specification_product` (`product_id`),
  CONSTRAINT `fk_specification_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `chk_specification_battery` CHECK (((`battery_hours` is null) or (`battery_hours` >= 0))),
  CONSTRAINT `chk_specification_ram` CHECK (((`ram_gb` is null) or (`ram_gb` >= 0))),
  CONSTRAINT `chk_specification_storage` CHECK (((`storage_gb` is null) or (`storage_gb` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specification`
--

LOCK TABLES `product_specification` WRITE;
/*!40000 ALTER TABLE `product_specification` DISABLE KEYS */;
INSERT INTO `product_specification` VALUES (1,1,'Intel Core i5','16 GB',16,'512 GB SSD',512,'15.6','1920x1080','Windows 11','50 Wh',7.00,'Full HD display',3),(3,3,'Snapdragon 8 Elite','12 GB',12,'256 GB',256,'6.2','2340x1080','Android','4000 mAh',12.00,'Advanced camera',4),(5,5,'Apple M3','8 GB',8,'128 GB',128,'11.0','2360x1640','iPadOS','28.93 Wh',10.00,'Apple Pencil support',4),(7,7,'Crystal Processor','2 GB',2,'8 GB',8,'55.0','3840x2160','Tizen','N/A',0.00,'4K Smart TV',2),(9,9,'Intel Core i5','16 GB',16,'512 GB SSD',512,'0','N/A','Windows 11','N/A',0.00,'Expandable memory',3);
/*!40000 ALTER TABLE `product_specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_suitability_check`
--

DROP TABLE IF EXISTS `product_suitability_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_suitability_check` (
  `check_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `profile_id` int NOT NULL,
  `user_budget` decimal(12,2) DEFAULT NULL,
  `suitability_result` varchar(100) DEFAULT NULL,
  `checked_date` date NOT NULL,
  PRIMARY KEY (`check_id`),
  KEY `fk_suitability_customer` (`customer_id`),
  KEY `fk_suitability_product` (`product_id`),
  KEY `fk_suitability_profile` (`profile_id`),
  CONSTRAINT `fk_suitability_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_suitability_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_suitability_profile` FOREIGN KEY (`profile_id`) REFERENCES `usage_activity_profile` (`profile_id`),
  CONSTRAINT `chk_suitability_budget` CHECK (((`user_budget` is null) or (`user_budget` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_suitability_check`
--

LOCK TABLES `product_suitability_check` WRITE;
/*!40000 ALTER TABLE `product_suitability_check` DISABLE KEYS */;
INSERT INTO `product_suitability_check` VALUES (1,1,1,1,70000.00,'Good Match','2026-11-22'),(2,2,1,2,70000.00,'Partial Match','2026-11-22'),(4,4,5,4,65000.00,'Good Match','2026-11-22'),(5,5,9,5,55000.00,'Good Match','2026-11-22');
/*!40000 ALTER TABLE `product_suitability_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_warranty`
--

DROP TABLE IF EXISTS `product_warranty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_warranty` (
  `warranty_id` int NOT NULL AUTO_INCREMENT,
  `order_item_id` int NOT NULL,
  `warranty_start_date` date DEFAULT NULL,
  `warranty_end_date` date DEFAULT NULL,
  `warranty_period_months` int DEFAULT NULL,
  `warranty_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`warranty_id`),
  KEY `fk_warranty_order_item` (`order_item_id`),
  CONSTRAINT `fk_warranty_order_item` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`order_item_id`),
  CONSTRAINT `chk_warranty_dates` CHECK (((`warranty_start_date` is null) or (`warranty_end_date` is null) or (`warranty_end_date` >= `warranty_start_date`))),
  CONSTRAINT `chk_warranty_period` CHECK (((`warranty_period_months` is null) or (`warranty_period_months` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_warranty`
--

LOCK TABLES `product_warranty` WRITE;
/*!40000 ALTER TABLE `product_warranty` DISABLE KEYS */;
INSERT INTO `product_warranty` VALUES (1,1,'2026-11-15','2027-11-15',12,'Active'),(2,2,'2026-11-16','2027-11-16',12,'Active'),(3,3,'2026-11-17','2027-11-17',12,'Active'),(4,4,'2026-11-18','2027-11-18',12,'Active'),(5,5,'2026-11-19','2027-11-19',12,'Active');
/*!40000 ALTER TABLE `product_warranty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `promotion_id` int NOT NULL AUTO_INCREMENT,
  `promotion_name` varchar(150) NOT NULL,
  `promotion_type` varchar(60) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `promotion_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`promotion_id`),
  CONSTRAINT `chk_promotion_dates` CHECK (((`start_date` is null) or (`end_date` is null) or (`end_date` >= `start_date`))),
  CONSTRAINT `chk_promotion_discount` CHECK (((`discount_percentage` is null) or ((`discount_percentage` >= 0) and (`discount_percentage` <= 100))))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'Diwali Sale','Seasonal',15.00,'2026-11-01','2026-11-30','Active'),(2,'New Year Sale','Seasonal',20.00,'2026-12-25','2027-01-05','Upcoming'),(3,'Student Offer','Special',10.00,'2026-11-01','2026-12-31','Active'),(4,'Laptop Discount','Product Based',12.00,'2026-11-10','2026-11-30','Active'),(5,'Festive Offer','Seasonal',18.00,'2026-10-01','2026-11-25','Active');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_or_replace_assessment`
--

DROP TABLE IF EXISTS `repair_or_replace_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_or_replace_assessment` (
  `assessment_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `owned_product_id` int NOT NULL,
  `replacement_product_id` int DEFAULT NULL,
  `device_condition` varchar(100) DEFAULT NULL,
  `warranty_status` varchar(50) DEFAULT NULL,
  `estimated_repair_cost` decimal(12,2) DEFAULT NULL,
  `decision_result` varchar(100) DEFAULT NULL,
  `assessed_date` date NOT NULL,
  PRIMARY KEY (`assessment_id`),
  KEY `fk_assessment_customer` (`customer_id`),
  KEY `fk_assessment_owned_product` (`owned_product_id`),
  KEY `fk_assessment_replacement_product` (`replacement_product_id`),
  CONSTRAINT `fk_assessment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_assessment_owned_product` FOREIGN KEY (`owned_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_assessment_replacement_product` FOREIGN KEY (`replacement_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `chk_assessment_repair_cost` CHECK (((`estimated_repair_cost` is null) or (`estimated_repair_cost` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_or_replace_assessment`
--

LOCK TABLES `repair_or_replace_assessment` WRITE;
/*!40000 ALTER TABLE `repair_or_replace_assessment` DISABLE KEYS */;
INSERT INTO `repair_or_replace_assessment` VALUES (1,1,1,NULL,'Minor performance issue','Active',3000.00,'Repair','2026-11-22'),(2,2,3,NULL,'Battery problem','Expired',12000.00,'Replace','2026-11-22'),(3,3,5,NULL,'Screen damage','Expired',8000.00,'Repair','2026-11-22'),(4,4,7,NULL,'Display problem','Active',5000.00,'Repair','2026-11-22'),(5,5,9,NULL,'Major hardware failure','Expired',25000.00,'Replace','2026-11-22');
/*!40000 ALTER TABLE `repair_or_replace_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_activity_profile`
--

DROP TABLE IF EXISTS `usage_activity_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_activity_profile` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(100) NOT NULL,
  `min_ram_gb` int DEFAULT NULL,
  `rec_ram_gb` int DEFAULT NULL,
  `min_storage_gb` int DEFAULT NULL,
  `min_battery_hours` decimal(5,2) DEFAULT NULL,
  `min_processor_tier` int DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  CONSTRAINT `chk_profile_battery` CHECK (((`min_battery_hours` is null) or (`min_battery_hours` >= 0))),
  CONSTRAINT `chk_profile_ram` CHECK ((((`min_ram_gb` is null) or (`min_ram_gb` >= 0)) and ((`rec_ram_gb` is null) or (`rec_ram_gb` >= 0)))),
  CONSTRAINT `chk_profile_storage` CHECK (((`min_storage_gb` is null) or (`min_storage_gb` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_activity_profile`
--

LOCK TABLES `usage_activity_profile` WRITE;
/*!40000 ALTER TABLE `usage_activity_profile` DISABLE KEYS */;
INSERT INTO `usage_activity_profile` VALUES (1,'Programming',8,16,256,5.00,3),(2,'Gaming',16,32,512,4.00,4),(3,'Video Editing',16,32,512,5.00,4),(4,'Online Classes',4,8,128,4.00,2),(5,'Office Work',8,16,256,5.00,2);
/*!40000 ALTER TABLE `usage_activity_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce_db'
--

--
-- Dumping routines for database 'ecommerce_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_customer_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer_orders`(IN cust_id INT)
BEGIN
    SELECT
        order_id,
        order_date,
        total_amount,
        order_status
    FROM orders
    WHERE customer_id = cust_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_product_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_product_details`(IN prod_id INT)
BEGIN
    SELECT
        p.product_id,
        p.product_name,
        c.category_name,
        p.price
    FROM product p
    INNER JOIN category c
    ON p.category_id = c.category_id
    WHERE p.product_id = prod_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_order_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_view` AS select `c`.`customer_id` AS `customer_id`,`c`.`customer_name` AS `customer_name`,`o`.`order_id` AS `order_id`,`o`.`order_date` AS `order_date`,`o`.`total_amount` AS `total_amount`,`o`.`order_status` AS `order_status` from (`customer` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_details_view`
--

/*!50001 DROP VIEW IF EXISTS `product_details_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_details_view` AS select `p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`category_name` AS `category_name`,`p`.`price` AS `price`,`i`.`available_quantity` AS `available_quantity` from ((`product` `p` join `category` `c` on((`p`.`category_id` = `c`.`category_id`))) join `inventory` `i` on((`p`.`product_id` = `i`.`product_id`))) */;
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

-- Dump completed on 2026-11-23 21:22:48
