-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: call_trace
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
-- Table structure for table `call_trace`
--

DROP TABLE IF EXISTS `call_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_trace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace_reference_id` varchar(100) DEFAULT NULL,
  `public_id` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `message` varchar(10240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_trace`
--

LOCK TABLES `call_trace` WRITE;
/*!40000 ALTER TABLE `call_trace` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_trace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_trace_config`
--

DROP TABLE IF EXISTS `call_trace_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_trace_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `call_trace_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_trace_config`
--

LOCK TABLES `call_trace_config` WRITE;
/*!40000 ALTER TABLE `call_trace_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `call_trace_config` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_menu`
--

LOCK TABLES `goadmin_menu` WRITE;
/*!40000 ALTER TABLE `goadmin_menu` DISABLE KEYS */;
INSERT INTO `goadmin_menu` VALUES (1,0,1,3,'Admin','fa-tasks','',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,1,1,3,'Users','fa-users','/info/manager',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(3,1,1,4,'Roles','fa-user','/info/roles',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(4,1,1,5,'Permission','fa-ban','/info/permission',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(5,1,1,6,'Menu','fa-bars','/menu',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(6,1,1,7,'Operation log','fa-history','/info/op',NULL,'',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(8,0,0,1,'Call Trace Configuration','fa-bars','/info/call_trace_config','','',NULL,'2021-03-29 08:31:55','2021-03-29 22:12:30'),(9,0,0,2,'Call Trace','fa-bar-chart','/info/call_trace','','',NULL,'2021-03-29 14:12:21','2021-03-30 08:57:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_operation_log`
--

LOCK TABLES `goadmin_operation_log` WRITE;
/*!40000 ALTER TABLE `goadmin_operation_log` DISABLE KEYS */;
INSERT INTO `goadmin_operation_log` VALUES (1,1,'/admin','GET','::1','','2021-03-29 08:30:06','2021-03-29 08:30:06'),(2,1,'/admin','GET','::1','','2021-03-29 08:30:13','2021-03-29 08:30:13'),(3,1,'/admin/menu','GET','::1','','2021-03-29 08:30:53','2021-03-29 08:30:53'),(4,1,'/admin/menu/new','POST','::1','{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"99f5d8d3-8143-4477-bcd6-e9b192d490e8\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"call-trace-configuration\"],\"uri\":[\"/info/call-trace\"]}','2021-03-29 08:31:55','2021-03-29 08:31:55'),(5,1,'/admin/menu','GET','::1','','2021-03-29 08:32:12','2021-03-29 08:32:12'),(6,1,'/admin/info/call-trace','GET','::1','','2021-03-29 08:32:15','2021-03-29 08:32:15'),(7,1,'/admin','GET','::1','','2021-03-29 08:33:26','2021-03-29 08:33:26'),(8,1,'/admin/menu','GET','::1','','2021-03-29 08:33:30','2021-03-29 08:33:30'),(9,1,'/admin/menu/edit/show','GET','::1','','2021-03-29 08:33:32','2021-03-29 08:33:32'),(10,1,'/admin/menu/edit','POST','::1','{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"1cf34195-5a40-4df5-a671-9aac16002c15\"],\"created_at\":[\"2021-03-29 08:31:55\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"id\":[\"8\"],\"parent_id\":[\"0\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"call-trace-configuration\"],\"updated_at\":[\"2021-03-29 08:31:55\"],\"uri\":[\"/info/call_trace\"]}','2021-03-29 08:33:39','2021-03-29 08:33:39'),(11,1,'/admin/menu','GET','::1','','2021-03-29 08:33:43','2021-03-29 08:33:43'),(12,1,'/admin/info/call_trace','GET','::1','','2021-03-29 08:33:45','2021-03-29 08:33:45'),(13,1,'/admin/info/call_trace','GET','::1','','2021-03-29 08:36:05','2021-03-29 08:36:05'),(14,1,'/admin/info/call_trace','GET','::1','','2021-03-29 08:36:08','2021-03-29 08:36:08'),(15,1,'/admin/info/call_trace','GET','::1','','2021-03-29 08:40:18','2021-03-29 08:40:18'),(16,1,'/admin','GET','::1','','2021-03-29 08:40:27','2021-03-29 08:40:27'),(17,1,'/admin/info/call_trace','GET','::1','','2021-03-29 08:40:29','2021-03-29 08:40:29'),(18,1,'/admin/info/call_trace','GET','::1','','2021-03-29 08:49:04','2021-03-29 08:49:04'),(19,1,'/admin/info/call_trace/new','GET','::1','','2021-03-29 08:49:15','2021-03-29 08:49:15'),(20,1,'/admin/new/call_trace','POST','::1','{\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"e1226a62-02a0-45c9-a119-97c402c0b1b2\"],\"id\":[\"\"],\"public_id\":[\"sips:felix.du@nokia-sbell.com\"]}','2021-03-29 08:49:35','2021-03-29 08:49:35'),(21,1,'/admin/info/call_trace/detail','GET','::1','','2021-03-29 08:50:03','2021-03-29 08:50:03'),(22,1,'/admin/info/call_trace','GET','::1','','2021-03-29 08:50:06','2021-03-29 08:50:06'),(23,1,'/admin','GET','10.158.100.9','','2021-03-29 08:54:57','2021-03-29 08:54:57'),(24,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 08:55:00','2021-03-29 08:55:00'),(25,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 08:56:49','2021-03-29 08:56:49'),(26,1,'/admin/info/call_trace/new','GET','10.158.100.9','','2021-03-29 08:56:51','2021-03-29 08:56:51'),(27,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 08:56:54','2021-03-29 08:56:54'),(28,1,'/admin/info/call_trace/edit','GET','10.158.100.9','','2021-03-29 08:57:52','2021-03-29 08:57:52'),(29,1,'/admin/edit/call_trace','POST','10.158.100.9','{\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"bc1d2585-b99c-4d90-8f73-aef0ca555a11\"],\"id\":[\"2\"],\"public_id\":[\"sips:felix.du@nokia-sbell.comm\"]}','2021-03-29 08:57:58','2021-03-29 08:57:58'),(30,1,'/admin/info/call_trace','GET','10.243.80.109','','2021-03-29 08:58:18','2021-03-29 08:58:18'),(31,1,'/admin/info/call_trace/edit','GET','10.243.80.109','','2021-03-29 08:58:45','2021-03-29 08:58:45'),(32,1,'/admin/edit/call_trace','POST','10.243.80.109','{\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"58eed9fa-59f5-483a-96c1-79664b736116\"],\"id\":[\"2\"],\"public_id\":[\"sips:felix.du@nokia-sbell.com\"]}','2021-03-29 08:58:54','2021-03-29 08:58:54'),(33,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 09:14:55','2021-03-29 09:14:55'),(34,1,'/admin/info/call_trace/edit','GET','10.158.100.9','','2021-03-29 09:15:07','2021-03-29 09:15:07'),(35,1,'/admin/edit/call_trace','POST','10.158.100.9','{\"__go_admin_post_result\":[\"\"],\"__go_admin_post_type\":[\"0\"],\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"f61da3d1-6a70-4a78-8d9a-99db1a4a4b87\"],\"id\":[\"1\"],\"public_id\":[\"sip:felix.du@nokia-sbell.com3\"]}','2021-03-29 09:15:13','2021-03-29 09:15:13'),(36,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 09:16:30','2021-03-29 09:16:30'),(37,1,'/admin/info/call_trace/edit','GET','10.158.100.9','','2021-03-29 09:16:44','2021-03-29 09:16:44'),(38,1,'/admin/edit/call_trace','POST','10.158.100.9','{\"__go_admin_post_result\":[\"\"],\"__go_admin_post_type\":[\"0\"],\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"a8ddc3b7-0f5e-4cf4-8a50-1df5acaa02e2\"],\"id\":[\"1\"],\"public_id\":[\"sip:felix.du@nokia-sbell.com\"]}','2021-03-29 09:16:48','2021-03-29 09:16:48'),(39,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 09:26:09','2021-03-29 09:26:09'),(40,1,'/admin/info/call_trace/edit','GET','10.158.100.9','','2021-03-29 09:26:11','2021-03-29 09:26:11'),(41,1,'/admin/edit/call_trace','POST','10.158.100.9','{\"__go_admin_post_result\":[\"\"],\"__go_admin_post_type\":[\"0\"],\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"84d84e3f-7f5e-467d-b7a2-4daba537285e\"],\"id\":[\"1\"],\"public_id\":[\"sip:felix.du@nokia-sbell.comm\"]}','2021-03-29 09:26:15','2021-03-29 09:26:15'),(42,1,'/admin/info/call_trace/edit','GET','10.158.100.9','','2021-03-29 09:26:42','2021-03-29 09:26:42'),(43,1,'/admin/edit/call_trace','POST','10.158.100.9','{\"__go_admin_post_result\":[\"\"],\"__go_admin_post_type\":[\"0\"],\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"2ab719f2-956b-4360-8ee9-f0a1ca01c834\"],\"id\":[\"1\"],\"public_id\":[\"sip:felix.du@nokia-sbell.commm\"]}','2021-03-29 09:26:45','2021-03-29 09:26:45'),(44,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 09:28:35','2021-03-29 09:28:35'),(45,1,'/admin/info/call_trace/edit','GET','10.158.100.9','','2021-03-29 09:28:41','2021-03-29 09:28:41'),(46,1,'/admin/edit/call_trace','POST','10.158.100.9','{\"__go_admin_post_result\":[\"\"],\"__go_admin_post_type\":[\"0\"],\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"90161acc-eab7-4855-8474-fc02cd08138a\"],\"id\":[\"1\"],\"public_id\":[\"sip:felix.du@nokia-sbell.commm\"]}','2021-03-29 09:28:45','2021-03-29 09:28:45'),(47,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 09:29:03','2021-03-29 09:29:03'),(48,1,'/admin/info/call_trace/edit','GET','10.158.100.9','','2021-03-29 09:37:34','2021-03-29 09:37:34'),(49,1,'/admin/edit/call_trace','POST','10.158.100.9','{\"__go_admin_post_result\":[\"\"],\"__go_admin_post_type\":[\"0\"],\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"3d1665be-8cd4-42e6-9351-e6ca23157b68\"],\"id\":[\"1\"],\"public_id\":[\"sip:felix.du@nokia-sbell.comm\"]}','2021-03-29 09:37:37','2021-03-29 09:37:37'),(50,1,'/admin/info/call_trace/edit','GET','10.158.100.9','','2021-03-29 09:39:02','2021-03-29 09:39:02'),(51,1,'/admin/edit/call_trace','POST','10.158.100.9','{\"__go_admin_post_result\":[\"\"],\"__go_admin_post_type\":[\"0\"],\"__go_admin_previous_\":[\"/admin/info/call_trace?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"46915497-e4d0-41c3-adda-099952fdc355\"],\"id\":[\"1\"],\"public_id\":[\"sip:felix.du@nokia-sbell.com\"]}','2021-03-29 09:39:06','2021-03-29 09:39:06'),(52,1,'/admin','GET','10.158.100.9','','2021-03-29 13:30:38','2021-03-29 13:30:38'),(53,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 13:30:40','2021-03-29 13:30:40'),(54,1,'/admin','GET','10.158.100.9','','2021-03-29 14:08:29','2021-03-29 14:08:29'),(55,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 14:08:33','2021-03-29 14:08:33'),(56,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-29 14:08:47','2021-03-29 14:08:47'),(57,1,'/admin/edit/site','POST','10.158.100.9','{\"__checkbox__debug\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"GoAdmin\"],\"logo\":[\"\\u003cb\\u003eGo\\u003c/b\\u003eAdmin\"],\"mini_logo\":[\"\\u003cb\\u003eG\\u003c/b\\u003eA\"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"GoAdmin\"]}','2021-03-29 14:08:55','2021-03-29 14:08:55'),(58,1,'/admin/edit/site','POST','10.158.100.9','{\"__checkbox__debug\":[\"on\"],\"__go_admin_previous_\":[\"/admin/info/site?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"f282db31-fda2-4976-bf95-37c795f8d1a4\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"GoAdmin\"],\"logo\":[\"\\u003cb\\u003eGo\\u003c/b\\u003eAdmin\"],\"mini_logo\":[\"\\u003cb\\u003eG\\u003c/b\\u003eA\"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"GoAdmin\"]}','2021-03-29 14:08:55','2021-03-29 14:08:55'),(59,1,'/admin/edit/site','POST','10.158.100.9','{\"__checkbox__debug\":[\"on\"],\"__go_admin_previous_\":[\"/admin/info/site?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"f282db31-fda2-4976-bf95-37c795f8d1a4\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"GoAdmin\"],\"logo\":[\"\\u003cb\\u003eGo\\u003c/b\\u003eAdmin\"],\"mini_logo\":[\"\\u003cb\\u003eG\\u003c/b\\u003eA\"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"GoAdmin\"]}','2021-03-29 14:09:03','2021-03-29 14:09:03'),(60,1,'/admin/edit/site','POST','10.158.100.9','{\"__checkbox__debug\":[\"on\"],\"__go_admin_previous_\":[\"/admin/info/site?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"f282db31-fda2-4976-bf95-37c795f8d1a4\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"GoAdmin\"],\"logo\":[\"\\u003cb\\u003eGo\\u003c/b\\u003eAdmin\"],\"mini_logo\":[\"\\u003cb\\u003eG\\u003c/b\\u003eA\"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"GoAdmin\"]}','2021-03-29 14:10:50','2021-03-29 14:10:50'),(61,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-29 14:11:04','2021-03-29 14:11:04'),(62,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 14:11:13','2021-03-29 14:11:13'),(63,1,'/admin/menu','GET','10.158.100.9','','2021-03-29 14:11:16','2021-03-29 14:11:16'),(64,1,'/admin/menu/edit/show','GET','10.158.100.9','','2021-03-29 14:11:19','2021-03-29 14:11:19'),(65,1,'/admin/menu/edit','POST','10.158.100.9','{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"2fa15d01-8b25-4c76-969c-4652618e1ee3\"],\"created_at\":[\"2021-03-29 08:31:55\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"id\":[\"8\"],\"parent_id\":[\"0\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"Call Trace Configuration\"],\"updated_at\":[\"2021-03-29 16:33:39\"],\"uri\":[\"/info/call_trace\"]}','2021-03-29 14:11:30','2021-03-29 14:11:30'),(66,1,'/admin/menu/delete','POST','10.158.100.9','','2021-03-29 14:11:41','2021-03-29 14:11:41'),(67,1,'/admin/menu','GET','10.158.100.9','','2021-03-29 14:11:42','2021-03-29 14:11:42'),(68,1,'/admin/menu/new','POST','10.158.100.9','{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"57f1ce35-7e41-419e-b14b-d5e9794a98f8\"],\"header\":[\"\"],\"icon\":[\"fa-bar-chart\"],\"parent_id\":[\"0\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"Call Trace\"],\"uri\":[\"/info/call_trace\"]}','2021-03-29 14:12:21','2021-03-29 14:12:21'),(69,1,'/admin/menu/edit/show','GET','10.158.100.9','','2021-03-29 14:12:24','2021-03-29 14:12:24'),(70,1,'/admin/menu/edit','POST','10.158.100.9','{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"584505a1-1af2-4304-b453-926ae24bc1fc\"],\"created_at\":[\"2021-03-29 08:31:55\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"id\":[\"8\"],\"parent_id\":[\"0\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"Call Trace Configuration\"],\"updated_at\":[\"2021-03-29 22:11:30\"],\"uri\":[\"/info/call_trace_config\"]}','2021-03-29 14:12:31','2021-03-29 14:12:31'),(71,1,'/admin/menu','GET','10.158.100.9','','2021-03-29 14:12:43','2021-03-29 14:12:43'),(72,1,'/admin','GET','10.158.100.9','','2021-03-29 14:12:49','2021-03-29 14:12:49'),(73,1,'/admin','GET','10.158.100.9','','2021-03-29 14:12:55','2021-03-29 14:12:55'),(74,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-29 14:12:57','2021-03-29 14:12:57'),(75,1,'/admin/menu','GET','10.158.100.9','','2021-03-29 14:13:03','2021-03-29 14:13:03'),(76,1,'/admin/menu/order','POST','10.158.100.9','','2021-03-29 14:13:13','2021-03-29 14:13:13'),(77,1,'/admin/menu','GET','10.158.100.9','','2021-03-29 14:13:13','2021-03-29 14:13:13'),(78,1,'/admin/menu','GET','10.158.100.9','','2021-03-29 14:13:18','2021-03-29 14:13:18'),(79,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-29 14:13:26','2021-03-29 14:13:26'),(80,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 14:13:29','2021-03-29 14:13:29'),(81,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-29 14:13:34','2021-03-29 14:13:34'),(82,1,'/admin','GET','10.158.100.9','','2021-03-29 16:49:41','2021-03-29 16:49:41'),(83,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 16:49:44','2021-03-29 16:49:44'),(84,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-29 17:00:35','2021-03-29 17:00:35'),(85,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-30 00:43:42','2021-03-30 00:43:42'),(86,1,'/admin/info/manager','GET','10.158.100.9','','2021-03-30 00:43:52','2021-03-30 00:43:52'),(87,1,'/admin/info/roles','GET','10.158.100.9','','2021-03-30 00:43:54','2021-03-30 00:43:54'),(88,1,'/admin/info/permission','GET','10.158.100.9','','2021-03-30 00:43:56','2021-03-30 00:43:56'),(89,1,'/admin/menu','GET','10.158.100.9','','2021-03-30 00:44:09','2021-03-30 00:44:09'),(90,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:44:19','2021-03-30 00:44:19'),(91,1,'/admin/edit/site','POST','10.158.100.9','{\"__checkbox__debug\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"Call Tracing System\"],\"logo\":[\"\\u003cb\\u003eGo\\u003c/b\\u003eAdmin\"],\"mini_logo\":[\"\\u003cb\\u003eG\\u003c/b\\u003eA\"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"Call Tracing System\"]}','2021-03-30 00:45:44','2021-03-30 00:45:44'),(92,1,'/admin/menu','GET','10.158.100.9','','2021-03-30 00:45:46','2021-03-30 00:45:46'),(93,1,'/admin/menu','GET','10.158.100.9','','2021-03-30 00:45:50','2021-03-30 00:45:50'),(94,1,'/admin/menu','GET','10.158.100.9','','2021-03-30 00:45:54','2021-03-30 00:45:54'),(95,1,'/admin','GET','10.158.100.9','','2021-03-30 00:46:04','2021-03-30 00:46:04'),(96,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 00:46:08','2021-03-30 00:46:08'),(97,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:46:11','2021-03-30 00:46:11'),(98,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:46:28','2021-03-30 00:46:28'),(99,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:46:29','2021-03-30 00:46:29'),(100,1,'/admin','GET','10.158.100.9','','2021-03-30 00:46:48','2021-03-30 00:46:48'),(101,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:46:51','2021-03-30 00:46:51'),(102,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:47:03','2021-03-30 00:47:03'),(103,1,'/admin/edit/site','POST','10.158.100.9','{\"__checkbox__debug\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"Call Tracing System\"],\"logo\":[\"        \\u003cb\\u003eCall\\u003c/b\\u003eTracing System\\n    \"],\"mini_logo\":[\"        \\u003cb\\u003eC\\u003c/b\\u003eT\\n    \"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"Call Tracing System\"]}','2021-03-30 00:47:50','2021-03-30 00:47:50'),(104,1,'/admin/info/site','GET','10.158.100.9','','2021-03-30 00:47:51','2021-03-30 00:47:51'),(105,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:47:51','2021-03-30 00:47:51'),(106,1,'/admin/info/site','GET','10.158.100.9','','2021-03-30 00:47:54','2021-03-30 00:47:54'),(107,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:47:54','2021-03-30 00:47:54'),(108,1,'/admin/edit/site','POST','10.158.100.9','{\"__checkbox__debug\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"All right reserved Nokia\\n    \"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"Call Tracing System\"],\"logo\":[\"        \\u003cb\\u003eCall\\u003c/b\\u003eTracing System\\r\\n    \"],\"mini_logo\":[\"        \\u003cb\\u003eC\\u003c/b\\u003eT\\r\\n    \"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"Call Tracing System\"]}','2021-03-30 00:49:03','2021-03-30 00:49:03'),(109,1,'/admin/info/site','GET','10.158.100.9','','2021-03-30 00:49:04','2021-03-30 00:49:04'),(110,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:49:04','2021-03-30 00:49:04'),(111,1,'/admin/info/site','GET','10.158.100.9','','2021-03-30 00:49:07','2021-03-30 00:49:07'),(112,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:49:07','2021-03-30 00:49:07'),(113,1,'/admin/edit/site','POST','10.158.100.9','{\"__checkbox__debug\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\\u003cb\\u003eAll right reserved Nokia\\u003c/b\\u003e    \\n    \"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\\n    \\n    \"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"Call Tracing System\"],\"logo\":[\"        \\u003cb\\u003eCall\\u003c/b\\u003eTracing System\\r\\n    \"],\"mini_logo\":[\"        \\u003cb\\u003eC\\u003c/b\\u003eT\\r\\n    \"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"Call Tracing System\"]}','2021-03-30 00:49:49','2021-03-30 00:49:49'),(114,1,'/admin/info/site','GET','10.158.100.9','','2021-03-30 00:49:50','2021-03-30 00:49:50'),(115,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:49:50','2021-03-30 00:49:50'),(116,1,'/admin/info/site','GET','10.158.100.9','','2021-03-30 00:49:52','2021-03-30 00:49:52'),(117,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:49:52','2021-03-30 00:49:52'),(118,1,'/admin/edit/site','POST','10.158.100.9','{\"__checkbox__debug\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"allow_del_operation_log\":[\"false\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_403_html\":[\"\"],\"custom_404_html\":[\"\"],\"custom_500_html\":[\"\"],\"custom_foot_html\":[\"\\u003cb\\u003eAll right reserved Nokia\\u003c/b\\u003e    \\r\\n    \"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"prod\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\"}\"],\"footer_info\":[\"\\u003cb\\u003eAll right reserved Nokia\\u003c/b\\u003e            \\n    \\n    \"],\"hide_app_info_entrance\":[\"false\"],\"hide_config_center_entrance\":[\"false\"],\"hide_plugin_entrance\":[\"false\"],\"hide_tool_entrance\":[\"false\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"en\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"Call Tracing System\"],\"logo\":[\"        \\u003cb\\u003eCall\\u003c/b\\u003eTracing System\\r\\n    \"],\"mini_logo\":[\"        \\u003cb\\u003eC\\u003c/b\\u003eT\\r\\n    \"],\"no_limit_login_ip\":[\"false\"],\"operation_log_off\":[\"false\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"Call Tracing System\"]}','2021-03-30 00:50:20','2021-03-30 00:50:20'),(119,1,'/admin/info/site','GET','10.158.100.9','','2021-03-30 00:50:22','2021-03-30 00:50:22'),(120,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:50:22','2021-03-30 00:50:22'),(121,1,'/admin/info/site','GET','10.158.100.9','','2021-03-30 00:50:23','2021-03-30 00:50:23'),(122,1,'/admin/info/site/edit','GET','10.158.100.9','','2021-03-30 00:50:23','2021-03-30 00:50:23'),(123,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 00:53:58','2021-03-30 00:53:58'),(124,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-30 00:54:07','2021-03-30 00:54:07'),(125,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 00:54:27','2021-03-30 00:54:27'),(126,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-30 00:54:29','2021-03-30 00:54:29'),(127,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 00:54:30','2021-03-30 00:54:30'),(128,1,'/admin/info/manager','GET','10.158.100.9','','2021-03-30 00:54:33','2021-03-30 00:54:33'),(129,1,'/admin/info/manager/new','GET','10.158.100.9','','2021-03-30 00:54:37','2021-03-30 00:54:37'),(130,1,'/admin/new/manager','POST','10.158.100.9','{\"__go_admin_previous_\":[\"/admin/info/manager?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"__go_admin_t_\":[\"23595faa-c12d-4f32-877d-06f96923e261\"],\"avatar\":[\"\"],\"avatar__change_flag\":[\"0\"],\"avatar__delete_flag\":[\"0\"],\"name\":[\"Felix Du\"],\"password\":[\"felixdu\"],\"password_again\":[\"felixdu\"],\"permission_id[]\":[\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\"],\"role_id[]\":[\"2\"],\"username\":[\"felixdu\"]}','2021-03-30 00:55:56','2021-03-30 00:55:56'),(131,1,'/admin/info/normal_manager/edit','GET','10.158.100.9','','2021-03-30 00:56:12','2021-03-30 00:56:12'),(132,1,'/admin/logout','GET','10.158.100.9','','2021-03-30 00:56:15','2021-03-30 00:56:15'),(133,3,'/admin','GET','10.158.100.9','','2021-03-30 00:56:21','2021-03-30 00:56:21'),(134,3,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 00:56:24','2021-03-30 00:56:24'),(135,3,'/admin/logout','GET','10.158.100.9','','2021-03-30 00:56:30','2021-03-30 00:56:30'),(136,1,'/admin','GET','10.158.100.9','','2021-03-30 00:56:34','2021-03-30 00:56:34'),(137,1,'/admin/info/manager','GET','10.158.100.9','','2021-03-30 00:56:38','2021-03-30 00:56:38'),(138,1,'/admin/info/manager/edit','GET','10.158.100.9','','2021-03-30 00:56:48','2021-03-30 00:56:48'),(139,1,'/admin/menu','GET','10.158.100.9','','2021-03-30 00:56:53','2021-03-30 00:56:53'),(140,1,'/admin/menu/edit/show','GET','10.158.100.9','','2021-03-30 00:56:57','2021-03-30 00:56:57'),(141,1,'/admin/info/manager','GET','10.158.100.9','','2021-03-30 00:57:01','2021-03-30 00:57:01'),(142,1,'/admin/menu','GET','10.158.100.9','','2021-03-30 00:57:03','2021-03-30 00:57:03'),(143,1,'/admin/menu/edit/show','GET','10.158.100.9','','2021-03-30 00:57:05','2021-03-30 00:57:05'),(144,1,'/admin/menu','GET','10.158.100.9','','2021-03-30 00:57:08','2021-03-30 00:57:08'),(145,1,'/admin/menu/edit/show','GET','10.158.100.9','','2021-03-30 00:57:10','2021-03-30 00:57:10'),(146,1,'/admin/menu/edit','POST','10.158.100.9','{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"01dd7862-10ab-4760-81dd-62fb743abf52\"],\"created_at\":[\"2021-03-29 14:12:21\"],\"header\":[\"\"],\"icon\":[\"fa-bar-chart\"],\"id\":[\"9\"],\"parent_id\":[\"0\"],\"plugin_name\":[\"\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"Call Trace\"],\"updated_at\":[\"2021-03-29 14:12:21\"],\"uri\":[\"/info/call_trace\"]}','2021-03-30 00:57:16','2021-03-30 00:57:16'),(147,1,'/admin/logout','GET','10.158.100.9','','2021-03-30 00:57:18','2021-03-30 00:57:18'),(148,3,'/admin','GET','10.158.100.9','','2021-03-30 00:57:22','2021-03-30 00:57:22'),(149,3,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 00:57:24','2021-03-30 00:57:24'),(150,3,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-30 00:57:26','2021-03-30 00:57:26'),(151,3,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 00:57:28','2021-03-30 00:57:28'),(152,3,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-30 01:00:12','2021-03-30 01:00:12'),(153,3,'/admin','GET','10.158.100.9','','2021-03-30 04:41:22','2021-03-30 04:41:22'),(154,3,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 04:41:24','2021-03-30 04:41:24'),(155,3,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-30 04:41:26','2021-03-30 04:41:26'),(156,3,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 04:41:34','2021-03-30 04:41:34'),(157,3,'/admin/export/call_trace_config','POST','10.158.100.9','','2021-03-30 04:41:49','2021-03-30 04:41:49'),(158,3,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-30 05:36:16','2021-03-30 05:36:16'),(159,3,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 05:36:53','2021-03-30 05:36:53'),(160,3,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-30 05:37:06','2021-03-30 05:37:06'),(161,3,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-03-30 05:37:19','2021-03-30 05:37:19'),(162,3,'/admin/info/call_trace','GET','10.158.100.9','','2021-03-30 05:37:52','2021-03-30 05:37:52'),(163,1,'/admin','GET','10.158.100.9','','2021-04-06 02:12:50','2021-04-06 02:12:50'),(164,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-04-06 02:12:52','2021-04-06 02:12:52'),(165,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-04-06 02:13:00','2021-04-06 02:13:00'),(166,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-04-06 02:13:01','2021-04-06 02:13:01'),(167,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-04-06 02:13:06','2021-04-06 02:13:06'),(168,1,'/admin','GET','10.158.100.9','','2021-04-06 03:15:15','2021-04-06 03:15:15'),(169,1,'/admin/logout','GET','10.158.100.9','','2021-04-06 03:15:26','2021-04-06 03:15:26'),(170,1,'/admin','GET','10.158.100.9','','2021-04-06 03:15:29','2021-04-06 03:15:29'),(171,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-04-06 03:15:31','2021-04-06 03:15:31'),(172,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-04-06 03:15:33','2021-04-06 03:15:33'),(173,1,'/admin/info/call_trace_config','GET','10.158.100.9','','2021-04-06 03:15:41','2021-04-06 03:15:41'),(174,1,'/admin/info/call_trace','GET','10.158.100.9','','2021-04-06 03:15:42','2021-04-06 03:15:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_permissions`
--

LOCK TABLES `goadmin_permissions` WRITE;
/*!40000 ALTER TABLE `goadmin_permissions` DISABLE KEYS */;
INSERT INTO `goadmin_permissions` VALUES (1,'All permission','*','','*','2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,'Dashboard','dashboard','GET,PUT,POST,DELETE','/','2019-09-10 00:00:00','2019-09-10 00:00:00'),(3,'call_trace Query','call_trace_query','GET','/info/call_trace','2021-03-29 08:21:20','2021-03-29 08:21:20'),(4,'call_trace Show Edit Form Page','call_trace_show_edit','GET','/info/call_trace/edit','2021-03-29 08:21:20','2021-03-29 08:21:20'),(5,'call_trace Show Create Form Page','call_trace_show_create','GET','/info/call_trace/new','2021-03-29 08:21:20','2021-03-29 08:21:20'),(6,'call_trace Edit','call_trace_edit','POST','/edit/call_trace','2021-03-29 08:21:20','2021-03-29 08:21:20'),(7,'call_trace Create','call_trace_create','POST','/new/call_trace','2021-03-29 08:21:20','2021-03-29 08:21:20'),(8,'call_trace Delete','call_trace_delete','POST','/delete/call_trace','2021-03-29 08:21:20','2021-03-29 08:21:20'),(9,'call_trace Export','call_trace_export','POST','/export/call_trace','2021-03-29 08:21:20','2021-03-29 08:21:20'),(10,'call_trace_config Query','call_trace_config_query','GET','/info/call_trace_config','2021-03-29 14:02:00','2021-03-29 14:02:00'),(11,'call_trace_config Show Edit Form Page','call_trace_config_show_edit','GET','/info/call_trace_config/edit','2021-03-29 14:02:00','2021-03-29 14:02:00'),(12,'call_trace_config Show Create Form Page','call_trace_config_show_create','GET','/info/call_trace_config/new','2021-03-29 14:02:00','2021-03-29 14:02:00'),(13,'call_trace_config Edit','call_trace_config_edit','POST','/edit/call_trace_config','2021-03-29 14:02:00','2021-03-29 14:02:00'),(14,'call_trace_config Create','call_trace_config_create','POST','/new/call_trace_config','2021-03-29 14:02:00','2021-03-29 14:02:00'),(15,'call_trace_config Delete','call_trace_config_delete','POST','/delete/call_trace_config','2021-03-29 14:02:00','2021-03-29 14:02:00'),(16,'call_trace_config Export','call_trace_config_export','POST','/export/call_trace_config','2021-03-29 14:02:00','2021-03-29 14:02:00');
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
INSERT INTO `goadmin_role_menu` VALUES (1,1,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(1,8,'2021-03-29 14:12:30','2021-03-29 14:12:30'),(2,8,'2021-03-29 14:12:30','2021-03-29 14:12:30'),(1,9,'2021-03-30 00:57:15','2021-03-30 00:57:15'),(2,9,'2021-03-30 00:57:15','2021-03-30 00:57:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goadmin_session`
--

LOCK TABLES `goadmin_session` WRITE;
/*!40000 ALTER TABLE `goadmin_session` DISABLE KEYS */;
INSERT INTO `goadmin_session` VALUES (76,'0d05fedb-cbd3-451c-91a8-813e1462ed64','{\"user_id\":1}','2021-04-06 03:15:26','2021-04-06 03:15:26');
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
INSERT INTO `goadmin_site` VALUES (1,'prohibit_config_modification','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(2,'language','en',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(3,'animation_delay','0.00',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(4,'logger_encoder_time_key','ts',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(5,'logger_encoder_message_key','msg',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(6,'logger_encoder_encoding','console',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(7,'no_limit_login_ip','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(8,'hide_tool_entrance','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(9,'hide_plugin_entrance','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(10,'index_url','/',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(11,'login_url','/login',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(12,'open_admin_api','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(13,'footer_info','<b>All right reserved Nokia</b>            \n    \n    ',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(14,'custom_403_html','',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(15,'exclude_theme_components','null',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(16,'logger_encoder_stacktrace_key','stacktrace',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(17,'logger_encoder_level','capitalColor',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(18,'site_off','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(19,'mini_logo','        <b>C</b>T\r\n    ',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(20,'logger_rotate_max_size','10',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(21,'hide_config_center_entrance','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(22,'go_mod_file_path','',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(23,'title','Call Tracing System',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(24,'logger_rotate_max_backups','5',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(25,'logger_rotate_max_age','30',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(26,'logger_rotate_compress','false',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(27,'logger_encoder_caller_key','caller',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(28,'logger_level','0',NULL,1,'2021-03-29 08:29:11','2021-03-29 08:29:11'),(29,'login_title','Call Tracing System',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(30,'hide_app_info_entrance','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(31,'domain','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(32,'access_log_path','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(33,'custom_foot_html','<b>All right reserved Nokia</b>    \r\n    ',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(34,'custom_500_html','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(35,'debug','true',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(36,'env','prod',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(37,'animation_duration','0.00',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(38,'access_assets_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(39,'login_logo','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(40,'info_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(41,'theme','adminlte',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(42,'logo','        <b>Call</b>Tracing System\r\n    ',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(43,'access_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(44,'logger_encoder_level_key','level',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(45,'info_log_path','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(46,'logger_encoder_duration','string',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(47,'app_id','LYpumSSAFz7o',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(48,'url_prefix','admin',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(49,'session_life_time','7200',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(50,'auth_user_table','goadmin_users',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(51,'operation_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(52,'error_log_path','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(53,'logger_encoder_caller','full',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(54,'file_upload_engine','{\"name\":\"local\"}',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(55,'bootstrap_file_path','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(56,'hide_visitor_user_center_entrance','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(57,'allow_del_operation_log','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(58,'logger_encoder_name_key','logger',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(59,'custom_head_html','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(60,'asset_url','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(61,'asset_root_path','./public/',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(62,'sql_log','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(63,'color_scheme','skin-black',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(64,'extra','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(65,'animation_type','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(66,'custom_404_html','',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(67,'error_log_off','false',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12'),(68,'logger_encoder_time','iso8601',NULL,1,'2021-03-29 08:29:12','2021-03-29 08:29:12');
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
INSERT INTO `goadmin_users` VALUES (1,'admin','$2a$10$ojIFDTT5re1Ba8c7EW5e9.rjL5O9y/jwSIlHinHCb0gwyTlOb.mYG','admin','','tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh','2019-09-10 00:00:00','2019-09-10 00:00:00'),(2,'operator','$2a$10$rVqkOzHjN2MdlEprRflb1eGP0oZXuSrbJLOmJagFsCd81YZm0bsh.','Operator','',NULL,'2019-09-10 00:00:00','2019-09-10 00:00:00'),(3,'felixdu','$2a$10$69YKiqdwUhcNRUSZOBIkWu7q8koN7M/7UywHh.U/fg0m4oR/ym44W','Felix Du','',NULL,'2021-03-30 00:55:56','2021-03-30 00:55:56');
/*!40000 ALTER TABLE `goadmin_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06  3:39:23
