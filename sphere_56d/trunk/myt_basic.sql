-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 184.3.4.1    Database: mytserver
-- ------------------------------------------------------
-- Server version	5.6.30-0ubuntu0.15.10.1

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `idAcct` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `status` enum('form','waiting','rejected','active','confirm') NOT NULL DEFAULT 'form',
  `lastedit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAcct`),
  UNIQUE KEY `byUsername` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2514 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

--
-- Table structure for table `alchemy`
--

DROP TABLE IF EXISTS `alchemy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alchemy` (
  `mask` int(10) unsigned NOT NULL,
  `potion` varchar(45) NOT NULL,
  PRIMARY KEY (`mask`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alchemy`
--

--
-- Table structure for table `background`
--

DROP TABLE IF EXISTS `background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `background` (
  `UID` int(10) unsigned NOT NULL,
  `KIND` int(10) unsigned NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `UID` (`UID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background`
--

--
-- Table structure for table `class_inventory`
--

DROP TABLE IF EXISTS `class_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classid` int(10) unsigned NOT NULL,
  `defname` varchar(255) NOT NULL DEFAULT 'i_adaga',
  `amount` int(10) unsigned NOT NULL DEFAULT '1',
  `color` varchar(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=993 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_inventory`
--


--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(45) NOT NULL,
  `flags` int(10) unsigned zerofill NOT NULL DEFAULT '0000000001',
  `revision` int(10) unsigned NOT NULL DEFAULT '0',
  `udate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `background` text NOT NULL,
  `superclass` varchar(45) NOT NULL,
  `Alchemy` int(10) unsigned NOT NULL DEFAULT '0',
  `Anatomy` int(10) unsigned NOT NULL DEFAULT '0',
  `AnimalLore` int(10) unsigned NOT NULL DEFAULT '0',
  `Archery` int(10) unsigned NOT NULL DEFAULT '0',
  `ArmsLore` int(10) unsigned NOT NULL DEFAULT '0',
  `Begging` int(10) unsigned NOT NULL DEFAULT '0',
  `Blacksmithing` int(10) unsigned NOT NULL DEFAULT '0',
  `Bowcraft` int(10) unsigned NOT NULL DEFAULT '0',
  `Bushido` int(10) unsigned NOT NULL DEFAULT '0',
  `Camping` int(10) unsigned NOT NULL DEFAULT '0',
  `Carpentry` int(10) unsigned NOT NULL DEFAULT '0',
  `Cartography` int(10) unsigned NOT NULL DEFAULT '0',
  `Chivalry` int(10) unsigned NOT NULL DEFAULT '0',
  `Cooking` int(10) unsigned NOT NULL DEFAULT '0',
  `DetectingHidden` int(10) unsigned NOT NULL DEFAULT '0',
  `Enticement` int(10) unsigned NOT NULL DEFAULT '0',
  `EvaluatingIntel` int(10) unsigned NOT NULL DEFAULT '0',
  `Fencing` int(10) unsigned NOT NULL DEFAULT '0',
  `Fishing` int(10) unsigned NOT NULL DEFAULT '0',
  `Focus` int(10) unsigned NOT NULL DEFAULT '0',
  `Forensics` int(10) unsigned NOT NULL DEFAULT '0',
  `Healing` int(10) unsigned NOT NULL DEFAULT '0',
  `Herding` int(10) unsigned NOT NULL DEFAULT '0',
  `Hiding` int(10) unsigned NOT NULL DEFAULT '0',
  `Inscription` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemId` int(10) unsigned NOT NULL DEFAULT '0',
  `LockPicking` int(10) unsigned NOT NULL DEFAULT '0',
  `Lumberjacking` int(10) unsigned NOT NULL DEFAULT '0',
  `Macefighting` int(10) unsigned NOT NULL DEFAULT '0',
  `Magery` int(10) unsigned NOT NULL DEFAULT '0',
  `MagicResistance` int(10) unsigned NOT NULL DEFAULT '0',
  `Meditation` int(10) unsigned NOT NULL DEFAULT '0',
  `Mining` int(10) unsigned NOT NULL DEFAULT '0',
  `Musicianship` int(10) unsigned NOT NULL DEFAULT '0',
  `Necromancy` int(10) unsigned NOT NULL DEFAULT '0',
  `Ninjitsu` int(10) unsigned NOT NULL DEFAULT '0',
  `Parrying` int(10) unsigned NOT NULL DEFAULT '0',
  `Peacemaking` int(10) unsigned NOT NULL DEFAULT '0',
  `Poisoning` int(10) unsigned NOT NULL DEFAULT '0',
  `Provocation` int(10) unsigned NOT NULL DEFAULT '0',
  `RemoveTrap` int(10) unsigned NOT NULL DEFAULT '0',
  `Snooping` int(10) unsigned NOT NULL DEFAULT '0',
  `Spellweaving` int(10) unsigned NOT NULL DEFAULT '0',
  `SpiritSpeak` int(10) unsigned NOT NULL DEFAULT '0',
  `Stealing` int(10) unsigned NOT NULL DEFAULT '0',
  `Stealth` int(10) unsigned NOT NULL DEFAULT '0',
  `Swordsmanship` int(10) unsigned NOT NULL DEFAULT '0',
  `Tactics` int(10) unsigned NOT NULL DEFAULT '0',
  `Tailoring` int(10) unsigned NOT NULL DEFAULT '0',
  `Taming` int(10) unsigned NOT NULL DEFAULT '0',
  `TasteId` int(10) unsigned NOT NULL DEFAULT '0',
  `Tinkering` int(10) unsigned NOT NULL DEFAULT '0',
  `Tracking` int(10) unsigned NOT NULL DEFAULT '0',
  `Veterinary` int(10) unsigned NOT NULL DEFAULT '0',
  `Wrestling` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `index_2` (`superclass`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

--
-- Table structure for table `craftmenu`
--

DROP TABLE IF EXISTS `craftmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftmenu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `def` varchar(45) NOT NULL COMMENT 'Nome do menu ou ITEMDEF',
  `type` enum('menu','function','item') NOT NULL COMMENT 'Item ou menu',
  `father` int(10) unsigned NOT NULL COMMENT 'nivel superior a este',
  `code` varchar(255) NOT NULL DEFAULT '1' COMMENT 'String de validação do item OU linha de comando de uma function.',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4705 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftmenu`
--

--
-- Table structure for table `eventsLog`
--

DROP TABLE IF EXISTS `eventsLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventsLog` (
  `idEvent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `charUid` int(10) unsigned NOT NULL,
  `charAcct` int(10) unsigned NOT NULL,
  `eventType` enum('Kill PC','Kill NPC','Killed by PC','Killed by NPC','Login','Logout','GM Note','RP Note','Jail') DEFAULT NULL,
  `char2Uid` int(10) unsigned NOT NULL,
  `char2Acct` int(10) unsigned NOT NULL,
  `x` smallint(5) unsigned NOT NULL,
  `y` smallint(5) unsigned NOT NULL,
  `z` tinyint(4) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`idEvent`),
  KEY `byTs` (`timestamp`),
  KEY `byUid` (`charUid`),
  KEY `byAcct` (`charAcct`),
  KEY `byChar2Uid` (`char2Uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2128898 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventsLog`
--

--
-- Table structure for table `form_answers`
--

DROP TABLE IF EXISTS `form_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `questionid` smallint(5) unsigned NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13755 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_answers`
--

--
-- Table structure for table `form_questions`
--

DROP TABLE IF EXISTS `form_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `question` text NOT NULL,
  `ord` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_questions`
--

LOCK TABLES `form_questions` WRITE;
/*!40000 ALTER TABLE `form_questions` DISABLE KEYS */;
INSERT INTO `form_questions` VALUES (20,'Bem vindo!','Bem vindo ao Mystical Tales Shard.\r\nPara que sua conta seja aceita e voce possa jogar regularmente voce deve conhecer a ambientacao do servidor (Disponivel no site) e responder as proximas cinco questoes:',0),(21,'Ambientacao','Conte um pouco sobre seu personagem e como ele compreende o Continente de Myrthos. ',1),(22,'Orcs e Drows','Como a ambientacao descreve a convivencia de Orcs e Drows?',4),(23,'Exploit e Bugs','Como proceder ao ver algum player usando magias continuamente nos npcs vendors/porteiros de uma cidade? E quando descobre algum bug/problema no jogo ou em algum sistema?',5),(24,'QuestÃ£o RP','Como os Humanos e Elfos chegaram ao Continente de Myrthos?',2),(25,'Divindades','Fale um pouco sobre seu deus preferido da MyT, quais caracteristicas dele o agradam.',3),(26,'Aguarde!','Seu formulario sera avaliado por um GM em breve!!',7),(27,'Bem vind3','Responda as perguntas seguintes com atenÃ§Ã£o! Elas definirÃ£o sua aprovaÃ§Ã£o ou reprovaÃ§Ã£o para jogar no servidor. LEMBRE-SE: AO JOGAR VOCÃŠ ESTÃ ACEITANDO AS REGRAS E TERMOS DE USO DO SERVIDOR. Leia antes de preencher!',13),(28,'Gostaria de participar do teste?','Voce gostaria de participar dos testes do servidor reprtando bugs, ajudando na construcao do mapa e balanceamento de magias estabelecendo contato frequente com a Staff em nosso forum?',8),(29,'As grandes questÃµes','Resumidamente: O que vocÃª espera do shard? O que espera se tornar com seu personagem? Qual o sentido da vida?',6),(30,'Voce frequenta o forum?','Voce tem uma conta no forum da MyT?<br>Se sim, com que frequencia visita?<br>Qual seu nick no forum?',10),(31,'Em branco','Deixe esta resposta em branco',12),(32,'Ajuda bem vinda','Sua ajuda sera muito bem vinda.<br> Em que pontos voce pretende atuar no teste?<br> Gostaria de atuar numa area em especial ou deseja ser incumbido de algum teste para que um sistema de sua preferencia fique pronto mais rapido?',9),(33,'Aguarde avaliacao','Suas respostas serao lidas pela staff e entao voce sera informado se participara do teste ou nao.<br>Obrigado pela atencao e pelo carinho pelo shard!',11),(34,'teste1','teste',14);
/*!40000 ALTER TABLE `form_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furniture`
--

DROP TABLE IF EXISTS `furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `furniture` (
  `furniture` int(10) unsigned NOT NULL,
  `player` int(10) unsigned NOT NULL,
  `since` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furniture`
--

--
-- Table structure for table `house_members`
--

DROP TABLE IF EXISTS `house_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house_members` (
  `idmember` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idhouse` int(10) unsigned NOT NULL DEFAULT '0',
  `uidmember` varchar(45) NOT NULL,
  `flags` varchar(45) NOT NULL DEFAULT '00',
  PRIMARY KEY (`idmember`),
  KEY `index_2` (`idhouse`,`uidmember`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_members`
--

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `houses` (
  `idhouse` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UID` varchar(45) NOT NULL,
  `owner` varchar(45) DEFAULT '00',
  `value` varchar(45) DEFAULT NULL,
  `lastpaid` varchar(45) DEFAULT '00',
  PRIMARY KEY (`idhouse`) USING BTREE,
  KEY `index_2` (`UID`,`owner`)
) ENGINE=MyISAM AUTO_INCREMENT=799 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--
--
-- Table structure for table `itemforge`
--

DROP TABLE IF EXISTS `itemforge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemforge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revision` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `itemdef` varchar(45) NOT NULL,
  `dispid` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `subsection` varchar(45) NOT NULL,
  `weight` int(10) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  `tevents` varchar(90) NOT NULL,
  `resources` varchar(120) NOT NULL,
  `resources2` varchar(120) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `skillmake` varchar(45) NOT NULL,
  `layer` varchar(45) NOT NULL,
  `pile` int(10) unsigned NOT NULL,
  `tdata1` varchar(45) NOT NULL,
  `tdata2` varchar(45) NOT NULL,
  `tdata3` varchar(45) NOT NULL,
  `tdata4` varchar(45) NOT NULL,
  `dam` varchar(45) NOT NULL,
  `armor` int(10) unsigned NOT NULL,
  `speed` int(10) unsigned NOT NULL,
  `skill` varchar(45) NOT NULL,
  `reqstr` int(10) unsigned NOT NULL,
  `twohands` varchar(1) NOT NULL,
  `color` int(10) unsigned NOT NULL,
  `create` varchar(255) NOT NULL,
  `valid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `byItemdef` (`itemdef`,`revision`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8955 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemforge`
--

--
-- Table structure for table `jail`
--

DROP TABLE IF EXISTS `jail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jail` (
  `timestamp` datetime NOT NULL,
  `uidJailer` int(10) unsigned NOT NULL,
  `jailer` varchar(45) NOT NULL,
  `uidJailed` int(10) unsigned NOT NULL,
  `jailed` varchar(45) NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `reason` varchar(90) NOT NULL,
  PRIMARY KEY (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jail`
--


--
-- Table structure for table `merchant_values`
--

DROP TABLE IF EXISTS `merchant_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemdef` varchar(45) NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `itemname` varchar(45) NOT NULL,
  `value` float NOT NULL DEFAULT '0.1',
  `region` varchar(45) NOT NULL DEFAULT 'a_Kalesh',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemByRegion` (`itemdef`,`region`)
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_values`
--


--
-- Table structure for table `messageBox`
--

DROP TABLE IF EXISTS `messageBox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messageBox` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` enum('Sent','Pending') NOT NULL,
  `triggerUid` int(10) unsigned NOT NULL,
  `toUid` int(10) unsigned NOT NULL,
  `color` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122402 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messageBox`
--


--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `NewsDate` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `news` text NOT NULL,
  PRIMARY KEY (`NewsDate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

--
-- Table structure for table `questState`
--

DROP TABLE IF EXISTS `questState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questState` (
  `idPlayer` int(10) unsigned NOT NULL,
  `idQuest` int(10) unsigned NOT NULL,
  `idStep` tinyint(3) unsigned NOT NULL,
  `dateStarted` datetime NOT NULL,
  `dateCompleted` datetime NOT NULL,
  `repetitions` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idPlayer`,`idQuest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questState`
--

--
-- Table structure for table `questSteps`
--

DROP TABLE IF EXISTS `questSteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questSteps` (
  `idQuest` int(10) unsigned NOT NULL,
  `idStep` tinyint(3) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` enum('Kill Mob','Get Mob Item','Get Item','Craft Item','Find Item','Escord','Delivery','Text','Talk To','Reward','Custom') NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  `param1` varchar(45) NOT NULL,
  `param2` varchar(45) NOT NULL,
  PRIMARY KEY (`idQuest`,`idStep`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questSteps`
--

--
-- Table structure for table `quests`
--

DROP TABLE IF EXISTS `quests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quests` (
  `idQuest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idNpc` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mayRepeat` tinyint(1) NOT NULL,
  PRIMARY KEY (`idQuest`),
  KEY `Index_2` (`idNpc`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quests`
--

--
-- Table structure for table `recipebooks`
--

DROP TABLE IF EXISTS `recipebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipebooks` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `defname` varchar(45) NOT NULL DEFAULT 'i_unused',
  `skill` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipebooks`
--

--
-- Table structure for table `rpGrade`
--

DROP TABLE IF EXISTS `rpGrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rpGrade` (
  `idGrade` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `charUid` int(10) unsigned NOT NULL,
  `charAcct` int(10) unsigned NOT NULL,
  `gmUid` int(10) unsigned NOT NULL,
  `gmAcct` int(10) unsigned NOT NULL,
  `grade` smallint(6) NOT NULL,
  PRIMARY KEY (`idGrade`),
  UNIQUE KEY `Index_2` (`charUid`,`gmAcct`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1078 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpGrade`
--

--
-- Table structure for table `server_events`
--

DROP TABLE IF EXISTS `server_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('Startup','Shutdown','SVN Update') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=597 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_events`
--


--
-- Table structure for table `server_stats`
--

DROP TABLE IF EXISTS `server_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_stats` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `players` smallint(5) unsigned NOT NULL DEFAULT '0',
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `chars` int(10) unsigned NOT NULL DEFAULT '0',
  `ram` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_stats`
--

--
-- Table structure for table `spellbooks`
--

DROP TABLE IF EXISTS `spellbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spellbooks` (
  `player` int(5) unsigned DEFAULT NULL COMMENT 'UID do jogador',
  `spellid` int(4) unsigned DEFAULT NULL COMMENT 'ID da spell',
  `skill` int(3) unsigned DEFAULT NULL COMMENT 'Essa spell e relativa a que skill?',
  `diff` int(5) unsigned DEFAULT NULL COMMENT 'Dificuldade da spell. Para classificar no livro',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ByPlayer` (`player`,`spellid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=49357 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spellbooks`
--


--
-- Table structure for table `teleporters`
--

DROP TABLE IF EXISTS `teleporters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teleporters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ax` smallint(5) unsigned NOT NULL,
  `ay` smallint(5) unsigned NOT NULL,
  `az` tinyint(4) NOT NULL,
  `am` tinyint(3) unsigned NOT NULL,
  `bx` smallint(5) unsigned NOT NULL,
  `by` smallint(5) unsigned NOT NULL,
  `bz` tinyint(4) NOT NULL,
  `bm` tinyint(3) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `byA` (`ax`,`ay`,`az`,`am`)
) ENGINE=MyISAM AUTO_INCREMENT=679 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teleporters`
--

--
-- Table structure for table `towns`
--

DROP TABLE IF EXISTS `towns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `towns` (
  `region` varchar(45) NOT NULL DEFAULT 'a_world',
  `capital` varchar(45) NOT NULL DEFAULT 'a_world',
  `type` int(10) unsigned NOT NULL DEFAULT '1',
  `master` int(10) unsigned NOT NULL DEFAULT '0',
  `artefactUID` int(10) unsigned NOT NULL DEFAULT '0',
  `permissions` int(10) unsigned NOT NULL DEFAULT '6032',
  `tresure` int(10) unsigned NOT NULL DEFAULT '1000',
  `vaultUID` int(10) unsigned NOT NULL DEFAULT '0',
  `color1` int(10) unsigned NOT NULL DEFAULT '4',
  `color2` int(10) unsigned NOT NULL DEFAULT '54',
  `commercialfee` int(10) unsigned NOT NULL DEFAULT '5',
  `buildingfee` int(10) unsigned NOT NULL DEFAULT '15',
  `tilelandprice` int(10) unsigned NOT NULL DEFAULT '13',
  `tilebuildprice` int(10) unsigned NOT NULL DEFAULT '22',
  `tilefixtureprice` int(10) unsigned NOT NULL DEFAULT '70',
  `FriendRaces` varchar(255) NOT NULL DEFAULT 'Anao,Elfo,Drow,Humano,Orc',
  PRIMARY KEY (`region`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns`
--


--
-- Table structure for table `towns_laws`
--

DROP TABLE IF EXISTS `towns_laws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `towns_laws` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Numero do decreto',
  `sign` varchar(45) NOT NULL COMMENT 'Assinatura de quem promulgou',
  `title` varchar(64) NOT NULL COMMENT 'Titulo do decreto',
  `time` datetime NOT NULL COMMENT 'Hora real',
  `gtime` varchar(45) NOT NULL COMMENT 'Data do jogo',
  `text` text NOT NULL COMMENT 'Texto do decreto',
  `region` varchar(45) NOT NULL COMMENT 'Defname da region',
  `flags` int(10) unsigned NOT NULL COMMENT 'Promulgado, revogado...',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=977 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns_laws`
--

--
-- Table structure for table `towns_members`
--

DROP TABLE IF EXISTS `towns_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `towns_members` (
  `UID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '''UID do player''',
  `region` varchar(45) NOT NULL DEFAULT 'a_world' COMMENT '''Defname da region''',
  `priv_id` int(10) unsigned NOT NULL DEFAULT '999' COMMENT '''id em towns_privs. 0 se banido''',
  `flags` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '''Criminal, em debito, preso e etc.'''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns_members`
--

--
-- Table structure for table `towns_petitions`
--

DROP TABLE IF EXISTS `towns_petitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `towns_petitions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL,
  `UID` int(10) unsigned NOT NULL,
  `region` varchar(45) NOT NULL,
  `father` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL,
  `text` text NOT NULL,
  `time` datetime NOT NULL,
  `gtime` varchar(45) NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region` (`region`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns_petitions`
--


--
-- Table structure for table `towns_privs`
--

DROP TABLE IF EXISTS `towns_privs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `towns_privs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(45) NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '999',
  `title` varchar(24) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `privs` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=323 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns_privs`
--

--
-- Table structure for table `towns_servants`
--

DROP TABLE IF EXISTS `towns_servants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `towns_servants` (
  `uid` int(10) unsigned NOT NULL,
  `region` varchar(45) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns_servants`
--

--
-- Table structure for table `tradeItems`
--

DROP TABLE IF EXISTS `tradeItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tradeItems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postDate` datetime NOT NULL,
  `sellDate` datetime NOT NULL,
  `idVendor` int(10) unsigned NOT NULL,
  `idPlayerVendor` int(10) unsigned NOT NULL,
  `idPlayerBuyer` int(10) unsigned NOT NULL,
  `playerVendorName` varchar(45) NOT NULL,
  `playerBuyerName` varchar(45) NOT NULL,
  `idItem` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price` float NOT NULL,
  `itemType` enum('Weapon','Armor','Magic','Food','Misc','Clothes','Raw') NOT NULL,
  `itemName` varchar(45) NOT NULL,
  `defName` varchar(30) NOT NULL,
  `subsection` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106426 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradeItems`
--

--
-- Table structure for table `traps`
--

DROP TABLE IF EXISTS `traps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traps` (
  `panelUID` int(10) unsigned NOT NULL,
  `objectUID` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traps`
--

--
-- Table structure for table `vendorItems`
--

DROP TABLE IF EXISTS `vendorItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendorItems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `idVendor` int(10) unsigned NOT NULL,
  `idPlayer` int(10) unsigned NOT NULL,
  `idItem` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price` float NOT NULL,
  `playerName` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `itemType` enum('Weapon','Armor','Magic','Food','Misc','Clothes','Raw') NOT NULL,
  `defName` varchar(30) NOT NULL,
  `itemName` varchar(45) NOT NULL,
  `subsection` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `byItemId` (`idItem`),
  KEY `byType` (`itemType`)
) ENGINE=MyISAM AUTO_INCREMENT=126435 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorItems`
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-23 13:18:42
