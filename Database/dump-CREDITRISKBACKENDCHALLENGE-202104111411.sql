-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: CREDITRISKBACKENDCHALLENGE
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `assetsId` int NOT NULL AUTO_INCREMENT,
  `bankId` int DEFAULT NULL,
  `assets` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`assetsId`),
  UNIQUE KEY `assetsId` (`assetsId`),
  KEY `assets_FK` (`bankId`),
  CONSTRAINT `assets_FK` FOREIGN KEY (`bankId`) REFERENCES `banks` (`bankId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,1,1234000),(2,2,5657345),(3,7,2999002),(4,4,4346823),(5,5,15342679);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetSettings`
--

DROP TABLE IF EXISTS `assetSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetSettings` (
  `baseLimit` decimal(10,0) DEFAULT NULL,
  `minAssetsForIncrease` decimal(10,0) DEFAULT NULL,
  `assetIncreaseMultiplier` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetSettings`
--

LOCK TABLES `assetSettings` WRITE;
/*!40000 ALTER TABLE `assetSettings` DISABLE KEYS */;
INSERT INTO `assetSettings` VALUES (2000000,3000000,1);
/*!40000 ALTER TABLE `assetSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `bankId` int NOT NULL AUTO_INCREMENT,
  `bankName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approved` bit(1) NOT NULL DEFAULT b'0',
  UNIQUE KEY `bankId` (`bankId`),
  UNIQUE KEY `bankId_2` (`bankId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'Bank of America',_binary ''),(2,'Wells Fargo',_binary ''),(3,'JP Morgan',_binary '\0'),(4,'Royal Bank of Canada',_binary ''),(5,'Bank of Montreal',_binary ''),(6,'Citibank',_binary ''),(7,'Bank of Nova Scotia',_binary '\0'),(8,'Goldman Sachs',_binary '\0');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calcLimit`
--

DROP TABLE IF EXISTS `calcLimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calcLimit` (
  `calcLimitId` int NOT NULL AUTO_INCREMENT,
  `bankId` int DEFAULT NULL,
  `ratingsId` int DEFAULT NULL,
  `assetsId` int DEFAULT NULL,
  `calculatedLimit` decimal(10,0) DEFAULT NULL,
  `lastUpdateDateTime` date DEFAULT NULL,
  PRIMARY KEY (`calcLimitId`),
  UNIQUE KEY `calcLimitId` (`calcLimitId`),
  UNIQUE KEY `calcLimitId_2` (`calcLimitId`),
  KEY `calcLimit_FK` (`bankId`),
  KEY `calcLimit_FK_ratingsId` (`ratingsId`),
  KEY `calcLimit_FK_assetsId` (`assetsId`),
  CONSTRAINT `calcLimit_FK` FOREIGN KEY (`bankId`) REFERENCES `banks` (`bankId`),
  CONSTRAINT `calcLimit_FK_assetsId` FOREIGN KEY (`assetsId`) REFERENCES `assets` (`assetsId`),
  CONSTRAINT `calcLimit_FK_ratingsId` FOREIGN KEY (`ratingsId`) REFERENCES `ratings` (`ratingsId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calcLimit`
--

LOCK TABLES `calcLimit` WRITE;
/*!40000 ALTER TABLE `calcLimit` DISABLE KEYS */;
INSERT INTO `calcLimit` VALUES (1,1,1,1,2260000,'2021-04-10'),(2,2,2,2,1760000,'2021-04-10'),(3,4,4,4,1820000,'2021-04-10'),(4,5,5,5,2100000,'2021-04-10'),(15,1,1,1,2260000,'2021-04-11'),(16,2,2,2,1760000,'2021-04-11'),(17,4,4,4,1820000,'2021-04-11'),(18,5,5,5,2100000,'2021-04-11');
/*!40000 ALTER TABLE `calcLimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `ratingsId` int NOT NULL AUTO_INCREMENT,
  `bankId` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`ratingsId`),
  UNIQUE KEY `ratingsId` (`ratingsId`),
  KEY `ratings_FK` (`bankId`),
  CONSTRAINT `ratings_FK` FOREIGN KEY (`bankId`) REFERENCES `banks` (`bankId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,7),(2,2,-4),(3,7,2),(4,4,-1),(5,5,1);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskLimit`
--

DROP TABLE IF EXISTS `riskLimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riskLimit` (
  `riskLimitId` int NOT NULL AUTO_INCREMENT,
  `minRisk` int DEFAULT NULL,
  `maxRisk` int DEFAULT NULL,
  `effectMultiplier` float DEFAULT NULL,
  PRIMARY KEY (`riskLimitId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskLimit`
--

LOCK TABLES `riskLimit` WRITE;
/*!40000 ALTER TABLE `riskLimit` DISABLE KEYS */;
INSERT INTO `riskLimit` VALUES (1,-5,-3,0.88),(2,-2,0,0.91),(3,1,3,1.05),(4,4,6,1.08),(5,7,10,1.13);
/*!40000 ALTER TABLE `riskLimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'CREDITRISKBACKENDCHALLENGE'
--
/*!50003 DROP PROCEDURE IF EXISTS `calculateLimit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculateLimit`()
BEGIN
	insert into calcLimit (bankId, assetsId, ratingsId, calculatedLimit, lastUpdateDateTime)
	select 
		b.bankId,
		a.assetsId,
		r.ratingsId,
		aSet.baseLimit * 
			(case 
				when a.assets >= aSet.minAssetsForIncrease then aSet.assetIncreaseMultiplier
				else 1 end) *
				rl.effectMultiplier,
		CURDATE() 
	from banks b 
	inner join assets a on b.bankId = a.bankId 
	inner join ratings r on b.bankId =r.bankId
	left join calcLimit cl on b.bankId = cl.bankId and cl.lastUpdateDateTime = CURDATE()
	left join riskLimit rl on rl.minRisk <= r.rating  and rl.maxRisk >= r.rating 
	left join assetSettings aSet on 1 = 1
	where b.approved = 1 and cl.calcLimitId is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCalculatedLimit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCalculatedLimit`()
BEGIN
	call calculateLimit();
	
	select  
		b.bankName,
		r.rating, 
		a.assets,
		cl.calculatedLimit,
		DATE_FORMAT(cl.lastUpdateDateTime, '%d/%m/%Y') as LastUpdatedDateTime
	from calcLimit cl
	join banks b on cl.bankId = b.bankId 
	join assets a on cl.assetsId = a.assetsId 
	join ratings r on cl.ratingsId = r.ratingsId 
	where cl.calculatedLimit is not null and cl.lastUpdateDateTime = CURDATE(); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 14:11:31
