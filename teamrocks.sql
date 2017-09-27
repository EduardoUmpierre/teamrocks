/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.11 : Database - teamrocks
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employees` */

insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (1,1,'Eduardo',NULL,NULL);
insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (2,1,'Felipe',NULL,NULL);
insert  into `employees`(`id`,`id_companies`,`name`,`created_at`,`updated_at`) values (3,1,'Ingrid',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employees_skills` */

insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (1,1,1,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (2,1,3,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (3,1,5,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (4,2,1,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (5,2,3,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (6,3,1,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (7,3,3,NULL,NULL,3);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (8,3,5,NULL,NULL,2);
insert  into `employees_skills`(`id`,`id_employees`,`id_skills`,`created_at`,`updated_at`,`level`) values (9,3,4,NULL,NULL,3);

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
