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
