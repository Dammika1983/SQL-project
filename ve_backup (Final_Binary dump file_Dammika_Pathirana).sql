-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: vaseage
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_ID` int NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `customer_phone` varchar(45) NOT NULL,
  `Employee_sales_associate_id` int NOT NULL,
  PRIMARY KEY (`customer_ID`,`Employee_sales_associate_id`),
  KEY `fk_customer_Employee1_idx` (`Employee_sales_associate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1001,'Julio Leighton','479-464-1914',2001),(1002,'Briggs Suller','281-229-9554',2002),(1003,'Brockie O Dee','677-502-3782',2003),(1004,'Ellene Grayshan','424-844-4728',2001),(1005,'Selena Weson','739-114-1478',2004),(1006,'Estelle Yakolev','751-333-2307',2002),(1007,'Curran Blindt','500-981-8448',2002),(1008,'Currie Padula','143-214-3081',2001),(1009,'Dammika Pathirana','613-123-4567',2002);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `sales_associate_id` int NOT NULL,
  `sales_associate_name` varchar(45) NOT NULL,
  PRIMARY KEY (`sales_associate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (2001,'Asher Chantler'),(2002,'Antonietta Restill'),(2003,'Ed Wildblood'),(2004,'Claudius Seabert'),(2005,'Peter Sam');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `order_date` date NOT NULL,
  `number_of_item` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `sub_total_of_order` varchar(45) NOT NULL,
  `customer_customer_ID` int NOT NULL,
  `Employee_sales_associate_id` int NOT NULL,
  PRIMARY KEY (`order_id`,`customer_customer_ID`,`Employee_sales_associate_id`),
  KEY `fk_order_customer_idx` (`customer_customer_ID`),
  KEY `fk_order_Employee1_idx` (`Employee_sales_associate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (3001,'2021-12-14','4','$1.94','$7.76',1001,2001),(3002,'2021-01-28','4','$3.52','$14.08',1002,2002),(3003,'2021-03-15','5','$11.65','$58.25',1003,2003),(3004,'2022-11-12','10','$1.01','$10.10',1004,2001),(3005,'2021-08-14','10','$1.62','$16.20',1005,2004),(3006,'2022-09-06','2','$19.16','$38.32',1004,2003),(3007,'2021-09-24','7','$16.33','$114.31',1006,2002),(3008,'2022-01-18','6','$4.19','$25.14',1007,2002),(3009,'2021-08-02','5','$8.31','$41.55',1003,2003),(3010,'2021-02-04','8','$12.00','$96.00',1008,2001),(3011,'2022-09-20','4','$1.94','$7.76',1009,2002);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vas`
--

DROP TABLE IF EXISTS `vas`;
/*!50001 DROP VIEW IF EXISTS `vas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vas` AS SELECT 
 1 AS `customer_name`,
 1 AS `customer_phone`,
 1 AS `sales_associate_name`,
 1 AS `order_date`,
 1 AS `number_of_item`,
 1 AS `price`,
 1 AS `sub_total_of_order`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vas`
--

/*!50001 DROP VIEW IF EXISTS `vas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vas` AS select `customer`.`customer_name` AS `customer_name`,`customer`.`customer_phone` AS `customer_phone`,`employee`.`sales_associate_name` AS `sales_associate_name`,`order`.`order_date` AS `order_date`,`order`.`number_of_item` AS `number_of_item`,`order`.`price` AS `price`,`order`.`sub_total_of_order` AS `sub_total_of_order` from ((`customer` join `order` on((`customer`.`customer_ID` = `order`.`customer_customer_ID`))) join `employee` on((`employee`.`sales_associate_id` = `order`.`Employee_sales_associate_id`))) */;
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

-- Dump completed on 2023-04-10 19:56:33
