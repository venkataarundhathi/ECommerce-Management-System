-- Table structure for table `address`

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

-- Table structure for table `cart`

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

-- Table structure for table `cart_items`

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

-- Table structure for table `category`

CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table `customer`

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

-- Table structure for table `customer_review`

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

-- Table structure for table `delivery`

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


-- Table structure for table `inventory`

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


-- Table structure for table `order_items`

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

-- Table structure for table `orders`

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


-- Table structure for table `payment`

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

-- Table structure for table `product`

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table `product_specification`

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

-- Table structure for table `product_suitability_check`

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


-- Table structure for table `product_warranty`

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


-- Table structure for table `promotion`

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

-- Table structure for table `repair_or_replace_assessment`

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


-- Table structure for table `usage_activity_profile`

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



