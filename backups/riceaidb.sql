-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: riceaidb
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add User',6,'add_user'),
(22,'Can change User',6,'change_user'),
(23,'Can delete User',6,'delete_user'),
(24,'Can view User',6,'view_user'),
(25,'Can add historical User',7,'add_historicaluser'),
(26,'Can change historical User',7,'change_historicaluser'),
(27,'Can delete historical User',7,'delete_historicaluser'),
(28,'Can view historical User',7,'view_historicaluser'),
(29,'Can add Classification',8,'add_classification'),
(30,'Can change Classification',8,'change_classification'),
(31,'Can delete Classification',8,'delete_classification'),
(32,'Can view Classification',8,'view_classification'),
(33,'Can add historical Classification',9,'add_historicalclassification'),
(34,'Can change historical Classification',9,'change_historicalclassification'),
(35,'Can delete historical Classification',9,'delete_historicalclassification'),
(36,'Can view historical Classification',9,'view_historicalclassification'),
(37,'Can add ImageTraining',10,'add_imagetrainingclassification'),
(38,'Can change ImageTraining',10,'change_imagetrainingclassification'),
(39,'Can delete ImageTraining',10,'delete_imagetrainingclassification'),
(40,'Can view ImageTraining',10,'view_imagetrainingclassification'),
(41,'Can add Token',11,'add_token'),
(42,'Can change Token',11,'change_token'),
(43,'Can delete Token',11,'delete_token'),
(44,'Can view Token',11,'view_token'),
(45,'Can add token',12,'add_tokenproxy'),
(46,'Can change token',12,'change_tokenproxy'),
(47,'Can delete token',12,'delete_tokenproxy'),
(48,'Can view token',12,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES
('19de41dc37f5c6924a948f8fa10aa5080803c03c','2023-04-02 06:57:04.523583',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnn_classification`
--

DROP TABLE IF EXISTS `cnn_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnn_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `img_name` varchar(200) NOT NULL,
  `img` varchar(100) NOT NULL,
  `accuracy_healthy` varchar(200) NOT NULL,
  `loss_nitrogen` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnn_classification`
--

LOCK TABLES `cnn_classification` WRITE;
/*!40000 ALTER TABLE `cnn_classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnn_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnn_historicalclassification`
--

DROP TABLE IF EXISTS `cnn_historicalclassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnn_historicalclassification` (
  `id` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `img_name` varchar(200) NOT NULL,
  `img` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` bigint(20) DEFAULT NULL,
  `accuracy_healthy` varchar(200) NOT NULL,
  `loss_nitrogen` varchar(200) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `cnn_historicalclassi_history_user_id_7033b3c8_fk_users_use` (`history_user_id`),
  KEY `cnn_historicalclassification_id_ac5a8cbc` (`id`),
  KEY `cnn_historicalclassification_history_date_ee44bd06` (`history_date`),
  CONSTRAINT `cnn_historicalclassi_history_user_id_7033b3c8_fk_users_use` FOREIGN KEY (`history_user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnn_historicalclassification`
--

LOCK TABLES `cnn_historicalclassification` WRITE;
/*!40000 ALTER TABLE `cnn_historicalclassification` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnn_historicalclassification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(11,'authtoken','token'),
(12,'authtoken','tokenproxy'),
(8,'cnn','classification'),
(9,'cnn','historicalclassification'),
(4,'contenttypes','contenttype'),
(10,'nn_architecture','imagetrainingclassification'),
(5,'sessions','session'),
(7,'users','historicaluser'),
(6,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2023-04-01 05:59:50.304126'),
(2,'contenttypes','0002_remove_content_type_name','2023-04-01 05:59:50.326431'),
(3,'auth','0001_initial','2023-04-01 05:59:50.389852'),
(4,'auth','0002_alter_permission_name_max_length','2023-04-01 05:59:50.403406'),
(5,'auth','0003_alter_user_email_max_length','2023-04-01 05:59:50.408596'),
(6,'auth','0004_alter_user_username_opts','2023-04-01 05:59:50.413558'),
(7,'auth','0005_alter_user_last_login_null','2023-04-01 05:59:50.420317'),
(8,'auth','0006_require_contenttypes_0002','2023-04-01 05:59:50.421663'),
(9,'auth','0007_alter_validators_add_error_messages','2023-04-01 05:59:50.426651'),
(10,'auth','0008_alter_user_username_max_length','2023-04-01 05:59:50.432477'),
(11,'auth','0009_alter_user_last_name_max_length','2023-04-01 05:59:50.438393'),
(12,'auth','0010_alter_group_name_max_length','2023-04-01 05:59:50.446991'),
(13,'auth','0011_update_proxy_permissions','2023-04-01 05:59:50.453435'),
(14,'auth','0012_alter_user_first_name_max_length','2023-04-01 05:59:50.459490'),
(15,'users','0001_initial','2023-04-01 05:59:50.575982'),
(16,'admin','0001_initial','2023-04-01 05:59:50.609839'),
(17,'admin','0002_logentry_remove_auto_add','2023-04-01 05:59:50.617814'),
(18,'admin','0003_logentry_add_action_flag_choices','2023-04-01 05:59:50.627601'),
(19,'authtoken','0001_initial','2023-04-01 05:59:50.650544'),
(20,'authtoken','0002_auto_20160226_1747','2023-04-01 05:59:50.678082'),
(21,'authtoken','0003_tokenproxy','2023-04-01 05:59:50.680949'),
(22,'cnn','0001_initial','2023-04-01 05:59:50.687583'),
(23,'cnn','0002_rename_updated_at_classification_deleted_at_and_more','2023-04-01 05:59:50.744054'),
(24,'cnn','0003_remove_classification_loss_and_more','2023-04-01 05:59:50.765382'),
(25,'cnn','0004_remove_classification_accuracy_and_more','2023-04-01 05:59:50.847014'),
(26,'cnn','0005_alter_classification_img','2023-04-01 05:59:50.850185'),
(27,'cnn','0006_alter_classification_img','2023-04-01 05:59:50.853623'),
(28,'cnn','0007_alter_classification_accuracy_healthy_and_more','2023-04-01 05:59:50.918333'),
(29,'cnn','0008_alter_classification_accuracy_healthy_and_more','2023-04-01 05:59:50.937118'),
(30,'cnn','0009_alter_classification_accuracy_healthy_and_more','2023-04-01 05:59:50.998443'),
(31,'nn_architecture','0001_initial','2023-04-01 05:59:51.005822'),
(32,'nn_architecture','0002_imagetrainingclassification_tag_label','2023-04-01 05:59:51.017541'),
(33,'nn_architecture','0003_imagetrainingclassification_category','2023-04-01 05:59:51.030064'),
(34,'sessions','0001_initial','2023-04-01 05:59:51.042762'),
(35,'users','0002_historicaluser_created_at_user_created_at','2023-04-01 05:59:51.154740'),
(36,'users','0003_historicaluser_updated_at_user_updated_at_and_more','2023-04-01 05:59:51.203018'),
(37,'users','0004_historicaluser_role_user_role','2023-04-01 05:59:51.232621');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nn_architecture_imagetrainingclassification`
--

DROP TABLE IF EXISTS `nn_architecture_imagetrainingclassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nn_architecture_imagetrainingclassification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `modified_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `img_name` varchar(200) NOT NULL,
  `img` varchar(100) NOT NULL,
  `tag_label` varchar(50) NOT NULL,
  `category` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nn_architecture_imagetrainingclassification`
--

LOCK TABLES `nn_architecture_imagetrainingclassification` WRITE;
/*!40000 ALTER TABLE `nn_architecture_imagetrainingclassification` DISABLE KEYS */;
INSERT INTO `nn_architecture_imagetrainingclassification` VALUES
(1,1,'2022-12-06 07:46:22.383754','2022-12-06 07:46:22.383786','2022-12-06 07:46:22.383801','rice_leaf_healthy.0.png','nn_architecture/images/rice_leaf_healthy.0.png','healthy','train'),
(2,1,'2022-12-06 08:06:21.453102','2022-12-06 08:06:21.453154','2022-12-06 08:06:21.453179','rice_leaf_healthy.18.png','nn_architecture/images/rice_leaf_healthy.18.png','healthy','train'),
(3,1,'2022-12-06 08:07:48.522768','2022-12-06 08:07:48.522818','2022-12-06 08:07:48.522841','rice_leaf_healthy.18.png','nn_architecture/images/rice_leaf_healthy.18_2ia4IpX.png','healthy','train'),
(4,1,'2022-12-06 08:07:48.533967','2022-12-06 08:07:48.533999','2022-12-06 08:07:48.534013','rice_leaf_healthy.112.png','nn_architecture/images/rice_leaf_healthy.112.png','healthy','train'),
(5,1,'2022-12-06 08:07:48.590527','2022-12-06 08:07:48.590583','2022-12-06 08:07:48.590612','rice_leaf_healthy.81.png','nn_architecture/images/rice_leaf_healthy.81.png','healthy','train'),
(6,1,'2022-12-06 08:07:48.648556','2022-12-06 08:07:48.648621','2022-12-06 08:07:48.648654','rice_leaf_healthy.63.png','nn_architecture/images/rice_leaf_healthy.63.png','healthy','train'),
(7,1,'2022-12-06 08:07:48.706253','2022-12-06 08:07:48.706317','2022-12-06 08:07:48.706350','rice_leaf_healthy.77.png','nn_architecture/images/rice_leaf_healthy.77.png','healthy','train'),
(8,1,'2022-12-06 08:07:48.767207','2022-12-06 08:07:48.767275','2022-12-06 08:07:48.767308','rice_leaf_healthy.80.png','nn_architecture/images/rice_leaf_healthy.80.png','healthy','train'),
(9,1,'2022-12-06 08:07:48.822547','2022-12-06 08:07:48.822610','2022-12-06 08:07:48.822644','rice_leaf_healthy.3.png','nn_architecture/images/rice_leaf_healthy.3.png','healthy','train'),
(10,1,'2022-12-06 08:07:48.880442','2022-12-06 08:07:48.880516','2022-12-06 08:07:48.880608','rice_leaf_healthy.51.png','nn_architecture/images/rice_leaf_healthy.51.png','healthy','train'),
(11,1,'2022-12-06 08:07:48.935603','2022-12-06 08:07:48.935668','2022-12-06 08:07:48.935702','rice_leaf_healthy.9.png','nn_architecture/images/rice_leaf_healthy.9.png','healthy','train'),
(12,1,'2022-12-06 08:07:48.993979','2022-12-06 08:07:48.994043','2022-12-06 08:07:48.994077','rice_leaf_healthy.39.png','nn_architecture/images/rice_leaf_healthy.39.png','healthy','train'),
(13,1,'2022-12-06 08:07:49.050716','2022-12-06 08:07:49.050756','2022-12-06 08:07:49.050774','rice_leaf_healthy.52.png','nn_architecture/images/rice_leaf_healthy.52.png','healthy','train'),
(14,1,'2022-12-06 08:07:49.107437','2022-12-06 08:07:49.107501','2022-12-06 08:07:49.107536','rice_leaf_healthy.4.png','nn_architecture/images/rice_leaf_healthy.4.png','healthy','train'),
(15,1,'2022-12-06 08:07:49.167674','2022-12-06 08:07:49.167743','2022-12-06 08:07:49.167777','rice_leaf_healthy.73.png','nn_architecture/images/rice_leaf_healthy.73.png','healthy','train'),
(16,1,'2022-12-06 08:07:49.221833','2022-12-06 08:07:49.221868','2022-12-06 08:07:49.221884','rice_leaf_healthy.71.png','nn_architecture/images/rice_leaf_healthy.71.png','healthy','train'),
(17,1,'2022-12-06 08:07:49.281186','2022-12-06 08:07:49.281228','2022-12-06 08:07:49.281250','rice_leaf_healthy.76.png','nn_architecture/images/rice_leaf_healthy.76.png','healthy','train'),
(18,1,'2022-12-06 08:07:49.336170','2022-12-06 08:07:49.336206','2022-12-06 08:07:49.336223','rice_leaf_healthy.99.png','nn_architecture/images/rice_leaf_healthy.99.png','healthy','train'),
(19,1,'2022-12-06 08:07:49.395551','2022-12-06 08:07:49.395613','2022-12-06 08:07:49.395646','rice_leaf_healthy.121.png','nn_architecture/images/rice_leaf_healthy.121.png','healthy','train'),
(20,1,'2022-12-06 08:07:49.453898','2022-12-06 08:07:49.453966','2022-12-06 08:07:49.454001','rice_leaf_healthy.65.png','nn_architecture/images/rice_leaf_healthy.65.png','healthy','train'),
(21,1,'2022-12-06 08:07:49.508183','2022-12-06 08:07:49.508217','2022-12-06 08:07:49.508233','rice_leaf_healthy.27.png','nn_architecture/images/rice_leaf_healthy.27.png','healthy','train'),
(22,1,'2022-12-06 08:07:49.560750','2022-12-06 08:07:49.560810','2022-12-06 08:07:49.560827','rice_leaf_healthy.8.png','nn_architecture/images/rice_leaf_healthy.8.png','healthy','train'),
(23,1,'2022-12-06 08:07:49.612955','2022-12-06 08:07:49.613019','2022-12-06 08:07:49.613053','rice_leaf_healthy.118.png','nn_architecture/images/rice_leaf_healthy.118.png','healthy','train'),
(24,1,'2022-12-06 08:07:49.668993','2022-12-06 08:07:49.669032','2022-12-06 08:07:49.669049','rice_leaf_healthy.36.png','nn_architecture/images/rice_leaf_healthy.36.png','healthy','train'),
(25,1,'2022-12-06 08:07:49.722924','2022-12-06 08:07:49.722959','2022-12-06 08:07:49.722974','rice_leaf_healthy.24.png','nn_architecture/images/rice_leaf_healthy.24.png','healthy','train'),
(26,1,'2022-12-06 08:07:49.774803','2022-12-06 08:07:49.774838','2022-12-06 08:07:49.774854','rice_leaf_healthy.46.png','nn_architecture/images/rice_leaf_healthy.46.png','healthy','train'),
(27,1,'2022-12-06 08:07:49.827235','2022-12-06 08:07:49.827269','2022-12-06 08:07:49.827285','rice_leaf_healthy.82.png','nn_architecture/images/rice_leaf_healthy.82.png','healthy','train'),
(28,1,'2022-12-06 08:07:49.884934','2022-12-06 08:07:49.884999','2022-12-06 08:07:49.885038','rice_leaf_healthy.40.png','nn_architecture/images/rice_leaf_healthy.40.png','healthy','train'),
(29,1,'2022-12-06 08:07:49.941259','2022-12-06 08:07:49.941328','2022-12-06 08:07:49.941363','rice_leaf_healthy.114.png','nn_architecture/images/rice_leaf_healthy.114.png','healthy','train'),
(30,1,'2022-12-06 08:07:49.997578','2022-12-06 08:07:49.997614','2022-12-06 08:07:49.997630','rice_leaf_healthy.10.png','nn_architecture/images/rice_leaf_healthy.10.png','healthy','train'),
(31,1,'2022-12-06 08:07:50.051128','2022-12-06 08:07:50.051177','2022-12-06 08:07:50.051197','rice_leaf_healthy.119.png','nn_architecture/images/rice_leaf_healthy.119.png','healthy','train'),
(32,1,'2022-12-06 08:07:50.107619','2022-12-06 08:07:50.107686','2022-12-06 08:07:50.107721','rice_leaf_healthy.22.png','nn_architecture/images/rice_leaf_healthy.22.png','healthy','train'),
(33,1,'2022-12-06 08:07:50.164030','2022-12-06 08:07:50.164094','2022-12-06 08:07:50.164126','rice_leaf_healthy.109.png','nn_architecture/images/rice_leaf_healthy.109.png','healthy','train'),
(34,1,'2022-12-06 08:07:50.220227','2022-12-06 08:07:50.220300','2022-12-06 08:07:50.220339','rice_leaf_healthy.86.png','nn_architecture/images/rice_leaf_healthy.86.png','healthy','train'),
(35,1,'2022-12-06 08:07:50.276576','2022-12-06 08:07:50.276638','2022-12-06 08:07:50.276671','rice_leaf_healthy.59.png','nn_architecture/images/rice_leaf_healthy.59.png','healthy','train'),
(36,1,'2022-12-06 08:07:50.331920','2022-12-06 08:07:50.331982','2022-12-06 08:07:50.332017','rice_leaf_healthy.72.png','nn_architecture/images/rice_leaf_healthy.72.png','healthy','train'),
(37,1,'2022-12-06 08:07:50.384130','2022-12-06 08:07:50.384171','2022-12-06 08:07:50.384190','rice_leaf_healthy.55.png','nn_architecture/images/rice_leaf_healthy.55.png','healthy','train'),
(38,1,'2022-12-06 08:07:50.437277','2022-12-06 08:07:50.437316','2022-12-06 08:07:50.437334','rice_leaf_healthy.105.png','nn_architecture/images/rice_leaf_healthy.105.png','healthy','train'),
(39,1,'2022-12-06 08:07:50.493269','2022-12-06 08:07:50.493334','2022-12-06 08:07:50.493367','rice_leaf_healthy.116.png','nn_architecture/images/rice_leaf_healthy.116.png','healthy','train'),
(40,1,'2022-12-06 08:07:50.549654','2022-12-06 08:07:50.549718','2022-12-06 08:07:50.549752','rice_leaf_healthy.108.png','nn_architecture/images/rice_leaf_healthy.108.png','healthy','train'),
(41,1,'2022-12-06 08:07:50.604388','2022-12-06 08:07:50.604456','2022-12-06 08:07:50.604517','rice_leaf_healthy.56.png','nn_architecture/images/rice_leaf_healthy.56.png','healthy','train'),
(42,1,'2022-12-06 08:07:50.660634','2022-12-06 08:07:50.660701','2022-12-06 08:07:50.660735','rice_leaf_healthy.78.png','nn_architecture/images/rice_leaf_healthy.78.png','healthy','train'),
(43,1,'2022-12-06 08:07:50.717173','2022-12-06 08:07:50.717237','2022-12-06 08:07:50.717270','rice_leaf_healthy.125.png','nn_architecture/images/rice_leaf_healthy.125.png','healthy','train'),
(44,1,'2022-12-06 08:07:50.773305','2022-12-06 08:07:50.773376','2022-12-06 08:07:50.773413','rice_leaf_healthy.17.png','nn_architecture/images/rice_leaf_healthy.17.png','healthy','train'),
(45,1,'2022-12-06 08:07:50.830071','2022-12-06 08:07:50.830135','2022-12-06 08:07:50.830169','rice_leaf_healthy.111.png','nn_architecture/images/rice_leaf_healthy.111.png','healthy','train'),
(46,1,'2022-12-06 08:07:50.885166','2022-12-06 08:07:50.885228','2022-12-06 08:07:50.885260','rice_leaf_healthy.42.png','nn_architecture/images/rice_leaf_healthy.42.png','healthy','train'),
(47,1,'2022-12-06 08:07:50.939582','2022-12-06 08:07:50.939651','2022-12-06 08:07:50.939690','rice_leaf_healthy.2.png','nn_architecture/images/rice_leaf_healthy.2.png','healthy','train'),
(48,1,'2022-12-06 08:07:50.997419','2022-12-06 08:07:50.997482','2022-12-06 08:07:50.997515','rice_leaf_healthy.13.png','nn_architecture/images/rice_leaf_healthy.13.png','healthy','train'),
(49,1,'2022-12-06 08:07:51.052609','2022-12-06 08:07:51.052669','2022-12-06 08:07:51.052685','rice_leaf_healthy.69.png','nn_architecture/images/rice_leaf_healthy.69.png','healthy','train'),
(50,1,'2022-12-06 08:07:51.110031','2022-12-06 08:07:51.110099','2022-12-06 08:07:51.110132','rice_leaf_healthy.60.png','nn_architecture/images/rice_leaf_healthy.60.png','healthy','train'),
(51,1,'2022-12-06 08:07:51.164135','2022-12-06 08:07:51.164170','2022-12-06 08:07:51.164185','rice_leaf_healthy.11.png','nn_architecture/images/rice_leaf_healthy.11.png','healthy','train'),
(52,1,'2022-12-06 08:07:51.219644','2022-12-06 08:07:51.219692','2022-12-06 08:07:51.219709','rice_leaf_healthy.79.png','nn_architecture/images/rice_leaf_healthy.79.png','healthy','train'),
(53,1,'2022-12-06 08:07:51.275151','2022-12-06 08:07:51.275217','2022-12-06 08:07:51.275251','rice_leaf_healthy.83.png','nn_architecture/images/rice_leaf_healthy.83.png','healthy','train'),
(54,1,'2022-12-06 08:07:51.332986','2022-12-06 08:07:51.333020','2022-12-06 08:07:51.333035','rice_leaf_healthy.61.png','nn_architecture/images/rice_leaf_healthy.61.png','healthy','train'),
(55,1,'2022-12-06 08:07:51.386568','2022-12-06 08:07:51.386604','2022-12-06 08:07:51.386622','rice_leaf_healthy.54.png','nn_architecture/images/rice_leaf_healthy.54.png','healthy','train'),
(56,1,'2022-12-06 08:07:51.440704','2022-12-06 08:07:51.440772','2022-12-06 08:07:51.440808','rice_leaf_healthy.107.png','nn_architecture/images/rice_leaf_healthy.107.png','healthy','train'),
(57,1,'2022-12-06 08:07:51.493651','2022-12-06 08:07:51.493726','2022-12-06 08:07:51.493763','rice_leaf_healthy.97.png','nn_architecture/images/rice_leaf_healthy.97.png','healthy','train'),
(58,1,'2022-12-06 08:07:51.550373','2022-12-06 08:07:51.550436','2022-12-06 08:07:51.550468','rice_leaf_healthy.14.png','nn_architecture/images/rice_leaf_healthy.14.png','healthy','train'),
(59,1,'2022-12-06 08:07:51.606517','2022-12-06 08:07:51.606585','2022-12-06 08:07:51.606621','rice_leaf_healthy.74.png','nn_architecture/images/rice_leaf_healthy.74.png','healthy','train'),
(60,1,'2022-12-06 08:07:51.662866','2022-12-06 08:07:51.662932','2022-12-06 08:07:51.662965','rice_leaf_healthy.115.png','nn_architecture/images/rice_leaf_healthy.115.png','healthy','train'),
(61,1,'2022-12-06 08:07:51.717626','2022-12-06 08:07:51.717690','2022-12-06 08:07:51.717723','rice_leaf_healthy.128.png','nn_architecture/images/rice_leaf_healthy.128.png','healthy','train'),
(62,1,'2022-12-06 08:07:51.771341','2022-12-06 08:07:51.771407','2022-12-06 08:07:51.771441','rice_leaf_healthy.5.png','nn_architecture/images/rice_leaf_healthy.5.png','healthy','train'),
(63,1,'2022-12-06 08:07:51.826574','2022-12-06 08:07:51.826644','2022-12-06 08:07:51.826680','rice_leaf_healthy.92.png','nn_architecture/images/rice_leaf_healthy.92.png','healthy','train'),
(64,1,'2022-12-06 08:07:51.883907','2022-12-06 08:07:51.883970','2022-12-06 08:07:51.884003','rice_leaf_healthy.102.png','nn_architecture/images/rice_leaf_healthy.102.png','healthy','train'),
(65,1,'2022-12-06 08:07:51.938920','2022-12-06 08:07:51.938986','2022-12-06 08:07:51.939019','rice_leaf_healthy.84.png','nn_architecture/images/rice_leaf_healthy.84.png','healthy','train'),
(66,1,'2022-12-06 08:07:51.994530','2022-12-06 08:07:51.994571','2022-12-06 08:07:51.994591','rice_leaf_healthy.45.png','nn_architecture/images/rice_leaf_healthy.45.png','healthy','train'),
(67,1,'2022-12-06 08:07:52.050259','2022-12-06 08:07:52.050321','2022-12-06 08:07:52.050353','rice_leaf_healthy.44.png','nn_architecture/images/rice_leaf_healthy.44.png','healthy','train'),
(68,1,'2022-12-06 08:07:52.111277','2022-12-06 08:07:52.111318','2022-12-06 08:07:52.111335','rice_leaf_healthy.53.png','nn_architecture/images/rice_leaf_healthy.53.png','healthy','train'),
(69,1,'2022-12-06 08:07:52.164047','2022-12-06 08:07:52.164082','2022-12-06 08:07:52.164098','rice_leaf_healthy.34.png','nn_architecture/images/rice_leaf_healthy.34.png','healthy','train'),
(70,1,'2022-12-06 08:07:52.220768','2022-12-06 08:07:52.220832','2022-12-06 08:07:52.220864','rice_leaf_healthy.6.png','nn_architecture/images/rice_leaf_healthy.6.png','healthy','train'),
(71,1,'2022-12-06 08:07:52.277226','2022-12-06 08:07:52.277298','2022-12-06 08:07:52.277338','rice_leaf_healthy.75.png','nn_architecture/images/rice_leaf_healthy.75.png','healthy','train'),
(72,1,'2022-12-06 08:07:52.330758','2022-12-06 08:07:52.330795','2022-12-06 08:07:52.330811','rice_leaf_healthy.98.png','nn_architecture/images/rice_leaf_healthy.98.png','healthy','train'),
(73,1,'2022-12-06 08:07:52.385169','2022-12-06 08:07:52.385232','2022-12-06 08:07:52.385265','rice_leaf_healthy.67.png','nn_architecture/images/rice_leaf_healthy.67.png','healthy','train'),
(74,1,'2022-12-06 08:07:52.436069','2022-12-06 08:07:52.436132','2022-12-06 08:07:52.436165','rice_leaf_healthy.94.png','nn_architecture/images/rice_leaf_healthy.94.png','healthy','train'),
(75,1,'2022-12-06 08:07:52.490555','2022-12-06 08:07:52.490592','2022-12-06 08:07:52.490609','rice_leaf_healthy.89.png','nn_architecture/images/rice_leaf_healthy.89.png','healthy','train'),
(76,1,'2022-12-06 08:07:52.546724','2022-12-06 08:07:52.546791','2022-12-06 08:07:52.546824','rice_leaf_healthy.15.png','nn_architecture/images/rice_leaf_healthy.15.png','healthy','train'),
(77,1,'2022-12-06 08:07:52.603024','2022-12-06 08:07:52.603089','2022-12-06 08:07:52.603123','rice_leaf_healthy.110.png','nn_architecture/images/rice_leaf_healthy.110.png','healthy','train'),
(78,1,'2022-12-06 08:07:52.660136','2022-12-06 08:07:52.660204','2022-12-06 08:07:52.660241','rice_leaf_healthy.117.png','nn_architecture/images/rice_leaf_healthy.117.png','healthy','train'),
(79,1,'2022-12-06 08:07:52.714621','2022-12-06 08:07:52.714687','2022-12-06 08:07:52.714721','rice_leaf_healthy.106.png','nn_architecture/images/rice_leaf_healthy.106.png','healthy','train'),
(80,1,'2022-12-06 08:07:52.770338','2022-12-06 08:07:52.770401','2022-12-06 08:07:52.770434','rice_leaf_healthy.47.png','nn_architecture/images/rice_leaf_healthy.47.png','healthy','train'),
(81,1,'2022-12-06 08:07:52.827089','2022-12-06 08:07:52.827159','2022-12-06 08:07:52.827200','rice_leaf_healthy.129.png','nn_architecture/images/rice_leaf_healthy.129.png','healthy','train'),
(82,1,'2022-12-06 08:07:52.880673','2022-12-06 08:07:52.880719','2022-12-06 08:07:52.880738','rice_leaf_healthy.7.png','nn_architecture/images/rice_leaf_healthy.7.png','healthy','train'),
(83,1,'2022-12-06 08:07:52.936294','2022-12-06 08:07:52.936360','2022-12-06 08:07:52.936395','rice_leaf_healthy.21.png','nn_architecture/images/rice_leaf_healthy.21.png','healthy','train'),
(84,1,'2022-12-06 08:07:52.993586','2022-12-06 08:07:52.993682','2022-12-06 08:07:52.993722','rice_leaf_healthy.12.png','nn_architecture/images/rice_leaf_healthy.12.png','healthy','train'),
(85,1,'2022-12-06 08:07:53.048059','2022-12-06 08:07:53.048132','2022-12-06 08:07:53.048170','rice_leaf_healthy.58.png','nn_architecture/images/rice_leaf_healthy.58.png','healthy','train'),
(86,1,'2022-12-06 08:07:53.103798','2022-12-06 08:07:53.103862','2022-12-06 08:07:53.103896','rice_leaf_healthy.126.png','nn_architecture/images/rice_leaf_healthy.126.png','healthy','train'),
(87,1,'2022-12-06 08:07:53.164382','2022-12-06 08:07:53.164454','2022-12-06 08:07:53.164537','rice_leaf_healthy.57.png','nn_architecture/images/rice_leaf_healthy.57.png','healthy','train'),
(88,1,'2022-12-06 08:07:53.220399','2022-12-06 08:07:53.220463','2022-12-06 08:07:53.220496','rice_leaf_healthy.120.png','nn_architecture/images/rice_leaf_healthy.120.png','healthy','train'),
(89,1,'2022-12-06 08:07:53.280474','2022-12-06 08:07:53.280546','2022-12-06 08:07:53.280585','rice_leaf_healthy.49.png','nn_architecture/images/rice_leaf_healthy.49.png','healthy','train'),
(90,1,'2022-12-06 08:07:53.337586','2022-12-06 08:07:53.337651','2022-12-06 08:07:53.337686','rice_leaf_healthy.123.png','nn_architecture/images/rice_leaf_healthy.123.png','healthy','train'),
(91,1,'2022-12-06 08:07:53.393807','2022-12-06 08:07:53.393870','2022-12-06 08:07:53.393903','rice_leaf_healthy.32.png','nn_architecture/images/rice_leaf_healthy.32.png','healthy','train'),
(92,1,'2022-12-06 08:07:53.449938','2022-12-06 08:07:53.450005','2022-12-06 08:07:53.450039','rice_leaf_healthy.93.png','nn_architecture/images/rice_leaf_healthy.93.png','healthy','train'),
(93,1,'2022-12-06 08:07:53.507201','2022-12-06 08:07:53.507262','2022-12-06 08:07:53.507294','rice_leaf_healthy.43.png','nn_architecture/images/rice_leaf_healthy.43.png','healthy','train'),
(94,1,'2022-12-06 08:07:53.565403','2022-12-06 08:07:53.565464','2022-12-06 08:07:53.565499','rice_leaf_healthy.31.png','nn_architecture/images/rice_leaf_healthy.31.png','healthy','train'),
(95,1,'2022-12-06 08:07:53.623841','2022-12-06 08:07:53.623878','2022-12-06 08:07:53.623894','rice_leaf_healthy.100.png','nn_architecture/images/rice_leaf_healthy.100.png','healthy','train'),
(96,1,'2022-12-06 08:07:53.679892','2022-12-06 08:07:53.679959','2022-12-06 08:07:53.679999','rice_leaf_healthy.127.png','nn_architecture/images/rice_leaf_healthy.127.png','healthy','train'),
(97,1,'2022-12-06 08:07:53.732726','2022-12-06 08:07:53.732763','2022-12-06 08:07:53.732780','rice_leaf_healthy.101.png','nn_architecture/images/rice_leaf_healthy.101.png','healthy','train'),
(98,1,'2022-12-06 08:07:53.785952','2022-12-06 08:07:53.785987','2022-12-06 08:07:53.786003','rice_leaf_healthy.37.png','nn_architecture/images/rice_leaf_healthy.37.png','healthy','train'),
(99,1,'2022-12-06 08:07:53.835894','2022-12-06 08:07:53.835928','2022-12-06 08:07:53.835943','rice_leaf_healthy.19.png','nn_architecture/images/rice_leaf_healthy.19.png','healthy','train'),
(100,1,'2022-12-06 08:07:53.888587','2022-12-06 08:07:53.888621','2022-12-06 08:07:53.888637','rice_leaf_healthy.26.png','nn_architecture/images/rice_leaf_healthy.26.png','healthy','train'),
(101,1,'2022-12-06 08:07:53.943393','2022-12-06 08:07:53.943457','2022-12-06 08:07:53.943490','rice_leaf_healthy.30.png','nn_architecture/images/rice_leaf_healthy.30.png','healthy','train'),
(102,1,'2022-12-06 08:07:54.004467','2022-12-06 08:07:54.004552','2022-12-06 08:07:54.004589','rice_leaf_healthy.91.png','nn_architecture/images/rice_leaf_healthy.91.png','healthy','train'),
(103,1,'2022-12-06 08:07:54.059674','2022-12-06 08:07:54.059738','2022-12-06 08:07:54.059771','rice_leaf_healthy.38.png','nn_architecture/images/rice_leaf_healthy.38.png','healthy','train'),
(104,1,'2022-12-06 08:07:54.114051','2022-12-06 08:07:54.114090','2022-12-06 08:07:54.114109','rice_leaf_healthy.85.png','nn_architecture/images/rice_leaf_healthy.85.png','healthy','train'),
(105,1,'2022-12-06 08:07:54.167729','2022-12-06 08:07:54.167768','2022-12-06 08:07:54.167798','rice_leaf_healthy.124.png','nn_architecture/images/rice_leaf_healthy.124.png','healthy','train'),
(106,1,'2022-12-06 08:07:54.222720','2022-12-06 08:07:54.222784','2022-12-06 08:07:54.222818','rice_leaf_healthy.0.png','nn_architecture/images/rice_leaf_healthy.0_iNTPbo4.png','healthy','train'),
(107,1,'2022-12-06 08:07:54.277980','2022-12-06 08:07:54.278045','2022-12-06 08:07:54.278079','rice_leaf_healthy.1.png','nn_architecture/images/rice_leaf_healthy.1.png','healthy','train'),
(108,1,'2022-12-06 08:07:54.334035','2022-12-06 08:07:54.334105','2022-12-06 08:07:54.334147','rice_leaf_healthy.41.png','nn_architecture/images/rice_leaf_healthy.41.png','healthy','train'),
(109,1,'2022-12-06 08:07:54.391022','2022-12-06 08:07:54.391086','2022-12-06 08:07:54.391119','rice_leaf_healthy.90.png','nn_architecture/images/rice_leaf_healthy.90.png','healthy','train'),
(110,1,'2022-12-06 08:07:54.444256','2022-12-06 08:07:54.444319','2022-12-06 08:07:54.444353','rice_leaf_healthy.48.png','nn_architecture/images/rice_leaf_healthy.48.png','healthy','train'),
(111,1,'2022-12-06 08:07:54.500592','2022-12-06 08:07:54.500658','2022-12-06 08:07:54.500694','rice_leaf_healthy.50.png','nn_architecture/images/rice_leaf_healthy.50.png','healthy','train'),
(112,1,'2022-12-06 08:07:54.554999','2022-12-06 08:07:54.555068','2022-12-06 08:07:54.555104','rice_leaf_healthy.122.png','nn_architecture/images/rice_leaf_healthy.122.png','healthy','train'),
(113,1,'2022-12-06 08:07:54.606219','2022-12-06 08:07:54.606255','2022-12-06 08:07:54.606270','rice_leaf_healthy.88.png','nn_architecture/images/rice_leaf_healthy.88.png','healthy','train'),
(114,1,'2022-12-06 08:07:54.661998','2022-12-06 08:07:54.662061','2022-12-06 08:07:54.662095','rice_leaf_healthy.20.png','nn_architecture/images/rice_leaf_healthy.20.png','healthy','train'),
(115,1,'2022-12-06 08:07:54.720338','2022-12-06 08:07:54.720409','2022-12-06 08:07:54.720442','rice_leaf_healthy.64.png','nn_architecture/images/rice_leaf_healthy.64.png','healthy','train'),
(116,1,'2022-12-06 08:07:54.775246','2022-12-06 08:07:54.775311','2022-12-06 08:07:54.775345','rice_leaf_healthy.70.png','nn_architecture/images/rice_leaf_healthy.70.png','healthy','train'),
(117,1,'2022-12-06 08:07:54.836006','2022-12-06 08:07:54.836086','2022-12-06 08:07:54.836127','rice_leaf_healthy.16.png','nn_architecture/images/rice_leaf_healthy.16.png','healthy','train'),
(118,1,'2022-12-06 08:07:54.893646','2022-12-06 08:07:54.893709','2022-12-06 08:07:54.893742','rice_leaf_healthy.104.png','nn_architecture/images/rice_leaf_healthy.104.png','healthy','train'),
(119,1,'2022-12-06 08:07:54.950267','2022-12-06 08:07:54.950337','2022-12-06 08:07:54.950376','rice_leaf_healthy.103.png','nn_architecture/images/rice_leaf_healthy.103.png','healthy','train'),
(120,1,'2022-12-06 08:07:55.005668','2022-12-06 08:07:55.005736','2022-12-06 08:07:55.005769','rice_leaf_healthy.66.png','nn_architecture/images/rice_leaf_healthy.66.png','healthy','train'),
(121,1,'2022-12-06 08:07:55.064051','2022-12-06 08:07:55.064117','2022-12-06 08:07:55.064151','rice_leaf_healthy.28.png','nn_architecture/images/rice_leaf_healthy.28.png','healthy','train'),
(122,1,'2022-12-06 08:07:55.119473','2022-12-06 08:07:55.119541','2022-12-06 08:07:55.119578','rice_leaf_healthy.35.png','nn_architecture/images/rice_leaf_healthy.35.png','healthy','train'),
(123,1,'2022-12-06 08:07:55.174987','2022-12-06 08:07:55.175051','2022-12-06 08:07:55.175083','rice_leaf_healthy.23.png','nn_architecture/images/rice_leaf_healthy.23.png','healthy','train'),
(124,1,'2022-12-06 08:07:55.230244','2022-12-06 08:07:55.230308','2022-12-06 08:07:55.230341','rice_leaf_healthy.95.png','nn_architecture/images/rice_leaf_healthy.95.png','healthy','train'),
(125,1,'2022-12-06 08:07:55.286243','2022-12-06 08:07:55.286283','2022-12-06 08:07:55.286302','rice_leaf_healthy.87.png','nn_architecture/images/rice_leaf_healthy.87.png','healthy','train'),
(126,1,'2022-12-06 08:07:55.343156','2022-12-06 08:07:55.343221','2022-12-06 08:07:55.343254','rice_leaf_healthy.25.png','nn_architecture/images/rice_leaf_healthy.25.png','healthy','train'),
(127,1,'2022-12-06 08:07:55.398726','2022-12-06 08:07:55.398794','2022-12-06 08:07:55.398827','rice_leaf_healthy.96.png','nn_architecture/images/rice_leaf_healthy.96.png','healthy','train'),
(128,1,'2022-12-06 08:07:55.453943','2022-12-06 08:07:55.453980','2022-12-06 08:07:55.453998','rice_leaf_healthy.113.png','nn_architecture/images/rice_leaf_healthy.113.png','healthy','train'),
(129,1,'2022-12-06 08:07:55.511851','2022-12-06 08:07:55.511917','2022-12-06 08:07:55.511949','rice_leaf_healthy.33.png','nn_architecture/images/rice_leaf_healthy.33.png','healthy','train'),
(130,1,'2022-12-06 08:07:55.570675','2022-12-06 08:07:55.570737','2022-12-06 08:07:55.570771','rice_leaf_healthy.29.png','nn_architecture/images/rice_leaf_healthy.29.png','healthy','train'),
(131,1,'2022-12-06 08:07:55.622567','2022-12-06 08:07:55.622606','2022-12-06 08:07:55.622626','rice_leaf_healthy.68.png','nn_architecture/images/rice_leaf_healthy.68.png','healthy','train'),
(132,1,'2022-12-06 08:07:55.678482','2022-12-06 08:07:55.678542','2022-12-06 08:07:55.678576','rice_leaf_healthy.62.png','nn_architecture/images/rice_leaf_healthy.62.png','healthy','train'),
(133,1,'2022-12-06 08:09:11.099856','2022-12-06 08:09:11.099898','2022-12-06 08:09:11.099914','rice_leaf_yellow.58.png','nn_architecture/images/rice_leaf_yellow.58.png','loss_nitrogen','train'),
(134,1,'2022-12-06 08:09:11.108074','2022-12-06 08:09:11.108108','2022-12-06 08:09:11.108123','rice_leaf_yellow.42.png','nn_architecture/images/rice_leaf_yellow.42.png','loss_nitrogen','train'),
(135,1,'2022-12-06 08:09:11.161339','2022-12-06 08:09:11.161394','2022-12-06 08:09:11.161423','rice_leaf_yellow.32.png','nn_architecture/images/rice_leaf_yellow.32.png','loss_nitrogen','train'),
(136,1,'2022-12-06 08:09:11.215628','2022-12-06 08:09:11.215664','2022-12-06 08:09:11.215679','rice_leaf_yellow.29.png','nn_architecture/images/rice_leaf_yellow.29.png','loss_nitrogen','train'),
(137,1,'2022-12-06 08:09:11.270318','2022-12-06 08:09:11.270385','2022-12-06 08:09:11.270423','rice_leaf_yellow.46.png','nn_architecture/images/rice_leaf_yellow.46.png','loss_nitrogen','train'),
(138,1,'2022-12-06 08:09:11.326672','2022-12-06 08:09:11.326738','2022-12-06 08:09:11.326772','rice_leaf_yellow.45.png','nn_architecture/images/rice_leaf_yellow.45.png','loss_nitrogen','train'),
(139,1,'2022-12-06 08:09:11.382234','2022-12-06 08:09:11.382297','2022-12-06 08:09:11.382330','rice_leaf_yellow.44.png','nn_architecture/images/rice_leaf_yellow.44.png','loss_nitrogen','train'),
(140,1,'2022-12-06 08:09:11.441015','2022-12-06 08:09:11.441082','2022-12-06 08:09:11.441117','rice_leaf_yellow.53.png','nn_architecture/images/rice_leaf_yellow.53.png','loss_nitrogen','train'),
(141,1,'2022-12-06 08:09:11.496326','2022-12-06 08:09:11.496389','2022-12-06 08:09:11.496420','rice_leaf_yellow.35.png','nn_architecture/images/rice_leaf_yellow.35.png','loss_nitrogen','train'),
(142,1,'2022-12-06 08:09:11.552745','2022-12-06 08:09:11.552819','2022-12-06 08:09:11.552860','rice_leaf_yellow.19.png','nn_architecture/images/rice_leaf_yellow.19.png','loss_nitrogen','train'),
(143,1,'2022-12-06 08:09:11.610343','2022-12-06 08:09:11.610408','2022-12-06 08:09:11.610442','rice_leaf_yellow.31.png','nn_architecture/images/rice_leaf_yellow.31.png','loss_nitrogen','train'),
(144,1,'2022-12-06 08:09:11.668385','2022-12-06 08:09:11.668454','2022-12-06 08:09:11.668504','rice_leaf_yellow.55.png','nn_architecture/images/rice_leaf_yellow.55.png','loss_nitrogen','train'),
(145,1,'2022-12-06 08:09:11.721287','2022-12-06 08:09:11.721352','2022-12-06 08:09:11.721389','rice_leaf_yellow.13.png','nn_architecture/images/rice_leaf_yellow.13.png','loss_nitrogen','train'),
(146,1,'2022-12-06 08:09:11.776070','2022-12-06 08:09:11.776137','2022-12-06 08:09:11.776169','rice_leaf_yellow.1.png','nn_architecture/images/rice_leaf_yellow.1.png','loss_nitrogen','train'),
(147,1,'2022-12-06 08:09:11.833567','2022-12-06 08:09:11.833630','2022-12-06 08:09:11.833662','rice_leaf_yellow.40.png','nn_architecture/images/rice_leaf_yellow.40.png','loss_nitrogen','train'),
(148,1,'2022-12-06 08:09:11.889958','2022-12-06 08:09:11.890032','2022-12-06 08:09:11.890071','rice_leaf_yellow.57.png','nn_architecture/images/rice_leaf_yellow.57.png','loss_nitrogen','train'),
(149,1,'2022-12-06 08:09:11.946567','2022-12-06 08:09:11.946632','2022-12-06 08:09:11.946664','rice_leaf_yellow.48.png','nn_architecture/images/rice_leaf_yellow.48.png','loss_nitrogen','train'),
(150,1,'2022-12-06 08:09:12.003257','2022-12-06 08:09:12.003319','2022-12-06 08:09:12.003357','rice_leaf_yellow.33.png','nn_architecture/images/rice_leaf_yellow.33.png','loss_nitrogen','train'),
(151,1,'2022-12-06 08:09:12.060316','2022-12-06 08:09:12.060380','2022-12-06 08:09:12.060414','rice_leaf_yellow.41.png','nn_architecture/images/rice_leaf_yellow.41.png','loss_nitrogen','train'),
(152,1,'2022-12-06 08:09:12.113359','2022-12-06 08:09:12.113394','2022-12-06 08:09:12.113411','rice_leaf_yellow.25.png','nn_architecture/images/rice_leaf_yellow.25.png','loss_nitrogen','train'),
(153,1,'2022-12-06 08:09:12.168881','2022-12-06 08:09:12.168916','2022-12-06 08:09:12.168931','rice_leaf_yellow.49.png','nn_architecture/images/rice_leaf_yellow.49.png','loss_nitrogen','train'),
(154,1,'2022-12-06 08:09:12.223190','2022-12-06 08:09:12.223259','2022-12-06 08:09:12.223297','rice_leaf_yellow.22.png','nn_architecture/images/rice_leaf_yellow.22.png','loss_nitrogen','train'),
(155,1,'2022-12-06 08:09:12.277477','2022-12-06 08:09:12.277512','2022-12-06 08:09:12.277527','rice_leaf_yellow.50.png','nn_architecture/images/rice_leaf_yellow.50.png','loss_nitrogen','train'),
(156,1,'2022-12-06 08:09:12.333433','2022-12-06 08:09:12.333495','2022-12-06 08:09:12.333528','rice_leaf_yellow.37.png','nn_architecture/images/rice_leaf_yellow.37.png','loss_nitrogen','train'),
(157,1,'2022-12-06 08:09:12.393865','2022-12-06 08:09:12.393931','2022-12-06 08:09:12.393964','rice_leaf_yellow.24.png','nn_architecture/images/rice_leaf_yellow.24.png','loss_nitrogen','train'),
(158,1,'2022-12-06 08:09:12.450222','2022-12-06 08:09:12.450287','2022-12-06 08:09:12.450319','rice_leaf_yellow.54.png','nn_architecture/images/rice_leaf_yellow.54.png','loss_nitrogen','train'),
(159,1,'2022-12-06 08:09:12.506298','2022-12-06 08:09:12.506337','2022-12-06 08:09:12.506354','rice_leaf_yellow.4.png','nn_architecture/images/rice_leaf_yellow.4.png','loss_nitrogen','train'),
(160,1,'2022-12-06 08:09:12.561618','2022-12-06 08:09:12.561690','2022-12-06 08:09:12.561727','rice_leaf_yellow.39.png','nn_architecture/images/rice_leaf_yellow.39.png','loss_nitrogen','train'),
(161,1,'2022-12-06 08:09:12.620080','2022-12-06 08:09:12.620145','2022-12-06 08:09:12.620179','rice_leaf_yellow.3.png','nn_architecture/images/rice_leaf_yellow.3.png','loss_nitrogen','train'),
(162,1,'2022-12-06 08:09:12.677743','2022-12-06 08:09:12.677848','2022-12-06 08:09:12.677888','rice_leaf_yellow.36.png','nn_architecture/images/rice_leaf_yellow.36.png','loss_nitrogen','train'),
(163,1,'2022-12-06 08:09:12.733721','2022-12-06 08:09:12.733787','2022-12-06 08:09:12.733819','rice_leaf_yellow.2.png','nn_architecture/images/rice_leaf_yellow.2.png','loss_nitrogen','train'),
(164,1,'2022-12-06 08:09:12.786651','2022-12-06 08:09:12.786688','2022-12-06 08:09:12.786703','rice_leaf_yellow.10.png','nn_architecture/images/rice_leaf_yellow.10.png','loss_nitrogen','train'),
(165,1,'2022-12-06 08:09:12.844621','2022-12-06 08:09:12.844660','2022-12-06 08:09:12.844677','rice_leaf_yellow.12.png','nn_architecture/images/rice_leaf_yellow.12.png','loss_nitrogen','train'),
(166,1,'2022-12-06 08:09:12.899326','2022-12-06 08:09:12.899361','2022-12-06 08:09:12.899377','rice_leaf_yellow.16.png','nn_architecture/images/rice_leaf_yellow.16.png','loss_nitrogen','train'),
(167,1,'2022-12-06 08:09:12.960382','2022-12-06 08:09:12.960456','2022-12-06 08:09:12.960493','rice_leaf_yellow.56.png','nn_architecture/images/rice_leaf_yellow.56.png','loss_nitrogen','train'),
(168,1,'2022-12-06 08:09:13.017178','2022-12-06 08:09:13.017243','2022-12-06 08:09:13.017278','rice_leaf_yellow.51.png','nn_architecture/images/rice_leaf_yellow.51.png','loss_nitrogen','train'),
(169,1,'2022-12-06 08:09:13.076716','2022-12-06 08:09:13.076759','2022-12-06 08:09:13.076777','rice_leaf_yellow.43.png','nn_architecture/images/rice_leaf_yellow.43.png','loss_nitrogen','train'),
(170,1,'2022-12-06 08:09:13.133629','2022-12-06 08:09:13.133694','2022-12-06 08:09:13.133728','rice_leaf_yellow.23.png','nn_architecture/images/rice_leaf_yellow.23.png','loss_nitrogen','train'),
(171,1,'2022-12-06 08:09:13.189638','2022-12-06 08:09:13.189675','2022-12-06 08:09:13.189706','rice_leaf_yellow.28.png','nn_architecture/images/rice_leaf_yellow.28.png','loss_nitrogen','train'),
(172,1,'2022-12-06 08:09:13.244731','2022-12-06 08:09:13.244770','2022-12-06 08:09:13.244787','rice_leaf_yellow.38.png','nn_architecture/images/rice_leaf_yellow.38.png','loss_nitrogen','train'),
(173,1,'2022-12-06 08:09:13.299936','2022-12-06 08:09:13.300000','2022-12-06 08:09:13.300032','rice_leaf_yellow.11.png','nn_architecture/images/rice_leaf_yellow.11.png','loss_nitrogen','train'),
(174,1,'2022-12-06 08:09:13.357349','2022-12-06 08:09:13.357411','2022-12-06 08:09:13.357443','rice_leaf_yellow.47.png','nn_architecture/images/rice_leaf_yellow.47.png','loss_nitrogen','train'),
(175,1,'2022-12-06 08:09:13.411542','2022-12-06 08:09:13.411611','2022-12-06 08:09:13.411649','rice_leaf_yellow.21.png','nn_architecture/images/rice_leaf_yellow.21.png','loss_nitrogen','train'),
(176,1,'2022-12-06 08:09:13.463575','2022-12-06 08:09:13.463646','2022-12-06 08:09:13.463683','rice_leaf_yellow.5.png','nn_architecture/images/rice_leaf_yellow.5.png','loss_nitrogen','train'),
(177,1,'2022-12-06 08:09:13.520749','2022-12-06 08:09:13.520813','2022-12-06 08:09:13.520846','rice_leaf_yellow.18.png','nn_architecture/images/rice_leaf_yellow.18.png','loss_nitrogen','train'),
(178,1,'2022-12-06 08:09:13.576992','2022-12-06 08:09:13.577059','2022-12-06 08:09:13.577096','rice_leaf_yellow.26.png','nn_architecture/images/rice_leaf_yellow.26.png','loss_nitrogen','train'),
(179,1,'2022-12-06 08:09:13.630770','2022-12-06 08:09:13.630811','2022-12-06 08:09:13.630831','rice_leaf_yellow.52.png','nn_architecture/images/rice_leaf_yellow.52.png','loss_nitrogen','train'),
(180,1,'2022-12-06 08:09:13.686539','2022-12-06 08:09:13.686600','2022-12-06 08:09:13.686634','rice_leaf_yellow.34.png','nn_architecture/images/rice_leaf_yellow.34.png','loss_nitrogen','train'),
(181,1,'2022-12-06 08:09:13.742082','2022-12-06 08:09:13.742122','2022-12-06 08:09:13.742140','rice_leaf_yellow.0.png','nn_architecture/images/rice_leaf_yellow.0.png','loss_nitrogen','train'),
(182,1,'2022-12-06 08:09:13.791828','2022-12-06 08:09:13.791861','2022-12-06 08:09:13.791876','rice_leaf_yellow.8.png','nn_architecture/images/rice_leaf_yellow.8.png','loss_nitrogen','train'),
(183,1,'2022-12-06 08:09:13.842648','2022-12-06 08:09:13.842686','2022-12-06 08:09:13.842701','rice_leaf_yellow.30.png','nn_architecture/images/rice_leaf_yellow.30.png','loss_nitrogen','train'),
(184,1,'2022-12-06 08:09:13.893422','2022-12-06 08:09:13.893457','2022-12-06 08:09:13.893473','rice_leaf_yellow.7.png','nn_architecture/images/rice_leaf_yellow.7.png','loss_nitrogen','train'),
(185,1,'2022-12-06 08:09:13.948799','2022-12-06 08:09:13.948864','2022-12-06 08:09:13.948896','rice_leaf_yellow.9.png','nn_architecture/images/rice_leaf_yellow.9.png','loss_nitrogen','train'),
(186,1,'2022-12-06 08:09:14.004776','2022-12-06 08:09:14.004834','2022-12-06 08:09:14.004866','rice_leaf_yellow.59.png','nn_architecture/images/rice_leaf_yellow.59.png','loss_nitrogen','train'),
(187,1,'2022-12-06 08:09:14.059605','2022-12-06 08:09:14.059667','2022-12-06 08:09:14.059699','rice_leaf_yellow.20.png','nn_architecture/images/rice_leaf_yellow.20.png','loss_nitrogen','train'),
(188,1,'2022-12-06 08:09:14.113507','2022-12-06 08:09:14.113547','2022-12-06 08:09:14.113565','rice_leaf_yellow.14.png','nn_architecture/images/rice_leaf_yellow.14.png','loss_nitrogen','train'),
(189,1,'2022-12-06 08:09:14.166712','2022-12-06 08:09:14.166784','2022-12-06 08:09:14.166824','rice_leaf_yellow.15.png','nn_architecture/images/rice_leaf_yellow.15.png','loss_nitrogen','train'),
(190,1,'2022-12-06 08:09:14.221577','2022-12-06 08:09:14.221639','2022-12-06 08:09:14.221672','rice_leaf_yellow.27.png','nn_architecture/images/rice_leaf_yellow.27.png','loss_nitrogen','train'),
(191,1,'2022-12-06 08:09:14.278843','2022-12-06 08:09:14.278884','2022-12-06 08:09:14.278905','rice_leaf_yellow.6.png','nn_architecture/images/rice_leaf_yellow.6.png','loss_nitrogen','train'),
(192,1,'2022-12-06 08:09:14.331987','2022-12-06 08:09:14.332027','2022-12-06 08:09:14.332044','rice_leaf_yellow.17.png','nn_architecture/images/rice_leaf_yellow.17.png','loss_nitrogen','train'),
(193,1,'2022-12-06 08:09:58.845432','2022-12-06 08:09:58.845483','2022-12-06 08:09:58.845505','rice_leaf_yellow.13.png','nn_architecture/images/rice_leaf_yellow.13_EOojVtV.png','loss_nitrogen','test'),
(194,1,'2022-12-06 08:09:58.853922','2022-12-06 08:09:58.853955','2022-12-06 08:09:58.853972','rice_leaf_yellow.1.png','nn_architecture/images/rice_leaf_yellow.1_ZrlWlHI.png','loss_nitrogen','test'),
(195,1,'2022-12-06 08:09:58.905602','2022-12-06 08:09:58.905639','2022-12-06 08:09:58.905654','rice_leaf_yellow.4.png','nn_architecture/images/rice_leaf_yellow.4_eJVATGi.png','loss_nitrogen','test'),
(196,1,'2022-12-06 08:09:58.959431','2022-12-06 08:09:58.959465','2022-12-06 08:09:58.959480','rice_leaf_yellow.3.png','nn_architecture/images/rice_leaf_yellow.3_lX1XcT4.png','loss_nitrogen','test'),
(197,1,'2022-12-06 08:09:59.016154','2022-12-06 08:09:59.016217','2022-12-06 08:09:59.016248','rice_leaf_yellow.2.png','nn_architecture/images/rice_leaf_yellow.2_9M2xNXD.png','loss_nitrogen','test'),
(198,1,'2022-12-06 08:09:59.069698','2022-12-06 08:09:59.069761','2022-12-06 08:09:59.069794','rice_leaf_yellow.10.png','nn_architecture/images/rice_leaf_yellow.10_9Oi4R5t.png','loss_nitrogen','test'),
(199,1,'2022-12-06 08:09:59.123659','2022-12-06 08:09:59.123698','2022-12-06 08:09:59.123716','rice_leaf_yellow.12.png','nn_architecture/images/rice_leaf_yellow.12_ZROXaJL.png','loss_nitrogen','test'),
(200,1,'2022-12-06 08:09:59.180129','2022-12-06 08:09:59.180192','2022-12-06 08:09:59.180225','rice_leaf_yellow.11.png','nn_architecture/images/rice_leaf_yellow.11_RG9quga.png','loss_nitrogen','test'),
(201,1,'2022-12-06 08:09:59.240390','2022-12-06 08:09:59.240456','2022-12-06 08:09:59.240488','rice_leaf_yellow.5.png','nn_architecture/images/rice_leaf_yellow.5_ZVPE4Bq.png','loss_nitrogen','test'),
(202,1,'2022-12-06 08:09:59.296876','2022-12-06 08:09:59.296938','2022-12-06 08:09:59.296971','rice_leaf_yellow.0.png','nn_architecture/images/rice_leaf_yellow.0_tx1irNo.png','loss_nitrogen','test'),
(203,1,'2022-12-06 08:09:59.353197','2022-12-06 08:09:59.353236','2022-12-06 08:09:59.353253','rice_leaf_yellow.8.png','nn_architecture/images/rice_leaf_yellow.8_0Zm02zb.png','loss_nitrogen','test'),
(204,1,'2022-12-06 08:09:59.407699','2022-12-06 08:09:59.407738','2022-12-06 08:09:59.407755','rice_leaf_yellow.7.png','nn_architecture/images/rice_leaf_yellow.7_PqJL4Wg.png','loss_nitrogen','test'),
(205,1,'2022-12-06 08:09:59.463374','2022-12-06 08:09:59.463438','2022-12-06 08:09:59.463470','rice_leaf_yellow.9.png','nn_architecture/images/rice_leaf_yellow.9_wvQMq4B.png','loss_nitrogen','test'),
(206,1,'2022-12-06 08:09:59.520354','2022-12-06 08:09:59.520394','2022-12-06 08:09:59.520415','rice_leaf_yellow.14.png','nn_architecture/images/rice_leaf_yellow.14_giYwP6j.png','loss_nitrogen','test'),
(207,1,'2022-12-06 08:09:59.574367','2022-12-06 08:09:59.574406','2022-12-06 08:09:59.574424','rice_leaf_yellow.6.png','nn_architecture/images/rice_leaf_yellow.6_j0gcF9s.png','loss_nitrogen','test'),
(208,1,'2022-12-06 08:10:28.929329','2022-12-06 08:10:28.929374','2022-12-06 08:10:28.929391','rice_leaf_healthy.18.png','nn_architecture/images/rice_leaf_healthy.18_CIwo7si.png','healthy','test'),
(209,1,'2022-12-06 08:10:28.937704','2022-12-06 08:10:28.937738','2022-12-06 08:10:28.937753','rice_leaf_healthy.63.png','nn_architecture/images/rice_leaf_healthy.63_aGv1VbM.png','healthy','test'),
(210,1,'2022-12-06 08:10:28.991833','2022-12-06 08:10:28.991868','2022-12-06 08:10:28.991884','rice_leaf_healthy.3.png','nn_architecture/images/rice_leaf_healthy.3_uLBQH8i.png','healthy','test'),
(211,1,'2022-12-06 08:10:29.044623','2022-12-06 08:10:29.044657','2022-12-06 08:10:29.044672','rice_leaf_healthy.51.png','nn_architecture/images/rice_leaf_healthy.51_sjejxBk.png','healthy','test'),
(212,1,'2022-12-06 08:10:29.097136','2022-12-06 08:10:29.097199','2022-12-06 08:10:29.097231','rice_leaf_healthy.9.png','nn_architecture/images/rice_leaf_healthy.9_Q2tpkH9.png','healthy','test'),
(213,1,'2022-12-06 08:10:29.152418','2022-12-06 08:10:29.152481','2022-12-06 08:10:29.152513','rice_leaf_healthy.39.png','nn_architecture/images/rice_leaf_healthy.39_KXu6gz7.png','healthy','test'),
(214,1,'2022-12-06 08:10:29.208870','2022-12-06 08:10:29.208933','2022-12-06 08:10:29.208971','rice_leaf_healthy.52.png','nn_architecture/images/rice_leaf_healthy.52_PY9ZGyf.png','healthy','test'),
(215,1,'2022-12-06 08:10:29.265391','2022-12-06 08:10:29.265453','2022-12-06 08:10:29.265484','rice_leaf_healthy.4.png','nn_architecture/images/rice_leaf_healthy.4_GE56bt3.png','healthy','test'),
(216,1,'2022-12-06 08:10:29.323751','2022-12-06 08:10:29.323789','2022-12-06 08:10:29.323805','rice_leaf_healthy.27.png','nn_architecture/images/rice_leaf_healthy.27_f6Pmh3O.png','healthy','test'),
(217,1,'2022-12-06 08:10:29.379038','2022-12-06 08:10:29.379108','2022-12-06 08:10:29.379144','rice_leaf_healthy.8.png','nn_architecture/images/rice_leaf_healthy.8_FzwTNAu.png','healthy','test'),
(218,1,'2022-12-06 08:10:29.436705','2022-12-06 08:10:29.436767','2022-12-06 08:10:29.436800','rice_leaf_healthy.36.png','nn_architecture/images/rice_leaf_healthy.36_lOhkbwm.png','healthy','test'),
(219,1,'2022-12-06 08:10:29.495277','2022-12-06 08:10:29.495345','2022-12-06 08:10:29.495381','rice_leaf_healthy.24.png','nn_architecture/images/rice_leaf_healthy.24_j4zftyR.png','healthy','test'),
(220,1,'2022-12-06 08:10:29.553156','2022-12-06 08:10:29.553220','2022-12-06 08:10:29.553252','rice_leaf_healthy.46.png','nn_architecture/images/rice_leaf_healthy.46_H7MWKRW.png','healthy','test'),
(221,1,'2022-12-06 08:10:29.610590','2022-12-06 08:10:29.610659','2022-12-06 08:10:29.610698','rice_leaf_healthy.40.png','nn_architecture/images/rice_leaf_healthy.40_2o0T9ZO.png','healthy','test'),
(222,1,'2022-12-06 08:10:29.667608','2022-12-06 08:10:29.667675','2022-12-06 08:10:29.667707','rice_leaf_healthy.10.png','nn_architecture/images/rice_leaf_healthy.10_wP2vIOZ.png','healthy','test'),
(223,1,'2022-12-06 08:10:29.723146','2022-12-06 08:10:29.723210','2022-12-06 08:10:29.723245','rice_leaf_healthy.22.png','nn_architecture/images/rice_leaf_healthy.22_Xglc4AE.png','healthy','test'),
(224,1,'2022-12-06 08:10:29.778571','2022-12-06 08:10:29.778611','2022-12-06 08:10:29.778629','rice_leaf_healthy.59.png','nn_architecture/images/rice_leaf_healthy.59_EKVsDvS.png','healthy','test'),
(225,1,'2022-12-06 08:10:29.833973','2022-12-06 08:10:29.834040','2022-12-06 08:10:29.834073','rice_leaf_healthy.55.png','nn_architecture/images/rice_leaf_healthy.55_I0mOJYW.png','healthy','test'),
(226,1,'2022-12-06 08:10:29.887711','2022-12-06 08:10:29.887746','2022-12-06 08:10:29.887763','rice_leaf_healthy.56.png','nn_architecture/images/rice_leaf_healthy.56_2p0bBDf.png','healthy','test'),
(227,1,'2022-12-06 08:10:29.943737','2022-12-06 08:10:29.943777','2022-12-06 08:10:29.943797','rice_leaf_healthy.17.png','nn_architecture/images/rice_leaf_healthy.17_DqLKGyP.png','healthy','test'),
(228,1,'2022-12-06 08:10:29.997642','2022-12-06 08:10:29.997680','2022-12-06 08:10:29.997696','rice_leaf_healthy.42.png','nn_architecture/images/rice_leaf_healthy.42_K17Uq9j.png','healthy','test'),
(229,1,'2022-12-06 08:10:30.054204','2022-12-06 08:10:30.054239','2022-12-06 08:10:30.054254','rice_leaf_healthy.2.png','nn_architecture/images/rice_leaf_healthy.2_3EPWtL8.png','healthy','test'),
(230,1,'2022-12-06 08:10:30.108201','2022-12-06 08:10:30.108237','2022-12-06 08:10:30.108253','rice_leaf_healthy.13.png','nn_architecture/images/rice_leaf_healthy.13_hm51vPE.png','healthy','test'),
(231,1,'2022-12-06 08:10:30.163102','2022-12-06 08:10:30.163169','2022-12-06 08:10:30.163206','rice_leaf_healthy.60.png','nn_architecture/images/rice_leaf_healthy.60_WCggxxO.png','healthy','test'),
(232,1,'2022-12-06 08:10:30.220267','2022-12-06 08:10:30.220330','2022-12-06 08:10:30.220362','rice_leaf_healthy.11.png','nn_architecture/images/rice_leaf_healthy.11_GkQX2oX.png','healthy','test'),
(233,1,'2022-12-06 08:10:30.276918','2022-12-06 08:10:30.276983','2022-12-06 08:10:30.277020','rice_leaf_healthy.61.png','nn_architecture/images/rice_leaf_healthy.61_fK8j97u.png','healthy','test'),
(234,1,'2022-12-06 08:10:30.337243','2022-12-06 08:10:30.337307','2022-12-06 08:10:30.337340','rice_leaf_healthy.54.png','nn_architecture/images/rice_leaf_healthy.54_pGwTK61.png','healthy','test'),
(235,1,'2022-12-06 08:10:30.399420','2022-12-06 08:10:30.399485','2022-12-06 08:10:30.399519','rice_leaf_healthy.14.png','nn_architecture/images/rice_leaf_healthy.14_a1fKZs3.png','healthy','test'),
(236,1,'2022-12-06 08:10:30.455192','2022-12-06 08:10:30.455227','2022-12-06 08:10:30.455243','rice_leaf_healthy.5.png','nn_architecture/images/rice_leaf_healthy.5_Du7Kb30.png','healthy','test'),
(237,1,'2022-12-06 08:10:30.513324','2022-12-06 08:10:30.513390','2022-12-06 08:10:30.513425','rice_leaf_healthy.45.png','nn_architecture/images/rice_leaf_healthy.45_il7VKCo.png','healthy','test'),
(238,1,'2022-12-06 08:10:30.573713','2022-12-06 08:10:30.573776','2022-12-06 08:10:30.573808','rice_leaf_healthy.44.png','nn_architecture/images/rice_leaf_healthy.44_qhI91HM.png','healthy','test'),
(239,1,'2022-12-06 08:10:30.633066','2022-12-06 08:10:30.633135','2022-12-06 08:10:30.633170','rice_leaf_healthy.53.png','nn_architecture/images/rice_leaf_healthy.53_dnHgRQL.png','healthy','test'),
(240,1,'2022-12-06 08:10:30.688795','2022-12-06 08:10:30.688859','2022-12-06 08:10:30.688893','rice_leaf_healthy.34.png','nn_architecture/images/rice_leaf_healthy.34_vddoIZh.png','healthy','test'),
(241,1,'2022-12-06 08:10:30.744318','2022-12-06 08:10:30.744382','2022-12-06 08:10:30.744414','rice_leaf_healthy.6.png','nn_architecture/images/rice_leaf_healthy.6_6BklaBA.png','healthy','test'),
(242,1,'2022-12-06 08:10:30.803917','2022-12-06 08:10:30.803984','2022-12-06 08:10:30.804017','rice_leaf_healthy.15.png','nn_architecture/images/rice_leaf_healthy.15_2vuPPyU.png','healthy','test'),
(243,1,'2022-12-06 08:10:30.860154','2022-12-06 08:10:30.860218','2022-12-06 08:10:30.860251','rice_leaf_healthy.47.png','nn_architecture/images/rice_leaf_healthy.47_AdLSPoj.png','healthy','test'),
(244,1,'2022-12-06 08:10:30.916393','2022-12-06 08:10:30.916435','2022-12-06 08:10:30.916454','rice_leaf_healthy.7.png','nn_architecture/images/rice_leaf_healthy.7_hhNDOj7.png','healthy','test'),
(245,1,'2022-12-06 08:10:30.973189','2022-12-06 08:10:30.973252','2022-12-06 08:10:30.973284','rice_leaf_healthy.21.png','nn_architecture/images/rice_leaf_healthy.21_9dH5bqc.png','healthy','test'),
(246,1,'2022-12-06 08:10:31.029882','2022-12-06 08:10:31.029921','2022-12-06 08:10:31.029941','rice_leaf_healthy.12.png','nn_architecture/images/rice_leaf_healthy.12_70mhIR5.png','healthy','test'),
(247,1,'2022-12-06 08:10:31.089429','2022-12-06 08:10:31.089493','2022-12-06 08:10:31.089526','rice_leaf_healthy.58.png','nn_architecture/images/rice_leaf_healthy.58_fSOq2J1.png','healthy','test'),
(248,1,'2022-12-06 08:10:31.150869','2022-12-06 08:10:31.150939','2022-12-06 08:10:31.150979','rice_leaf_healthy.57.png','nn_architecture/images/rice_leaf_healthy.57_I905FpZ.png','healthy','test'),
(249,1,'2022-12-06 08:10:31.204543','2022-12-06 08:10:31.204577','2022-12-06 08:10:31.204593','rice_leaf_healthy.49.png','nn_architecture/images/rice_leaf_healthy.49_BdebqIB.png','healthy','test'),
(250,1,'2022-12-06 08:10:31.260536','2022-12-06 08:10:31.260598','2022-12-06 08:10:31.260630','rice_leaf_healthy.32.png','nn_architecture/images/rice_leaf_healthy.32_97amrSJ.png','healthy','test'),
(251,1,'2022-12-06 08:10:31.317065','2022-12-06 08:10:31.317135','2022-12-06 08:10:31.317171','rice_leaf_healthy.43.png','nn_architecture/images/rice_leaf_healthy.43_w3c98Rr.png','healthy','test'),
(252,1,'2022-12-06 08:10:31.373727','2022-12-06 08:10:31.373790','2022-12-06 08:10:31.373822','rice_leaf_healthy.31.png','nn_architecture/images/rice_leaf_healthy.31_RLfonnA.png','healthy','test'),
(253,1,'2022-12-06 08:10:31.429497','2022-12-06 08:10:31.429560','2022-12-06 08:10:31.429592','rice_leaf_healthy.37.png','nn_architecture/images/rice_leaf_healthy.37_AQSbvxu.png','healthy','test'),
(254,1,'2022-12-06 08:10:31.484800','2022-12-06 08:10:31.484840','2022-12-06 08:10:31.484859','rice_leaf_healthy.19.png','nn_architecture/images/rice_leaf_healthy.19_hKmLZfc.png','healthy','test'),
(255,1,'2022-12-06 08:10:31.537907','2022-12-06 08:10:31.537985','2022-12-06 08:10:31.538020','rice_leaf_healthy.26.png','nn_architecture/images/rice_leaf_healthy.26_PmhlTmE.png','healthy','test'),
(256,1,'2022-12-06 08:10:31.593196','2022-12-06 08:10:31.593260','2022-12-06 08:10:31.593293','rice_leaf_healthy.30.png','nn_architecture/images/rice_leaf_healthy.30_NhU52ug.png','healthy','test'),
(257,1,'2022-12-06 08:10:31.648919','2022-12-06 08:10:31.648988','2022-12-06 08:10:31.649026','rice_leaf_healthy.38.png','nn_architecture/images/rice_leaf_healthy.38_E4PJnsT.png','healthy','test'),
(258,1,'2022-12-06 08:10:31.706110','2022-12-06 08:10:31.706174','2022-12-06 08:10:31.706208','rice_leaf_healthy.0.png','nn_architecture/images/rice_leaf_healthy.0_8KKGKZe.png','healthy','test'),
(259,1,'2022-12-06 08:10:31.762322','2022-12-06 08:10:31.762387','2022-12-06 08:10:31.762421','rice_leaf_healthy.1.png','nn_architecture/images/rice_leaf_healthy.1_aPyghYN.png','healthy','test'),
(260,1,'2022-12-06 08:10:31.820856','2022-12-06 08:10:31.820911','2022-12-06 08:10:31.820927','rice_leaf_healthy.41.png','nn_architecture/images/rice_leaf_healthy.41_FNiXPZl.png','healthy','test'),
(261,1,'2022-12-06 08:10:31.875647','2022-12-06 08:10:31.875710','2022-12-06 08:10:31.875741','rice_leaf_healthy.48.png','nn_architecture/images/rice_leaf_healthy.48_o7LcNGb.png','healthy','test'),
(262,1,'2022-12-06 08:10:31.933795','2022-12-06 08:10:31.933860','2022-12-06 08:10:31.933879','rice_leaf_healthy.50.png','nn_architecture/images/rice_leaf_healthy.50_Gj4ZBH4.png','healthy','test'),
(263,1,'2022-12-06 08:10:31.988328','2022-12-06 08:10:31.988365','2022-12-06 08:10:31.988381','rice_leaf_healthy.20.png','nn_architecture/images/rice_leaf_healthy.20_artCZM0.png','healthy','test'),
(264,1,'2022-12-06 08:10:32.043902','2022-12-06 08:10:32.043965','2022-12-06 08:10:32.043999','rice_leaf_healthy.64.png','nn_architecture/images/rice_leaf_healthy.64_iz0pcxX.png','healthy','test'),
(265,1,'2022-12-06 08:10:32.104020','2022-12-06 08:10:32.104089','2022-12-06 08:10:32.104125','rice_leaf_healthy.16.png','nn_architecture/images/rice_leaf_healthy.16_9bUQkT5.png','healthy','test'),
(266,1,'2022-12-06 08:10:32.157124','2022-12-06 08:10:32.157188','2022-12-06 08:10:32.157221','rice_leaf_healthy.28.png','nn_architecture/images/rice_leaf_healthy.28_GAopl6c.png','healthy','test'),
(267,1,'2022-12-06 08:10:32.214985','2022-12-06 08:10:32.215050','2022-12-06 08:10:32.215082','rice_leaf_healthy.35.png','nn_architecture/images/rice_leaf_healthy.35_4UnZIG4.png','healthy','test'),
(268,1,'2022-12-06 08:10:32.270896','2022-12-06 08:10:32.270962','2022-12-06 08:10:32.271000','rice_leaf_healthy.23.png','nn_architecture/images/rice_leaf_healthy.23_lfsKeNc.png','healthy','test'),
(269,1,'2022-12-06 08:10:32.329581','2022-12-06 08:10:32.329645','2022-12-06 08:10:32.329678','rice_leaf_healthy.25.png','nn_architecture/images/rice_leaf_healthy.25_ib5cLUR.png','healthy','test'),
(270,1,'2022-12-06 08:10:32.385538','2022-12-06 08:10:32.385578','2022-12-06 08:10:32.385598','rice_leaf_healthy.33.png','nn_architecture/images/rice_leaf_healthy.33_pD2G3dd.png','healthy','test'),
(271,1,'2022-12-06 08:10:32.437680','2022-12-06 08:10:32.437744','2022-12-06 08:10:32.437782','rice_leaf_healthy.29.png','nn_architecture/images/rice_leaf_healthy.29_LuCklPR.png','healthy','test'),
(272,1,'2022-12-06 08:10:32.493363','2022-12-06 08:10:32.493427','2022-12-06 08:10:32.493461','rice_leaf_healthy.62.png','nn_architecture/images/rice_leaf_healthy.62_MRHy6H5.png','healthy','test');
/*!40000 ALTER TABLE `nn_architecture_imagetrainingclassification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_historicaluser`
--

DROP TABLE IF EXISTS `users_historicaluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_historicaluser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `users_historicaluser_history_user_id_7f91d047_fk_users_user_id` (`history_user_id`),
  KEY `users_historicaluser_id_5e70dd03` (`id`),
  KEY `users_historicaluser_username_8f7ba123` (`username`),
  KEY `users_historicaluser_email_a7c70263` (`email`),
  KEY `users_historicaluser_history_date_c280194d` (`history_date`),
  CONSTRAINT `users_historicaluser_history_user_id_7f91d047_fk_users_user_id` FOREIGN KEY (`history_user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_historicaluser`
--

LOCK TABLES `users_historicaluser` WRITE;
/*!40000 ALTER TABLE `users_historicaluser` DISABLE KEYS */;
INSERT INTO `users_historicaluser` VALUES
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=',NULL,1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,1,'2023-04-01 06:25:38.181846',NULL,'+',NULL,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119',NULL),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 00:00:03.096397',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,2,'2023-04-02 00:00:03.097913',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 00:05:29.001387',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,3,'2023-04-02 00:05:29.004394',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 00:06:19.211005',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,4,'2023-04-02 00:06:19.219231',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 00:07:40.205927',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,5,'2023-04-02 00:07:40.208962',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 00:08:13.997240',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,6,'2023-04-02 00:08:14.000122',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 00:20:45.296451',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,7,'2023-04-02 00:20:45.299266',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 00:21:37.616170',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,8,'2023-04-02 00:21:37.618886',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 00:36:44.875447',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,9,'2023-04-02 00:36:44.878318',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 01:14:30.820639',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,10,'2023-04-02 01:14:30.823472',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 01:17:04.408964',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,11,'2023-04-02 01:17:04.411998',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 01:22:42.179090',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,12,'2023-04-02 01:22:42.185287',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 01:36:56.573851',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,13,'2023-04-02 01:36:56.576949',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 01:37:28.665131',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,14,'2023-04-02 01:37:28.668227',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 01:40:01.891949',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,15,'2023-04-02 01:40:01.894771',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 01:42:27.659100',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,16,'2023-04-02 01:42:27.662190',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 01:47:22.411149',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,17,'2023-04-02 01:47:22.413619',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 01:58:43.696698',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,18,'2023-04-02 01:58:43.699257',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 02:01:01.993836',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,19,'2023-04-02 02:01:01.996591',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 02:01:36.429274',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,20,'2023-04-02 02:01:36.431976',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 02:02:35.158150',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,21,'2023-04-02 02:02:35.160827',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 05:25:11.189609',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,22,'2023-04-02 05:25:11.195113',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 06:42:08.929942',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,23,'2023-04-02 06:42:08.933039',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 06:42:54.477186',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,24,'2023-04-02 06:42:54.479759',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin'),
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 06:43:40.635683',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,25,'2023-04-02 06:43:40.636892',NULL,'~',1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin');
/*!40000 ALTER TABLE `users_historicaluser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES
(1,'pbkdf2_sha256$390000$ayOCrfudxYZZwGLXFCvV0M$JwNOrEXl9gyHw3ammEP/4Kfwkz2ZPJCbmqbxiWWrGGU=','2023-04-02 06:43:40.635683',1,'payload0911','anegreiross@outlook.com','Arturo Francesco','Negreiros Samanez','',1,1,'2023-04-01 06:25:38.179090','2023-04-01 06:25:38.179119','admin');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-02  2:12:42
