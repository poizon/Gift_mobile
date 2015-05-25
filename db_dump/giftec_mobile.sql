-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: giftec_site
-- ------------------------------------------------------
-- Server version	5.1.49-3

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
-- Table structure for table `dilers`
--

DROP TABLE IF EXISTS `dilers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dilers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `descript` text,
  `public` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dilers`
--

LOCK TABLES `dilers` WRITE;
/*!40000 ALTER TABLE `dilers` DISABLE KEYS */;
INSERT INTO `dilers` VALUES (1,'«ГИФТЕК»','Москва','+7 (495) 245-02','Giftec@giftec.ru','<script src=\"//api-maps.yandex.ru/services/constructor/1.0/js/?sid=vWBdT3u79v2ItJ14aIO1UEr6UDAz-6nP&amp;width=340&amp;height=300\" type=\"text/javascript\" charset=\"utf-8\"></script><p>Адрес: 143000, г. Одинцово, ул. Железнодорожная д.3</p>','1'),(2,'«ГИФТЕК-Рефлекшн»','С.Петербург','+7 (812) 244-16','Sale@giftec.ru','123','1'),(3,'«Восток Трейд»','Новосибирск',NULL,NULL,NULL,'1'),(4,'«Восток Трейд»','Владивосток',NULL,NULL,NULL,'1'),(5,'«Восток Трейд»','Омск',NULL,NULL,NULL,'1'),(6,'«Восток Трейд»','Екатеринбург',NULL,NULL,NULL,'1'),(7,'«Восток Трейд»','Красноярск',NULL,NULL,NULL,'1'),(8,'«Восток Трейд»','Иркутск',NULL,NULL,NULL,'1'),(9,'«Восток Трейд»','Самара',NULL,NULL,NULL,'1'),(10,'«Восток Трейд»','Казань',NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `dilers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_specs`
--

DROP TABLE IF EXISTS `item_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_specs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `descript` varchar(150) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SPECS` (`item_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_specs`
--

LOCK TABLES `item_specs` WRITE;
/*!40000 ALTER TABLE `item_specs` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) DEFAULT NULL,
  `cat` int(11) DEFAULT NULL,
  `descript` text,
  `price` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `action` char(1) DEFAULT NULL,
  `popular` char(1) DEFAULT NULL,
  `new_item` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ITEMS` (`id`,`type`,`cat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_cat`
--

DROP TABLE IF EXISTS `items_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) DEFAULT NULL COMMENT '''услуга/товар''',
  `descript` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_cat`
--

LOCK TABLES `items_cat` WRITE;
/*!40000 ALTER TABLE `items_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_images`
--

DROP TABLE IF EXISTS `items_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) DEFAULT NULL,
  `main` char(1) DEFAULT NULL COMMENT 'pervaya kartinka ili net?',
  `descript` varchar(50) DEFAULT NULL,
  `image_url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDITEM` (`id_item`,`image_url`,`main`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_images`
--

LOCK TABLES `items_images` WRITE;
/*!40000 ALTER TABLE `items_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_related`
--

DROP TABLE IF EXISTS `items_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_related` (
  `id` int(11) NOT NULL,
  `id_related` int(11) DEFAULT NULL,
  KEY `RELATED` (`id`,`id_related`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='soputsv. tovary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_related`
--

LOCK TABLES `items_related` WRITE;
/*!40000 ALTER TABLE `items_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `comment` text,
  `pay` varchar(2) DEFAULT NULL COMMENT 'nl/bn',
  `items` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL COMMENT 'itogo summa',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(50) DEFAULT NULL,
  `source_url` varchar(100) DEFAULT NULL,
  `public` char(1) DEFAULT NULL,
  `descript` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,'/img/banner/image1.jpg','http://www.giftec.ru/catalogue/hp_latex/','1','Бла бла бла'),(2,'/img/banner/image2.jpg','http://www.giftec.ru/catalogue/kompaniya_swissqprint__rasshiryaet_modelnyj_ryad/','1',NULL),(3,'/img/banner/image3.jpg','http://www.giftec.ru/catalogue/kompaniya_swissqprint__rasshiryaet_modelnyj_ryad/','1',NULL),(4,'/img/banner/image4.jpg','http://www.giftec.ru/catalogue/kompaniya_swissqprint__rasshiryaet_modelnyj_ryad/','1',NULL);
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-25 17:07:41
