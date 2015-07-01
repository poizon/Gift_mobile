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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packet_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` decimal(10,0) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ITM_idx` (`item_id`),
  CONSTRAINT `FK_ITM` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,1,1,'3','O'),(2,2,1,'1','O'),(3,3,1,'2','O'),(4,3,2,'1','O'),(5,5,1,'3','O'),(6,5,2,'1','O'),(7,5,3,'2','O'),(10,8,1,'1','O'),(11,8,2,'1','O'),(12,8,3,'1','O'),(23,11,1,'2','O'),(24,11,2,'1','O'),(34,13,1,'1','O'),(35,13,2,'6','O'),(36,13,3,'6','O'),(81,16,1,'1','O'),(83,16,3,'1','O'),(86,18,1,'13','O'),(88,18,2,'11','O'),(89,20,2,'1','O'),(90,20,3,'1','O'),(100,20,2,'1','O'),(101,20,2,'1','O'),(135,20,2,'1','O'),(136,20,3,'1','O'),(145,26,2,'1','O'),(146,26,2,'1','O'),(149,28,1,'1','O'),(152,28,3,'1','O'),(153,28,4,'1','O'),(154,31,5,'1','O'),(155,31,1,'1','O');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
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
  `price` decimal(10,0) DEFAULT NULL,
  `old_price` decimal(10,0) DEFAULT NULL,
  `action` char(1) DEFAULT NULL,
  `popular` char(1) DEFAULT NULL,
  `new_item` char(1) DEFAULT NULL,
  `main_img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ITEMS` (`id`,`type`,`cat`,`name`),
  KEY `FK_CATS_idx` (`cat`),
  CONSTRAINT `FK_CATS` FOREIGN KEY (`cat`) REFERENCES `items_cat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'I',19,'AZON DTS White','Бесплатная доставка и установка','Печать белым цветом на любом материале с помощью принтера AZON DTS White.\n<ul>\n<li>\nНовинка в серии принтеров AZON DTS. Теперь появилась возможность печатать белым цветом на любом материале.\n</li>\n<li>AZON DTS демонстрирует качественную печать на всех видах цветных и тёмных материалов.</li>\n<li>Принтер исключительно прост в использовании.</li>\n<li>Новые «наноцветовые» пигменты проникают в структуру любого материала, обеспечивая\nнасыщенные яркие изображения.</li>\n<li>DTS White печатает каплями трёх размеров.</li>\n<li>Максимальная толщина запечатываемого материала составляет 10 см.</li>\n<li>Поверхности могут быть гладкими или шероховатыми, плоскими или изогнутыми. </li>\n<li>Для печати подойдут дерево,пластик, камень, стекло, керамика, кожа, металл и другие материалы.</li>\n</ul>','500000','0','0','0','1','azon.jpg'),(2,'I',19,'AZON DTS','Бесплатная доставка и установка','Azon DTS – это струйный принтер, печатающий напрямую на стекле, металле, камне, дереве, пластике и других материалах. С его помощью можно получить качественные, полноцветные изображения на любой поверхности быстрее и дешевле, чем с помощью других способов печати. Возможна печать на готовых пластмассовых изделиях, таких как ручки, зажигалки, мобильные телефоны, пластиковые карты и др. Исключительно высокое разрешение 2880.','550000','560000','1','0','0','azon.jpg'),(3,'I',12,'Безворсовые салфетки','Оптом - дешевле!','Cалфетки Berkshire сделаны из полиэстеровых нитей, сотканных по технологии «double knit» (двойное плетение). Особое плетение и специальный способ обработки сжатым воздухом позволяют избежать появления ворсинок и микрочастиц на поверхности ткани.','5000','8000','0','1','0','satpax.jpg'),(4,'S',14,'Перемотка и резка','Перемотай под себя!','Компания «ГИФТЕК» предоставляет услуги по перемотке и резке различных видов рулонных материалов, в том числе офсетной: крафт, офисной, силиконизированной и крепированной бумаги.\nНа нашем производстве стоит современная широкоформатная бобинорезка DCM Usimeca Panthère, которая позволяет резать и перематывать рулоны шириной до 1600 мм. Минимальная ширина готового рулона составляет 50 мм.\nМы предлагаем резку со смоткой в рулон меньшего или такого же формата и диаметра. Такой вид перемотки сопровождается полной перемоткой исходного рулона на несколько рулонов меньшего формата и диаметра. Максимальный диаметр разматываемого рулона 1300 мм, наматываемого 800 мм. Диаметр втулок на размотке и намотке составляет 76,2мм и 152мм соответственно.\nКроме того, на нашем производстве мы режем различные виды полимерных плёнок.<p></p>\n<p><b>Основные виды, разрезаемых рулонных материалов:</b></p>\n<ul>\n<li>офсетная бумага</li>\n<li>крафт-бумага</li>\n<li>бумага ВХИ (офисная)</li>\n<li>силиконизированная бумага</li>\n<li>крепированная бумага</li>\n</ul>','1000','0','0','1','0','rezka2.jpg'),(5,'S',15,'Сервис','Доверься профессионалам!','Компания «ГИФТЕК» предлагает услуги по сервисному обслуживанию и ремонту широкоформатных,планшетных уф- и сольвентных принтеров, а также другого оборудования.\nПоддержание оборудования в рабочем состоянии – одна из основных задач сервисной службы, поэтому наш сервисный отдел работает 24 часа в сутки.\nТехнические специалисты – профессионалы своего дела, регулярно проходят стажировки на заводах-изготовителях, и готовы в любую минуту прийти на помощь.\nОборудование, которое подвергается постоянной строгой проверке опытных специалистов, работает дольше, реже выходит из строя, проще ремонтируется.\nВкладывая деньги в плановый осмотр принтеров, Вы значительно экономите.\nСнижается процент брака, сокращается время простоя принтера из-за неожиданной поломки.\nДля улучшения качества печати и повышения эффективности Вашего бизнеса, «ГИФТЕК» советует всем своим клиентам настраивать цветовые профили ICC.\nТакже мы предлагаем оригинальные запасные части MATAN, swissqprint, AZON и др., гарантийное и послегарантийное обслуживание в не зависимости от места расположения на территории РФ.','0','0','0','0','0','service.jpg'),(6,'I',8,'Широкоформатный УФ принтер Barak 5 HS','Только пpoвepeнное оборудование!','Высокая производительность — Вы можете быть уверены в сдаче любого заказа точно в срок. Низкий расход чернил. Быстрая окупаемость.\nНепревзойденно высокая скорость печати — до 353 м 2 / чhs_b адресуемое разрешение 600 dpi; стойкость к выцветанию отпечатков до 2 лет;\nMultiRoll – печать различных изображений одновременно на нескольких рулонах;\nопция печати по жестким материалам с ручным самонакладом;\nпечать на большинстве рулонных и жестких материалов;\nвсего 35 см материала требуется на зарядку нового ролика;\nисключительно низкий расход чернил — 5,5 мл/м2;\nпечатает на материалах низкого качества.\nВВОД В ЭКСПЛУАТАЦИЮ: 2012 год\nВОЗМОЖНО ДООСНАСТИТЬ.','12000000','0','0','1','0','Barak-5-HS.png'),(7,'I',8,'Широкоформатный УФ принтер Barak 3 HS','Только пpoвepeнное оборудование!','Средняя скорость 10 плакатов 3х6м в час. С такой производительностью Вы можете быть уверены в сдаче любого заказа точно в срок. Низкий расход чернил. Быстрая окупаемость.\nДата ввода в эксплуатацию: октябрь 2010\n\nКОНФИГУРАЦИЯ:\nКоличество каналов: 4 CMYK\nКоличество головок на канал: 8\nУстановлена опция для печати по жёстким материалам.\nШирина 3,2м.\n\nВОЗМОЖНО ДООСНАСТИТЬ:\n\nДо версии Barak 3 iQ','9000000','10000000','1','0','0','Barak-5-HS.png'),(8,'I',8,'УФ-принтер Techno-Jet UV M 10 (Docan)','Только пpoвepeнное оборудование!','Принтеры Techno-Jet UV M – это новейшие достижения в технологии цифровой широкоформатной УФ-печати. Принтеры Techno-Jet UV M специально созданы для печати работ высокого разрешения, требующих аккуратной и точной проработки деталей. Shanghai Docan Tech. Co., Ltd динамично развивающаяся компания, которая занимается производством профессиональных УФ принтеров уже более 12 лет. Несмотря на конкуренцию с огромными корпорациями за это время компании удалось заработать репутацию стабильного и надежного производителя оборудования, как на российском, так и на мировом рынке. Компания постоянно развивается и предлагает рынку инновационные продукты. В Shanghai Docan Tech. Co., Ltd считают, что секрет успеха кроется в стабильно высоком качестве продуктов и грамотной технической поддержке.\n\nПринтеры Techno-Jet UV M – это новейшие достижения в технологии цифровой широкоформатной УФ-печати. Принтеры Techno-Jet UV M специально созданы для печати работ высокого разрешения, требующих аккуратной и точной проработки деталей.\nКонструкция с использованием ШВП (Шариковинтовой передачи) производства Япония, позволяет добиться прецизионной точности позиционирования капли на материале. Наличие 2-ух ШВП расположенных с обеих сторон принтера повышает плавность и равномерность перемещения портала. Высокоточная рельса THK(Япония) большой ширины, позволяет перемещать каретку без вибраций, что сказывается на высочайшем качестве печати. Тяжелая массивная станина (до 2500 кг) дает максимальную структурную жесткость при работе с любыми материалами в максимальных скоростных режимах.\nОпорная рама каретки выполнена из алюминиевого массива методом фрезерования, что лучше, чем стандартные стальные или наборные конструкции за счет низкой температурной деформации и высокой жесткости и легкости.\nПозиционирование подвижных органов происходит за счет электромагнитных энкодеров.\n\nНаши принтеры оснащены модулем белого цвета. Белые чернила можно использовать в качестве полутонового цвета, как подложку или кроющий слой.\n\nКлючевые особенности УФ принтеров серии Techno-Jet UV M/MR:\nНеподвижный печатный стол, оснащенный вакуумным прижимом с опцией обратного вакуума\nПечать без полей, в край\nВозможность печати на рулонных материалах (MR Series)\nМодуль печати белым цветом, позволяющий использовать белые чернила в качестве подложки, кроющего слоя и в качестве полутонового цвета;\nСдвоенная шариковинтовая передача (ШВП) по оси движения портала принтера предназначена для обеспечения прецизионной точности позиционирования каретки и, как следствие, капли на материале. Двухсторонняя ШВП обеспечивает плавные и равномерные движения портала;\nВысокоточная рельса ТНК, большая ширина которой позволяет без вибраций перемещать каретку и благотворно влияет на качество печати\nТяжелая массивная станина, позволяющая достичь максимальной структурной жесткости при работе с любыми материалами в разных скоростных режимах\nОпорная рама каретки, изготовленная из алюминиевого массива;\nЭлектромагнитные энкодеры, обеспечивающие позиционирование подвижных элементов;\nЗащита от столкновения (Anticrash system), которая предотвращает повреждения принтера от возможного столкновения каретки с препятствиями;\nСветлые оттенки цветов Lc и Lm (Light cyan и Light magenta), использование которых улучшает цветопередачу в сложных макетах;\nВозможность печати бесцветным, прозрачным лаком (Varnish)\nФункция автоматического позиционирования над материалом;\nФотографическое качество печати;\nНовейшие печатающие головки Ricoh Gen с переменной каплей 6-35 пл.','3100000','0','0','0','0','Techno-Jet-UV-M-10-Docan.jpg'),(9,'I',8,'Принтер Fujifilm Acuity Advance Select','Только пpoвepeнное оборудование!','Принтер Fujifilm Acuity Advance Select представляет новейшее достижение в технологии цифровой широкоформатной УФ-печати, на 33% быстрее предыдущей модели и специально создан для печатных работ высокого разрешения, требующих аккуратной и точной проработки деталей. На нем можно печатать привлекательную продукцию на жёстких и гибких материалах, при этом качество печати достойно самого пристального взгляда.','2200000','0','0','0','0','Fujifilm-Acuity-Advance-Select.gif'),(10,'I',8,'Широкоформатный цифровой УФ принтер CUBE','Только пpoвepeнное оборудование!','Широкоформатный цифровой УФ принтер CUBE, 7 цветов (CMYK+Lc+Lm+2xWhite). Производство — компания IP&I, Корея. Широкоформатный цифровой УФ принтер CUBE, 7 цветов (CMYK+Lc+Lm+2xWhite).Производство — компания IP&I, Корея.','2199000','0','1','0','0','cube.gif'),(11,'I',4,'Пенокартон KAPA tex','Цена за коробку! В коробке 18 листов','KAPA — tex- это лёгкие композитные панели с фактурой холста и сердцевиной из пенополиуретана.','54357','0','0','1','0','kapa-tex.jpg'),(12,'I',4,'Пенокартон KAPA Plast','Цена за коробку!','KAPA plast – лёгкий, прочный композитный материал верхний слой которого состоит из целлюлозного картона с полимерным покрытием, а сердцевина из пенополиуретана.','47418','0','0','0','0','kapa-plast.jpg'),(13,'I',9,'Промышленный узкорулонный цифровой принтер MATAN Spring G3','Рекомендован для небольших тиражей этикеток, наклеек, дорожных знаков','Преимущества:\n\nСкорость печати до 270 м2/ ч\nСтойкость отпечатков до 5 лет на открытом воздухе\nПечать одновременно 6-ю цветами\nПростота эксплуатации\nИнтуитивный интерфейс\nЭкологичные чернила без резкого химического запаха\nГотовые изделия могут размещаться в местах с повышенными\nтребованиями к экологической безопасности\nНизкая потребляемая мощность\nБыстрая окупаемость\nВысокая надёжность\nЯркие цвета,\nДополнительные цвета золото, серебро и белый\nЧёткость мелких изображений и шрифтов (до 2-х pt)\nУстойчивость к истиранию',NULL,NULL,'0','0','0','MATAN-Spring-G3.png');
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
  KEY `RELATED` (`bonus_id`,`item_id`),
  KEY `FK_ITEM_idx` (`item_id`),
  CONSTRAINT `FK_ITEM` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_BONUS` FOREIGN KEY (`bonus_id`) REFERENCES `bonuses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='bonus k tovary';
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
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
  `item_id` int(11) DEFAULT NULL,
  `main` char(1) DEFAULT NULL COMMENT 'pervaya kartinka ili net?',
  `descript` varchar(50) DEFAULT NULL,
  `image_url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDITEM` (`item_id`,`image_url`,`main`),
  CONSTRAINT `FK_IMAGES` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_images`
--

LOCK TABLES `items_images` WRITE;
/*!40000 ALTER TABLE `items_images` DISABLE KEYS */;
INSERT INTO `items_images` VALUES (1,1,'1',NULL,'azon.jpg'),(2,2,'1',NULL,'azon.jpg'),(3,3,'1',NULL,'satpax.jpg'),(4,4,'0',NULL,'rezka.jpg'),(5,4,'0',NULL,'rezka1.jpg'),(6,4,'1',NULL,'rezka2.jpg'),(7,1,'0',NULL,'azon.jpg'),(8,2,'0',NULL,'azon.jpg'),(9,5,'1',NULL,'service.jpg'),(10,5,'0',NULL,'service1.jpg');
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
  KEY `RELATED` (`relate_id`,`item_id`),
  CONSTRAINT `FK_RELATED` FOREIGN KEY (`relate_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='soputsv. tovary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_related`
--

LOCK TABLES `items_related` WRITE;
/*!40000 ALTER TABLE `items_related` DISABLE KEYS */;
INSERT INTO `items_related` VALUES (2,2,1),(1,3,1),(4,6,7),(3,7,6),(5,7,8),(7,7,9),(6,8,7),(9,8,10),(10,9,10),(11,10,9);
/*!40000 ALTER TABLE `items_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_specs`
--

DROP TABLE IF EXISTS `items_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_specs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `descript` varchar(150) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SPECS` (`item_id`,`name`,`descript`),
  CONSTRAINT `FK_SPECS` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_specs`
--

LOCK TABLES `items_specs` WRITE;
/*!40000 ALTER TABLE `items_specs` DISABLE KEYS */;
INSERT INTO `items_specs` VALUES (11,'Драйвер принтера','Win 95/98/2000/XP/Vista/7, NT4.0, Mac',1),(9,'Интерфейс','USB, сеть LAN',1),(12,'Используемый материал','Стекло, металл, камень, дерево, пластик.',1),(4,'Код управления','ESC/P Raster',1),(1,'Модель','AZON DTS White',1),(3,'Размер печати','Макс. 420 мм x 600 мм, макс. толщина 100 мм',1),(7,'Разрешение печати','Макс. 1440 dpi',1),(6,'Скорость печати','11 отпечатков 600 мм x 420 мм в час',1),(2,'Технология печати','Струйная (микро пьезо головка)',1),(8,'Требования к питанию','220В~, 59 Вт (в режиме ожидания 5 Вт)',1),(10,'Условия эксплуатации','Температура от 15 до 30C, влажность от 50 до 70% отн. влажности',1),(5,'Цветность','C, M, Y, K, + LC, LM, 2W',1),(13,'Материал','100% полиэстер',3),(17,'Пачек в коробке, шт.','10',3),(15,'Размер салфетки, см','23×23',3),(16,'Расфасовка в пачке, шт.','150',3),(14,'Технология','double knit',3),(23,'Вес рулона, кг','1200',4),(26,'Готовый рулон, диаметр втулки, мм','76, 152',4),(25,'Готовый рулон, диаметр, мм','до 800',4),(24,'Готовый рулон, ширина, мм','20-1600',4),(22,'Исходный рулон, диаметр втулки, мм','76, 152',4),(21,'Исходный рулон, диаметр, мм','1300',4),(20,'Исходный рулон, ширина, мм','1650',4),(18,'Масса, г/м2','28-300',4),(19,'Толщина, мкм','25-450',4),(34,'RIP','Photoprint 10',8),(30,'Возможность печати на рулоне','нет',8),(38,'Допустимые форматы файлов','TIFF, JPEG, Postscript3 EPS, PDF',8),(32,'Количество печатающих головок','до 14 шт.',8),(37,'Макс. толщина материала','100 мм, опционально до 300 мм',8),(36,'Максимальное разрешение печати','720dpi х 1440dpi',8),(44,'Масса оборудования','2160 кг',8),(33,'Печатающая головка','Konica Minolta 1024 / Ricoh Gen 5',8),(29,'Размеры оборудования в сборе, м','4,29 x4,25 x 1,65',8),(28,'Размеры печатного поля, м','2,05 х 3,2',8),(43,'Рекомендованная влажность','40%-60%',8),(31,'Система закрепления','УФ лампы Primarc (Великобритания)',8),(42,'Температурное требование','до 28 С',8),(27,'Технология печати','Пьезоэлектрическая струйная печать',8),(40,'Тип привода портала','Сдвоенная ШВП',8),(41,'Требования к электросети','50/60 Гц 220 В(20%)>20 А',8),(35,'Управление цветом','Поддержка ICC профилей, регулировка плотности цвета',8),(39,'Цветовые схемы','C M Y K Lc Lm White Varnish',8),(56,'RIP','ColorGATE Productionserver7 Fujifilm Edition',9),(60,'Вес','778 кг',9),(59,'Габариты (Ш) х (Д) х (В)','4.66 x 2.0 x 1.3 м',9),(53,'Диаметр шпули','7,62 см',9),(48,'Макс. вес листового материала','34 кг/кв.м',9),(51,'Макс. вес рулона','50 кг',9),(50,'Макс. ширина печати на рулонном материале','2.19 м',9),(46,'Максимальная толщина материала','50.8 мм',9),(52,'Максимальный диаметр рулона','240 мм',9),(45,'Максимальный размер материала','2.5 x 1.25 м',9),(47,'Область печати','2.51 x 1.26 м',9),(54,'Печатающие головки','Toshiba Tec CE-2 greyscale, переменная капля 6-42 пл',9),(55,'Разрешение печати','До 1,200dpi и выше',9),(61,'Скорость печати Express, кв. м','32,8 (планшетная) / 25,8 (рулонная)',9),(65,'Скорость печати Fine Art','11,3 (планшетная) / 9,4 (рулонная)',9),(66,'Скорость печати High Definition','5,9 (планшетная) / 5,2 (рулонная)',9),(62,'Скорость печати Production','20,3 (планшетная) / 16,9 (рулонная)',9),(63,'Скорость печати Quality','14 (планшетная) / 11,6 (рулонная)',9),(64,'Скорость печати Quality Density','7,8 (планшетная) / 6,5 (рулонная)',9),(67,'Скорость печати Quality Layered (white) 2 layer','7 (планшетная) / 5,8 (рулонная)',9),(68,'Скорость печати Quality Layered (white) 3 layer','4,6(планшетная) / 3,9 (рулонная)',9),(69,'Скорость печати Varnish gloss mode','4 (планшетная) / — (рулонная)',9),(58,'Требования к электросети','2 x 200-240 В AC, 50/60 Гц 1 фаза, 16A',9),(57,'Условия эксплуатации','18-30 Cо, влажность 30-70%',9),(49,'Ширина рулона','0.9 — 2.2 м',9),(98,'Вес без упаковки','1500 кг',10),(101,'Встроенная система Touch Screen для управления','1 шт',10),(84,'Высота каретки','Задается оператором и выставляется автоматически посредством сервомотора.',10),(97,'Габариты (В/Д/Ш) без столов','1820 / 4350/ 1200 мм',10),(71,'Количество сопел','512',10),(80,'Макс. длина','Не ограничена',10),(81,'Макс. толщина материала','95cm',10),(79,'Макс. ширина материала-носителя','260cm',10),(82,'Механизм подачи носителя','Подающий и принимающий складывающиеся роликовые столы из литого алюминия для жестких материалов + сенсорные приемное и подающее устройства для рулонны',10),(89,'Операционная система рабочей станции','EIS (Easy Interface Software),технология Touch screen позволяет легко управлять принтером прикосновением пальца к экрану, видеть уровень краски, просм',10),(83,'Отверждение краски','2 УФ лампы, расположенные по обе стороны каретки мощностью 320 -450nm. Система УФ отверждения.',10),(96,'Относительная влажность','40 % — 80 %, без оседания конденсата',10),(70,'Печатные голвки','Konica-Minolta KM 512(1440dpi), 8 шт',10),(86,'Поддерживаемые форматы файлов','PostScript 3, PDF, EPS, TIFF, JPEG, RGB',10),(94,'Потребляемая мощность','12 KWA (~8,5 кВт)',10),(102,'Програмное обеспечение','Caldera Grand RIP+',10),(75,'Производительность CMYKLmLc + White','360×360 – 39 кв./час',10),(77,'Производительность CMYKLmLc + White','360х1440 – 7 кв./час',10),(76,'Производительность CMYKLmLc + White','360х720 – 16 кв./час',10),(85,'Протяжка материалов','Печатный стол оборудован транспортёром и мощной вакуумной системой для прочного удержания материалов толщиной до 9,5 см. При печати на материалах мало',10),(72,'Размер капли','14pl',10),(74,'Разрешение','360 х 360 dpi / 360 x 720 dpi/ 360 x 1440 dpi',10),(88,'Растровый процессор','Caldera RIP software',10),(78,'Режимы печати','Автоматическая регулировка скорости движения каретки в зависимости от выбранного разрешения.',10),(91,'Сетевое подключение	','Ethernet',10),(99,'Система подачи/приема листового носителя(подающий и принимающий роликовые столы)','2 шт',10),(100,'Станция промывки печатных головок','1 шт',10),(92,'Стойкость изображения','2-3 года',10),(95,'Температурный диапазон','20°С — 30°С',10),(103,'Технология','Пьезо-электрическая (drop on demand),',10),(87,'Цветопередача','Соответствует Pantone',10),(90,'Чистка головок','Автоматическая система промывки и чистки головок силиконовым ракелем, без участия оператора',10),(73,'Ширина прохода','36,03 mm',10),(93,'Электропитание','1 фаза, 50А, 220-240VAC, 50/60Hz',10),(105,'Стандартные форматы (ШхД), мм','700 х 1000 и 1400 х 3000',11),(104,'ТОЛЩИНА','5,10',11),(107,'Стандартные форматы (ШхД), мм','700 х 1000, 1000 х 1400, 1400 х 3000, 1530 х 3050, 2030 х 3050',12),(106,'Толщина, мм','3,5,10,15',12),(111,'RIP','Scanvec Amiable RIP',13),(119,'Вес брутто','680 кг',13),(118,'Вес нетто','500 кг',13),(117,'Габариты','Д(2200 мм)Ш(1000 мм)В(1000 мм)',13),(116,'Длина рулона','до 500 м',13),(115,'Наружный диаметр рулона','до 500 мм',13),(121,'Параметры электросети','220/230 В переменного тока, 50/60 Гц, однофазный',13),(112,'Печать','roll to roll',13),(120,'Потребляемая мощность','24 А (Макс.)',13),(109,'Разрешение печати*','1600х400, 1200х400, 800х400, 400х400,200х400 dpi',13),(122,'Сжатый воздух','Сухой воздух 5,5/6,0 бар, расход 50 л/мин.',13),(110,'Скорость печати**','до 270 м2/ч',13),(108,'Способ печати','Термотрансфер. До шести цветов за один проход',13),(113,'Ширина материала','до 320 мм',13),(114,'Эффективная ширина печати','307 мм',13);
/*!40000 ALTER TABLE `items_specs` ENABLE KEYS */;
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
  `packet_id` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Вася','Васильев','vasya@vason.com','89851720332','Огого!!!','nl',26,'O'),(2,'Колян','Васильев','pavel@giftec.ru','89851720332','Нутен','bn',28,'O'),(3,'Павел','Павлов','pkuptsov@gmail.com','89851720332','','nl',31,'O');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,'/img/banner/image1.jpg','http://www.giftec.ru/catalogue/hp_latex/','1','Бла бла бла'),(2,'/img/banner/image2.jpg','http://www.giftec.ru/catalogue/kompaniya_swissqprint__rasshiryaet_modelnyj_ryad/','1',NULL),(3,'/img/banner/image3.jpg','http://www.giftec.ru/catalogue/kompaniya_swissqprint__rasshiryaet_modelnyj_ryad/','1',NULL),(4,'/img/banner/image4.jpg','http://www.giftec.ru/catalogue/kompaniya_swissqprint__rasshiryaet_modelnyj_ryad/','1',NULL),(5,'/img/banner/configurator.jpg','http://matan.giftec.ru','1',NULL);
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

-- Dump completed on 2015-07-01 15:50:21
