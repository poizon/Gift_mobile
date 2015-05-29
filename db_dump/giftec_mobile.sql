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
-- Table structure for table `bonuses`
--

DROP TABLE IF EXISTS `bonuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descript` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonuses`
--

LOCK TABLES `bonuses` WRITE;
/*!40000 ALTER TABLE `bonuses` DISABLE KEYS */;
INSERT INTO `bonuses` VALUES (1,'Бесплатная доставка'),(2,'Бесплатная установка'),(3,'Бесплатное цветопрофилирование');
/*!40000 ALTER TABLE `bonuses` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `SPECS` (`item_id`,`name`,`descript`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_specs`
--

LOCK TABLES `item_specs` WRITE;
/*!40000 ALTER TABLE `item_specs` DISABLE KEYS */;
INSERT INTO `item_specs` VALUES (1,'Модель','AZON DTS White',1),(2,'Технология печати','Струйная (микро пьезо головка)',1),(3,'Размер печати','Макс. 420 мм x 600 мм, макс. толщина 100 мм',1),(4,'Код управления','ESC/P Raster',1),(5,'Цветность','C, M, Y, K, + LC, LM, 2W',1),(6,'Скорость печати','11 отпечатков 600 мм x 420 мм в час',1),(7,'Разрешение печати','Макс. 1440 dpi',1),(8,'Требования к питанию','220В~, 59 Вт (в режиме ожидания 5 Вт)',1),(9,'Интерфейс','USB, сеть LAN',1),(10,'Условия эксплуатации','Температура от 15 до 30C, влажность от 50 до 70% отн. влажности',1),(11,'Драйвер принтера','Win 95/98/2000/XP/Vista/7, NT4.0, Mac',1),(12,'Используемый материал','Стекло, металл, камень, дерево, пластик.',1),(13,'Материал','100% полиэстер',3),(14,'Технология','double knit',3),(15,'Размер салфетки, см','23×23',3),(16,'Расфасовка в пачке, шт.','150',3),(17,'Пачек в коробке, шт.','10',3),(18,'Масса, г/м2','28-300',4),(19,'Толщина, мкм','25-450',4),(20,'Исходный рулон, ширина, мм','1650',4),(21,'Исходный рулон, диаметр, мм','1300',4),(22,'Исходный рулон, диаметр втулки, мм','76, 152',4),(23,'Вес рулона, кг','1200',4),(24,'Готовый рулон, ширина, мм','20-1600',4),(25,'Готовый рулон, диаметр, мм','до 800',4),(26,'Готовый рулон, диаметр втулки, мм','76, 152',4);
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
  `name` varchar(100) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `descript` text,
  `price` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `action` char(1) DEFAULT NULL,
  `popular` char(1) DEFAULT NULL,
  `new_item` char(1) DEFAULT NULL,
  `main_img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ITEMS` (`id`,`type`,`cat`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'I',19,'AZON DTS White','Бесплатная доставка и установка','Печать белым цветом на любом материале с помощью принтера AZON DTS White.\n<ul>\n<li>\nНовинка в серии принтеров AZON DTS. Теперь появилась возможность печатать белым цветом на любом материале.\n</li>\n<li>AZON DTS демонстрирует качественную печать на всех видах цветных и тёмных материалов.</li>\n<li>Принтер исключительно прост в использовании.</li>\n<li>Новые «наноцветовые» пигменты проникают в структуру любого материала, обеспечивая\nнасыщенные яркие изображения.</li>\n<li>DTS White печатает каплями трёх размеров.</li>\n<li>Максимальная толщина запечатываемого материала составляет 10 см.</li>\n<li>Поверхности могут быть гладкими или шероховатыми, плоскими или изогнутыми. </li>\n<li>Для печати подойдут дерево,пластик, камень, стекло, керамика, кожа, металл и другие материалы.</li>\n</ul>','500000.00','0.00','0','0','1','azon.jpg'),(2,'I',19,'AZON DTS','Бесплатная доставка и установка','Azon DTS – это струйный принтер, печатающий напрямую на стекле, металле, камне, дереве, пластике и других материалах. С его помощью можно получить качественные, полноцветные изображения на любой поверхности быстрее и дешевле, чем с помощью других способов печати. Возможна печать на готовых пластмассовых изделиях, таких как ручки, зажигалки, мобильные телефоны, пластиковые карты и др. Исключительно высокое разрешение 2880.','550000.00','560000.00','1','0','0','azon.jpg'),(3,'I',12,'Безворсовые салфетки','Оптом - дешевле!','Cалфетки Berkshire сделаны из полиэстеровых нитей, сотканных по технологии «double knit» (двойное плетение). Особое плетение и специальный способ обработки сжатым воздухом позволяют избежать появления ворсинок и микрочастиц на поверхности ткани.','5000.00','8000.00','0','1','0','satpax.jpg'),(4,'S',14,'Перемотка и резка','Перемотай под себя!','Компания «ГИФТЕК» предоставляет услуги по перемотке и резке различных видов рулонных материалов, в том числе офсетной: крафт, офисной, силиконизированной и крепированной бумаги.\nНа нашем производстве стоит современная широкоформатная бобинорезка DCM Usimeca Panthère, которая позволяет резать и перематывать рулоны шириной до 1600 мм. Минимальная ширина готового рулона составляет 50 мм.\nМы предлагаем резку со смоткой в рулон меньшего или такого же формата и диаметра. Такой вид перемотки сопровождается полной перемоткой исходного рулона на несколько рулонов меньшего формата и диаметра. Максимальный диаметр разматываемого рулона 1300 мм, наматываемого 800 мм. Диаметр втулок на размотке и намотке составляет 76,2мм и 152мм соответственно.\nКроме того, на нашем производстве мы режем различные виды полимерных плёнок.<p></p>\n<p><b>Основные виды, разрезаемых рулонных материалов:</b></p>\n<ul>\n<li>офсетная бумага</li>\n<li>крафт-бумага</li>\n<li>бумага ВХИ (офисная)</li>\n<li>силиконизированная бумага</li>\n<li>крепированная бумага</li>\n</ul>','1000.00',NULL,'0','1','0','rezka2.jpg'),(5,'S',15,'Сервис','Доверься профессионалам!','Компания «ГИФТЕК» предлагает услуги по сервисному обслуживанию и ремонту широкоформатных,планшетных уф- и сольвентных принтеров, а также другого оборудования.\nПоддержание оборудования в рабочем состоянии – одна из основных задач сервисной службы, поэтому наш сервисный отдел работает 24 часа в сутки.\nТехнические специалисты – профессионалы своего дела, регулярно проходят стажировки на заводах-изготовителях, и готовы в любую минуту прийти на помощь.\nОборудование, которое подвергается постоянной строгой проверке опытных специалистов, работает дольше, реже выходит из строя, проще ремонтируется.\nВкладывая деньги в плановый осмотр принтеров, Вы значительно экономите.\nСнижается процент брака, сокращается время простоя принтера из-за неожиданной поломки.\nДля улучшения качества печати и повышения эффективности Вашего бизнеса, «ГИФТЕК» советует всем своим клиентам настраивать цветовые профили ICC.\nТакже мы предлагаем оригинальные запасные части MATAN, swissqprint, AZON и др., гарантийное и послегарантийное обслуживание в не зависимости от места расположения на территории РФ.','0.00','0.00','0','0','0','service.jpg');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_bonus`
--

DROP TABLE IF EXISTS `items_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bonus_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RELATED` (`bonus_id`,`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='bonus k tovary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_bonus`
--

LOCK TABLES `items_bonus` WRITE;
/*!40000 ALTER TABLE `items_bonus` DISABLE KEYS */;
INSERT INTO `items_bonus` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2);
/*!40000 ALTER TABLE `items_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_cat`
--

DROP TABLE IF EXISTS `items_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_id` int(11) DEFAULT '0',
  `type` char(1) DEFAULT NULL COMMENT '''услуга/товар''',
  `descript` varchar(45) DEFAULT NULL,
  `chpurl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chpurl_UNIQUE` (`chpurl`),
  KEY `SUBID` (`sub_id`,`type`,`chpurl`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_cat`
--

LOCK TABLES `items_cat` WRITE;
/*!40000 ALTER TABLE `items_cat` DISABLE KEYS */;
INSERT INTO `items_cat` VALUES (1,0,'I','Рулонные материалы','rulonnye_materialy'),(2,0,'I','Принтеры','printery'),(3,0,'I','Обрабатывающие центры','obrabatyvayuschie-centry'),(4,0,'I','Листовые материалы','listovye_materialy'),(5,0,'I','Световозврат','svetovozvrat'),(6,0,'I','Планшетные ламинаторы RollsRoller','planshetnye_laminatory'),(7,0,'I','Чернила','uf-chernila'),(8,0,'I','Подержанное печатное оборудование','bu_oborudovanie'),(9,0,'I','Оборудование для этикеток','oborudovanie_dlya__etiketok'),(10,0,'I','Режущие плоттеры','rezhushhie_plottery'),(11,0,'I','Технические материалы','tehnicheskie_materialy'),(12,0,'I','Безворсовые салфетки','bezvorsovye_salfetki'),(13,0,'I','Запчасти','zapchasty'),(14,0,'S','Перемотка и резка','peremotka_i_rezka'),(15,0,'S','Сервис','servis'),(16,2,'I','GT Print','interernye_printery'),(17,2,'I','Matan Barak','matan_barak'),(18,2,'I','swissQprint','swissqprint'),(19,2,'I','AZON','azon'),(20,2,'I','HP Latex','lateksnye_printery_hp_latex');
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_images`
--

LOCK TABLES `items_images` WRITE;
/*!40000 ALTER TABLE `items_images` DISABLE KEYS */;
INSERT INTO `items_images` VALUES (1,1,'1',NULL,'azon.jpg'),(2,2,'1',NULL,'azon.jpg'),(3,3,'1',NULL,'satpax.jpg'),(4,4,'0',NULL,'rezka.jpg'),(5,4,'0',NULL,'rezka1.jpg'),(6,4,'1',NULL,'rezka2.jpg'),(7,1,'0',NULL,'azon.jpg'),(8,2,'0',NULL,'azon.jpg');
/*!40000 ALTER TABLE `items_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_related`
--

DROP TABLE IF EXISTS `items_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_related` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relate_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RELATED` (`relate_id`,`item_id`)
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

-- Dump completed on 2015-05-29 17:59:20
