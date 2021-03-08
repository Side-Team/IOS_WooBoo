CREATE DATABASE  IF NOT EXISTS `wooboo` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wooboo`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: aws-wooboo.ccsntmql93pq.ap-northeast-2.rds.amazonaws.com    Database: wooboo
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `balancegame`
--

DROP TABLE IF EXISTS `balancegame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `balancegame` (
  `bSeqno` int(11) NOT NULL AUTO_INCREMENT,
  `bTitle` varchar(45) DEFAULT NULL,
  `bSelection1` varchar(30) DEFAULT NULL,
  `bSelection2` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`bSeqno`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balancegame`
--

LOCK TABLES `balancegame` WRITE;
/*!40000 ALTER TABLE `balancegame` DISABLE KEYS */;
INSERT INTO `balancegame` VALUES (1,' ','꿀잼 존못 애인','노잼 존잘(예) 애인'),(2,' ','에어컨 1대','선풍기 3대'),(3,' ','다른 이성이 애인에게 밥먹다가 물떠주기 허용가능','애인이 다른 이성에게 밥먹다가 물떠주기 허용가능'),(4,' ','공짜로 100억 받기','200억 받고 군대 재입대 하기'),(5,' ','20살 100억','46살 만수르'),(6,' ','대머리 애인','털복숭이 애인'),(7,'  ','친구의 전 애인과 사귀기','전 애인의 친구와 사귀기'),(8,'  ','낮져밤이','낮이밤져'),(9,'  ','키스 5분','뽀뽀 무제한'),(10,'  ','귀여운 애인','섹시한 애인'),(11,'  ','애인이 이성친구 집에서 자기','애인 집에 이성친구가 자기'),(12,'  ','10년지기 이성친구 한명','가끔 안부 묻는 이성친구 100명'),(13,' ','입냄새','발냄새'),(14,'  ','평생 대머리로 살기','평생 평발로 살기'),(15,' ','뽀뽀할 때마다 방귀 끼는 사람','뽀뽀할 떄마다 우는 사람'),(16,'  ','만날 때마다 나 뭐 달라진 거 없어?','만날 때마다 나랑 얘기 좀 하자'),(17,'  ','1년 내내 히잡','1년 내내 비키니'),(18,'  ','집에 100cm 바퀴벌레','집에 지네 30 마리'),(19,' ','이성친구와 단둘이 새벽 2시까지 술','이성친구와 1박 2일 여행'),(20,'  ','애인과 하루 종일 데이트 하기','좋아하는 연예인과 1시간 데이트 하기'),(21,'   ','평소 양치 안하는 애인','평소 머리 안감는 애인'),(22,'목욕탕에서 불이 났는데 바가지가 딱 하나 있을때','얼굴을 가린다','중요한 곳을 가린다'),(23,'  ','친구 팬티 안에 내 손','내 팬티 안에 친구 손'),(24,'  ','1일 24 깡하는 친구','1일 24시간 내내 아재개그하는 친구'),(25,' ','이 안 닦아도 치아 청결한 상태 유지','머리 안 감아도 머리 청결한 상태 유지'),(26,' ','내가 언제 죽을지 알기','내가 어떻게 죽는지 알기'),(27,'  ','야동 보다가 애인에게 걸리기','야동 보다가 엄마에게 걸리기'),(28,'   ','치킨 무 없이 치킨먹기','케찹없이 감자튀김 먹기'),(29,'  ','탈모인 원빈','머리풍성한 김광규'),(30,'  ','주기적으로 오르는 탄탄한 주식 하나','한강 앞 100평 아파트'),(31,'  ','평생 살 안 찌는 몸매','평생 공부 안해도 똑똑한 머리'),(32,'  ','짧은 연애 설레고 불타는 사랑','긴 연애의 무미건조하지만 안정적인 사랑'),(33,'  ','싸이코패스랑 친구하기','내가 싸이코패스되기'),(34,'  ','내가 뭘 하는지 아무 관심이 없는 애인','연락이 1분이라도 끊기면 안되는 애인'),(35,'  ','내 원수와 바람난 애인','내 절친과 바람난 애인'),(36,'  ','데이트 할때 완전 철저히 계획짜서 옴','데이트 할때 아무 계획없이 오는 애인'),(37,'  ','비 올때만 만날 수 있는 애인','비 올때는 무슨일이 있어도 못만나는 애인'),(38,'   ','약속시간 2시간씩 늦는 애인','약속 2시간전에 나오는 애인'),(39,'   ','밖에서 손도 안잡는 애인','공공장소에서 애정표현하는 애인'),(40,'   ','치즈 없는 피자','탄산 없는 콜라'),(41,'  ','1/2 확률로 1억 받기','1/4 확률로 100억 받기'),(42,'   ','눈 3개','팔 3개'),(43,'사귄지 한달만에','커플타투','혼인신고'),(44,'친구랑 여행 갔을때','운전기사 되기','사진작가 되기');
/*!40000 ALTER TABLE `balancegame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `user_uSeqno` int(11) NOT NULL,
  `questions_qSeqno` int(11) NOT NULL,
  PRIMARY KEY (`user_uSeqno`,`questions_qSeqno`),
  KEY `fk_like_user1_idx` (`user_uSeqno`),
  KEY `fk_like_questions1_idx` (`questions_qSeqno`),
  CONSTRAINT `fk_like_questions1` FOREIGN KEY (`questions_qSeqno`) REFERENCES `questions` (`qSeqno`),
  CONSTRAINT `fk_like_user1` FOREIGN KEY (`user_uSeqno`) REFERENCES `user` (`uSeqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (1,199),(1,211),(1,212);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `qSeqno` int(11) NOT NULL AUTO_INCREMENT,
  `user_uSeqno` int(11) NOT NULL,
  `qTitle` varchar(20) DEFAULT NULL,
  `qSelection1` varchar(10) DEFAULT NULL,
  `qSelection2` varchar(10) DEFAULT NULL,
  `qSelection3` varchar(10) DEFAULT NULL,
  `qSelection4` varchar(10) DEFAULT NULL,
  `qSelection5` varchar(10) DEFAULT NULL,
  `qCategory` int(11) DEFAULT NULL,
  `qInsertDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `qDeleteDate` datetime DEFAULT NULL,
  `qImageFileName1` varchar(100) DEFAULT NULL,
  `qImageFileName2` varchar(100) DEFAULT NULL,
  `qImageFileName3` varchar(100) DEFAULT NULL,
  `qImageFileName4` varchar(100) DEFAULT NULL,
  `qImageFileName5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`qSeqno`,`user_uSeqno`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (197,1,'점심 뭐 먹을까요','윤기 좔좔 짜장면','얼큰 시원 짬뽕','X','X','X',1,'2021-03-08 01:50:20',NULL,'65FB06F4-27D2-43B7-99D7-9B2735518807.jpeg','8DB34D86-48D5-49D6-B7D4-69FCF35A6D8A.jpeg','','',''),(198,1,'다음주 여행 어디로 갈까요~','강원도 평창!','제주도!','X','X','X',2,'2021-03-08 01:59:51',NULL,'E08E8DAF-174C-4399-9394-28A54B2716AF.jpeg','9B6A782D-0AC5-4B02-8CEA-052504D0A5C6.jpeg','','',''),(199,1,'야식에는??','치킨','피자','곱창','족발','떡볶이',1,'2021-03-08 02:01:58',NULL,'','','','',''),(200,1,'탕수육 먹는 법 국룰은!?','부먹이 진리','찍먹이 진리','X','X','X',1,'2021-03-08 02:02:53',NULL,'','','','',''),(201,1,'치킨 추천 좀','처갓집 수프림','교촌 허니콤보','비비큐 황올','굽네 고추바사삭','X',1,'2021-03-08 02:04:24',NULL,'','','','',''),(202,1,'하.. 족발VS닭발 골라줘 제발','불족과 막국수','국물닭발과 주먹밥','X','X','X',1,'2021-03-08 02:08:13',NULL,'','','','',''),(203,1,'우부들아 골라줘','짜장면','짬뽕','X','X','X',1,'2021-03-08 02:09:36',NULL,'D461FCA2-3C97-4A9B-A41D-FCC068792407.jpeg','17FDAC94-16AF-4D6B-8608-2C497FB7594C.jpeg','','',''),(204,1,'회 추천 좀!!','고등어','참치','연어','광어','우럭',1,'2021-03-08 02:10:43',NULL,'','','','',''),(205,1,'파스타 뭐 먹지???','까르보나라','알리오올리오','볼로네제','로제','X',1,'2021-03-08 02:14:35','2021-03-08 05:13:31','','','','',''),(206,1,'케이크 좀 골라줘!','치즈케이크','오레오케이크','레몬치즈케이크','X','X',1,'2021-03-08 02:16:51',NULL,'','','','',''),(207,1,'치밥에 어울리는 치킨','굽네 볼케이노','지코바 숯불 양념','굽네 갈비천왕','흘릴래 투블랙간장','X',1,'2021-03-08 02:18:35',NULL,'','','','',''),(208,1,'몽쉘vs오예스vs초코파이','몽쉘','오예스','초코파이','X','X',1,'2021-03-08 02:19:39',NULL,'','','','',''),(209,1,'우부들 헬프미 ','엽떡','신전','X','X','X',1,'2021-03-08 02:22:07','2021-03-08 06:09:21','','','','',''),(210,1,'햄버거 뭐먹을까','버거킹','맥날','맘터','X','X',1,'2021-03-08 02:23:11',NULL,'','','','',''),(211,151,'강원도vs제주도','강원도','제주도','X','X','X',2,'2021-03-08 03:25:23',NULL,'','','','',''),(212,151,'IT학원 골라줘 우부들','이젠','더조은','X','X','X',6,'2021-03-08 03:26:36',NULL,'','','','',''),(215,1,'여행지 추천좀 해주세요','강원도 평창!','제주도!','X','X','X',2,'2021-03-08 05:12:56',NULL,'DC12A377-9170-43FD-92C1-FE027F6204D7.jpeg','2F2952C0-15C5-42AA-846B-32737C6F16C6.jpeg','','',''),(216,1,'여행 어디로 갈까요?','강원도','제주도','X','X','X',2,'2021-03-08 05:17:01',NULL,'4F5E3B9B-B01E-467B-AC44-15B6D2CC1C65.jpeg','87B68478-1FEC-4BB1-97FC-FEB8AEDBEA9A.jpeg','','',''),(217,1,'이번달 에 갈만한 여행지 추천좀~','강원도','제주도','X','X','X',2,'2021-03-08 05:31:13',NULL,'1B1F985D-E584-489B-91EE-0DB5B6485E64.jpeg','98B3A7C0-D32A-4E99-A120-B5E1DCD01E81.jpeg','','',''),(218,1,'여행지추천좀~','강원도','제주도','X','X','X',2,'2021-03-08 05:44:37',NULL,'8497C98A-3F39-4159-811D-3593C86ECC20.jpeg','E3E063F5-57D2-46E9-915F-F19F15AEDD6D.jpeg','','',''),(219,1,'어디로 여행가니??','강원도','제주도','X','X','X',2,'2021-03-08 05:52:00','2021-03-08 06:07:10','9628649C-9254-46B4-B38E-BA65A2BE9D70.jpeg','B361582A-EDB8-4F7D-BD96-ED9AECA488CF.jpeg','','','');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `questions_qSeqno` int(11) NOT NULL,
  `user_uSeqno` int(11) NOT NULL,
  `rViews` int(11) DEFAULT '1',
  PRIMARY KEY (`questions_qSeqno`,`user_uSeqno`),
  KEY `fk_insert_user1_idx` (`user_uSeqno`),
  CONSTRAINT `fk_insert_questions` FOREIGN KEY (`questions_qSeqno`) REFERENCES `questions` (`qSeqno`),
  CONSTRAINT `fk_insert_user1` FOREIGN KEY (`user_uSeqno`) REFERENCES `user` (`uSeqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (197,1,422),(198,1,378),(199,1,401),(200,1,312),(201,1,288),(202,1,302),(203,1,212),(204,1,199),(205,1,174),(206,1,154),(207,1,89),(208,1,78),(209,1,66),(210,1,2),(211,151,6),(212,151,11),(215,1,1),(216,1,1),(217,1,1),(218,1,1),(219,1,1);
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `questions_qSeqno` int(11) NOT NULL,
  `user_uSeqno` int(11) NOT NULL,
  `rContent` varchar(200) DEFAULT NULL,
  `rReportDate` datetime DEFAULT NULL,
  `rResult` int(11) DEFAULT NULL,
  PRIMARY KEY (`questions_qSeqno`,`user_uSeqno`),
  KEY `fk_report_questions1_idx` (`questions_qSeqno`),
  KEY `fk_report_user1` (`user_uSeqno`),
  CONSTRAINT `fk_report_questions1` FOREIGN KEY (`questions_qSeqno`) REFERENCES `questions` (`qSeqno`),
  CONSTRAINT `fk_report_user1` FOREIGN KEY (`user_uSeqno`) REFERENCES `user` (`uSeqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (197,1,'짜장면이 너무 맛있어보여서 짜증낭요','2021-03-08 05:50:43',0);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `select_balancegame`
--

DROP TABLE IF EXISTS `select_balancegame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `select_balancegame` (
  `balancegame_bSeqno` int(11) NOT NULL,
  `user_uSeqno` int(11) NOT NULL,
  `sbSelection` int(11) DEFAULT NULL,
  `sbViews` int(11) DEFAULT NULL,
  PRIMARY KEY (`balancegame_bSeqno`,`user_uSeqno`),
  KEY `fk_select_balancegame_balancegame1_idx` (`balancegame_bSeqno`),
  KEY `fk_select_balancegame_user1` (`user_uSeqno`),
  CONSTRAINT `fk_select_balancegame_balancegame1` FOREIGN KEY (`balancegame_bSeqno`) REFERENCES `balancegame` (`bSeqno`),
  CONSTRAINT `fk_select_balancegame_user1` FOREIGN KEY (`user_uSeqno`) REFERENCES `user` (`uSeqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `select_balancegame`
--

LOCK TABLES `select_balancegame` WRITE;
/*!40000 ALTER TABLE `select_balancegame` DISABLE KEYS */;
INSERT INTO `select_balancegame` VALUES (2,6,1,NULL),(2,25,1,NULL),(3,1,0,NULL),(3,6,1,NULL),(3,25,1,NULL),(4,6,1,NULL),(4,50,1,NULL),(5,6,1,NULL),(5,25,0,NULL),(6,1,1,NULL),(6,25,0,NULL),(7,6,1,NULL),(7,25,1,NULL),(8,6,1,NULL),(8,50,0,NULL),(9,6,1,NULL),(9,25,1,NULL),(9,50,1,NULL),(10,6,1,NULL),(11,6,1,NULL),(11,25,0,NULL),(11,50,1,NULL),(12,6,1,NULL),(13,25,0,NULL),(13,50,0,NULL),(14,1,1,NULL),(14,25,1,NULL),(15,6,0,NULL),(15,25,1,NULL),(15,50,1,NULL),(16,6,1,NULL),(16,50,0,NULL),(17,25,1,NULL),(18,6,1,NULL),(18,25,1,NULL),(18,50,1,NULL),(19,6,1,NULL),(20,6,0,NULL),(20,25,1,NULL),(21,6,1,NULL),(22,6,0,NULL),(22,25,1,NULL),(23,6,0,NULL),(23,50,1,NULL),(25,6,1,NULL),(25,25,1,NULL),(26,6,1,NULL),(27,6,1,NULL),(27,25,0,NULL),(27,50,0,NULL),(28,6,0,NULL),(29,6,0,NULL),(29,25,0,NULL),(29,50,0,NULL),(30,1,1,NULL),(30,6,0,NULL),(30,25,1,NULL),(31,6,1,NULL),(31,25,1,NULL),(31,50,0,NULL),(33,6,0,NULL),(33,50,1,NULL),(34,6,1,NULL),(34,50,0,NULL),(35,6,0,NULL),(36,6,0,NULL),(36,25,1,NULL),(37,6,0,NULL),(37,25,0,NULL),(38,6,1,NULL),(38,25,1,NULL),(39,25,0,NULL),(39,50,1,NULL),(40,6,0,NULL),(40,25,1,NULL),(40,50,0,NULL),(41,1,0,NULL),(41,6,1,NULL),(41,50,0,NULL),(42,6,1,NULL),(42,50,0,NULL),(43,6,1,NULL),(44,1,1,NULL),(44,6,1,NULL),(44,25,1,NULL),(44,50,0,NULL);
/*!40000 ALTER TABLE `select_balancegame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `select_question`
--

DROP TABLE IF EXISTS `select_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `select_question` (
  `questions_qSeqno` int(11) NOT NULL,
  `user_uSeqno` int(11) NOT NULL,
  `sqSelection` int(11) DEFAULT NULL,
  PRIMARY KEY (`questions_qSeqno`,`user_uSeqno`),
  KEY `fk_select_questions1_idx` (`questions_qSeqno`),
  KEY `fk_select_user1` (`user_uSeqno`),
  CONSTRAINT `fk_select_questions1` FOREIGN KEY (`questions_qSeqno`) REFERENCES `questions` (`qSeqno`),
  CONSTRAINT `fk_select_user1` FOREIGN KEY (`user_uSeqno`) REFERENCES `user` (`uSeqno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `select_question`
--

LOCK TABLES `select_question` WRITE;
/*!40000 ALTER TABLE `select_question` DISABLE KEYS */;
INSERT INTO `select_question` VALUES (197,1,1),(197,119,1),(197,120,2),(197,121,1),(197,122,1),(197,123,1),(197,124,1),(197,125,1),(197,126,2),(197,127,2),(197,128,1),(197,129,2),(197,130,2),(197,131,1),(197,132,1),(197,133,2),(197,134,1),(197,135,2),(197,136,2),(197,137,1),(197,138,1),(197,139,1),(197,140,1),(197,141,1),(197,142,2),(197,143,1),(197,144,2),(197,145,2),(197,146,2),(197,147,1),(197,148,1),(197,149,2),(197,150,1),(197,151,1),(199,1,3),(199,6,2),(199,119,1),(199,120,2),(199,121,3),(199,122,2),(199,123,1),(199,124,4),(199,125,5),(199,126,5),(199,127,4),(199,128,3),(199,129,4),(199,130,2),(199,131,1),(199,132,3),(199,133,2),(199,134,3),(199,135,2),(199,136,5),(199,137,1),(199,138,4),(199,139,1),(199,140,5),(199,141,1),(199,142,2),(199,143,1),(199,144,2),(199,145,2),(199,146,2),(199,147,3),(199,148,1),(199,149,2),(199,150,4),(199,151,5),(199,152,3),(199,153,1),(202,6,2),(207,6,2),(208,6,1),(209,6,1),(210,6,2),(212,1,2),(212,6,2);
/*!40000 ALTER TABLE `select_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uSeqno` int(11) NOT NULL AUTO_INCREMENT,
  `uEmail` varchar(30) DEFAULT NULL,
  `uPw` varchar(20) DEFAULT NULL,
  `uPhone` varchar(20) DEFAULT NULL,
  `uInsertDate` datetime DEFAULT NULL,
  `uDeleteDate` datetime DEFAULT NULL,
  `uImageFileName` varchar(45) DEFAULT 'img_calmness',
  `uLogin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uSeqno`),
  UNIQUE KEY `uEmail_UNIQUE` (`uEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'wooboo@naver.com','qweR1234','11',NULL,NULL,'img_Happy.png',NULL),(2,'12','12',NULL,NULL,NULL,'happy.png',NULL),(3,'14','15',NULL,NULL,NULL,'happy.png',NULL),(4,'15','16',NULL,NULL,NULL,'happy.png',NULL),(5,'17','189',NULL,NULL,NULL,'happy.png',NULL),(6,'16','17',NULL,NULL,'2021-03-08 05:23:54','happy.png',NULL),(7,'123','18',NULL,NULL,NULL,'happy.png',NULL),(8,'qkrtpa12@naver.com',NULL,NULL,'2021-03-02 05:30:40',NULL,'happy.png','kakao'),(11,'qkrtpa13@gmail.com',NULL,NULL,'2021-03-02 10:46:35',NULL,'happy.png','google'),(13,'dkstjdals933@gmail.com',NULL,NULL,'2021-03-02 10:50:44','2021-03-05 08:40:34','happy.png','google'),(24,'66','rrrr1111',NULL,NULL,NULL,'img_Embarrassment.png',NULL),(25,'25','25',NULL,NULL,'2021-03-05 15:07:06','img_calmness',NULL),(26,'26','222',NULL,NULL,NULL,'img_calmness',NULL),(27,'qq@qq.qq','1234qwer','01090993729','2021-03-03 07:55:51',NULL,'img_calmness',NULL),(28,'tnctis@naver.com','11',NULL,'2021-03-03 11:44:46',NULL,'img_calmness',NULL),(29,'tnctis21@naver.com','11111111',NULL,'2021-03-03 11:46:15',NULL,'happy.png','kakao'),(30,'test@naver.com','123',NULL,'2021-03-03 11:53:11','2021-03-03 11:53:56','img_calmness',NULL),(31,'test1@naver.com','4',NULL,'2021-03-03 11:55:05',NULL,'img_calmness',NULL),(32,'rr@ff.cc','11111111',NULL,'2021-03-03 12:14:04',NULL,'img_calmness',NULL),(34,'qw@qw.we','22222222',NULL,'2021-03-03 12:21:03',NULL,'img_calmness',NULL),(35,'tess@ff.ff','11111111',NULL,'2021-03-03 12:21:46',NULL,'img_calmness',NULL),(36,'mm@dd.jojoba','Qwer1234',NULL,'2021-03-03 12:38:44',NULL,'img_calmness',NULL),(37,'pp@pp.gg','qweR1234',NULL,'2021-03-03 12:39:50',NULL,'img_calmness',NULL),(42,'67','1234qweR','12',NULL,NULL,'img_calmness',NULL),(45,'wooboo@test.com','1234qweR',NULL,'2021-03-05 07:27:36',NULL,'img_calmness',NULL),(46,'web@wbwdd.com','1234Qwer','01023456666','2021-03-05 07:47:26',NULL,'img_calmness',NULL),(50,'88','47',NULL,NULL,NULL,'img_calmness',NULL),(51,'qhfka5656@gmail.com',NULL,NULL,'2021-03-05 08:58:21',NULL,'img_calmness','google'),(53,'ttest@naver.com','qqqqW123','01022223333','2021-03-05 09:31:54',NULL,'img_calmness',NULL),(54,'ad@naver.com','qwerT123',NULL,'2021-03-05 12:38:09','2021-03-08 06:02:52','img_calmness',NULL),(119,'1','1',NULL,NULL,NULL,'img_calmness',NULL),(120,'2','1',NULL,NULL,NULL,'img_calmness',NULL),(121,'3','1',NULL,NULL,NULL,'img_calmness',NULL),(122,'4','1',NULL,NULL,NULL,'img_calmness',NULL),(123,'5','1',NULL,NULL,NULL,'img_calmness',NULL),(124,'6','1',NULL,NULL,NULL,'img_calmness',NULL),(125,'7','1',NULL,NULL,NULL,'img_calmness',NULL),(126,'8','1',NULL,NULL,NULL,'img_calmness',NULL),(127,'9','1',NULL,NULL,NULL,'img_calmness',NULL),(128,'10','1',NULL,NULL,NULL,'img_calmness',NULL),(129,'11','1',NULL,NULL,NULL,'img_calmness',NULL),(130,'30','1',NULL,NULL,NULL,'img_calmness',NULL),(131,'31','1',NULL,NULL,NULL,'img_calmness',NULL),(132,'32','1',NULL,NULL,NULL,'img_calmness',NULL),(133,'33','1',NULL,NULL,NULL,'img_calmness',NULL),(134,'34','1',NULL,NULL,NULL,'img_calmness',NULL),(135,'35','1',NULL,NULL,NULL,'img_calmness',NULL),(136,'36','1',NULL,NULL,NULL,'img_calmness',NULL),(137,'37','1',NULL,NULL,NULL,'img_calmness',NULL),(138,'38','1',NULL,NULL,NULL,'img_calmness',NULL),(139,'39','1',NULL,NULL,NULL,'img_calmness',NULL),(140,'40','1',NULL,NULL,NULL,'img_calmness',NULL),(141,'41','1',NULL,NULL,NULL,'img_calmness',NULL),(142,'42','1',NULL,NULL,NULL,'img_calmness',NULL),(143,'43','1',NULL,NULL,NULL,'img_calmness',NULL),(144,'44','1',NULL,NULL,NULL,'img_calmness',NULL),(145,'45','1',NULL,NULL,NULL,'img_calmness',NULL),(146,'46','1',NULL,NULL,NULL,'img_calmness',NULL),(147,'100','1',NULL,NULL,NULL,'img_calmness',NULL),(148,'48','1',NULL,NULL,NULL,'img_calmness',NULL),(149,'49','1',NULL,NULL,NULL,'img_calmness',NULL),(150,'50','1',NULL,NULL,NULL,'img_calmness',NULL),(151,'51','1',NULL,NULL,NULL,'img_calmness',NULL),(152,'52','1',NULL,NULL,NULL,'img_calmness',NULL),(153,'53','1',NULL,NULL,NULL,'img_calmness',NULL),(154,'wooboo@naver.cook','1234qweR','01023455055','2021-03-08 05:49:21',NULL,'img_calmness',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-08 15:27:57
