-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ads_news`
--

DROP TABLE IF EXISTS `ads_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads_news` (
  `id` varchar(0) DEFAULT NULL,
  `title` varchar(0) DEFAULT NULL,
  `img` varchar(0) DEFAULT NULL,
  `detail` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_news`
--

LOCK TABLES `ads_news` WRITE;
/*!40000 ALTER TABLE `ads_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'المدربين');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` tinyint(4) DEFAULT NULL,
  `group_id` tinyint(4) DEFAULT NULL,
  `permission_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,25),(2,1,29),(3,1,36);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` tinyint(4) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `codename` varchar(21) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry'),(2,1,'change_logentry','Can change log entry'),(3,1,'delete_logentry','Can delete log entry'),(4,1,'view_logentry','Can view log entry'),(5,2,'add_permission','Can add permission'),(6,2,'change_permission','Can change permission'),(7,2,'delete_permission','Can delete permission'),(8,2,'view_permission','Can view permission'),(9,3,'add_group','Can add group'),(10,3,'change_group','Can change group'),(11,3,'delete_group','Can delete group'),(12,3,'view_group','Can view group'),(13,4,'add_user','Can add user'),(14,4,'change_user','Can change user'),(15,4,'delete_user','Can delete user'),(16,4,'view_user','Can view user'),(17,5,'add_contenttype','Can add content type'),(18,5,'change_contenttype','Can change content type'),(19,5,'delete_contenttype','Can delete content type'),(20,5,'view_contenttype','Can view content type'),(21,6,'add_session','Can add session'),(22,6,'change_session','Can change session'),(23,6,'delete_session','Can delete session'),(24,6,'view_session','Can view session'),(25,7,'add_catgory','Can add الفرع'),(26,7,'change_catgory','Can change الفرع'),(27,7,'delete_catgory','Can delete الفرع'),(28,7,'view_catgory','Can view الفرع'),(29,8,'add_lessons','Can add الدرس'),(30,8,'change_lessons','Can change الدرس'),(31,8,'delete_lessons','Can delete الدرس'),(32,8,'view_lessons','Can view الدرس'),(33,9,'add_student','Can add الطالب'),(34,9,'change_student','Can change الطالب'),(35,9,'delete_student','Can delete الطالب'),(36,9,'view_student','Can view الطالب'),(37,10,'add_exam','Can add امتحان'),(38,10,'change_exam','Can change امتحان'),(39,10,'delete_exam','Can delete امتحان'),(40,10,'view_exam','Can view امتحان'),(41,11,'add_task','Can add الأسئله'),(42,11,'change_task','Can change الأسئله'),(43,11,'delete_task','Can delete الأسئله'),(44,11,'view_task','Can view الأسئله'),(45,12,'add_examreport','Can add تقرير الامتحان'),(46,12,'change_examreport','Can change تقرير الامتحان'),(47,12,'delete_examreport','Can delete تقرير الامتحان'),(48,12,'view_examreport','Can view تقرير الامتحان'),(49,13,'add_homeworkreport','Can add تفرير الواجب'),(50,13,'change_homeworkreport','Can change تفرير الواجب'),(51,13,'delete_homeworkreport','Can delete تفرير الواجب'),(52,13,'view_homeworkreport','Can view تفرير الواجب'),(53,14,'add_report','Can add التفرير'),(54,14,'change_report','Can change التفرير'),(55,14,'delete_report','Can delete التفرير'),(56,14,'view_report','Can view التفرير'),(57,15,'add_adds','Can add adds'),(58,15,'change_adds','Can change adds'),(59,15,'delete_adds','Can delete adds'),(60,15,'view_adds','Can view adds'),(61,15,'add_ads','Can add ads'),(62,15,'change_ads','Can change ads'),(63,15,'delete_ads','Can delete ads'),(64,15,'view_ads','Can view ads'),(65,15,'add_news','Can add news'),(66,15,'change_news','Can change news'),(67,15,'delete_news','Can delete news'),(68,15,'view_news','Can view news'),(69,16,'add_news','Can add إعلان'),(70,16,'change_news','Can change إعلان'),(71,16,'delete_news','Can delete إعلان'),(72,16,'view_news','Can view إعلان'),(73,17,'add_live','Can add live'),(74,17,'change_live','Can change live'),(75,17,'delete_live','Can delete live'),(76,17,'view_live','Can view live'),(77,18,'add_coach','Can add المدرب'),(78,18,'change_coach','Can change المدرب'),(79,18,'delete_coach','Can delete المدرب'),(80,18,'view_coach','Can view المدرب');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` tinyint(4) DEFAULT NULL,
  `password` varchar(88) DEFAULT NULL,
  `last_login` varchar(10) DEFAULT NULL,
  `is_superuser` tinyint(4) DEFAULT NULL,
  `username` varchar(11) DEFAULT NULL,
  `last_name` varchar(0) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `is_staff` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `date_joined` varchar(10) DEFAULT NULL,
  `first_name` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$600000$LbGKruKDobrEZMtEzp3SLv$TFkProU+qvO6Ycfd/+28WQ+Sv65+ICVQp79PDjRX+yw=','2024-08-06',1,'saskeadmin','','saskecompany1@gmail.com',1,1,'2023-08-15',''),(14,'pbkdf2_sha256$600000$N94auoGBbjKr6d4N7wYqCn$XefNHKG1zIbFF4QWX+8dddb32A0KsYSmP9WykfiCTBs=','2024-08-07',0,'sultanpasha','','sultanelsultan4@gmail.com',0,1,'2023-08-24',''),(16,'pbkdf2_sha256$600000$S4EVaz09FhVZ0mYNKmsfmh$up0D/5pQKHPotmrBKXZJvHJs+/x0CG8oMUSbdtVxqAg=','2024-08-02',1,'admin','','test1@gmail.com',1,1,'2023-09-14',''),(17,'pbkdf2_sha256$600000$OcpgaK5nXAB7RgUJJMoqC6$+cLwNPt0lsLSA3ivlcghKRw136IZm1J8nkBRYeapTg0=','2024-08-03',0,'ahmed','','',1,1,'',''),(28,'pbkdf2_sha256$600000$cRMoWsDrw0TnFN4b4IAnCt$O9sLm6fI3K/GBiMIKKFP8MilGOyUbW6SDPFSmOBaL1U=','2024-08-04',0,'hassen','','hassen@gmail.com',0,1,'2024-08-04','');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `group_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,17,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `permission_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,17,36);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches_coach`
--

DROP TABLE IF EXISTS `coaches_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coaches_coach` (
  `id` tinyint(4) DEFAULT NULL,
  `CName` varchar(7) DEFAULT NULL,
  `CPhone` varchar(13) DEFAULT NULL,
  `User_id` tinyint(4) DEFAULT NULL,
  `Cemail` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches_coach`
--

LOCK TABLES `coaches_coach` WRITE;
/*!40000 ALTER TABLE `coaches_coach` DISABLE KEYS */;
INSERT INTO `coaches_coach` VALUES (1,'سلطان','+201060950140',2,'sultanelsultan4@gmail.com'),(2,'أحمد طه','+201062167420',17,'ahmedtaha12131415@gmail.com');
/*!40000 ALTER TABLE `coaches_coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` smallint(6) DEFAULT NULL,
  `action_time` varchar(10) DEFAULT NULL,
  `object_id` tinyint(4) DEFAULT NULL,
  `object_repr` varchar(48) DEFAULT NULL,
  `change_message` varchar(251) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `action_flag` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-15',1,'sas','',4,2,3),(2,'2023-08-15',1,'كورس التسويق','[{\"added\": {}}]',7,2,1),(3,'2023-08-15',1,'1- الدرس الأول, من فرع كورس التسويق','[{\"added\": {}}]',8,2,1),(4,'2023-08-15',1,'task object (1)','[{\"added\": {}}]',11,2,1),(5,'2023-08-15',1,'الدرس الأول','[{\"added\": {}}]',10,2,1),(6,'2023-08-15',1,'task object (1)','[{\"changed\": {\"fields\": [\"u0627u0645u062au062du0627u0646\"]}}]',11,2,2),(7,'2023-08-16',1,'الإعلان الأول','[{\"added\": {}}]',16,2,1),(8,'2023-08-17',1,'الإعلان الأول','[{\"changed\": {\"fields\": [\"u062au0641u0627u0635u064au0644 u0627u0644u0625u0639u0644u0627u0646\"]}}]',16,2,2),(9,'2023-08-18',2,'الإعلان الثاني','[{\"added\": {}}]',16,2,1),(10,'2023-08-23',2,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0635u0648u0631u0629 u0627u0644u0637u0627u0644u0628\"]}}]',9,2,2),(11,'2023-08-23',5,'ahmed22','',4,2,3),(12,'2023-08-23',6,'ahmed22','',4,2,3),(13,'2023-08-23',3,'sultanelsultan4','',4,2,3),(14,'2023-08-23',4,'sultanpasha','',4,2,3),(15,'2023-08-23',7,'sultanpasha4','',4,2,3),(16,'2023-08-23',8,'sultanpasha','',4,2,3),(17,'2023-08-23',9,'sultanpasha','',4,2,3),(18,'2023-08-23',10,'sultanpasha4','',4,2,3),(19,'2023-08-23',7,'اسم الطالب:سلطان عبدالكريم سلطان','',9,2,3),(20,'2023-08-23',5,'اسم الطالب:سلطان عبدالكريم سلطان','',9,2,3),(21,'2023-08-23',4,'اسم الطالب:احمد علي جاد','',9,2,3),(22,'2023-08-23',11,'sultanpasha4','',4,2,3),(23,'2023-08-23',12,'sultanpasha','',4,2,3),(24,'2023-08-23',13,'sultanpasha','',4,2,3),(25,'2023-08-25',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0646u0642u0627u0637\"]}}]',9,2,2),(26,'2023-08-25',2,'2- الدرس الثاني, من فرع كورس التسويق','[{\"added\": {}}]',8,2,1),(27,'2023-08-25',2,'امتحان الشهر الجديد','[{\"added\": {}}]',10,2,1),(28,'2023-08-25',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(29,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(30,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(31,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(32,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(33,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(34,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(35,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(36,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(37,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\", \"u0627u0644u0646u0642u0627u0637\"]}}]',9,2,2),(38,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\", \"u0627u0644u0646u0642u0627u0637\"]}}]',9,2,2),(39,'2023-08-26',8,'اسم الطالب:سلطان عبدالكريم سلطان','[{\"changed\": {\"fields\": [\"u0627u0644u0645u062du0627u0636u0631u0627u062a u0627u0644u0645u0646u062au0647u064au0647\"]}}]',9,2,2),(40,'2023-09-01',8,'Live object (8)','',17,2,3),(41,'2023-09-01',7,'Live object (7)','',17,2,3),(42,'2023-09-01',6,'Live object (6)','',17,2,3),(43,'2023-09-01',5,'Live object (5)','',17,2,3),(44,'2023-09-01',4,'Live object (4)','',17,2,3),(45,'2023-09-01',3,'Live object (3)','',17,2,3),(46,'2023-09-01',2,'Live object (2)','',17,2,3),(47,'2023-09-01',1,'Live object (1)','',17,2,3),(48,'2023-09-01',13,'Live object (13)','',17,2,3),(49,'2023-09-01',12,'Live object (12)','',17,2,3),(50,'2023-09-01',11,'Live object (11)','',17,2,3),(51,'2023-09-01',10,'Live object (10)','',17,2,3),(52,'2023-09-01',9,'Live object (9)','',17,2,3),(53,'2023-09-04',17,'9765','',17,2,3),(54,'2023-09-04',16,'4511','',17,2,3),(55,'2023-09-04',15,'latest9628','',17,2,3),(56,'2023-09-04',14,'5386','',17,2,3),(57,'2023-09-04',13,'9477','',17,2,3),(58,'2023-09-04',12,'9477','',17,2,3),(59,'2023-09-04',11,'9477','',17,2,3),(60,'2023-09-04',10,'9477','',17,2,3),(61,'2023-09-04',9,'9477','',17,2,3),(62,'2023-09-04',8,'9477','',17,2,3),(63,'2023-09-04',7,'9477','',17,2,3),(64,'2023-09-04',6,'9477','',17,2,3),(65,'2023-09-04',5,'9477','',17,2,3),(66,'2023-09-04',4,'9477','',17,2,3),(67,'2023-09-04',3,'9477','',17,2,3),(68,'2023-09-04',2,'9477','',17,2,3),(69,'2023-09-04',1,'19477','',17,2,3),(70,'2023-09-04',19,'2','',17,2,3),(71,'2023-09-04',18,'8850','',17,2,3),(72,'2023-09-04',21,'8850','',17,2,3),(73,'2023-09-04',20,'8850','',17,2,3),(74,'2023-09-04',22,'6507','',17,2,3),(75,'2023-09-04',25,'440','',17,2,3),(76,'2023-09-04',26,'5753','',17,2,3),(77,'2023-09-04',27,'2937','',17,2,3),(78,'2023-09-04',28,'7960','',17,2,3),(79,'2023-09-04',7,'3897','',17,2,3),(80,'2023-09-04',6,'1856','',17,2,3),(81,'2023-09-04',5,'1255','',17,2,3),(82,'2023-09-04',4,'7941','',17,2,3),(83,'2023-09-04',3,'1255','',17,2,3),(84,'2023-09-04',2,'1255','',17,2,3),(85,'2023-09-04',1,'1255','',17,2,3),(86,'2023-09-04',8,'3897','',17,2,3),(87,'2023-09-04',9,'2198','',17,2,3),(88,'2023-09-04',15,'8415','',17,2,3),(89,'2023-09-04',14,'8415','',17,2,3),(90,'2023-09-04',13,'874','',17,2,3),(91,'2023-09-04',12,'874','',17,2,3),(92,'2023-09-04',11,'4087','',17,2,3),(93,'2023-09-04',10,'8812','',17,2,3),(94,'2023-09-04',21,'test6785','',17,2,3),(95,'2023-09-04',23,'test8693','',17,2,3),(96,'2023-11-16',27,'test6499','',17,2,3),(97,'2024-07-30',1,'coach object (1)','[{\"added\": {}}]',18,16,1),(98,'2024-07-30',1,'كورس التسويق','[{\"changed\": {\"fields\": [\"u0645u062fu0631u0628 u0627u0644u0643u0648u0631u0633\"]}}]',7,16,2),(99,'2024-07-30',17,'ahmed','[{\"added\": {}}]',4,16,1),(100,'2024-07-30',2,'أحمد طه','[{\"added\": {}}]',18,16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` tinyint(4) DEFAULT NULL,
  `app_label` varchar(12) DEFAULT NULL,
  `model` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(15,'ads','news'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(18,'coaches','coach'),(5,'contenttypes','contenttype'),(7,'home','catgory'),(8,'home','lessons'),(17,'live','live'),(16,'news','news'),(12,'reports','examreport'),(13,'reports','homeworkreport'),(14,'reports','report'),(6,'sessions','session'),(9,'students','student'),(10,'tasks','exam'),(11,'tasks','task');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` tinyint(4) DEFAULT NULL,
  `app` varchar(12) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `applied` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-12'),(2,'auth','0001_initial','2023-08-12'),(3,'admin','0001_initial','2023-08-12'),(4,'admin','0002_logentry_remove_auto_add','2023-08-12'),(5,'admin','0003_logentry_add_action_flag_choices','2023-08-12'),(6,'contenttypes','0002_remove_content_type_name','2023-08-12'),(7,'auth','0002_alter_permission_name_max_length','2023-08-12'),(8,'auth','0003_alter_user_email_max_length','2023-08-12'),(9,'auth','0004_alter_user_username_opts','2023-08-12'),(10,'auth','0005_alter_user_last_login_null','2023-08-12'),(11,'auth','0006_require_contenttypes_0002','2023-08-12'),(12,'auth','0007_alter_validators_add_error_messages','2023-08-12'),(13,'auth','0008_alter_user_username_max_length','2023-08-12'),(14,'auth','0009_alter_user_last_name_max_length','2023-08-12'),(15,'auth','0010_alter_group_name_max_length','2023-08-12'),(16,'auth','0011_update_proxy_permissions','2023-08-12'),(17,'auth','0012_alter_user_first_name_max_length','2023-08-12'),(18,'home','0001_initial','2023-08-12'),(19,'home','0002_auto_20220829_0404','2023-08-12'),(20,'home','0003_remove_lessons_limg','2023-08-12'),(21,'home','0004_auto_20220829_0417','2023-08-12'),(22,'home','0005_auto_20220829_1703','2023-08-12'),(23,'tasks','0001_initial','2023-08-12'),(24,'reports','0001_initial','2023-08-12'),(25,'sessions','0001_initial','2023-08-12'),(26,'students','0001_initial','2023-08-12'),(27,'students','0002_remove_student_sidnumber','2023-08-12'),(28,'students','0003_student_sidnumber','2023-08-12'),(29,'ads','0001_initial','2023-08-16'),(30,'ads','0002_rename_adds_ads','2023-08-16'),(31,'ads','0003_rename_ads_news','2023-08-16'),(32,'ads','0004_alter_news_options','2023-08-16'),(33,'ads','0005_auto_20230816_2126','2023-08-16'),(34,'news','0001_initial','2023-08-16'),(35,'students','0004_student_simg','2023-08-23'),(36,'students','0005_alter_student_simg','2023-08-23'),(37,'live','0001_initial','2023-09-01'),(38,'live','0002_live_lroom','2023-09-01'),(39,'live','0003_alter_live_lurl','2023-09-04'),(40,'live','0004_alter_live_lurl','2023-09-04'),(41,'live','0005_alter_live_lurl','2023-09-04'),(42,'coaches','0001_initial','2024-07-30'),(43,'home','0006_auto_20240730_1824','2024-07-30'),(44,'live','0006_alter_live_options','2024-07-30'),(45,'news','0002_alter_news_options','2024-07-30'),(46,'coaches','0002_auto_20240730_1951','2024-07-30'),(47,'home','0007_catgory_cprice','2024-07-30'),(48,'home','0008_alter_catgory_ccoach','2024-07-30'),(49,'students','0006_student_sstatus','2024-07-31'),(50,'coaches','0003_coach_cemail','2024-07-31'),(51,'home','0009_alter_catgory_cimage_alter_catgory_name','2024-08-01'),(52,'students','0007_student_scourses','2024-08-01'),(53,'students','0008_remove_student_scourses','2024-08-01'),(54,'students','0009_student_scourses','2024-08-01'),(55,'students','0010_remove_student_scourses_student_scourses','2024-08-01'),(56,'students','0011_alter_student_scourses','2024-08-01'),(57,'home','0010_alter_lessons_video','2024-08-01'),(58,'home','0011_lessons_youtube','2024-08-01'),(59,'home','0012_rename_youtube_lessons_lyoutube','2024-08-01');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(32) DEFAULT NULL,
  `session_data` varchar(230) DEFAULT NULL,
  `expire_date` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ublfdpgm1v54rptdbtpfoeszbnsi633z','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWq8dHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3Zmip1-t4T0KG0H-Y7t1jn1ti5z4rvCDzr4tefyvBzu30HFUb81Bi8hg1fGBqW0I5NEkmi9p2Q1ZgJbJq2cB41AjoKkrASAkUYY6Sb2_gDCxTbg:1qW3c4:Wvrt8tPoCYvksOLoPzXfFtkaDYjEgjQp7R464TWJ7f4','2023-08-29'),('zp4c0jxa47f5h6d3z96bitrodap5avux','.eJxVjEEOwiAQRe_C2hBmBBGX7nsGMgODVA1NSrsy3l2bdKHb_977LxVpXWpcu8xxzOqijurwuzGlh7QN5Du126TT1JZ5ZL0peqddD1OW53V3_w4q9fqtvbXCnAUB0JFF5x0BGMpUyjn7E6A3VoINLgUXLIfCKCYAiEsJhdX7A9nSN8s:1qW3tP:bQXQHhAWaIoTq0oU2oTdfFbfFGenbZqh-_UsSx6yP50','2023-08-30'),('6ohx5c24ly50fwndrcdamb48mt6k7dg8','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWq8dHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3Zmip1-t4T0KG0H-Y7t1jn1ti5z4rvCDzr4tefyvBzu30HFUb81Bi8hg1fGBqW0I5NEkmi9p2Q1ZgJbJq2cB41AjoKkrASAkUYY6Sb2_gDCxTbg:1qWMK2:kZ65yG53mZKE7mO0glVPz27BALVDn-16S3_SkEviovY','2023-08-30'),('ch7cptjh5a72aakp9w8vv1tzwqep9bbg','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWq8dHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3Zmip1-t4T0KG0H-Y7t1jn1ti5z4rvCDzr4tefyvBzu30HFUb81Bi8hg1fGBqW0I5NEkmi9p2Q1ZgJbJq2cB41AjoKkrASAkUYY6Sb2_gDCxTbg:1qYsxt:VERWgZuhuQlSO1qDrkDIuLkwh03NyaipWbvAsC2QcCM','2023-09-06'),('mji8bs0x8nv6zc17g0eiruxz5tccbd60','.eJxVjEEOgjAQRe_StWko7XTEpXvO0Mx0poIaSCisjHdXEha6_e-9_zKJtnVIW9UljWIuxgVz-h2Z8kOnncidptts8zyty8h2V-xBq-1n0ef1cP8OBqrDt2ZtNIqXRoHFIwm2FErIHQg47woKcMaIymcmiqX1EQFiCNSpg7Yz7w8tWjhs:1qZ4v9:OZR17FmdfANKe9FZG4vjxyS_WaZyMUsJ0-07CkqV-xo','2023-09-07'),('1v6ffo8smfeugqr4xxys21tavblxjgit','.eJxVjEEOgjAQRe_StWko7XTEpXvO0Mx0poIaSCisjHdXEha6_e-9_zKJtnVIW9UljWIuxgVz-h2Z8kOnncidptts8zyty8h2V-xBq-1n0ef1cP8OBqrDt2ZtNIqXRoHFIwm2FErIHQg47woKcMaIymcmiqX1EQFiCNSpg7Yz7w8tWjhs:1qf4rh:QjSLy0Bce_q1kRbPeXeq1Mn60qhH5SkALcN6T5tZgVA','2023-09-23'),('akkpeb97ahyo9ykk559bl1is3t4rrj90','.eJxVjDsOwjAQBe_iGln-rT-U9JzBWq8dHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3Zmip1-t4T0KG0H-Y7t1jn1ti5z4rvCDzr4tefyvBzu30HFUb81Bi8hg1fGBqW0I5NEkmi9p2Q1ZgJbJq2cB41AjoKkrASAkUYY6Sb2_gDCxTbg:1qfOHW:VjZWOHRLVXasa1lVYwfIba5UiZ4jCutOWGw2HAYRrEE','2023-09-24'),('q0ui0nik4tidnb9x5pgdi4rkp8slu806','.eJxVjEEOwiAQRe_C2pACY6Eu3fcMZGaYStVAUtqV8e7apAvd_vfef6mI25rj1mSJc1IXZXp1-h0J-SFlJ-mO5VY117IuM-ld0QdteqxJntfD_TvI2PK3PktgLzxZ4xOy4w6dARgcePRiiY0LEwiwJwuWKJiEvaHkBQe0Vjr1_gAfITiv:1qgqFa:ghSFRIBrLOa1AnFEiLQNwsC-5D-GFrL2n8uXRGuR88k','2023-09-28'),('yu8vw4vmp1g75s9f15df6jogsmm79vif','.eJxVjMEOwiAQRP-FsyHQwsJ69O43kAVWqRqalPZk_Hdp0oNe5vDmzbxFoG0tYWu8hCmLs9BGnH5hpPTkujf5QfU-yzTXdZmi3BV5tE1e58yvy-H-HRRqpa8TDmSUAa2c5dFZVBoYU2ZCC0Z3GNGP_qbBq54YWaEDTDwYAmdAfL7a0jbb:1r3oXQ:2ZAl8ekgb9SZwbF2iOPyyVWrNaaz8fiDBryDxv7vBq4','2023-12-01'),('fb7n3ap4wfuj3g7fzcnndvlvc6rm6hk8','.eJxVjEEOgjAQRe_StWm00M7UpXvO0Mx0BosaSCisjHcXEha6_e-9_zaJ1qWkteqcBjFX48zpd2PKTx13IA8a75PN07jMA9tdsQettptEX7fD_TsoVMtWA2Avquy1DYxtJr5wRB8gukyCfWjUcWzQ-zMGl4El99g2GxIPHsB8vvz5ODE:1r3sPY:2XUkanSmUBwf9J9f1mtwHYDXYWs1ILQh6n-zwvg9-sM','2023-12-01'),('5a6ax8kke3ovftx2etrxznspf538v1gp','.eJxVjEEOwiAQRe_C2pACY6Eu3fcMZGaYStVAUtqV8e7apAvd_vfef6mI25rj1mSJc1IXZXp1-h0J-SFlJ-mO5VY117IuM-ld0QdteqxJntfD_TvI2PK3PktgLzxZ4xOy4w6dARgcePRiiY0LEwiwJwuWKJiEvaHkBQe0Vjr1_gAfITiv:1s1s7A:o-IB5BY1NWx9xYjRWvnKrsz7Cq37Y_iI-TBZDyBFlGs','2024-05-14'),('w95sdrzygx4uyx15qwoedb34emlxauxp','.eJxVjMEOwiAQRP-FsyEsS6V49O43kAUWqRpISnsy_rtt0oMe5jLvzbyFp3Upfu08-ymJiwAjTr9loPjkupP0oHpvMra6zFOQuyIP2uWtJX5dD_fvoFAv29q5gNk4yxiU4ZgtQAatKSk9IgZM5KI5Owxa2cQAwzAqq5EhO9rC4vMF-1E3og:1sYsqA:iwCUjIRr1HhrW-7nYFsTeTlAJupLF1-9N3lFPUtoXOk','2024-08-13');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_catgory`
--

DROP TABLE IF EXISTS `home_catgory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_catgory` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(12) DEFAULT NULL,
  `cimage` varchar(0) DEFAULT NULL,
  `Cprice` smallint(6) DEFAULT NULL,
  `CCoach_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_catgory`
--

LOCK TABLES `home_catgory` WRITE;
/*!40000 ALTER TABLE `home_catgory` DISABLE KEYS */;
INSERT INTO `home_catgory` VALUES (1,'كورس التسويق','',240,2),(2,'كورس البرمجه','',400,1);
/*!40000 ALTER TABLE `home_catgory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_lessons`
--

DROP TABLE IF EXISTS `home_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_lessons` (
  `id` tinyint(4) DEFAULT NULL,
  `name` varchar(24) DEFAULT NULL,
  `date` varchar(0) DEFAULT NULL,
  `catname_id` tinyint(4) DEFAULT NULL,
  `limg` varchar(0) DEFAULT NULL,
  `video` varchar(24) DEFAULT NULL,
  `LYoutube` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_lessons`
--

LOCK TABLES `home_lessons` WRITE;
/*!40000 ALTER TABLE `home_lessons` DISABLE KEYS */;
INSERT INTO `home_lessons` VALUES (1,'الدرس الأول','',1,'','lessons/الدرس_الأول.mp4',''),(2,'الدرس الثاني','',1,'','lessons/الدرس_الثاني.mp4',''),(3,'محاضره تجريبيه من يوتيوب','',2,'','','dmJYYbNOMPI');
/*!40000 ALTER TABLE `home_lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_live`
--

DROP TABLE IF EXISTS `live_live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_live` (
  `id` varchar(0) DEFAULT NULL,
  `Lname` varchar(0) DEFAULT NULL,
  `Limg` varchar(0) DEFAULT NULL,
  `Linit_id` varchar(0) DEFAULT NULL,
  `Lroom` varchar(0) DEFAULT NULL,
  `Lurl` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_live`
--

LOCK TABLES `live_live` WRITE;
/*!40000 ALTER TABLE `live_live` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_news`
--

DROP TABLE IF EXISTS `news_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_news` (
  `id` tinyint(4) DEFAULT NULL,
  `title` varchar(23) DEFAULT NULL,
  `img` varchar(36) DEFAULT NULL,
  `detail` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_news`
--

LOCK TABLES `news_news` WRITE;
/*!40000 ALTER TABLE `news_news` DISABLE KEYS */;
INSERT INTO `news_news` VALUES (1,'إعلان إفتتاح المنصه','img/SACAD_logo_Company.png','يسعدنا و بكل فخر الإعلان عن تشغيل قسم تقديم التدريبات وتعليم #البرمجه بالشركه\r\nقسم #SaCaD التعليمي\r\nانتظروا الإعلان عن الكورسات المقدمه لكل الفئات العمريه قريباً\r\n#Soon ð¥\r\n#SASKE_Company ð\r\n#بوابتك_للخدمات_التق'),(2,'إعلان كورس تعلم البرمجه','img/SASKE_SACAD_first_Ad_Project.png','تعلم البرمجه من Zero to Hero#ðªلجميع الفئات العمريه. \r\nمع شركة SASKE ð \r\nتحت شعار البرمجه للجميع و حرصاً منا لإعداد قاده وشباب متواكبين مع رؤيه مصر 2030ðªð¬ \r\nو تحت رعاية مركز المستقبل للتأهيل ð \r\nð¢نعلن عن بدء محاضرات دورة تعلم البرمجه من الصفر في محافظة المنياð\r\nتلبية لرغبات الساده عملائنا الكرام ❤️\r\nالدوره مناسبه لكل الفئات العمريهð¯\r\nهذه الدوره مجهزه و مقدمه علي ايدي نخبه من المدربينð المتخصصين و المتميزين في مجالات برمجيه مختلفه و متعدده✨.\r\nوسنتعرف خلالها عن:\r\nð كل ما يخص عالم البرمجيات\r\nð تداخل البرمجيات مع الهاردوير\r\nð لغات البرمجه\r\nð أهم المبادئ البرمجية\r\nð مقدمه في علوم الحاسب\r\nð تطبيقات عمليه مختلفه و مشاريع نهائيه علي كل مرحله تعليميه\r\nلو انت طالب في العشرينات و ما دون ذلك الحق استثمر في نفسك و تعلم لغة المستقبلð®\r\nولو انت أب نمي مهارات ابنك و علمه لغة المستقبل ليصبح له مستقبل واعد مواكباً للتغير التكنولوجي السريعð.\r\nاللغات اثناء الدوره:\r\nScratch منصة لتعلم البرمجه للمبتدئين\r\nHTML لغة ترميز النص الفائق\r\nCss لغة أوراق الأنماط المتتاليه (لتنسيق مواقع الويب)\r\njavascript لغة برمجة عالية المستوي (لإنشاء مواقع ويب تفاعليه)\r\npython لغة برمجة عالية المستوي مفتوحة المصدر (إستخدامات متعدده)\r\nمتطلبات الالتحاق بالدوره:\r\nيحق لكل الطلاب من هم بين 6 سنوات حتي 35 سنه الالتحاق بالدوره✅\r\nلا يتطلب اي معلومات سابقه عن البرمجه او الحاسب الآلي✅\r\nيتطلب اساسيات اللغه الانجليزيه قراءه و كتابه✅\r\nللحجز يرجي ملئي نموذج طلب الإلتحاق التالي لتحديد المستوي و مدى تأهل الطالب للدوره:\r\nhttps://forms.gle/e4LkYaMQVmbmR3j49\r\nوللإستفسار يرجي التواصل معنا علي الأرقام التاليه ☎️:\r\nفون وواتساب: 01060950140\r\nتليفون الشركه: 0862130396\r\nاو زيارة مقر الشركه الجديد علي العنوان التالي:\r\nالمنيا - شلبي - برج الزهراء بجوار بنزينة التعاون الدور ا');
/*!40000 ALTER TABLE `news_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_examreport`
--

DROP TABLE IF EXISTS `reports_examreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_examreport` (
  `id` tinyint(4) DEFAULT NULL,
  `asknumber` tinyint(4) DEFAULT NULL,
  `correctAnswers` tinyint(4) DEFAULT NULL,
  `wrongAnswers` tinyint(4) DEFAULT NULL,
  `presentage` tinyint(4) DEFAULT NULL,
  `exam_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_examreport`
--

LOCK TABLES `reports_examreport` WRITE;
/*!40000 ALTER TABLE `reports_examreport` DISABLE KEYS */;
INSERT INTO `reports_examreport` VALUES (2,1,0,1,0,1,14);
/*!40000 ALTER TABLE `reports_examreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_homeworkreport`
--

DROP TABLE IF EXISTS `reports_homeworkreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_homeworkreport` (
  `id` varchar(0) DEFAULT NULL,
  `asknumber` varchar(0) DEFAULT NULL,
  `correctAnswers` varchar(0) DEFAULT NULL,
  `wrongAnswers` varchar(0) DEFAULT NULL,
  `presentage` varchar(0) DEFAULT NULL,
  `lesson_id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_homeworkreport`
--

LOCK TABLES `reports_homeworkreport` WRITE;
/*!40000 ALTER TABLE `reports_homeworkreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_homeworkreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_report`
--

DROP TABLE IF EXISTS `reports_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_report` (
  `id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_report`
--

LOCK TABLES `reports_report` WRITE;
/*!40000 ALTER TABLE `reports_report` DISABLE KEYS */;
INSERT INTO `reports_report` VALUES (2,14);
/*!40000 ALTER TABLE `reports_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_report_examReport`
--

DROP TABLE IF EXISTS `reports_report_examReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_report_examReport` (
  `id` tinyint(4) DEFAULT NULL,
  `report_id` tinyint(4) DEFAULT NULL,
  `examreport_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_report_examReport`
--

LOCK TABLES `reports_report_examReport` WRITE;
/*!40000 ALTER TABLE `reports_report_examReport` DISABLE KEYS */;
INSERT INTO `reports_report_examReport` VALUES (2,2,2);
/*!40000 ALTER TABLE `reports_report_examReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_report_homerport`
--

DROP TABLE IF EXISTS `reports_report_homerport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_report_homerport` (
  `id` varchar(0) DEFAULT NULL,
  `report_id` varchar(0) DEFAULT NULL,
  `homeworkreport_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_report_homerport`
--

LOCK TABLES `reports_report_homerport` WRITE;
/*!40000 ALTER TABLE `reports_report_homerport` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_report_homerport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sqlite_sequence`
--

DROP TABLE IF EXISTS `sqlite_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqlite_sequence` (
  `name` varchar(33) DEFAULT NULL,
  `seq` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sqlite_sequence`
--

LOCK TABLES `sqlite_sequence` WRITE;
/*!40000 ALTER TABLE `sqlite_sequence` DISABLE KEYS */;
INSERT INTO `sqlite_sequence` VALUES ('django_migrations',59),('django_admin_log',158),('django_content_type',18),('auth_permission',80),('auth_group',1),('auth_user',28),('students_student_watchedlecs',34),('tasks_task',1),('reports_homeworkreport',1),('students_student_finishedHomework',1),('reports_report',2),('reports_report_homerport',1),('tasks_exam',2),('reports_examreport',2),('students_student_finishExam',2),('reports_report_examReport',2),('news_news',2),('live_live',28),('auth_group_permissions',3),('auth_user_groups',1),('home_catgory',2),('coaches_coach',2),('students_student',17),('students_student_Scourses',11),('auth_user_user_permissions',1),('home_lessons',3);
/*!40000 ALTER TABLE `sqlite_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_student`
--

DROP TABLE IF EXISTS `students_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_student` (
  `id` tinyint(4) DEFAULT NULL,
  `Sfname` varchar(5) DEFAULT NULL,
  `Smname` varchar(9) DEFAULT NULL,
  `Slname` varchar(6) DEFAULT NULL,
  `Spercent` tinyint(4) DEFAULT NULL,
  `Spercenthomeworks` tinyint(4) DEFAULT NULL,
  `Spercentexams` tinyint(4) DEFAULT NULL,
  `shomeworks` tinyint(4) DEFAULT NULL,
  `sexams` tinyint(4) DEFAULT NULL,
  `points` tinyint(4) DEFAULT NULL,
  `sinit_id` tinyint(4) DEFAULT NULL,
  `Sidnumber` bigint(20) DEFAULT NULL,
  `simg` varchar(29) DEFAULT NULL,
  `Sstatus` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_student`
--

LOCK TABLES `students_student` WRITE;
/*!40000 ALTER TABLE `students_student` DISABLE KEYS */;
INSERT INTO `students_student` VALUES (8,'سلطان','عبدالكريم','سلطان',0,0,0,0,0,0,14,215904219,'students/img/sultanpasha.png',1),(17,'حسن','علي','بسيوني',0,0,0,0,0,0,28,1942892285,'students/img/None_i2YYQyh.jpg',1);
/*!40000 ALTER TABLE `students_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_student_Scourses`
--

DROP TABLE IF EXISTS `students_student_Scourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_student_Scourses` (
  `id` tinyint(4) DEFAULT NULL,
  `student_id` tinyint(4) DEFAULT NULL,
  `catgory_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_student_Scourses`
--

LOCK TABLES `students_student_Scourses` WRITE;
/*!40000 ALTER TABLE `students_student_Scourses` DISABLE KEYS */;
INSERT INTO `students_student_Scourses` VALUES (10,8,1),(11,17,1);
/*!40000 ALTER TABLE `students_student_Scourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_student_finishExam`
--

DROP TABLE IF EXISTS `students_student_finishExam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_student_finishExam` (
  `id` tinyint(4) DEFAULT NULL,
  `student_id` tinyint(4) DEFAULT NULL,
  `exam_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_student_finishExam`
--

LOCK TABLES `students_student_finishExam` WRITE;
/*!40000 ALTER TABLE `students_student_finishExam` DISABLE KEYS */;
INSERT INTO `students_student_finishExam` VALUES (2,8,1);
/*!40000 ALTER TABLE `students_student_finishExam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_student_finishedHomework`
--

DROP TABLE IF EXISTS `students_student_finishedHomework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_student_finishedHomework` (
  `id` varchar(0) DEFAULT NULL,
  `student_id` varchar(0) DEFAULT NULL,
  `lessons_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_student_finishedHomework`
--

LOCK TABLES `students_student_finishedHomework` WRITE;
/*!40000 ALTER TABLE `students_student_finishedHomework` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_student_finishedHomework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_student_watchedlecs`
--

DROP TABLE IF EXISTS `students_student_watchedlecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_student_watchedlecs` (
  `id` tinyint(4) DEFAULT NULL,
  `student_id` tinyint(4) DEFAULT NULL,
  `lessons_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_student_watchedlecs`
--

LOCK TABLES `students_student_watchedlecs` WRITE;
/*!40000 ALTER TABLE `students_student_watchedlecs` DISABLE KEYS */;
INSERT INTO `students_student_watchedlecs` VALUES (15,8,1),(34,8,2),(31,17,1),(32,17,2),(33,17,3);
/*!40000 ALTER TABLE `students_student_watchedlecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_exam`
--

DROP TABLE IF EXISTS `tasks_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_exam` (
  `id` tinyint(4) DEFAULT NULL,
  `title` varchar(19) DEFAULT NULL,
  `publishAt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_exam`
--

LOCK TABLES `tasks_exam` WRITE;
/*!40000 ALTER TABLE `tasks_exam` DISABLE KEYS */;
INSERT INTO `tasks_exam` VALUES (1,'الدرس الأول','2023-08-15'),(2,'امتحان الشهر الجديد','2023-08-25');
/*!40000 ALTER TABLE `tasks_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_task`
--

DROP TABLE IF EXISTS `tasks_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_task` (
  `id` tinyint(4) DEFAULT NULL,
  `quest` varchar(23) DEFAULT NULL,
  `questimg` varchar(0) DEFAULT NULL,
  `answer1` varchar(14) DEFAULT NULL,
  `answer2` varchar(16) DEFAULT NULL,
  `answer3` varchar(17) DEFAULT NULL,
  `answer4` varchar(12) DEFAULT NULL,
  `answer` tinyint(4) DEFAULT NULL,
  `exam_id` tinyint(4) DEFAULT NULL,
  `lesson_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_task`
--

LOCK TABLES `tasks_task` WRITE;
/*!40000 ALTER TABLE `tasks_task` DISABLE KEYS */;
INSERT INTO `tasks_task` VALUES (1,'التسويق الإلكتروني هو ؟','','تسويق المنتجات','التسويق بالعموله','التسويق بالإنترنت','تسويق تقليدي',3,1,1);
/*!40000 ALTER TABLE `tasks_task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 16:42:54
