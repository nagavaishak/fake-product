/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.5.48 : Database - db_lightweightauthentication
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_lightweightauthentication` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_lightweightauthentication`;

/*Table structure for table `m_admin` */

DROP TABLE IF EXISTS `m_admin`;

CREATE TABLE `m_admin` (
  `m_id` int(5) NOT NULL AUTO_INCREMENT,
  `m_admin` varchar(50) DEFAULT NULL,
  `m_pass` varchar(50) DEFAULT NULL,
  `m_mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `m_admin` */

insert  into `m_admin`(`m_id`,`m_admin`,`m_pass`,`m_mail`) values 
(1,'admin','123','ashwini@dhsinformatics.com');

/*Table structure for table `m_category` */

DROP TABLE IF EXISTS `m_category`;

CREATE TABLE `m_category` (
  `cat_id` int(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `m_category` */

insert  into `m_category`(`cat_id`,`cat_name`) values 
(1,'Corona Virus'),
(2,'Dengue');

/*Table structure for table `m_product` */

DROP TABLE IF EXISTS `m_product`;

CREATE TABLE `m_product` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `m_pro_code` varchar(200) DEFAULT NULL,
  `m_pro_name` varchar(200) DEFAULT NULL,
  `m_pro_company` varchar(200) DEFAULT NULL,
  `m_pro_type` int(20) DEFAULT NULL,
  `m_model_no` varchar(200) DEFAULT NULL,
  `m_manfu_date` varchar(200) DEFAULT NULL,
  `m_pro_warranty` varchar(200) DEFAULT NULL,
  `m_pro_mrp` varchar(200) DEFAULT NULL,
  `m_pro_hashCode` varchar(200) DEFAULT NULL,
  `m_pro_rnsvalue` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `m_product` */

insert  into `m_product`(`id`,`m_pro_code`,`m_pro_name`,`m_pro_company`,`m_pro_type`,`m_model_no`,`m_manfu_date`,`m_pro_warranty`,`m_pro_mrp`,`m_pro_hashCode`,`m_pro_rnsvalue`) values 
(1,'1001','Zydus Calida','zycovD',1,'1','31/12/2020','6','150','622d6226eaf3aedf393116149f140fd97af97df420a9e2cbac197de1902a4710','49_49#48_48#48_48#49_49#126_126#90_90#121_121#100_100#117_117#115_115#32_32#67_67#97_97#108_108#105_105#100_100#97_97#126_126#122_122#121_121#99_99#111_111#118_118#68_68#126_126#49_49#126_126#49_49#126_126#51_51#49_49#47_47#49_49#50_50#47_47#50_50#48_48#50_50#48_48#126_126#49_49#53_53#48_48#');

/*Table structure for table `m_user` */

DROP TABLE IF EXISTS `m_user`;

CREATE TABLE `m_user` (
  `user_code` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(40) DEFAULT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_sex` varchar(10) DEFAULT NULL,
  `user_age` int(20) DEFAULT NULL,
  `user_email_id` varchar(50) DEFAULT NULL,
  `user_cell_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `m_user` */

insert  into `m_user`(`user_code`,`user_id`,`user_pwd`,`user_name`,`user_sex`,`user_age`,`user_email_id`,`user_cell_no`) values 
(1,'ashu','ashu','ashu','female',23,'ashu@gmail.com','9620725674'),
(2,'aaa','aaa','aaa','f',23,'ash@gmail.com','9620725674');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
