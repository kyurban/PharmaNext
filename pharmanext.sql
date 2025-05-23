-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: pharmanext
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Pharmacists'),(2,'Technicians');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (46,1,1),(47,1,2),(48,1,3),(49,1,4),(50,1,5),(51,1,6),(52,1,7),(53,1,8),(54,1,9),(55,1,10),(56,1,11),(57,1,12),(58,1,13),(59,1,14),(60,1,15),(61,1,16),(62,1,17),(63,1,18),(64,1,19),(65,1,20),(66,1,21),(67,1,22),(68,1,23),(69,1,24),(70,1,25),(71,1,26),(72,1,27),(73,1,28),(74,1,29),(75,1,30),(76,1,31),(77,1,32),(78,1,33),(79,1,34),(80,1,35),(81,1,36),(82,1,37),(83,1,38),(84,1,39),(85,1,40),(86,1,41),(87,1,42),(88,1,43),(89,1,44),(90,1,45),(91,1,46),(92,1,47),(93,1,48),(1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32),(33,2,33),(34,2,34),(35,2,35),(36,2,36),(37,2,37),(38,2,41),(39,2,42),(40,2,43),(41,2,44),(42,2,45),(43,2,46),(44,2,47),(45,2,48);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add prescription',7,'add_prescription'),(26,'Can change prescription',7,'change_prescription'),(27,'Can delete prescription',7,'delete_prescription'),(28,'Can view prescription',7,'view_prescription'),(29,'Can add qt',8,'add_qt'),(30,'Can change qt',8,'change_qt'),(31,'Can delete qt',8,'delete_qt'),(32,'Can view qt',8,'view_qt'),(33,'Can add qp',9,'add_qp'),(34,'Can change qp',9,'change_qp'),(35,'Can delete qp',9,'delete_qp'),(36,'Can view qp',9,'view_qp'),(37,'Can add qv',10,'add_qv'),(38,'Can change qv',10,'change_qv'),(39,'Can delete qv',10,'delete_qv'),(40,'Can view qv',10,'view_qv'),(41,'Can add inventory item',11,'add_inventoryitem'),(42,'Can change inventory item',11,'change_inventoryitem'),(43,'Can delete inventory item',11,'delete_inventoryitem'),(44,'Can view inventory item',11,'view_inventoryitem'),(45,'Can add patient',12,'add_patient'),(46,'Can change patient',12,'change_patient'),(47,'Can delete patient',12,'delete_patient'),(48,'Can view patient',12,'view_patient');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$zhSklHA6EZraTBSwCMzDJ9$4Ad+OVxmAyP4B5DWMyIHvMt6RwcDKRQuPVudrr1n2G4=','2025-04-23 23:55:24.097126',1,'admin','','','',1,1,'2025-03-23 05:11:01.000000'),(2,'pbkdf2_sha256$870000$5qDwYYdbyz5ihni7nVfAdB$xhcK9F2ZDImQFUx8uXTcMQbLakqxd0jnpSGZcAGedzg=','2025-04-29 15:38:09.083976',1,'pharmacist','','','',1,1,'2025-03-23 05:13:57.000000'),(3,'pbkdf2_sha256$870000$IdmCaIoKWUGwVzcy9lR13I$lStrefyDCe/7s6xNrP+R8JAWjHTGQpTGC6/FS3B3tCc=','2025-04-29 15:39:37.003675',0,'technician','','','',0,1,'2025-03-23 05:14:06.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (4,1,1),(5,1,2),(1,2,1),(2,2,2),(3,3,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (46,2,1),(47,2,2),(48,2,3),(49,2,4),(50,2,5),(51,2,6),(52,2,7),(53,2,8),(54,2,9),(55,2,10),(56,2,11),(57,2,12),(58,2,13),(59,2,14),(60,2,15),(61,2,16),(62,2,17),(63,2,18),(64,2,19),(65,2,20),(66,2,21),(67,2,22),(68,2,23),(69,2,24),(70,2,25),(71,2,26),(72,2,27),(73,2,28),(74,2,29),(75,2,30),(76,2,31),(77,2,32),(78,2,33),(79,2,34),(80,2,35),(81,2,36),(82,2,37),(83,2,38),(84,2,39),(85,2,40),(86,2,41),(87,2,42),(88,2,43),(89,2,44),(90,2,45),(91,2,46),(92,2,47),(93,2,48),(1,3,1),(2,3,2),(3,3,3),(4,3,4),(5,3,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,3,16),(17,3,17),(18,3,18),(19,3,19),(20,3,20),(21,3,21),(22,3,22),(23,3,23),(24,3,24),(25,3,25),(26,3,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,3,31),(32,3,32),(33,3,33),(34,3,34),(35,3,35),(36,3,36),(37,3,37),(38,3,41),(39,3,42),(40,3,43),(41,3,44),(42,3,45),(43,3,46),(44,3,47),(45,3,48);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-23 05:13:58.011522','2','pharmacist',1,'[{\"added\": {}}]',4,1),(2,'2025-03-23 05:14:07.194750','3','technician',1,'[{\"added\": {}}]',4,1),(3,'2025-03-23 05:15:06.059418','2','pharmacist',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(4,'2025-04-16 19:28:53.397436','2','pharmacist',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(5,'2025-04-21 01:12:53.781989','3','technician',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,2),(6,'2025-04-21 01:14:28.434799','1','Pharmacists',1,'[{\"added\": {}}]',3,2),(7,'2025-04-21 01:15:15.354808','2','Technicians',1,'[{\"added\": {}}]',3,2),(8,'2025-04-21 01:15:19.710508','1','Pharmacists',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,2),(9,'2025-04-21 01:16:09.462723','2','pharmacist',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,2),(10,'2025-04-21 01:16:20.328363','3','technician',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,2),(11,'2025-04-21 01:16:27.623899','1','admin',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,2),(12,'2025-04-21 01:17:50.955946','2','Technicians',2,'[]',3,1),(13,'2025-04-21 01:18:25.970973','3','technician',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(14,'2025-04-21 19:59:04.157839','2','pharmacist',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(15,'2025-04-21 19:59:08.538718','2','pharmacist',2,'[]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'inventory_management','inventoryitem'),(12,'patient_management','patient'),(7,'rx_pending','prescription'),(8,'rx_pending','qt'),(9,'rx_production','qp'),(10,'rx_verification','qv'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-11 18:28:25.112599'),(2,'auth','0001_initial','2025-03-11 18:28:25.464565'),(3,'admin','0001_initial','2025-03-11 18:28:25.556348'),(4,'admin','0002_logentry_remove_auto_add','2025-03-11 18:28:25.562355'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-11 18:28:25.577130'),(6,'contenttypes','0002_remove_content_type_name','2025-03-11 18:28:25.630626'),(7,'auth','0002_alter_permission_name_max_length','2025-03-11 18:28:25.671639'),(8,'auth','0003_alter_user_email_max_length','2025-03-11 18:28:25.687642'),(9,'auth','0004_alter_user_username_opts','2025-03-11 18:28:25.692251'),(10,'auth','0005_alter_user_last_login_null','2025-03-11 18:28:25.730464'),(11,'auth','0006_require_contenttypes_0002','2025-03-11 18:28:25.732071'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-11 18:28:25.736075'),(13,'auth','0008_alter_user_username_max_length','2025-03-11 18:28:25.783562'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-11 18:28:25.832033'),(15,'auth','0010_alter_group_name_max_length','2025-03-11 18:28:25.843539'),(16,'auth','0011_update_proxy_permissions','2025-03-11 18:28:25.848550'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-11 18:28:25.889315'),(18,'inventory_management','0001_initial','2025-03-11 18:28:25.900484'),(19,'patient_management','0001_initial','2025-03-11 18:28:25.921096'),(20,'rx_pending','0001_initial','2025-03-11 18:28:26.048559'),(21,'rx_production','0001_initial','2025-03-11 18:28:26.106039'),(22,'rx_verification','0001_initial','2025-03-11 18:28:26.163744'),(23,'sessions','0001_initial','2025-03-11 18:28:26.188744'),(24,'rx_pending','0002_alter_prescription_status_delete_qt','2025-03-17 03:41:39.508203');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('af2ej9p1vxri9kz6cn69q7dlb46uh7c3','.eJxVjMsOwiAUBf-FtSFQoJe6dN9vIPeBUjU0Ke3K-O_apAvdnpk5L5VwW0vaWl7SJOqsrDr9boT8yHUHcsd6mzXPdV0m0ruiD9r0OEt-Xg7376BgK9_aGGcJ0Yg1ANcQHXeW2A1BwDgJEtgjoWdiGjx4Y4FcByA9OYjcR_X-ANcYN4c:1twSzW:H-VTNCIaH8bpXilBfKvQQKf1xOZd3xzRnkd99eCIfuc','2025-04-06 21:36:22.066772'),('jp9m5ud2a5veznb8m8j8wwi3qmb0lyww','.eJxVjEEOwiAQRe_C2hCgpVNcuu8ZyDADUjWQlHZlvLtt0oVu_3v_vYXHbc1-a3HxM4ur6MTldwtIz1gOwA8s9yqplnWZgzwUedImp8rxdTvdv0DGlve3CYRBp45YI7CzARwMI6gBtVGpV2yZXOpNjKQZyEAyezzZODICAYvPFwNMOSE:1u9n3Z:rXeKl9kReA6UJ8dk67yVi5NB3sE1iETsmRwAWTgAaXQ','2025-05-13 15:39:37.006795'),('qdonldzfnklsym42wrj5q9xec6c18817','e30:1u8LEZ:vBRjstpXHQrSTcHHTlIjF6R4eWCTZcfwNEaJlXOMAlo','2025-05-09 15:44:59.279580');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_management_inventoryitem`
--

DROP TABLE IF EXISTS `inventory_management_inventoryitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_management_inventoryitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uses` longtext NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_management_inventoryitem`
--

LOCK TABLES `inventory_management_inventoryitem` WRITE;
/*!40000 ALTER TABLE `inventory_management_inventoryitem` DISABLE KEYS */;
INSERT INTO `inventory_management_inventoryitem` VALUES (1,'Amoxicillin 500 mg','Bacterial infections',909,20.00,'2026-06-02'),(14,'Tramadol 50 mg','Pain',500,20.00,'2026-01-01'),(32,'Metformin 1000 mg','Diabetes',1000,20.00,'2026-01-01'),(33,'Atorvastatin 10 mg','Cholesterol',300,20.00,'2026-01-01');
/*!40000 ALTER TABLE `inventory_management_inventoryitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_management_patient`
--

DROP TABLE IF EXISTS `patient_management_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_management_patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_management_patient`
--

LOCK TABLES `patient_management_patient` WRITE;
/*!40000 ALTER TABLE `patient_management_patient` DISABLE KEYS */;
INSERT INTO `patient_management_patient` VALUES (2,'John','Smith','2000-12-20','1234567890','test2@pharmanext.com','123 Pharma blvd'),(9,'Jane','Doe','2000-12-20','1234567890','test1@pharmanext.com','123 Main St');
/*!40000 ALTER TABLE `patient_management_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rx_pending_prescription`
--

DROP TABLE IF EXISTS `rx_pending_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rx_pending_prescription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sig` longtext NOT NULL,
  `quantity` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `prescribed_by` varchar(100) NOT NULL,
  `drug_id` bigint NOT NULL,
  `patient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rx_pending_prescript_drug_id_5b80e882_fk_inventory` (`drug_id`),
  KEY `rx_pending_prescript_patient_id_2008a3d6_fk_patient_m` (`patient_id`),
  CONSTRAINT `rx_pending_prescript_drug_id_5b80e882_fk_inventory` FOREIGN KEY (`drug_id`) REFERENCES `inventory_management_inventoryitem` (`id`),
  CONSTRAINT `rx_pending_prescript_patient_id_2008a3d6_fk_patient_m` FOREIGN KEY (`patient_id`) REFERENCES `patient_management_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rx_pending_prescription`
--

LOCK TABLES `rx_pending_prescription` WRITE;
/*!40000 ALTER TABLE `rx_pending_prescription` DISABLE KEYS */;
INSERT INTO `rx_pending_prescription` VALUES (1,'Take 1 tablet by mouth daily',70,'Awaiting Verification','Dr. Next',14,2),(5,'Take 1 capsule by mouth daily until gone',21,'Pending','Dr. Next',1,9),(9,'Take 1 tablet by mouth twice a day',90,'In Production','Dr. Next',32,2),(10,'Take 1 tablet by mouth daily',90,'Pending','Dr. Next',33,9),(11,'Take 1 tablet by mouth twice a day',180,'Pending','Dr. Next',32,9);
/*!40000 ALTER TABLE `rx_pending_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rx_production_qp`
--

DROP TABLE IF EXISTS `rx_production_qp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rx_production_qp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `started_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `prescription_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prescription_id` (`prescription_id`),
  CONSTRAINT `rx_production_qp_prescription_id_6b0a14f2_fk_rx_pendin` FOREIGN KEY (`prescription_id`) REFERENCES `rx_pending_prescription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rx_production_qp`
--

LOCK TABLES `rx_production_qp` WRITE;
/*!40000 ALTER TABLE `rx_production_qp` DISABLE KEYS */;
/*!40000 ALTER TABLE `rx_production_qp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rx_verification_qv`
--

DROP TABLE IF EXISTS `rx_verification_qv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rx_verification_qv` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `verified_at` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `prescription_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prescription_id` (`prescription_id`),
  CONSTRAINT `rx_verification_qv_prescription_id_031a7128_fk_rx_pendin` FOREIGN KEY (`prescription_id`) REFERENCES `rx_pending_prescription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rx_verification_qv`
--

LOCK TABLES `rx_verification_qv` WRITE;
/*!40000 ALTER TABLE `rx_verification_qv` DISABLE KEYS */;
/*!40000 ALTER TABLE `rx_verification_qv` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-29  9:35:33
