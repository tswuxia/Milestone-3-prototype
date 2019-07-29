-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: orbital
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
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
  `exchange` varchar(200) DEFAULT NULL,
  `seen` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (NULL,32,'Secondary Math Notes','Sec',1,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque id erat mi. Phasellus imperdiet ante lacus, in vehicula metus tempor sed. Nunc cursus, lorem fermentum vehicula condimentum, orci diam aliquam diam, in laoreet sapien ante id tortor. Nullam feugiat sed eros ac suscipit. Suspendisse potenti. Suspendisse eu magna quis erat elementum volutpat eget non nulla. Duis at nunc lacus. \r\nMorbi nec libero eleifend, ullamcorper nisl id, tristique sem. Suspendisse auctor, elit eu ultricies semper, lectus est tempus nulla, sed porta purus leo a nulla. Vestibulum lacus enim, blandit eget magna id, tincidunt ornare lacus. Duis sit amet est eget odio consequat interdum. Pellentesque tristique consequat purus. Sed et suscipit ex, et dignissim sem.',NULL,'3c97b8ee-848c-409a-83b5-ca134b1fa867.png','Secondary Physics Notes',NULL),(NULL,33,'GP notes All Topics','jc',1,15,'Mauris rhoncus velit quis purus sagittis, quis interdum turpis accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla pretium consectetur eros. Phasellus eleifend diam enim, vitae varius nisi accumsan a. \r\nVivamus viverra felis nec ante placerat, in vestibulum est vehicula. Praesent bibendum magna eu mi semper vehicula. Proin faucibus dolor ex, quis sodales massa condimentum a. Sed suscipit neque sit amet arcu volutpat mattis. Sed in orci ornare, vulputate ex convallis, vestibulum nibh. In a neque sit amet sem ornare semper. Ut non ultrices purus. Nullam rhoncus augue id molestie congue. Donec nec porttitor orci, sed dignissim elit.',NULL,'5f68d250-3fd9-4a99-b383-c18e8438170c.jpg',NULL,NULL),(13,34,'Cheat Sheet Physics','uni',3,NULL,'Maecenas nulla ligula, placerat sed tortor ac, pulvinar tristique erat. Nunc rutrum mauris id ipsum dictum placerat. Curabitur eleifend arcu quis eros suscipit ullamcorper. Nullam dolor sem, semper sit amet ornare ut, feugiat tempus purus. Proin lacinia tellus ac mauris feugiat, vel imperdiet libero sagittis. Suspendisse potenti. Sed tristique tempus arcu sit amet vehicula. Cras blandit interdum placerat. Sed vestibulum tristique mi, ut mollis nulla rutrum non. Maecenas tincidunt ex vitae sapien congue, sit amet pellentesque tortor tincidunt.',NULL,'4de980bb-8728-4cd8-877c-f1aa97d9d9ec.png','Japanese language notes',1),(NULL,35,'Past Year Prelims all JCs Maths','jc',3,25,'Aliquam eget dolor massa. Sed erat justo, semper ac auctor a, vehicula ut dui. Fusce lacinia risus neque, in convallis dui lobortis eu. Vivamus euismod ante eu tempus vehicula. Morbi diam ante, rutrum eget odio sed, finibus interdum mauris. Sed nec bibendum diam. Pellentesque vel euismod neque, eget fermentum neque. Proin mi dolor, egestas pretium elementum at, fermentum et ex. Suspendisse et massa eget ligula iaculis sollicitudin. Duis pretium volutpat nisi, nec pellentesque est pharetra at. Donec fringilla dignissim eros id sodales. Nunc aliquet sit amet diam hendrerit pulvinar.',NULL,'76fd56ef-1bd6-4473-855e-bb102961d4ec.png',NULL,NULL),(15,36,'NUS MA1101R Cheat Sheet','uni',5,3,'Sed feugiat urna quis laoreet cursus. Quisque id nisl vehicula, gravida libero quis, tristique est. Sed pulvinar eros vel libero imperdiet fringilla. Mauris suscipit efficitur aliquet. Vestibulum lectus sem, mattis non fermentum quis, lobortis at elit. Proin non eros vel nulla elementum elementum ut ut nulla. Cras tristique eget felis ut blandit. Duis eget dapibus neque. Ut sit amet placerat neque. Quisque lacus est, tristique eu est eu, tristique aliquam turpis. Nunc efficitur diam velit, et posuere velit euismod quis.',NULL,'72e40aca-c393-4374-882b-83afc80de687.png','NUS MA1521 Cheat Sheet',0),(14,37,'NUS CS1231 Cheat Sheet','uni',5,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque id erat mi. Phasellus imperdiet ante lacus, in vehicula metus tempor sed. Nunc cursus, lorem fermentum vehicula condimentum, orci diam aliquam diam, in laoreet sapien ante id tortor. Nullam feugiat sed eros ac suscipit. Suspendisse potenti. Suspendisse eu magna quis erat elementum volutpat eget non nulla. Duis at nunc lacus. Morbi nec libero eleifend, ullamcorper nisl id, tristique sem. Suspendisse auctor, elit eu ultricies semper, lectus est tempus nulla, sed porta purus leo a nulla. ',NULL,'2da00bb8-def4-4e5f-9555-06ade73e8323.jpg','NUS ST2334 Cheat Sheet',0),(17,38,'Exclusive Chemistry Test Papers','Sec',6,19,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque id erat mi. Phasellus imperdiet ante lacus, in vehicula metus tempor sed. Nunc cursus, lorem fermentum vehicula condimentum, orci diam aliquam diam, in laoreet sapien ante id tortor. Nullam feugiat sed eros ac suscipit. Suspendisse potenti. Suspendisse eu magna quis erat elementum volutpat eget non nulla. Duis at nunc lacus. Morbi nec libero eleifend, ullamcorper nisl id, tristique sem. Suspendisse auctor, elit eu ultricies semper, lectus est tempus nulla, sed porta purus leo a nulla. ',NULL,'22dbfe84-4bf5-4333-bc28-cc7448ca8c3d.png',NULL,1),(NULL,39,'Hand Made Economics Notes All Topics','jc',6,15,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque id erat mi. Phasellus imperdiet ante lacus, in vehicula metus tempor sed. Nunc cursus, lorem fermentum vehicula condimentum, orci diam aliquam diam, in laoreet sapien ante id tortor. Nullam feugiat sed eros ac suscipit. Suspendisse potenti. Suspendisse eu magna quis erat elementum volutpat eget non nulla. Duis at nunc lacus. Morbi nec libero eleifend, ullamcorper nisl id, tristique sem. Suspendisse auctor, elit eu ultricies semper, lectus est tempus nulla, sed porta purus leo a nulla. \r\nMauris rhoncus velit quis purus sagittis, quis interdum turpis accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla pretium consectetur eros. ',NULL,'7e851731-bf34-4f09-b559-cad204f1547d.jpg',NULL,NULL),(NULL,45,'PSLE Chinese revision package','psle',1,10,'A good revision material which helps the students to practice reading and writing skill.',NULL,'257acc71-c86e-482a-b78e-c7289057958a.png',NULL,NULL),(NULL,46,'SAT II physics past year paper','other',1,10,'SAT II physics past year papers with detailed answer sheet. Brand new with some scratches. ',NULL,'9b5ebd37-5ab3-473e-a16a-2d00c6718f81.jpg','IELTS reference book',NULL),(NULL,47,'Chemistry formula book','jc',1,7,'Bought at S$13. With some notes on it.',NULL,'d25fb26c-e0ef-4c80-9cdf-7bcfb4e37549.jpg',NULL,NULL),(NULL,48,'PSLE science practice book','psle',1,5,'Very useful practice book. My child used to love it a lot. There are some drawings on the front page but the content is not affected',NULL,'a1e6e315-767b-48f0-a000-dac9fe0ecb95.jpg',NULL,NULL),(NULL,49,'A handmade math revision book','psle',3,NULL,'A high-quality handmade primary school revision book that contains a lot of examples. Please exchange with any English revision material.',NULL,'9ced6f30-8ac7-45cf-b20a-7d768bdde64b.png','any English revision material',NULL),(NULL,50,'Mathematics Olympiad practice book','other',3,8,'Practice book with detailed explanation. This book used to belong to a golden prize winner.',NULL,'0860625a-3e45-4047-bdf6-3f086907ce57.png',NULL,NULL),(NULL,51,'IELTS English paper','other',3,NULL,'Got an 8 for IELTS with the help of this book. Decide to taking an SAT exam as well so pls exchange with your SAT revision book',NULL,'16e8c9c1-57e0-4629-bfd1-88d9ec56d0e4.jpg','SAT revision material',NULL),(NULL,52,'NTU mathematics cheatsheet','uni',5,NULL,'Got an A+ for this mod',NULL,'ca3c6d0f-6cfc-4214-b468-8f51d8a7e3de.jpg','Cheatsheet for NTU CS core module',NULL),(NULL,53,'PSLE English cheatsheet','psle',6,15,'',NULL,'3097723f-32de-4037-9436-8f85bc09eaf4.jpg',NULL,NULL),(NULL,54,'SEC Chinese Revision Book','psle',6,NULL,'',NULL,'94dec826-8c11-45e5-a788-9fec8c4acca0.png','sec school gp revision material',NULL),(NULL,55,'Secondary Malay revision package','sec',6,NULL,'',NULL,'b85b59c9-e2cd-44c8-bb67-ed7e89a817d3.png','Secondary physics book',NULL),(NULL,56,'IB Math','ib',17,12,'doumeishakeshi',NULL,'ee2f986c-f9d6-447c-bc9a-88632ffbcaf5.jpg',NULL,NULL),(NULL,57,'IB Chemistry','uni',17,15,'',NULL,'f04f2104-05ef-44b6-aab4-8a7bb177c24f.jpg',NULL,NULL),(NULL,58,'IB English','ib',17,8,'',NULL,'0284a4e1-64a1-4f95-8bde-f3cd18a84b3a.png',NULL,NULL),(NULL,59,'IB physics book','uni',17,12,'',NULL,'6d407a24-4a13-47d0-8db5-2912d8498281.jpg',NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile` (
  `userID` int(11) DEFAULT NULL,
  `profilePic` varchar(50) DEFAULT NULL,
  `profileNum` int(11) DEFAULT NULL,
  `profileCat` varchar(20) DEFAULT NULL,
  `tagOne` varchar(20) DEFAULT NULL,
  `tagTwo` varchar(20) DEFAULT NULL,
  `tagThree` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'988892aa-1ac0-4a86-8b1b-c7873481040a.jpg',90895890,'uni','science','math','nus'),(3,'5277b0bc-2e5a-42a8-8427-785046342630.jpg',88888888,'uni','science','math','nus'),(5,'ae292be5-aba4-4178-8932-8d8ee04bd5fa.jpg',11111111,'uni','physics','chemistry','nus'),(6,'07bb89b0-5a10-4065-9d17-f089071d8425.jpg',NULL,'jc','science','english','physics'),(13,'a322495e-6322-47b8-9c96-fa21bfa3889f.jpg',55555555,'uni','math','physics','nus'),(14,'7282e869-b15b-46a0-ada3-d2b34c3b7915.jpg',11111111,'uni','science','physics','nus'),(15,'355d9d4b-1e8e-497f-9f77-188fd746e1a2.jpg',11111111,'uni','science','physics','nus'),(16,'65e98cf5-391a-4b0c-b393-0c798219334e.jpg',11111111,'uni','science','physics','nus'),(17,'564b1b07-d657-4ef1-8d77-f0e338e3d215.jpg',11111111,'uni','science','physics','nus');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('l3Ae9wlQ3eRKJoMmAgQGSrwaMQ5wlK3C',1564327469,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":{\"userID\":17,\"userName\":\"newUser\",\"userEmail\":\"newuser@gmail.com\",\"userPassword\":\"111111\"}}}');
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
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Li Jiayu','lijiayu0017@gmail.com','1234qwer?!'),(3,'001','tswuxia@gmail.com','001'),(5,'002','lijiayu0017@gmail.com','002'),(6,'test','test@163.com','12345678'),(17,'newUser','newuser@gmail.com','111111');
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

-- Dump completed on 2019-07-27 23:26:24
