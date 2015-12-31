
--
-- Table structure for table `koken_slugs`
--

DROP TABLE IF EXISTS `koken_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_slugs` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_slugs`
--

LOCK TABLES `koken_slugs` WRITE;
/*!40000 ALTER TABLE `koken_slugs` DISABLE KEYS */;
INSERT INTO `koken_slugs` VALUES ('content.01-1'),('content.01-2'),('content.01-3'),('content.01-4'),('content.mc'),('content.test'),('content.test-1');
/*!40000 ALTER TABLE `koken_slugs` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `koken_trash`
--

DROP TABLE IF EXISTS `koken_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koken_trash` (
  `id` varchar(255) NOT NULL,
  `data` text,
  `created_on` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_on` (`created_on`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koken_trash`
--

LOCK TABLES `koken_trash` WRITE;
/*!40000 ALTER TABLE `koken_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `koken_trash` ENABLE KEYS */;
UNLOCK TABLES;

