-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: orbital
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `userID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(6) DEFAULT NULL,
  `picPath` varchar(50) DEFAULT NULL,
  `productName` varchar(150) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (3,19,7,'plse','ee5d82e8-affe-434a-b868-5948dacc32aa.jpg','testrun\'s book',44),(3,18,8,'plse','12dfc152-f208-45db-b232-be9889c02dce.jpg','test\'s book',33);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `buyerID` int(11) DEFAULT NULL,
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(150) DEFAULT NULL,
  `category` varchar(6) DEFAULT NULL,
  `sellerID` int(11) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `description` text,
  `payment` varchar(10) DEFAULT NULL,
  `picPath` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (NULL,13,'jiayu\'s book','plse',1,33,'ffffffffffffffff',NULL,'a21520c6-3bce-41e0-a257-6e6324ab55da.png'),(NULL,14,'jiayu\'s another book','plse',1,10,'ddddddddddddddddddddddddddddddddd',NULL,'6a35a264-a96a-4d5f-b761-9fbd8e5b1be8.jpg'),(NULL,15,'001\'s book','plse',3,5.5,'ddddddddddddddddddddddddddddddd',NULL,'32fb50ea-ab2d-4887-a9c9-b27a45e88c83.jpg'),(NULL,16,'002\'s book','Sec',5,5.5,'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',NULL,'5bcaea53-282f-450f-8c92-8a2caab9d149.jpg'),(NULL,17,'002\'s another book','plse',5,4,'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',NULL,'88c4c673-9100-48ee-bf17-f1ccc68b1c5b.jpg'),(NULL,18,'test\'s book','plse',6,33,'ffffffffffffffffffffffffffffffffff',NULL,'12dfc152-f208-45db-b232-be9889c02dce.jpg'),(NULL,19,'testrun\'s book','plse',8,44,'ddddddddddddddddddddddddddddddddddddddddddd',NULL,'ee5d82e8-affe-434a-b868-5948dacc32aa.jpg'),(NULL,20,'some book','plse',3,10,'dfdfdfdfdfdfd',NULL,'339934a5-8469-41d1-a3b3-9557b67b6777.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('OoKOY2SoJkN_rLq1OWVqNARBIBMg_Iy9',1563616612,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"userID\":3,\"userName\":\"001\",\"userEmail\":\"lijiayu0017@gmail.com\",\"userPassword\":\"001\",\"phoneNum\":33333333}}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `userEmail` varchar(40) NOT NULL,
  `userPassword` varchar(32) NOT NULL,
  `phoneNum` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Li Jiayu','lijiayu0017@gmail.com','1234qwer?!',11111111),(3,'001','lijiayu0017@gmail.com','001',33333333),(5,'002','lijiayu0017@gmail.com','002',55555555),(6,'test','test@163.com','12345678',66666666),(8,'testrun','test01@163.com','test',88888888),(9,'newbie','newbie@gmail.com','newbie',99999999),(10,'yo','yo@gmail.com','yo',33333333);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-19 22:27:44
