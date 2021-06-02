-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: subscriber_tracing
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB-1:10.5.9+maria~focal

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
-- Table structure for table `goadmin_menu`
--

DROP TABLE IF EXISTS `goadmin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `order` int(11) unsigned NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plugin_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_menu`
--

LOCK TABLES `goadmin_menu` WRITE;
/*!40000 ALTER TABLE `goadmin_menu` DISABLE KEYS */;
INSERT INTO `goadmin_menu` VALUES (1,0,1,3,'Admin','fa-tasks','',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,1,1,3,'Users','fa-users','/info/manager',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(3,1,1,4,'Roles','fa-user','/info/roles',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(4,1,1,5,'Permission','fa-ban','/info/permission',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(5,1,1,6,'Menu','fa-bars','/menu',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(6,1,1,7,'Operation log','fa-history','/info/op',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(8,0,0,1,'Subscriber Tracing Configuration','fa-bars','/info/subscriber_tracing_config','','',NULL,'2021-03-29 08:31:55','2021-03-29 22:12:30'),(9,0,0,2,'Subscriber Tracing','fa-bar-chart','/info/subscriber_tracing','','',NULL,'2021-03-29 14:12:21','2021-03-30 08:57:15'),(10,0,0,2,'Sip Message Report','fa-bars','/info/sipmsg_report','','',NULL,'2021-06-02 03:03:56','2021-06-02 03:03:56');
/*!40000 ALTER TABLE `goadmin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_operation_log`
--

DROP TABLE IF EXISTS `goadmin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_operation_log`
--

LOCK TABLES `goadmin_operation_log` WRITE;
/*!40000 ALTER TABLE `goadmin_operation_log` DISABLE KEYS */;
INSERT INTO `goadmin_operation_log` VALUES (175,1,'/admin','GET','10.158.100.9','','2021-04-07 15:10:33','2021-04-07 15:10:33'),(176,1,'/admin/info/subscriber_tracing_config','GET','10.158.100.9','','2021-04-07 15:10:37','2021-04-07 15:10:37'),(177,1,'/admin/info/subscriber_tracing','GET','10.158.100.9','','2021-04-07 15:10:41','2021-04-07 15:10:41'),(178,1,'/admin/info/subscriber_tracing_config','GET','10.158.100.9','','2021-04-07 15:10:45','2021-04-07 15:10:45'),(179,1,'/admin','GET','10.243.80.109','','2021-04-13 03:00:36','2021-04-13 03:00:36'),(180,1,'/admin/info/site/edit','GET','10.243.80.109','','2021-04-13 03:00:41','2021-04-13 03:00:41'),(181,1,'/admin/edit/site','POST','10.243.80.109','{\"__checkbox__debug\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\\u003cb\\u003eAll right reserved Nokia\\u003c/b\\u003e    \\r\\n    \"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\\u003cb\\u003eAll right reserved Nokia\\u003c/b\\u003e            \\r\\n    \\r\\n    \"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"Subscriber Tracing System\"],\"logo\":[\"        \\u003cb\\u003eSubscriber\\u003c/b\\u003eTracing System\"],\"mini_logo\":[\"        \\u003cb\\u003eC\\u003c/b\\u003eT\\r\\n    \"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"72000\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"Call Tracing System\"]}','2021-04-13 03:01:33','2021-04-13 03:01:33'),(182,1,'/admin','GET','10.243.80.109','','2021-04-13 03:01:35','2021-04-13 03:01:35'),(183,1,'/admin/info/site/edit','GET','10.158.100.3','','2021-04-13 03:19:35','2021-04-13 03:19:35'),(184,1,'/admin','GET','10.158.100.3','','2021-04-13 05:13:45','2021-04-13 05:13:45'),(185,1,'/admin/info/subscriber_tracing_config','GET','10.158.100.3','','2021-04-13 05:13:48','2021-04-13 05:13:48'),(186,1,'/admin/info/subscriber_tracing','GET','10.158.100.3','','2021-04-13 05:13:49','2021-04-13 05:13:49'),(187,1,'/admin','GET','10.243.80.109','','2021-06-02 03:02:05','2021-06-02 03:02:05'),(188,1,'/admin','GET','10.243.80.109','','2021-06-02 03:02:55','2021-06-02 03:02:55'),(189,1,'/admin/info/site/edit','GET','10.243.80.109','','2021-06-02 03:02:58','2021-06-02 03:02:58'),(190,1,'/admin/menu','GET','10.243.80.109','','2021-06-02 03:03:02','2021-06-02 03:03:02'),(191,1,'/admin/menu/new','POST','10.243.80.109','{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"43cff671-fe80-4880-bb12-7d8922b0d847\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"Sip Message Report\"],\"uri\":[\"/info/sipmsg_report\"]}','2021-06-02 03:03:56','2021-06-02 03:03:56'),(192,1,'/admin/menu','GET','10.243.80.109','','2021-06-02 03:04:00','2021-06-02 03:04:00'),(193,1,'/admin/info/sipmsg_report','GET','10.243.80.109','','2021-06-02 03:04:10','2021-06-02 03:04:10'),(194,1,'/admin/info/subscriber_tracing','GET','10.243.80.109','','2021-06-02 03:04:26','2021-06-02 03:04:26'),(195,1,'/admin/info/sipmsg_report','GET','10.243.80.109','','2021-06-02 03:04:28','2021-06-02 03:04:28'),(196,1,'/admin/info/sipmsg_report','GET','10.243.80.109','','2021-06-02 03:04:29','2021-06-02 03:04:29'),(197,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 03:20:42','2021-06-02 03:20:42'),(198,1,'/admin/info/subscriber_tracing','GET','10.158.100.3','','2021-06-02 03:20:52','2021-06-02 03:20:52'),(199,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 03:20:55','2021-06-02 03:20:55'),(200,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 03:35:03','2021-06-02 03:35:03'),(201,1,'/admin/info/sipmsg_report/edit','GET','10.158.100.3','','2021-06-02 03:35:15','2021-06-02 03:35:15'),(202,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 03:35:22','2021-06-02 03:35:22'),(203,1,'/admin/info/sipmsg_report/edit','GET','10.158.100.3','','2021-06-02 03:36:31','2021-06-02 03:36:31'),(204,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 03:36:37','2021-06-02 03:36:37'),(205,1,'/admin/info/sipmsg_report/edit','GET','10.158.100.3','','2021-06-02 03:37:52','2021-06-02 03:37:52'),(206,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 03:37:58','2021-06-02 03:37:58'),(207,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 03:44:40','2021-06-02 03:44:40'),(208,1,'/admin/info/sipmsg_report/edit','GET','10.158.100.3','','2021-06-02 03:44:47','2021-06-02 03:44:47'),(209,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 03:45:01','2021-06-02 03:45:01'),(210,1,'/admin/info/sipmsg_report/edit','GET','10.158.100.3','','2021-06-02 03:45:10','2021-06-02 03:45:10'),(211,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 03:45:16','2021-06-02 03:45:16'),(212,1,'/admin/info/site/edit','GET','10.158.100.3','','2021-06-02 04:36:33','2021-06-02 04:36:33'),(213,1,'/admin/edit/site','POST','10.158.100.3','{\"__checkbox__debug\":[\"on\"],\"__checkbox__no_limit_login_ip\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\\u003cb\\u003eAll right reserved Nokia\\u003c/b\\u003e    \\r\\n    \"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\\u003cb\\u003eAll right reserved Nokia\\u003c/b\\u003e            \\r\\n    \\r\\n    \"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"Subscriber Tracing System\"],\"logo\":[\"        \\u003cb\\u003eSubscriber\\u003c/b\\u003eTracing System\"],\"mini_logo\":[\"        \\u003cb\\u003eC\\u003c/b\\u003eT\\r\\n    \"],\"no_limit_login_ip\":[\"true\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"72000\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"Call Tracing System\"]}','2021-06-02 04:36:40','2021-06-02 04:36:40'),(214,1,'/admin/info/site','GET','10.158.100.3','','2021-06-02 04:36:42','2021-06-02 04:36:42'),(215,1,'/admin/info/site/edit','GET','10.158.100.3','','2021-06-02 04:36:43','2021-06-02 04:36:43'),(216,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 04:36:45','2021-06-02 04:36:45'),(217,1,'/admin/info/sipmsg_report/edit','GET','10.158.100.3','','2021-06-02 04:36:56','2021-06-02 04:36:56'),(218,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 04:37:08','2021-06-02 04:37:08'),(219,1,'/admin/info/sipmsg_report/edit','GET','10.158.100.3','','2021-06-02 04:37:12','2021-06-02 04:37:12'),(220,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 04:37:23','2021-06-02 04:37:23'),(221,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 04:51:02','2021-06-02 04:51:02'),(222,1,'/admin/info/sipmsg_report','GET','10.158.100.3','','2021-06-02 04:53:47','2021-06-02 04:53:47'),(223,1,'/admin/info/subscriber_tracing','GET','10.158.100.3','','2021-06-02 04:53:53','2021-06-02 04:53:53');
/*!40000 ALTER TABLE `goadmin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_permissions`
--

DROP TABLE IF EXISTS `goadmin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_permissions`
--

LOCK TABLES `goadmin_permissions` WRITE;
/*!40000 ALTER TABLE `goadmin_permissions` DISABLE KEYS */;
INSERT INTO `goadmin_permissions` VALUES (1,'All permission','*','','*','2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,'Dashboard','dashboard','GET,PUT,POST,DELETE','/','2019-09-10 00:00:00','2019-09-10 00:00:00'),(17,'subscriber_tracing Query','subscriber_tracing_query','GET','/info/subscriber_tracing','2021-04-07 14:34:46','2021-04-07 14:34:46'),(18,'subscriber_tracing Show Edit Form Page','subscriber_tracing_show_edit','GET','/info/subscriber_tracing/edit','2021-04-07 14:34:46','2021-04-07 14:34:46'),(19,'subscriber_tracing Show Create Form Page','subscriber_tracing_show_create','GET','/info/subscriber_tracing/new','2021-04-07 14:34:46','2021-04-07 14:34:46'),(20,'subscriber_tracing Edit','subscriber_tracing_edit','POST','/edit/subscriber_tracing','2021-04-07 14:34:46','2021-04-07 14:34:46'),(21,'subscriber_tracing Create','subscriber_tracing_create','POST','/new/subscriber_tracing','2021-04-07 14:34:46','2021-04-07 14:34:46'),(22,'subscriber_tracing Delete','subscriber_tracing_delete','POST','/delete/subscriber_tracing','2021-04-07 14:34:46','2021-04-07 14:34:46'),(23,'subscriber_tracing Export','subscriber_tracing_export','POST','/export/subscriber_tracing','2021-04-07 14:34:46','2021-04-07 14:34:46'),(24,'subscriber_tracing_config Query','subscriber_tracing_config_query','GET','/info/subscriber_tracing_config','2021-04-07 14:34:46','2021-04-07 14:34:46'),(25,'subscriber_tracing_config Show Edit Form Page','subscriber_tracing_config_show_edit','GET','/info/subscriber_tracing_config/edit','2021-04-07 14:34:46','2021-04-07 14:34:46'),(26,'subscriber_tracing_config Show Create Form Page','subscriber_tracing_config_show_create','GET','/info/subscriber_tracing_config/new','2021-04-07 14:34:46','2021-04-07 14:34:46'),(27,'subscriber_tracing_config Edit','subscriber_tracing_config_edit','POST','/edit/subscriber_tracing_config','2021-04-07 14:34:46','2021-04-07 14:34:46'),(28,'subscriber_tracing_config Create','subscriber_tracing_config_create','POST','/new/subscriber_tracing_config','2021-04-07 14:34:46','2021-04-07 14:34:46'),(29,'subscriber_tracing_config Delete','subscriber_tracing_config_delete','POST','/delete/subscriber_tracing_config','2021-04-07 14:34:46','2021-04-07 14:34:46'),(30,'subscriber_tracing_config Export','subscriber_tracing_config_export','POST','/export/subscriber_tracing_config','2021-04-07 14:34:46','2021-04-07 14:34:46'),(31,'sipmsg_report Query','sipmsg_report_query','GET','/info/sipmsg_report','2021-06-02 02:59:31','2021-06-02 02:59:31'),(32,'sipmsg_report Show Edit Form Page','sipmsg_report_show_edit','GET','/info/sipmsg_report/edit','2021-06-02 02:59:31','2021-06-02 02:59:31'),(33,'sipmsg_report Show Create Form Page','sipmsg_report_show_create','GET','/info/sipmsg_report/new','2021-06-02 02:59:31','2021-06-02 02:59:31'),(34,'sipmsg_report Edit','sipmsg_report_edit','POST','/edit/sipmsg_report','2021-06-02 02:59:31','2021-06-02 02:59:31'),(35,'sipmsg_report Create','sipmsg_report_create','POST','/new/sipmsg_report','2021-06-02 02:59:31','2021-06-02 02:59:31'),(36,'sipmsg_report Delete','sipmsg_report_delete','POST','/delete/sipmsg_report','2021-06-02 02:59:31','2021-06-02 02:59:31'),(37,'sipmsg_report Export','sipmsg_report_export','POST','/export/sipmsg_report','2021-06-02 02:59:31','2021-06-02 02:59:31');
/*!40000 ALTER TABLE `goadmin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_role_menu`
--

DROP TABLE IF EXISTS `goadmin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_role_menu` (
  `role_id` int(11) unsigned NOT NULL,
  `menu_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_role_menu`
--

LOCK TABLES `goadmin_role_menu` WRITE;
/*!40000 ALTER TABLE `goadmin_role_menu` DISABLE KEYS */;
INSERT INTO `goadmin_role_menu` VALUES (1,1,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(1,8,'2021-03-29 14:12:30','2021-03-29 14:12:30'),(2,8,'2021-03-29 14:12:30','2021-03-29 14:12:30'),(1,9,'2021-03-30 00:57:15','2021-03-30 00:57:15'),(2,9,'2021-03-30 00:57:15','2021-03-30 00:57:15'),(1,10,'2021-06-02 03:03:56','2021-06-02 03:03:56');
/*!40000 ALTER TABLE `goadmin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_role_permissions`
--

DROP TABLE IF EXISTS `goadmin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_role_permissions` (
  `role_id` int(11) unsigned NOT NULL,
  `permission_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  UNIQUE KEY `admin_role_permissions` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_role_permissions`
--

LOCK TABLES `goadmin_role_permissions` WRITE;
/*!40000 ALTER TABLE `goadmin_role_permissions` DISABLE KEYS */;
INSERT INTO `goadmin_role_permissions` VALUES (1,1,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(1,2,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,2,'2019-09-10 00:00:00','2019-09-10 00:00:00');
/*!40000 ALTER TABLE `goadmin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_role_users`
--

DROP TABLE IF EXISTS `goadmin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_role_users` (
  `role_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  UNIQUE KEY `admin_user_roles` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_role_users`
--

LOCK TABLES `goadmin_role_users` WRITE;
/*!40000 ALTER TABLE `goadmin_role_users` DISABLE KEYS */;
INSERT INTO `goadmin_role_users` VALUES (1,1,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,2,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,3,'2021-03-30 00:55:56','2021-03-30 00:55:56');
/*!40000 ALTER TABLE `goadmin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_roles`
--

DROP TABLE IF EXISTS `goadmin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_roles`
--

LOCK TABLES `goadmin_roles` WRITE;
/*!40000 ALTER TABLE `goadmin_roles` DISABLE KEYS */;
INSERT INTO `goadmin_roles` VALUES (1,'Administrator','administrator','2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,'Operator','operator','2019-09-10 00:00:00','2019-09-10 00:00:00');
/*!40000 ALTER TABLE `goadmin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_session`
--

DROP TABLE IF EXISTS `goadmin_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_session`
--

LOCK TABLES `goadmin_session` WRITE;
/*!40000 ALTER TABLE `goadmin_session` DISABLE KEYS */;
INSERT INTO `goadmin_session` VALUES (83,'3fab9c2b-c2e5-45f9-93b7-4e131b78295d','{\"user_id\":1}','2021-06-02 03:02:05','2021-06-02 03:02:05'),(84,'71b86d88-5778-49c5-beb0-a32a31de8a41','__csrf_token__','2021-06-02 03:02:58','2021-06-02 03:02:58'),(86,'817e193d-12a8-4ad5-856b-cbc8c8556095','__csrf_token__','2021-06-02 03:03:56','2021-06-02 03:03:56'),(87,'98cc46c6-e834-4b50-b7ee-1af0f46247a2','__csrf_token__','2021-06-02 03:04:00','2021-06-02 03:04:00'),(88,'b3302553-7666-4a8f-9fc7-4c2a96061abc','__csrf_token__','2021-06-02 03:35:14','2021-06-02 03:35:14'),(89,'e3c0e3b5-8a03-46ff-83ee-b85f916bbc9b','__csrf_token__','2021-06-02 03:36:31','2021-06-02 03:36:31'),(90,'c75d0db2-3374-41a2-9e5b-0ed5b13dd7ab','__csrf_token__','2021-06-02 03:37:52','2021-06-02 03:37:52'),(91,'2ada2fa9-efb0-4d43-aca1-4f80750c3179','__csrf_token__','2021-06-02 03:44:47','2021-06-02 03:44:47'),(92,'34f2cc0c-9681-46d0-ae32-1be389a8d2f2','__csrf_token__','2021-06-02 03:45:10','2021-06-02 03:45:10'),(94,'5b7f1a24-e283-414d-9d07-a3c68cfb2d47','__csrf_token__','2021-06-02 04:36:40','2021-06-02 04:36:40'),(95,'4d49fcd9-cbac-4092-9217-c346a0038019','__csrf_token__','2021-06-02 04:36:43','2021-06-02 04:36:43'),(96,'9265840f-51a0-4d47-987d-9964b19ab0ae','__csrf_token__','2021-06-02 04:36:56','2021-06-02 04:36:56'),(97,'d92850c0-f456-4eca-8c04-535edd87e3c0','__csrf_token__','2021-06-02 04:37:12','2021-06-02 04:37:12');
/*!40000 ALTER TABLE `goadmin_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_site`
--

DROP TABLE IF EXISTS `goadmin_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_site` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_site`
--

LOCK TABLES `goadmin_site` WRITE;
/*!40000 ALTER TABLE `goadmin_site` DISABLE KEYS */;
INSERT INTO `goadmin_site` VALUES (1,'prohibit_config_modification','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(2,'language','en',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(3,'animation_delay','0.00',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(4,'logger_encoder_time_key','ts',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(5,'logger_encoder_message_key','msg',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(6,'logger_encoder_encoding','console',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(7,'no_limit_login_ip','true',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(8,'hide_tool_entrance','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(9,'hide_plugin_entrance','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(10,'index_url','/',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(11,'login_url','/login',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(12,'open_admin_api','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(13,'footer_info','<b>All right reserved Nokia</b>            \r\n    \r\n    ',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(14,'custom_403_html','',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(15,'exclude_theme_components','null',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(16,'logger_encoder_stacktrace_key','stacktrace',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(17,'logger_encoder_level','capitalColor',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(18,'site_off','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(19,'mini_logo','        <b>C</b>T\r\n    ',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(20,'logger_rotate_max_size','10',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(21,'hide_config_center_entrance','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(22,'go_mod_file_path','',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(23,'title','Call Tracing System',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(24,'logger_rotate_max_backups','5',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(25,'logger_rotate_max_age','30',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(26,'logger_rotate_compress','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(27,'logger_encoder_caller_key','caller',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(28,'logger_level','0',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(29,'login_title','Subscriber Tracing System',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(30,'hide_app_info_entrance','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(31,'domain','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(32,'access_log_path','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(33,'custom_foot_html','<b>All right reserved Nokia</b>    \r\n    ',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(34,'custom_500_html','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(35,'debug','true',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(36,'env','prod',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(37,'animation_duration','0.00',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(38,'access_assets_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(39,'login_logo','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(40,'info_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(41,'theme','adminlte',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(42,'logo','        <b>Subscriber</b>Tracing System',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(43,'access_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(44,'logger_encoder_level_key','level',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(45,'info_log_path','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(46,'logger_encoder_duration','string',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(47,'app_id','LYpumSSAFz7o',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(48,'url_prefix','admin',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(49,'session_life_time','72000',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(50,'auth_user_table','goadmin_users',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(51,'operation_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(52,'error_log_path','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(53,'logger_encoder_caller','full',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(54,'file_upload_engine','{\"name\":\"local\"}',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(55,'bootstrap_file_path','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(56,'hide_visitor_user_center_entrance','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(57,'allow_del_operation_log','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(58,'logger_encoder_name_key','logger',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(59,'custom_head_html','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(60,'asset_url','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(61,'asset_root_path','./public/',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(62,'sql_log','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(63,'color_scheme','skin-black',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(64,'extra','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(65,'animation_type','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(66,'custom_404_html','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(67,'error_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(68,'logger_encoder_time','iso8601',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12');
/*!40000 ALTER TABLE `goadmin_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_user_permissions`
--

DROP TABLE IF EXISTS `goadmin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_user_permissions` (
  `user_id` int(11) unsigned NOT NULL,
  `permission_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  UNIQUE KEY `admin_user_permissions` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_user_permissions`
--

LOCK TABLES `goadmin_user_permissions` WRITE;
/*!40000 ALTER TABLE `goadmin_user_permissions` DISABLE KEYS */;
INSERT INTO `goadmin_user_permissions` VALUES (1,1,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,2,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(3,3,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,4,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,5,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,6,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,7,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,8,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,9,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,10,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,11,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,12,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,13,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,14,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,15,'2021-03-30 00:55:56','2021-03-30 00:55:56'),(3,16,'2021-03-30 00:55:56','2021-03-30 00:55:56');
/*!40000 ALTER TABLE `goadmin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goadmin_users`
--

DROP TABLE IF EXISTS `goadmin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goadmin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_users`
--

LOCK TABLES `goadmin_users` WRITE;
/*!40000 ALTER TABLE `goadmin_users` DISABLE KEYS */;
INSERT INTO `goadmin_users` VALUES (1,'admin','$2a$10$rwkAhRC7e3XKf4Yj3XRcnOCpoHcmKwFM84jKWDP4ugvojGHY.yjUa','admin','','tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh','2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,'operator','$2a$10$rVqkOzHjN2MdlEprRflb1eGP0oZXuSrbJLOmJagFsCd81YZm0bsh.','Operator','',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00');
/*!40000 ALTER TABLE `goadmin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipmsg_report`
--

DROP TABLE IF EXISTS `sipmsg_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sipmsg_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipmsg_report`
--

LOCK TABLES `sipmsg_report` WRITE;
/*!40000 ALTER TABLE `sipmsg_report` DISABLE KEYS */;
INSERT INTO `sipmsg_report` VALUES (1,'2021-06-02 03:34:42','INVITE sip:User.0000@tas01.defult.svc.cluster.local SIP/2.0\r\nVia: SIP/2.0/TCP 11.0.0.10:15060;branch=z9hG4bK-3193-1-0\r\nFrom: <sip:User.0001@tas01.defult.svc.cluster.local>;tag=1\r\nTo: <sip:User.0000@tas01.defult.svc.cluster.local>\r\nCall-ID: 1-3193@11.0.0.10\r\nCSeq: 1 INVITE\r\nContact: <sip:User.0001@11.0.0.10:15060;transport=TCP>\r\nSupported: 100rel\r\nRoute: <sip:+16959000000:15306;role=anch;lr;transport=udp>\r\nP-Asserted-Identity: <sip:User.0001@tas01.defult.svc.cluster.local>\r\nAllow: UPDATE,INVITE,ACK,CANCEL,BYE,PRACK,REFER,MESSAGE,INFO\r\nMax-Forwards: 70\r\nContent-Type: application/sdp\r\nContent-Length:  127\r\n\r\nv=0\r\no=PCTEL 256 2 IN IP4 11.0.0.10\r\nc=IN IP4 11.0.0.10\r\nm=audio 4030 RTP/AVP 0 8\r\na=rtpmap:0 PCMU/8000\r\na=rtpmap:8 PCMU/8000\r\n'),(2,'2021-06-02 03:44:00','INVITE sip:User.0000@tas01.defult.svc.cluster.local SIP/2.0\r\nVia: SIP/2.0/TCP 11.0.0.10:15060;branch=z9hG4bK-3193-1-0\r\nFrom: <sip:User.0001@tas01.defult.svc.cluster.local>;tag=1\r\nTo: <sip:User.0000@tas01.defult.svc.cluster.local>\r\nCall-ID: 1-3193@11.0.0.10\r\nCSeq: 1 INVITE\r\nContact: <sip:User.0001@11.0.0.10:15060;transport=TCP>\r\nSupported: 100rel\r\nRoute: <sip:+16959000000:15306;role=anch;lr;transport=udp>\r\nP-Asserted-Identity: <sip:User.0001@tas01.defult.svc.cluster.local>\r\nAllow: UPDATE,INVITE,ACK,CANCEL,BYE,PRACK,REFER,MESSAGE,INFO\r\nMax-Forwards: 70\r\nContent-Type: application/sdp\r\nContent-Length:  127\r\n\r\nv=0\r\no=PCTEL 256 2 IN IP4 11.0.0.10\r\nc=IN IP4 11.0.0.10\r\nm=audio 4030 RTP/AVP 0 8\r\na=rtpmap:0 PCMU/8000\r\na=rtpmap:8 PCMU/8000\r\n');
/*!40000 ALTER TABLE `sipmsg_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber_tracing`
--

DROP TABLE IF EXISTS `subscriber_tracing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriber_tracing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace_reference_id` varchar(100) DEFAULT NULL,
  `supi` varchar(100) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `address` varchar(100) DEFAULT NULL,
  `message` varchar(10240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber_tracing`
--

LOCK TABLES `subscriber_tracing` WRITE;
/*!40000 ALTER TABLE `subscriber_tracing` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber_tracing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber_tracing_config`
--

DROP TABLE IF EXISTS `subscriber_tracing_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriber_tracing_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supi` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `call_trace_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber_tracing_config`
--

LOCK TABLES `subscriber_tracing_config` WRITE;
/*!40000 ALTER TABLE `subscriber_tracing_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber_tracing_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-02  4:54:12
