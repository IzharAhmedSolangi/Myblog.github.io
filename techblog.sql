/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.30 : Database - techblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`techblog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `techblog`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `discription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `categories` */

insert  into `categories`(`cid`,`name`,`discription`) values 
(1,'Java Programming Language','One the most popular language'),
(2,'Python','One the most popular language'),
(3,'Web Development','One the most popular language'),
(4,'(Andriod Development','One the most popular language'),
(5,'Block Chain','One the most popular language'),
(6,'IOS Development','One the most popular language'),
(7,'Machine Learning',NULL),
(8,'Data Science',NULL),
(9,'Artificial Neural Networks',NULL),
(10,'Natural Language Processing',NULL);

/*Table structure for table `liked` */

DROP TABLE IF EXISTS `liked`;

CREATE TABLE `liked` (
  `lId` int NOT NULL AUTO_INCREMENT,
  `uId` int DEFAULT NULL,
  `pId` int DEFAULT NULL,
  PRIMARY KEY (`lId`),
  KEY `pId` (`pId`),
  KEY `uId` (`uId`),
  CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `post` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`uId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `liked` */

insert  into `liked`(`lId`,`uId`,`pId`) values 
(2,1,15),
(3,1,11),
(4,1,1),
(5,1,15),
(6,1,15),
(7,1,15),
(8,1,15),
(9,1,15),
(10,1,15),
(11,1,15),
(12,1,15),
(13,1,15),
(14,1,15),
(15,1,12),
(16,1,12),
(17,1,12),
(18,1,15),
(19,1,15),
(20,1,15),
(21,1,15),
(22,1,15),
(23,1,15),
(24,1,15),
(25,1,15),
(26,1,1),
(27,1,2),
(28,1,9),
(29,1,4),
(30,1,11),
(31,1,14),
(32,1,15),
(33,4,11),
(34,4,11),
(35,4,11),
(36,4,11);

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pic` varchar(100) DEFAULT NULL,
  `pDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `catId` (`catId`),
  KEY `userId` (`userId`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `post` */

insert  into `post`(`pid`,`pTitle`,`pContent`,`pCode`,`pic`,`pDate`,`catId`,`userId`) values 
(1,'What is Java?','Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.\r\n\r\nJava was developed by Sun Microsystems (which is now the subsidiary of Oracle) in the year 1995. James Gosling is known as the father of Java. Before Java, its name was Oak. Since Oak was already a registered company, so James Gosling and his team changed the name from Oak to Java.\r\n\r\nPlatform: Any hardware or software environment in which a program runs, is known as a platform. Since Java has a runtime environment (JRE) and API, it is called a platform','class Simple{  \r\n    public static void main(String args[]){  \r\n     System.out.println(\"Hello Java\");  \r\n    }  \r\n}','java-training.png','2022-10-30 22:27:35',1,1),
(2,' What is blockchain technology?','Blockchain defined: Blockchain is a shared, immutable ledger that facilitates the process of recording transactions and tracking assets in a business network. An asset can be tangible (a house, car, cash, land) or intangible (intellectual property, patents, copyrights, branding). Virtually anything of value can be tracked and traded on a blockchain network, reducing risk and cutting costs for all involved','nothing','download.jfif','2022-10-30 22:41:12',5,5),
(4,'What Does Web Development Mean?','Web development refers in general to the tasks associated with developing websites for hosting via intranet or internet. The web development process includes web design, web content development, client-side/server-side scripting and network security configuration, among other tasks.','nothing','download (1).jfif','2022-10-30 22:51:28',3,3),
(9,'What Does Artificial Neural Network (ANN) Mean?','An artificial neuron network (neural network) is a computational model that mimics the way nerve cells work in the human brain.\r\n\r\nArtificial neural networks (ANNs) use learning algorithms that can independently make adjustments - or learn, in a sense - as they receive new input. This makes them a very effective tool for non-linear statistical data modeling.\r\n\r\nDeep learning ANNs play an important role in machine learning (ML) and support the broader field of artificial intelligence (AI) technology.\r\n\r\n','Sorry','download (2).jfif','2022-10-30 23:05:06',9,5),
(10,'What Does Artificial Neural Network (ANN) Mean?','An artificial neuron network (neural network) is a computational model that mimics the way nerve cells work in the human brain.\r\n\r\nArtificial neural networks (ANNs) use learning algorithms that can independently make adjustments - or learn, in a sense - as they receive new input. This makes them a very effective tool for non-linear statistical data modeling.\r\n\r\nDeep learning ANNs play an important role in machine learning (ML) and support the broader field of artificial intelligence (AI) technology.\r\n\r\n','Sorry','download (2).jfif','2022-10-30 23:05:06',9,5),
(11,'Introduction to Android Development','Android operating system is the largest installed base among various mobile platforms across the globe. Hundreds of millions of mobile devices are powered by Android in more than 190 countries of the world. It conquered around 71% of the global market share by the end of 2021, and this trend is growing bigger every other day. The company named Open Handset Alliance developed Android for the first time that is based on the modified version of the Linux kernel and other open-source software.','nothing','androidosgfg.png','2022-10-30 23:10:07',4,5),
(12,'Introduction to Android Development','Android operating system is the largest installed base among various mobile platforms across the globe. Hundreds of millions of mobile devices are powered by Android in more than 190 countries of the world. It conquered around 71% of the global market share by the end of 2021, and this trend is growing bigger every other day. The company named Open Handset Alliance developed Android for the first time that is based on the modified version of the Linux kernel and other open-source software.','nothing','androidosgfg.png','2022-10-30 23:10:07',4,5),
(13,'sasadasd','asdasdsad','sadsadsad','pexels-pixabay-33545.jpg','2022-10-30 23:11:23',1,5),
(14,'sasadasd','asdasdsad','sadsadsad','pexels-pixabay-33545.jpg','2022-10-30 23:11:23',1,5),
(15,'What Is Python Used For?','Python, one of the most popular programming languages in the world, has created everything from Netflixâs recommendation algorithm to the software that controls self-driving cars. Python is a general-purpose language, which means itâs designed to be used in a range of applications, including data science, software and web development, automation, and generally getting stuff done.\r\n\r\nLetâs take a closer look at what Python is, what it can do, and how you can start learning it.','','s.png','2022-10-30 23:14:45',2,4);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `about` varchar(1000) DEFAULT '''hey ! Im using TechBlog''',
  `rDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default.png',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`Id`,`Name`,`email`,`password`,`gender`,`about`,`rDate`,`profile`) values 
(1,'Izhar Ahmed','solangiizhar66@gmail.com','123','on','I am a java developer       ','2022-10-27 16:35:07','WhatsApp Image 2022-10-21 at 1.15.28 PM.jpeg'),
(3,'sameer','sameer@gmail.com','asd','male','nothiung','2022-10-28 07:58:58','default.png'),
(4,'israr','israr@gmail.com','1234','male','nothing','2022-10-28 08:00:25','default.png'),
(5,'masroor','abc@gmail.com','123','male','dsfsdf','2022-10-28 08:04:15','default.png'),
(28,'izhar','ab@gmail.com','as','male','kjflsdjkafo','2022-10-29 21:40:50','default.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
