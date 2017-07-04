-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: keystone
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB-1ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_token_oauth2`
--

DROP TABLE IF EXISTS `access_token_oauth2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_token_oauth2` (
  `id` varchar(64) NOT NULL,
  `consumer_id` varchar(64) NOT NULL,
  `authorizing_user_id` varchar(64) DEFAULT NULL,
  `expires_at` varchar(64) NOT NULL,
  `scopes` text,
  `refresh_token` varchar(64) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `ix_access_token_oauth2_consumer_id` (`consumer_id`),
  CONSTRAINT `access_token_oauth2_ibfk_1` FOREIGN KEY (`consumer_id`) REFERENCES `consumer_oauth2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token_oauth2`
--

LOCK TABLES `access_token_oauth2` WRITE;
/*!40000 ALTER TABLE `access_token_oauth2` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_token_oauth2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `type` enum('UserProject','GroupProject','UserDomain','GroupDomain') NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `target_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  `inherited` tinyint(1) NOT NULL,
  PRIMARY KEY (`type`,`actor_id`,`target_id`,`role_id`),
  KEY `role_id` (`role_id`),
  KEY `ix_actor_id` (`actor_id`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES ('UserProject','hi','2bf6ec516ae44d47b089153b5216e235','d29be2304f394dcd8d4991b4e5dd5de9',0),('UserProject','hi','6d7c6f52bebf41b3bc1a1d11fbd8c6ea','d29be2304f394dcd8d4991b4e5dd5de9',0),('UserProject','idm_user','idm_project','91021e08762741a7a7887cde9f5f38e5',0),('UserProject','idm_user','idm_project','d29be2304f394dcd8d4991b4e5dd5de9',0),('UserDomain','hi','default','dcfe37146f7e4e2ab8824c9387e4977e',0);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization_code_oauth2`
--

DROP TABLE IF EXISTS `authorization_code_oauth2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorization_code_oauth2` (
  `code` varchar(64) NOT NULL,
  `consumer_id` varchar(64) NOT NULL,
  `authorizing_user_id` varchar(64) NOT NULL,
  `expires_at` varchar(64) NOT NULL,
  `scopes` text,
  `redirect_uri` varchar(256) NOT NULL,
  `state` varchar(256) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL,
  `extra` text,
  PRIMARY KEY (`code`),
  KEY `ix_authorization_code_oauth2_consumer_id` (`consumer_id`),
  CONSTRAINT `authorization_code_oauth2_ibfk_1` FOREIGN KEY (`consumer_id`) REFERENCES `consumer_oauth2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_code_oauth2`
--

LOCK TABLES `authorization_code_oauth2` WRITE;
/*!40000 ALTER TABLE `authorization_code_oauth2` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorization_code_oauth2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer_credentials_oauth2`
--

DROP TABLE IF EXISTS `consumer_credentials_oauth2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumer_credentials_oauth2` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `client_id` varchar(64) NOT NULL,
  `redirect_uri` varchar(256) NOT NULL,
  `response_type` enum('code','token') NOT NULL,
  `state` varchar(256) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `ix_consumer_credentials_oauth2_user_id` (`user_id`),
  KEY `ix_consumer_credentials_oauth2_client_id` (`client_id`),
  CONSTRAINT `consumer_credentials_oauth2_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `consumer_oauth2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer_credentials_oauth2`
--

LOCK TABLES `consumer_credentials_oauth2` WRITE;
/*!40000 ALTER TABLE `consumer_credentials_oauth2` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumer_credentials_oauth2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer_oauth2`
--

DROP TABLE IF EXISTS `consumer_oauth2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumer_oauth2` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  `secret` varchar(128) NOT NULL,
  `client_type` enum('confidential') NOT NULL,
  `redirect_uris` text NOT NULL,
  `grant_type` enum('authorization_code') NOT NULL,
  `response_type` enum('code','token') NOT NULL,
  `scopes` text,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer_oauth2`
--

LOCK TABLES `consumer_oauth2` WRITE;
/*!40000 ALTER TABLE `consumer_oauth2` DISABLE KEYS */;
INSERT INTO `consumer_oauth2` VALUES ('idm_admin_app','idm_admin_app','Application that acts as the IdM itself. To see the administration section of the web portal grant provider to a user in this application.','627260a5321944ca9a5541dc2a6e27e4','confidential','[]','authorization_code','code','[]','{\"is_default\": true}');
/*!40000 ALTER TABLE `consumer_oauth2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `blob` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_domain_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES ('default','Default',1,'{\"description\": \"Owns users and tenants (i.e. projects) available on Identity API v2.\"}');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint`
--

DROP TABLE IF EXISTS `endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endpoint` (
  `id` varchar(64) NOT NULL,
  `legacy_endpoint_id` varchar(64) DEFAULT NULL,
  `interface` varchar(8) NOT NULL,
  `service_id` varchar(64) NOT NULL,
  `url` text NOT NULL,
  `extra` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `region_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `fk_endpoint_region_id` (`region_id`),
  CONSTRAINT `endpoint_service_id_fkey` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `fk_endpoint_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint`
--

LOCK TABLES `endpoint` WRITE;
/*!40000 ALTER TABLE `endpoint` DISABLE KEYS */;
INSERT INTO `endpoint` VALUES ('36135c2934ad4f0e8a3586d6bf804ff5',NULL,'public','f0aa344cbc144f919f728a98959a2f3b','http://127.0.0.1:5000/v3/','{}',1,'Spain2'),('8d1cd5f081ce4e7880bae1b413ea3744',NULL,'internal','f0aa344cbc144f919f728a98959a2f3b','http://127.0.0.1:35357/v3/','{}',1,'Spain2'),('c607fcfda39342d191a1c0b41f288049',NULL,'admin','f0aa344cbc144f919f728a98959a2f3b','http://127.0.0.1:35357/v3/','{}',1,'Spain2');
/*!40000 ALTER TABLE `endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint_group`
--

DROP TABLE IF EXISTS `endpoint_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endpoint_group` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `filters` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint_group`
--

LOCK TABLES `endpoint_group` WRITE;
/*!40000 ALTER TABLE `endpoint_group` DISABLE KEYS */;
INSERT INTO `endpoint_group` VALUES ('4886cf2d65f046cfb3e11653b1cdebf5','keystone Identity Group',NULL,'{\"service_id\": \"f0aa344cbc144f919f728a98959a2f3b\"}'),('bee74c9298dc4affaf0eec1dbf44e54b','Spain2 Region Group',NULL,'{\"region_id\": \"Spain2\"}');
/*!40000 ALTER TABLE `endpoint_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` varchar(64) NOT NULL,
  `domain_id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  `extra` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_group_name_domain_id` (`domain_id`,`name`),
  CONSTRAINT `fk_group_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_mapping`
--

DROP TABLE IF EXISTS `id_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `id_mapping` (
  `public_id` varchar(64) NOT NULL,
  `domain_id` varchar(64) NOT NULL,
  `local_id` varchar(64) NOT NULL,
  `entity_type` enum('user','group') NOT NULL,
  PRIMARY KEY (`public_id`),
  UNIQUE KEY `domain_id` (`domain_id`,`local_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_mapping`
--

LOCK TABLES `id_mapping` WRITE;
/*!40000 ALTER TABLE `id_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `id_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrate_version`
--

DROP TABLE IF EXISTS `migrate_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrate_version` (
  `repository_id` varchar(250) NOT NULL,
  `repository_path` mediumtext,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`repository_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrate_version`
--

LOCK TABLES `migrate_version` WRITE;
/*!40000 ALTER TABLE `migrate_version` DISABLE KEYS */;
INSERT INTO `migrate_version` VALUES ('endpoint_filter','/keystone/keystone/contrib/endpoint_filter/migrate_repo',2),('keystone','/keystone/keystone/common/sql/migrate_repo',61),('oauth2','/keystone/keystone/contrib/oauth2/migrate_repo',10),('revoke','/keystone/keystone/contrib/revoke/migrate_repo',2),('roles','/keystone/keystone/contrib/roles/migrate_repo',9),('two_factor_auth','/keystone/keystone/contrib/two_factor_auth/migrate_repo',2),('user_registration','/keystone/keystone/contrib/user_registration/migrate_repo',1);
/*!40000 ALTER TABLE `migrate_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_fiware`
--

DROP TABLE IF EXISTS `permission_fiware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_fiware` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `is_internal` tinyint(1) NOT NULL,
  `application_id` varchar(64) NOT NULL,
  `action` varchar(10) DEFAULT NULL,
  `resource` varchar(256) DEFAULT NULL,
  `xml` text,
  PRIMARY KEY (`id`),
  KEY `ix_permission_fiware_application_id` (`application_id`),
  CONSTRAINT `permission_fiware_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `consumer_oauth2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_fiware`
--

LOCK TABLES `permission_fiware` WRITE;
/*!40000 ALTER TABLE `permission_fiware` DISABLE KEYS */;
INSERT INTO `permission_fiware` VALUES ('get-assign-internal-roles','Get and assign all internal application roles',1,'idm_admin_app',NULL,NULL,NULL),('get-assign-public-owned-roles','Get and assign only public owned roles',1,'idm_admin_app',NULL,NULL,NULL),('get-assign-public-roles','Get and assign all public application roles',1,'idm_admin_app',NULL,NULL,NULL),('manage-application','Manage the application',1,'idm_admin_app',NULL,NULL,NULL),('manage-authorizations','Manage Authorizations',1,'idm_admin_app',NULL,NULL,NULL),('manage-roles','Manage roles',1,'idm_admin_app',NULL,NULL,NULL);
/*!40000 ALTER TABLE `permission_fiware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy` (
  `id` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `blob` text NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `extra` text,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `domain_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_project_name_domain_id` (`domain_id`,`name`),
  CONSTRAINT `fk_project_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('2bf6ec516ae44d47b089153b5216e235','hi cloud','{\"is_cloud_project\": true}','This organization is intended to be used in the cloud environment. As long as you are a trial or community user this organization will be authorized as purchaser in the Cloud Application.',1,'default'),('6d7c6f52bebf41b3bc1a1d11fbd8c6ea','hi','{\"is_default\": true}','',1,'default'),('idm_project','idm','{\"is_default\": true}','',1,'default');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_endpoint`
--

DROP TABLE IF EXISTS `project_endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_endpoint` (
  `endpoint_id` varchar(64) NOT NULL,
  `project_id` varchar(64) NOT NULL,
  PRIMARY KEY (`endpoint_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_endpoint`
--

LOCK TABLES `project_endpoint` WRITE;
/*!40000 ALTER TABLE `project_endpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_endpoint_group`
--

DROP TABLE IF EXISTS `project_endpoint_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_endpoint_group` (
  `endpoint_group_id` varchar(64) NOT NULL,
  `project_id` varchar(64) NOT NULL,
  PRIMARY KEY (`endpoint_group_id`,`project_id`),
  CONSTRAINT `project_endpoint_group_ibfk_1` FOREIGN KEY (`endpoint_group_id`) REFERENCES `endpoint_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_endpoint_group`
--

LOCK TABLES `project_endpoint_group` WRITE;
/*!40000 ALTER TABLE `project_endpoint_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_endpoint_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `parent_region_id` varchar(255) DEFAULT NULL,
  `extra` text,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('Spain2','',NULL,'{}',NULL);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revocation_event`
--

DROP TABLE IF EXISTS `revocation_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revocation_event` (
  `id` varchar(64) NOT NULL,
  `domain_id` varchar(64) DEFAULT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  `trust_id` varchar(64) DEFAULT NULL,
  `consumer_id` varchar(64) DEFAULT NULL,
  `access_token_id` varchar(64) DEFAULT NULL,
  `issued_before` datetime NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `revoked_at` datetime NOT NULL,
  `audit_id` varchar(32) DEFAULT NULL,
  `audit_chain_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_revocation_event_revoked_at` (`revoked_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revocation_event`
--

LOCK TABLES `revocation_event` WRITE;
/*!40000 ALTER TABLE `revocation_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `revocation_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_role_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('44973efb4ac34cb2a78010d7949551cc','member','{}'),('6febbae5936f4f459168df1033a4aa48','trial','{\"is_default\": true}'),('91021e08762741a7a7887cde9f5f38e5','admin','{\"is_default\": true}'),('cd8cf324082444dba31893f571ccd00f','community','{\"is_default\": true}'),('d29be2304f394dcd8d4991b4e5dd5de9','owner','{}'),('dcfe37146f7e4e2ab8824c9387e4977e','basic','{\"is_default\": true}');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_fiware`
--

DROP TABLE IF EXISTS `role_fiware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_fiware` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `is_internal` tinyint(1) NOT NULL,
  `application_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_role_fiware_application_id` (`application_id`),
  CONSTRAINT `role_fiware_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `consumer_oauth2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_fiware`
--

LOCK TABLES `role_fiware` WRITE;
/*!40000 ALTER TABLE `role_fiware` DISABLE KEYS */;
INSERT INTO `role_fiware` VALUES ('provider','Provider',1,'idm_admin_app'),('purchaser','Purchaser',1,'idm_admin_app');
/*!40000 ALTER TABLE `role_fiware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_organization_fiware`
--

DROP TABLE IF EXISTS `role_organization_fiware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_organization_fiware` (
  `role_id` varchar(64) DEFAULT NULL,
  `organization_id` varchar(64) DEFAULT NULL,
  `application_id` varchar(64) DEFAULT NULL,
  KEY `role_id` (`role_id`),
  KEY `application_id` (`application_id`),
  KEY `role_organization_fiware_ibfk_3` (`organization_id`),
  CONSTRAINT `role_organization_fiware_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_fiware` (`id`),
  CONSTRAINT `role_organization_fiware_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_organization_fiware_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_organization_fiware`
--

LOCK TABLES `role_organization_fiware` WRITE;
/*!40000 ALTER TABLE `role_organization_fiware` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_organization_fiware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission_fiware`
--

DROP TABLE IF EXISTS `role_permission_fiware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission_fiware` (
  `role_id` varchar(64) DEFAULT NULL,
  `permission_id` varchar(64) DEFAULT NULL,
  KEY `role_permission_fiware_ibfk_1` (`role_id`),
  KEY `role_permission_fiware_ibfk_2` (`permission_id`),
  CONSTRAINT `role_permission_fiware_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_fiware` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permission_fiware_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission_fiware` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission_fiware`
--

LOCK TABLES `role_permission_fiware` WRITE;
/*!40000 ALTER TABLE `role_permission_fiware` DISABLE KEYS */;
INSERT INTO `role_permission_fiware` VALUES ('provider','get-assign-internal-roles'),('provider','manage-application'),('provider','manage-roles'),('provider','get-assign-public-roles'),('provider','manage-authorizations'),('provider','get-assign-public-owned-roles'),('provider','manage-authorizations'),('provider','get-assign-public-owned-roles'),('purchaser','get-assign-public-roles'),('provider','manage-authorizations'),('provider','get-assign-public-owned-roles'),('purchaser','get-assign-public-roles');
/*!40000 ALTER TABLE `role_permission_fiware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user_fiware`
--

DROP TABLE IF EXISTS `role_user_fiware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user_fiware` (
  `role_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `organization_id` varchar(64) DEFAULT NULL,
  `application_id` varchar(64) DEFAULT NULL,
  KEY `organization_id` (`organization_id`),
  KEY `role_user_fiware_ibfk_3` (`application_id`),
  KEY `role_user_fiware_ibfk_2` (`user_id`),
  KEY `role_user_fiware_ibfk_1` (`role_id`),
  CONSTRAINT `role_user_fiware_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_fiware` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_fiware_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_fiware_ibfk_3` FOREIGN KEY (`application_id`) REFERENCES `consumer_oauth2` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_fiware_ibfk_4` FOREIGN KEY (`application_id`) REFERENCES `consumer_oauth2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user_fiware`
--

LOCK TABLES `role_user_fiware` WRITE;
/*!40000 ALTER TABLE `role_user_fiware` DISABLE KEYS */;
INSERT INTO `role_user_fiware` VALUES ('provider','idm_user','idm_project','idm_admin_app'),('provider','idm_user','idm_project','idm_admin_app');
/*!40000 ALTER TABLE `role_user_fiware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` varchar(64) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `extra` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES ('f0aa344cbc144f919f728a98959a2f3b','identity','{\"name\": \"keystone\"}',1);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` varchar(64) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text,
  `valid` tinyint(1) NOT NULL,
  `trust_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_token_expires` (`expires`),
  KEY `ix_token_expires_valid` (`expires`,`valid`),
  KEY `ix_token_user_id` (`user_id`),
  KEY `ix_token_trust_id` (`trust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trust`
--

DROP TABLE IF EXISTS `trust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trust` (
  `id` varchar(64) NOT NULL,
  `trustor_user_id` varchar(64) NOT NULL,
  `trustee_user_id` varchar(64) NOT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `impersonation` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `extra` text,
  `remaining_uses` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trust`
--

LOCK TABLES `trust` WRITE;
/*!40000 ALTER TABLE `trust` DISABLE KEYS */;
/*!40000 ALTER TABLE `trust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trust_role`
--

DROP TABLE IF EXISTS `trust_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trust_role` (
  `trust_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`trust_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trust_role`
--

LOCK TABLES `trust_role` WRITE;
/*!40000 ALTER TABLE `trust_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `trust_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor_auth`
--

DROP TABLE IF EXISTS `two_factor_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `two_factor_auth` (
  `user_id` varchar(64) NOT NULL,
  `two_factor_key` varchar(32) NOT NULL,
  `security_question` varchar(128) NOT NULL,
  `security_answer` varchar(128) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor_auth`
--

LOCK TABLES `two_factor_auth` WRITE;
/*!40000 ALTER TABLE `two_factor_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor_devices`
--

DROP TABLE IF EXISTS `two_factor_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `two_factor_devices` (
  `device_id` varchar(32) NOT NULL,
  `device_token` varchar(32) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  PRIMARY KEY (`device_id`,`device_token`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor_devices`
--

LOCK TABLES `two_factor_devices` WRITE;
/*!40000 ALTER TABLE `two_factor_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `extra` text,
  `password` varchar(128) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `domain_id` varchar(64) NOT NULL,
  `default_project_id` varchar(64) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_user_name_domain_id` (`domain_id`,`name`),
  CONSTRAINT `fk_user_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('hi','hi@21vianet.com','{\"password_changed_at\": \"2017-07-04\", \"cloud_project_id\": \"2bf6ec516ae44d47b089153b5216e235\", \"starters_tour_ended\": true}','$6$rounds=40000$do0XmhRsdScOnqRg$CYFHPC54AUqK0hoU4NrZCg2YpXREWJnM5Q3ItznDTvhydiDxktPqSHt9FwavzxVSXQ7KCRDnvhbP.oSw6raCF0',1,'default','6d7c6f52bebf41b3bc1a1d11fbd8c6ea','hi'),('idm_user','idm','{}','$6$rounds=40000$Mf6zrkR4Mg.jYCiy$tPZQOA7Iq5H8wZc31Qkjox6M1WTDjtfG7gifWAkvTGWfiFNFUMCZcBBlCArh4VSH3IRhPh/EpJafyCPKBYsIV0',1,'default','idm_project','idm');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_membership`
--

DROP TABLE IF EXISTS `user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_membership` (
  `user_id` varchar(64) NOT NULL,
  `group_id` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `fk_user_group_membership_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  CONSTRAINT `fk_user_group_membership_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_membership`
--

LOCK TABLES `user_group_membership` WRITE;
/*!40000 ALTER TABLE `user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_registration_activation_profile`
--

DROP TABLE IF EXISTS `user_registration_activation_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_registration_activation_profile` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `project_id` varchar(64) NOT NULL,
  `cloud_project_id` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `activation_key` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_user_registration_activation_profile_user_id` (`user_id`),
  KEY `ix_user_registration_activation_profile_project_id` (`project_id`),
  KEY `ix_user_registration_activation_profile_activation_key` (`activation_key`),
  KEY `ix_user_registration_activation_profile_cloud_project_id` (`cloud_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_registration_activation_profile`
--

LOCK TABLES `user_registration_activation_profile` WRITE;
/*!40000 ALTER TABLE `user_registration_activation_profile` DISABLE KEYS */;
INSERT INTO `user_registration_activation_profile` VALUES ('c74360800cc64c58873850ab9fdb7cb1','hi','6d7c6f52bebf41b3bc1a1d11fbd8c6ea','2bf6ec516ae44d47b089153b5216e235','2017-07-04 11:25:16','a345afd33fcb4af392bc1edb77863815');
/*!40000 ALTER TABLE `user_registration_activation_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_registration_reset_profile`
--

DROP TABLE IF EXISTS `user_registration_reset_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_registration_reset_profile` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `reset_token` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_user_registration_reset_profile_user_id` (`user_id`),
  KEY `ix_user_registration_reset_profile_reset_token` (`reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_registration_reset_profile`
--

LOCK TABLES `user_registration_reset_profile` WRITE;
/*!40000 ALTER TABLE `user_registration_reset_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_registration_reset_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-04  3:49:39
