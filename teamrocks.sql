/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.19 : Database - teamrocks
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cnpj` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8244AA3AC8C6906B` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `companies` */

insert  into `companies`(`id`,`name`,`cnpj`,`created_at`,`updated_at`) values (1,'Eduardo Eldorado','12345678',NULL,NULL);

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_companies` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA82C300271161D` (`id_companies`),
  CONSTRAINT `FK_BA82C300271161D` FOREIGN KEY (`id_companies`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employees` */

insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (1,1,'Eduardo',NULL,NULL);
insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (2,1,'Felipe',NULL,NULL);
insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (3,1,'Ingrid',NULL,NULL);
insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (4,1,'Neon',NULL,NULL);
insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (5,1,'Elias',NULL,NULL);
insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (6,1,'Andrei',NULL,NULL);
insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (7,1,'André',NULL,NULL);
insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (8,1,'Phellipe',NULL,NULL);

/*Table structure for table `employees_skills` */

DROP TABLE IF EXISTS `employees_skills`;

CREATE TABLE `employees_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_employees` int(11) DEFAULT NULL,
  `id_skills` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_297D0E53AB77F27` (`id_employees`),
  KEY `IDX_297D0E5F306A39D` (`id_skills`),
  CONSTRAINT `FK_297D0E53AB77F27` FOREIGN KEY (`id_employees`) REFERENCES `employees` (`id`),
  CONSTRAINT `FK_297D0E5F306A39D` FOREIGN KEY (`id_skills`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employees_skills` */

insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (1,1,1,NULL,NULL,1);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (2,1,2,NULL,NULL,1);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (3,1,3,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (4,1,4,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (5,1,5,NULL,NULL,1);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (6,2,1,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (7,2,2,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (8,2,3,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (9,2,4,NULL,NULL,1);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (10,2,5,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (11,3,1,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (12,3,2,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (13,3,3,NULL,NULL,1);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (14,3,4,NULL,NULL,1);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (15,3,5,NULL,NULL,1);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (16,4,1,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (17,4,2,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (18,5,3,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (19,6,4,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (20,7,5,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (21,8,1,NULL,NULL,3);

/*Table structure for table `managers` */

DROP TABLE IF EXISTS `managers`;

CREATE TABLE `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_companies` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A949E006271161D` (`id_companies`),
  CONSTRAINT `FK_A949E006271161D` FOREIGN KEY (`id_companies`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `managers` */

insert  into `managers`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (1,1,'Eduardo',NULL,NULL);

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_manager` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `deadline` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL COMMENT '0 = Inativo; 1 = Ativo; 2 = Finalizado',
  PRIMARY KEY (`id`),
  KEY `IDX_5C93B3A424B98CC9` (`id_manager`),
  CONSTRAINT `FK_5C93B3A424B98CC9` FOREIGN KEY (`id_manager`) REFERENCES `managers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `projects` */

insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (121,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-10-18 13:25:24','2017-10-18 13:25:24',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (122,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-10-18 14:52:57','2017-10-18 14:52:57',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (123,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-10-18 14:53:33','2017-10-18 14:53:33',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (124,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-10-18 15:06:57','2017-10-18 15:06:57',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (125,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-10-18 15:08:21','2017-10-18 15:08:21',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (126,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-11-07 17:53:33','2017-11-07 17:53:33',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (127,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-11-07 17:54:27','2017-11-07 17:54:27',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (128,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-11-07 17:54:57','2017-11-07 17:54:57',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (129,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-11-07 17:55:10','2017-11-07 17:55:10',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (130,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-11-07 17:55:36','2017-11-07 17:55:36',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (131,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-11-08 15:22:59','2017-11-08 15:22:59',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (132,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-11-08 15:27:18','2017-11-08 15:27:18',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (133,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-12-05 14:55:44','2017-12-05 14:55:44',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (134,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-12-05 16:09:41','2017-12-05 16:09:41',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (135,1,'Título do projeto','Descrição do projeto','1996-01-12 00:00:00','2017-12-06 14:15:58','2017-12-06 14:15:58',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (136,1,'Título do projeto','Descrição do projeto','2018-01-12 00:00:00','2017-12-06 14:16:17','2017-12-06 14:16:17',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (137,1,'Título do projeto','Descrição do projeto','2018-01-02 00:00:00','2017-12-13 10:27:38','2017-12-13 10:27:38',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (138,1,'Título do projeto','Descrição do projeto','2018-01-02 00:00:00','2017-12-13 11:14:29','2017-12-13 11:14:29',1);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (139,1,'Título do projeto','Descrição do projeto','2018-01-02 00:00:00','2017-12-13 11:16:02','2017-12-13 11:16:02',1);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (140,1,'Título do projeto','Descrição do projeto','2018-01-02 00:00:00','2017-12-13 17:34:20','2017-12-13 17:34:20',2);
insert  into `projects`(`id`,`id_manager`,`title`,`description`,`deadline`,`created_at`,`updated_at`,`status`) values (141,1,'Sistema gerenciador de gerenciamentos','Serviço disponibilizado para gerenciar','2018-01-02 00:00:00','2017-12-13 17:37:31','2017-12-13 17:37:31',1);

/*Table structure for table `projects_employees` */

DROP TABLE IF EXISTS `projects_employees`;

CREATE TABLE `projects_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_employees` int(11) DEFAULT NULL,
  `id_projects` int(11) DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_633E043F3AB77F27` (`id_employees`),
  KEY `IDX_633E043FC485F31` (`id_projects`),
  CONSTRAINT `FK_633E043F3AB77F27` FOREIGN KEY (`id_employees`) REFERENCES `employees` (`id`),
  CONSTRAINT `FK_633E043FC485F31` FOREIGN KEY (`id_projects`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `projects_employees` */

insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (83,2,121,0,'2017-10-18 13:25:24','2017-10-18 13:25:24');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (84,1,121,0,'2017-10-18 13:25:24','2017-10-18 13:25:24');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (85,2,122,0,'2017-10-18 14:52:57','2017-10-18 14:52:57');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (86,1,122,0,'2017-10-18 14:52:58','2017-10-18 14:52:58');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (87,2,123,0,'2017-10-18 14:53:33','2017-10-18 14:53:33');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (88,3,123,0,'2017-10-18 14:53:33','2017-10-18 14:53:33');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (89,1,123,0,'2017-10-18 14:53:34','2017-10-18 14:53:34');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (90,2,124,0,'2017-10-18 15:06:58','2017-10-18 15:06:58');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (91,3,124,0,'2017-10-18 15:06:58','2017-10-18 15:06:58');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (92,1,124,0,'2017-10-18 15:06:58','2017-10-18 15:06:58');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (93,2,125,0,'2017-10-18 15:08:21','2017-10-18 15:08:21');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (94,3,125,0,'2017-10-18 15:08:21','2017-10-18 15:08:21');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (95,1,125,0,'2017-10-18 15:08:21','2017-10-18 15:08:21');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (96,1,126,0,'2017-11-07 17:53:33','2017-11-07 17:53:33');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (97,3,126,0,'2017-11-07 17:53:33','2017-11-07 17:53:33');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (98,1,127,0,'2017-11-07 17:54:27','2017-11-07 17:54:27');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (99,3,127,0,'2017-11-07 17:54:27','2017-11-07 17:54:27');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (100,1,128,0,'2017-11-07 17:54:57','2017-11-07 17:54:57');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (101,3,128,0,'2017-11-07 17:54:57','2017-11-07 17:54:57');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (102,1,129,0,'2017-11-07 17:55:10','2017-11-07 17:55:10');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (103,3,129,0,'2017-11-07 17:55:10','2017-11-07 17:55:10');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (104,1,130,0,'2017-11-07 17:55:36','2017-11-07 17:55:36');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (105,3,130,0,'2017-11-07 17:55:36','2017-11-07 17:55:36');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (106,1,131,0,'2017-11-08 15:22:59','2017-11-08 15:22:59');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (107,3,131,0,'2017-11-08 15:22:59','2017-11-08 15:22:59');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (108,1,132,0,'2017-11-08 15:27:18','2017-11-08 15:27:18');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (109,2,132,0,'2017-11-08 15:27:18','2017-11-08 15:27:18');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (110,3,132,0,'2017-11-08 15:27:18','2017-11-08 15:27:18');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (111,1,133,0,'2017-12-05 14:55:45','2017-12-05 14:55:45');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (112,3,133,0,'2017-12-05 14:55:45','2017-12-05 14:55:45');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (113,1,134,0,'2017-12-05 16:09:42','2017-12-05 16:09:42');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (114,3,134,0,'2017-12-05 16:09:42','2017-12-05 16:09:42');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (115,1,135,0,'2017-12-06 14:15:58','2017-12-06 14:15:58');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (116,3,135,0,'2017-12-06 14:15:58','2017-12-06 14:15:58');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (117,1,136,0,'2017-12-06 14:16:17','2017-12-06 14:16:17');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (118,3,136,0,'2017-12-06 14:16:17','2017-12-06 14:16:17');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (119,1,137,0,'2017-12-13 10:27:38','2017-12-13 10:27:38');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (120,3,137,0,'2017-12-13 10:27:38','2017-12-13 10:27:38');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (121,4,138,0,'2017-12-13 11:14:30','2017-12-13 11:14:30');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (122,6,138,0,'2017-12-13 11:14:30','2017-12-13 11:14:30');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (123,5,139,0,'2017-12-13 11:16:02','2017-12-13 11:16:02');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (124,8,139,0,'2017-12-13 11:16:02','2017-12-13 11:16:02');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (125,1,140,0,'2017-12-13 17:34:21','2017-12-13 17:34:21');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (126,3,140,0,'2017-12-13 17:34:21','2017-12-13 17:34:21');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (127,1,141,0,'2017-12-13 17:37:32','2017-12-13 17:37:32');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (128,2,141,0,'2017-12-13 17:37:32','2017-12-13 17:37:32');
insert  into `projects_employees`(`id`,`id_employees`,`id_projects`,`level`,`created_at`,`updated_at`) values (129,3,141,0,'2017-12-13 17:37:32','2017-12-13 17:37:32');

/*Table structure for table `projects_employees_skills` */

DROP TABLE IF EXISTS `projects_employees_skills`;

CREATE TABLE `projects_employees_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_projects_employees` int(11) DEFAULT NULL,
  `id_skills` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DE3A3854E01CB690` (`id_projects_employees`),
  KEY `IDX_DE3A3854F306A39D` (`id_skills`),
  CONSTRAINT `FK_DE3A3854E01CB690` FOREIGN KEY (`id_projects_employees`) REFERENCES `projects_employees` (`id`),
  CONSTRAINT `FK_DE3A3854F306A39D` FOREIGN KEY (`id_skills`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `projects_employees_skills` */

insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (1,83,1,'2017-10-18 13:25:24','2017-10-18 13:25:24');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (2,83,3,'2017-10-18 13:25:24','2017-10-18 13:25:24');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (3,83,5,'2017-10-18 13:25:24','2017-10-18 13:25:24');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (4,84,2,'2017-10-18 13:25:24','2017-10-18 13:25:24');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (5,84,4,'2017-10-18 13:25:24','2017-10-18 13:25:24');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (6,85,1,'2017-10-18 14:52:57','2017-10-18 14:52:57');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (7,85,2,'2017-10-18 14:52:58','2017-10-18 14:52:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (8,85,3,'2017-10-18 14:52:58','2017-10-18 14:52:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (9,85,5,'2017-10-18 14:52:58','2017-10-18 14:52:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (10,86,4,'2017-10-18 14:52:58','2017-10-18 14:52:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (11,87,2,'2017-10-18 14:53:33','2017-10-18 14:53:33');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (12,87,3,'2017-10-18 14:53:33','2017-10-18 14:53:33');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (13,87,5,'2017-10-18 14:53:33','2017-10-18 14:53:33');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (14,88,1,'2017-10-18 14:53:33','2017-10-18 14:53:33');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (15,89,4,'2017-10-18 14:53:34','2017-10-18 14:53:34');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (16,90,2,'2017-10-18 15:06:58','2017-10-18 15:06:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (17,90,3,'2017-10-18 15:06:58','2017-10-18 15:06:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (18,90,5,'2017-10-18 15:06:58','2017-10-18 15:06:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (19,91,1,'2017-10-18 15:06:58','2017-10-18 15:06:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (20,92,4,'2017-10-18 15:06:58','2017-10-18 15:06:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (21,93,2,'2017-10-18 15:08:21','2017-10-18 15:08:21');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (22,93,3,'2017-10-18 15:08:21','2017-10-18 15:08:21');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (23,93,5,'2017-10-18 15:08:21','2017-10-18 15:08:21');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (24,94,1,'2017-10-18 15:08:21','2017-10-18 15:08:21');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (25,95,4,'2017-10-18 15:08:22','2017-10-18 15:08:22');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (26,96,4,'2017-11-07 17:53:33','2017-11-07 17:53:33');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (27,97,1,'2017-11-07 17:53:33','2017-11-07 17:53:33');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (28,97,2,'2017-11-07 17:53:33','2017-11-07 17:53:33');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (29,98,4,'2017-11-07 17:54:27','2017-11-07 17:54:27');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (30,99,1,'2017-11-07 17:54:27','2017-11-07 17:54:27');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (31,99,2,'2017-11-07 17:54:27','2017-11-07 17:54:27');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (32,100,4,'2017-11-07 17:54:57','2017-11-07 17:54:57');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (33,101,1,'2017-11-07 17:54:57','2017-11-07 17:54:57');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (34,101,2,'2017-11-07 17:54:57','2017-11-07 17:54:57');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (35,102,4,'2017-11-07 17:55:10','2017-11-07 17:55:10');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (36,103,1,'2017-11-07 17:55:10','2017-11-07 17:55:10');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (37,103,2,'2017-11-07 17:55:10','2017-11-07 17:55:10');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (38,104,4,'2017-11-07 17:55:36','2017-11-07 17:55:36');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (39,105,1,'2017-11-07 17:55:36','2017-11-07 17:55:36');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (40,105,2,'2017-11-07 17:55:36','2017-11-07 17:55:36');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (41,106,4,'2017-11-08 15:22:59','2017-11-08 15:22:59');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (42,107,1,'2017-11-08 15:22:59','2017-11-08 15:22:59');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (43,107,2,'2017-11-08 15:22:59','2017-11-08 15:22:59');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (44,108,4,'2017-11-08 15:27:18','2017-11-08 15:27:18');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (45,109,5,'2017-11-08 15:27:18','2017-11-08 15:27:18');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (46,110,1,'2017-11-08 15:27:19','2017-11-08 15:27:19');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (47,111,4,'2017-12-05 14:55:45','2017-12-05 14:55:45');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (48,112,1,'2017-12-05 14:55:45','2017-12-05 14:55:45');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (49,112,2,'2017-12-05 14:55:45','2017-12-05 14:55:45');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (50,113,4,'2017-12-05 16:09:42','2017-12-05 16:09:42');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (51,114,1,'2017-12-05 16:09:42','2017-12-05 16:09:42');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (52,114,2,'2017-12-05 16:09:42','2017-12-05 16:09:42');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (53,115,4,'2017-12-06 14:15:58','2017-12-06 14:15:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (54,116,1,'2017-12-06 14:15:58','2017-12-06 14:15:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (55,116,2,'2017-12-06 14:15:58','2017-12-06 14:15:58');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (56,117,4,'2017-12-06 14:16:17','2017-12-06 14:16:17');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (57,118,1,'2017-12-06 14:16:17','2017-12-06 14:16:17');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (58,118,2,'2017-12-06 14:16:17','2017-12-06 14:16:17');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (59,119,4,'2017-12-13 10:27:38','2017-12-13 10:27:38');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (60,120,1,'2017-12-13 10:27:38','2017-12-13 10:27:38');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (61,120,2,'2017-12-13 10:27:38','2017-12-13 10:27:38');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (62,121,1,'2017-12-13 11:14:30','2017-12-13 11:14:30');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (63,121,2,'2017-12-13 11:14:30','2017-12-13 11:14:30');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (64,122,4,'2017-12-13 11:14:30','2017-12-13 11:14:30');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (65,123,3,'2017-12-13 11:16:02','2017-12-13 11:16:02');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (66,124,1,'2017-12-13 11:16:02','2017-12-13 11:16:02');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (67,125,4,'2017-12-13 17:34:21','2017-12-13 17:34:21');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (68,126,1,'2017-12-13 17:34:21','2017-12-13 17:34:21');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (69,126,2,'2017-12-13 17:34:21','2017-12-13 17:34:21');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (70,127,4,'2017-12-13 17:37:32','2017-12-13 17:37:32');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (71,128,3,'2017-12-13 17:37:32','2017-12-13 17:37:32');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (72,128,5,'2017-12-13 17:37:32','2017-12-13 17:37:32');
insert  into `projects_employees_skills`(`id`,`id_projects_employees`,`id_skills`,`created_at`,`updated_at`) values (73,129,1,'2017-12-13 17:37:32','2017-12-13 17:37:32');

/*Table structure for table `projects_tasks` */

DROP TABLE IF EXISTS `projects_tasks`;

CREATE TABLE `projects_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_projects` int(11) DEFAULT NULL,
  `id_skills` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `level` smallint(6) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_employees` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C5D931A9C485F31` (`id_projects`),
  KEY `IDX_C5D931A9F306A39D` (`id_skills`),
  KEY `IDX_C5D931A93AB77F27` (`id_employees`),
  CONSTRAINT `FK_C5D931A93AB77F27` FOREIGN KEY (`id_employees`) REFERENCES `employees` (`id`),
  CONSTRAINT `FK_C5D931A9C485F31` FOREIGN KEY (`id_projects`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C5D931A9F306A39D` FOREIGN KEY (`id_skills`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `projects_tasks` */

insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (1,121,1,'Exemplo','O que deve ser feito',3,'2017-10-18 13:25:24','2017-10-18 13:25:24',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (2,121,2,'Exemplo','O que deve ser feito',2,'2017-10-18 13:25:24','2017-10-18 13:25:24',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (3,121,3,'Exemplo','O que deve ser feito',2,'2017-10-18 13:25:24','2017-10-18 13:25:24',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (4,121,4,'Exemplo','O que deve ser feito',2,'2017-10-18 13:25:24','2017-10-18 13:25:24',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (5,121,5,'Exemplo','O que deve ser feito',2,'2017-10-18 13:25:24','2017-10-18 13:25:24',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (6,122,1,'Exemplo','O que deve ser feito',2,'2017-10-18 14:52:57','2017-10-18 14:52:57',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (7,122,2,'Exemplo','O que deve ser feito',1,'2017-10-18 14:52:57','2017-10-18 14:52:57',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (8,122,3,'Exemplo','O que deve ser feito',2,'2017-10-18 14:52:57','2017-10-18 14:52:57',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (9,122,4,'Exemplo','O que deve ser feito',3,'2017-10-18 14:52:57','2017-10-18 14:52:57',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (10,122,5,'Exemplo','O que deve ser feito',2,'2017-10-18 14:52:57','2017-10-18 14:52:57',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (11,123,1,'Exemplo','O que deve ser feito',3,'2017-10-18 14:53:33','2017-10-18 14:53:33',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (12,123,2,'Exemplo','O que deve ser feito',2,'2017-10-18 14:53:33','2017-10-18 14:53:33',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (13,123,3,'Exemplo','O que deve ser feito',2,'2017-10-18 14:53:33','2017-10-18 14:53:33',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (14,123,4,'Exemplo','O que deve ser feito',2,'2017-10-18 14:53:33','2017-10-18 14:53:33',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (15,123,5,'Exemplo','O que deve ser feito',2,'2017-10-18 14:53:33','2017-10-18 14:53:33',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (16,124,1,'Exemplo','O que deve ser feito',3,'2017-10-18 15:06:58','2017-10-18 15:06:58',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (17,124,2,'Exemplo','O que deve ser feito',2,'2017-10-18 15:06:58','2017-10-18 15:06:58',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (18,124,3,'Exemplo','O que deve ser feito',2,'2017-10-18 15:06:58','2017-10-18 15:06:58',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (19,124,4,'Exemplo','O que deve ser feito',2,'2017-10-18 15:06:58','2017-10-18 15:06:58',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (20,124,5,'Exemplo','O que deve ser feito',2,'2017-10-18 15:06:58','2017-10-18 15:06:58',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (21,125,1,'Exemplo','O que deve ser feito',3,'2017-10-18 15:08:21','2017-10-18 15:08:21',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (22,125,2,'Exemplo','O que deve ser feito',2,'2017-10-18 15:08:21','2017-10-18 15:08:21',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (23,125,3,'Exemplo','O que deve ser feito',2,'2017-10-18 15:08:21','2017-10-18 15:08:21',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (24,125,4,'Exemplo','O que deve ser feito',2,'2017-10-18 15:08:21','2017-10-18 15:08:21',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (25,125,5,'Exemplo','O que deve ser feito',2,'2017-10-18 15:08:21','2017-10-18 15:08:21',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (26,126,1,'Exemplo','O que deve ser feito',3,'2017-11-07 17:53:33','2017-11-07 17:53:33',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (27,126,2,'Exemplo','O que deve ser feito',2,'2017-11-07 17:53:33','2017-11-07 17:53:33',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (28,126,4,'Exemplo','O que deve ser feito',2,'2017-11-07 17:53:33','2017-11-07 17:53:33',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (29,127,1,'Exemplo','O que deve ser feito',3,'2017-11-07 17:54:27','2017-11-07 17:54:27',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (30,127,2,'Exemplo','O que deve ser feito',2,'2017-11-07 17:54:27','2017-11-07 17:54:27',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (31,127,4,'Exemplo','O que deve ser feito',2,'2017-11-07 17:54:27','2017-11-07 17:54:27',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (32,128,1,'Exemplo','O que deve ser feito',3,'2017-11-07 17:54:57','2017-11-07 17:54:57',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (33,128,2,'Exemplo','O que deve ser feito',2,'2017-11-07 17:54:57','2017-11-07 17:54:57',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (34,128,4,'Exemplo','O que deve ser feito',2,'2017-11-07 17:54:57','2017-11-07 17:54:57',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (35,129,1,'Exemplo','O que deve ser feito',3,'2017-11-07 17:55:10','2017-11-07 17:55:10',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (36,129,2,'Exemplo','O que deve ser feito',2,'2017-11-07 17:55:10','2017-11-07 17:55:10',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (37,129,4,'Exemplo','O que deve ser feito',2,'2017-11-07 17:55:10','2017-11-07 17:55:10',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (38,130,1,'Exemplo','O que deve ser feito',3,'2017-11-07 17:55:36','2017-11-07 17:55:36',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (39,130,2,'Exemplo','O que deve ser feito',2,'2017-11-07 17:55:36','2017-11-07 17:55:36',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (40,130,4,'Exemplo','O que deve ser feito',2,'2017-11-07 17:55:36','2017-11-07 17:55:36',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (41,131,1,'Exemplo','O que deve ser feito',3,'2017-11-08 15:22:59','2017-11-08 15:22:59',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (42,131,2,'Exemplo','O que deve ser feito',2,'2017-11-08 15:22:59','2017-11-08 15:22:59',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (43,131,4,'Exemplo','O que deve ser feito',2,'2017-11-08 15:22:59','2017-11-08 15:22:59',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (44,132,1,'Exemplo','O que deve ser feito',3,'2017-11-08 15:27:18','2017-11-08 15:27:18',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (45,132,5,'Exemplo','O que deve ser feito',2,'2017-11-08 15:27:18','2017-11-08 15:27:18',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (46,132,4,'Exemplo','O que deve ser feito',2,'2017-11-08 15:27:18','2017-11-08 15:27:18',NULL);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (47,133,1,'Exemplo','O que deve ser feito',3,'2017-12-05 14:55:45','2017-12-05 14:55:45',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (48,133,2,'Exemplo','O que deve ser feito',2,'2017-12-05 14:55:45','2017-12-05 14:55:45',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (49,133,4,'Exemplo','O que deve ser feito',2,'2017-12-05 14:55:45','2017-12-05 14:55:45',1);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (50,134,1,'Exemplo','O que deve ser feito',3,'2017-12-05 16:09:41','2017-12-05 16:09:41',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (51,134,2,'Exemplo','O que deve ser feito',2,'2017-12-05 16:09:41','2017-12-05 16:09:41',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (52,134,4,'Exemplo','O que deve ser feito',2,'2017-12-05 16:09:42','2017-12-05 16:09:42',1);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (53,135,1,'Exemplo','O que deve ser feito',3,'2017-12-06 14:15:58','2017-12-06 14:15:58',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (54,135,2,'Exemplo','O que deve ser feito',2,'2017-12-06 14:15:58','2017-12-06 14:15:58',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (55,135,4,'Exemplo','O que deve ser feito',2,'2017-12-06 14:15:58','2017-12-06 14:15:58',1);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (56,136,1,'Exemplo','O que deve ser feito',3,'2017-12-06 14:16:17','2017-12-06 14:16:17',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (57,136,2,'Exemplo','O que deve ser feito',2,'2017-12-06 14:16:17','2017-12-06 14:16:17',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (58,136,4,'Exemplo','O que deve ser feito',2,'2017-12-06 14:16:17','2017-12-06 14:16:17',1);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (59,137,1,'Exemplo','O que deve ser feito',3,'2017-12-13 10:27:38','2017-12-13 10:27:38',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (60,137,2,'Exemplo','O que deve ser feito',2,'2017-12-13 10:27:38','2017-12-13 10:27:38',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (61,137,4,'Exemplo','O que deve ser feito',2,'2017-12-13 10:27:38','2017-12-13 10:27:38',1);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (62,138,1,'Exemplo','O que deve ser feito',3,'2017-12-13 11:14:30','2017-12-13 11:14:30',4);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (63,138,2,'Exemplo','O que deve ser feito',2,'2017-12-13 11:14:30','2017-12-13 11:14:30',4);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (64,138,4,'Exemplo','O que deve ser feito',2,'2017-12-13 11:14:30','2017-12-13 11:14:30',6);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (65,139,1,'Exemplo','O que deve ser feito',1,'2017-12-13 11:16:02','2017-12-13 11:16:02',8);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (66,139,3,'Exemplo','O que deve ser feito',1,'2017-12-13 11:16:02','2017-12-13 11:16:02',5);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (67,140,1,'Exemplo','O que deve ser feito',3,'2017-12-13 17:34:20','2017-12-13 17:34:20',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (68,140,2,'Exemplo','O que deve ser feito',2,'2017-12-13 17:34:21','2017-12-13 17:34:21',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (69,140,4,'Exemplo','O que deve ser feito',2,'2017-12-13 17:34:21','2017-12-13 17:34:21',1);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (70,141,1,'Desenvolver o back-end','Symfony e MySQL',3,'2017-12-13 17:37:31','2017-12-13 17:37:31',3);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (71,141,3,'Desenvolver a estrutura do site','O que deve ser feito',2,'2017-12-13 17:37:31','2017-12-13 17:37:31',2);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (72,141,5,'Desenvolver os estilos do site','O que deve ser feito',2,'2017-12-13 17:37:31','2017-12-13 17:37:31',2);
insert  into `projects_tasks`(`id`,`id_projects`,`id_skills`,`title`,`description`,`level`,`created_at`,`updated_at`,`id_employees`) values (73,141,4,'Consumir a API restFUL','O que deve ser feito',2,'2017-12-13 17:37:32','2017-12-13 17:37:32',1);

/*Table structure for table `skills` */

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `skills` */

insert  into `skills`(`id`,`name`,`created_at`,`updated_at`) values (1,'PHP',NULL,NULL);
insert  into `skills`(`id`,`name`,`created_at`,`updated_at`) values (2,'Java',NULL,NULL);
insert  into `skills`(`id`,`name`,`created_at`,`updated_at`) values (3,'Html',NULL,NULL);
insert  into `skills`(`id`,`name`,`created_at`,`updated_at`) values (4,'Angular',NULL,NULL);
insert  into `skills`(`id`,`name`,`created_at`,`updated_at`) values (5,'CSS',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
