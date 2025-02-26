-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: bestioles
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `animal`
--
DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `color` VARCHAR(50) DEFAULT NULL,
 `name` VARCHAR(50) NOT NULL,
 `sex` VARCHAR(255) NOT NULL,
 `species_id` INT NOT NULL, PRIMARY KEY (`id`), KEY `FK8ht4up5vd7qxcx9okgsdj4538` (`species_id`), CONSTRAINT `FK8ht4up5vd7qxcx9okgsdj4538` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--
LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'Gris tacheté','Max','M',1),(2,'Blanc','Médor','M',2),(3,'Noir','Loulou','F',1),(4,'Brun','Zia','F',2),(5,'Blanc','Lou','F',3),(6,'Roux','Minouchette','M',1);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */; UNLOCK TABLES;

--
-- Table structure for table `person`
--
DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `age` INT DEFAULT NULL,
 `firstname` VARCHAR(50) NOT NULL,
 `lastname` VARCHAR(50) NOT NULL,
 `login` VARCHAR(50) NOT NULL UNIQUE, 
 `mdp` VARCHAR(100) NOT NULL, PRIMARY KEY (`id`),
 `active` TINYINT(4) NOT NULL DEFAULT 1,
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--
LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,22,'Henri','Lamarque', 'hla', '*****', 1),(2,24,'Sylvie','Lamarque', 'sla', '*****', 1),(3,55,'Jean','Vintroi', 'jvi', '*****', 1),(4,80,'Paul','Demaine', 'pde', '*****', 1),(5,45,'Sophie','Nero', 'sne', '*****', 1),(6,17,'Pierre','Sansane', 'sva', '*****', 1),(7,33,'John','Mangolo', 'jma', '*****', 1),(8,26,'Bill','Wagner', 'bwa', '*****', 1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */; UNLOCK TABLES;

--
-- Table structure for table `person_animals`
--
DROP TABLE IF EXISTS `person_animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_animals` (
 `person_id` INT NOT NULL,
 `animals_id` INT NOT NULL, PRIMARY KEY (`person_id`,`animals_id`), KEY `FKpt8c3kig54emvkm6a1gcq1ury` (`animals_id`), CONSTRAINT `FKpt8c3kig54emvkm6a1gcq1ury` FOREIGN KEY (`animals_id`) REFERENCES `animal` (`id`), CONSTRAINT `FKq2c74s7eeeoy8tq0sqsjmvbmw` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_animals`
--
LOCK TABLES `person_animals` WRITE;
/*!40000 ALTER TABLE `person_animals` DISABLE KEYS */;
INSERT INTO `person_animals` VALUES (2,1),(7,1),(4,2),(3,3),(5,4),(2,5),(8,6);
/*!40000 ALTER TABLE `person_animals` ENABLE KEYS */; UNLOCK TABLES;

--
-- Table structure for table `species`
--
DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `common_name` VARCHAR(50) NOT NULL,
 `latin_name` VARCHAR(200) NOT NULL, PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--
LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES (1,'Chat','Felis silvestris catus'),(2,'Chien','Canis lupus familiaris'),(3,'Lapin','Oryctolagus cuniculus');
/*!40000 ALTER TABLE `species` ENABLE KEYS */; UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-14 11:21:49
CREATE TABLE `role` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`label` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci', PRIMARY KEY (`id`) USING BTREE
) COLLATE='utf8mb4_general_ci' ENGINE=InnoDB;
CREATE TABLE `person_role` (
	`person_id` INT(11) NOT NULL,
	`role_id` INT(10) UNSIGNED NOT NULL, PRIMARY KEY (`person_id`, `role_id`) USING BTREE, INDEX `FKpt8c3kig54emvkm6a1gcq1ury` (`role_id`) USING BTREE, CONSTRAINT `FK_Person_Role_Person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON
UPDATE RESTRICT ON
DELETE RESTRICT, CONSTRAINT `FK_Person_Role_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON
UPDATE RESTRICT ON
DELETE RESTRICT
) COLLATE='utf8mb4_general_ci' ENGINE=InnoDB;
INSERT INTO `role` (`id`, `label`) VALUES (1, 'ROLE_EMPLOYE');
INSERT INTO `role` (`id`, `label`) VALUES (2, 'ROLE_USER');
INSERT INTO `role` (`id`, `label`) VALUES (3, 'ROLE_ADMIN');
