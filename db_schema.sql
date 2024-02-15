/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `album_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `band_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `style_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `link_id` mediumint(8) unsigned DEFAULT NULL,
  `album` varchar(100) NOT NULL DEFAULT '',
  `album_year` smallint(5) unsigned DEFAULT NULL,
  `album_time` varchar(6) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `lyrics` text DEFAULT NULL,
  `songs` text DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `xif1albums` (`band_id`),
  KEY `xif2albums` (`style_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23013 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums_contents` (
  `album_id` int(10) unsigned NOT NULL DEFAULT 0,
  `content_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`album_id`,`content_id`),
  KEY `xif1albums_contents` (`album_id`),
  KEY `xif2albums_contents` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bands` (
  `band_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `band` varchar(40) NOT NULL DEFAULT '',
  `first_letter` char(1) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `band_alt` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(100) DEFAULT NULL,
  `last_update` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`band_id`),
  UNIQUE KEY `xak1bands` (`band_alt`),
  KEY `xif1bands` (`band`),
  KEY `xif2bands` (`first_letter`)
) ENGINE=MyISAM AUTO_INCREMENT=8294 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bands_contents` (
  `band_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `content_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`band_id`,`content_id`),
  KEY `xif1bands_contents` (`band_id`),
  KEY `xif2bands_contents` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bands_galleries` (
  `band_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `gallery_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`band_id`,`gallery_id`),
  KEY `xif1bands_galleries` (`band_id`),
  KEY `xif2bands_galleries` (`gallery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bands_relations` (
  `band_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `relation_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`band_id`,`relation_id`),
  KEY `xif1bands_relations` (`band_id`),
  KEY `xif2bands_relations` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bands_topics` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT 0,
  `band_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`topic_id`,`band_id`),
  KEY `xif1bands_topics` (`band_id`),
  KEY `xif2bands_topics` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banned_forum` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `till` datetime /* mariadb-5.3 */ DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `xifbanned_forum` (`till`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banned_ip` (
  `ip` varchar(15) NOT NULL DEFAULT '',
  `redirect` varchar(255) DEFAULT NULL,
  `till` datetime /* mariadb-5.3 */ DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ip`),
  KEY `x_banned_till` (`till`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banned_mail` (
  `domain_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`domain_id`),
  UNIQUE KEY `xak1banned_email` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banned_shop` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `till` datetime /* mariadb-5.3 */ DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `xifbanned_shop` (`till`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL DEFAULT '',
  `href` varchar(255) NOT NULL DEFAULT '',
  `title_ru` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `date_from` datetime /* mariadb-5.3 */ DEFAULT NULL,
  `date_till` datetime /* mariadb-5.3 */ DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `weight` float NOT NULL DEFAULT 1,
  `pos1` tinyint(3) unsigned DEFAULT 0,
  `pos2` tinyint(3) unsigned DEFAULT 0,
  `shown` bigint(20) unsigned NOT NULL DEFAULT 0,
  `clicked` bigint(20) unsigned NOT NULL DEFAULT 0,
  `added` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`banner_id`),
  KEY `ix1_banners` (`active`),
  KEY `ix2_banners` (`date_from`),
  KEY `ix3_banners` (`date_till`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `newsmaker_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `permitted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `content_date` date DEFAULT NULL,
  `actual_date` date DEFAULT NULL,
  `language` enum('R','E') NOT NULL DEFAULT 'R',
  `content_type` enum('articles','bios','news','reviews','shows') NOT NULL DEFAULT 'news',
  `score` double DEFAULT NULL,
  `link_id` mediumint(8) unsigned DEFAULT NULL,
  `content` text DEFAULT NULL,
  `last_modified` timestamp /* mariadb-5.3 */ NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`content_id`),
  KEY `idx_content_nmid` (`newsmaker_id`),
  KEY `idx_content_linkid` (`link_id`),
  KEY `idx_content_type` (`content_type`),
  KEY `idx_content_date` (`content_date`)
) ENGINE=MyISAM AUTO_INCREMENT=74457 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_messages` (
  `message_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `message_time` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  `topic_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(15) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `now_playing` varchar(255) DEFAULT NULL,
  `when_deleted` timestamp /* mariadb-5.3 */ NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`,`message_id`),
  KEY `xif1deleted_messages` (`user_id`),
  KEY `xif2deleted_messages` (`topic_id`),
  KEY `xif3deleted_messages` (`when_deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries` (
  `gallery_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_en` varchar(255) NOT NULL DEFAULT '',
  `gallery_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`gallery_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1893 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geolimits` (
  `country_code` char(2) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `samples` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `forum` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `shop` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`country_code`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_types` (
  `good_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(20) NOT NULL DEFAULT '',
  `name_ru` varchar(50) NOT NULL DEFAULT '',
  `name_en` varchar(50) NOT NULL DEFAULT '',
  `chapter_ru` varchar(50) NOT NULL DEFAULT '',
  `chapter_en` varchar(50) NOT NULL DEFAULT '',
  `cover_x` tinyint(3) unsigned DEFAULT NULL,
  `cover_y` tinyint(3) unsigned DEFAULT NULL,
  `separated` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `use_rebates` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `show_in_top_sales` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `show_on_first_page` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `bind_to_bands` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `bind_to_albums` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `bind_to_contents` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `on_page` int(10) unsigned DEFAULT NULL,
  `title_name_ru` varchar(50) NOT NULL DEFAULT '',
  `title_name_en` varchar(50) NOT NULL DEFAULT '',
  `subtitle_name_ru` varchar(50) NOT NULL DEFAULT '',
  `subtitle_name_en` varchar(50) NOT NULL DEFAULT '',
  `attr1_name_ru` varchar(50) DEFAULT NULL,
  `attr1_name_en` varchar(50) DEFAULT NULL,
  `attr2_name_ru` varchar(50) DEFAULT NULL,
  `attr2_name_en` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`good_type_id`),
  UNIQUE KEY `xak_good_types` (`uri`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `good_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_type_id` int(10) unsigned DEFAULT NULL,
  `good_group` varchar(100) DEFAULT NULL,
  `good_title` varchar(100) DEFAULT NULL,
  `good_year` smallint(6) DEFAULT NULL,
  `cover` varchar(50) DEFAULT NULL,
  `attr1` varchar(50) DEFAULT NULL,
  `attr2` varchar(50) DEFAULT NULL,
  `price_ue` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `new_item` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `language` enum('R','E') NOT NULL DEFAULT 'R',
  `added` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`good_id`),
  KEY `xif1goods` (`added`),
  KEY `xif3goods` (`active`),
  KEY `xif4goods` (`new_item`),
  KEY `xif5goods` (`language`),
  KEY `xif2goods` (`good_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6444 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_albums` (
  `good_id` int(10) unsigned NOT NULL DEFAULT 0,
  `album_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`good_id`,`album_id`),
  KEY `xif1goods_albums` (`album_id`),
  KEY `xif2goods_albums` (`good_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_bands` (
  `good_id` int(10) unsigned NOT NULL DEFAULT 0,
  `band_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`good_id`,`band_id`),
  KEY `xif1goods_bands` (`band_id`),
  KEY `xif2goods_bands` (`good_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_contents` (
  `good_id` int(10) unsigned NOT NULL DEFAULT 0,
  `content_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`good_id`,`content_id`),
  KEY `xif1goods_contents` (`content_id`),
  KEY `xif2goods_contents` (`good_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexer_tasks` (
  `item` enum('band','album','news','shows','articles','reviews','soundcheck','rearrange') NOT NULL DEFAULT 'band',
  `language` enum('R','E') NOT NULL DEFAULT 'R',
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `task_time` timestamp /* mariadb-5.3 */ NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`item`,`language`,`id`),
  KEY `x_time` (`task_time`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_manager` (
  `range_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_start` int(10) unsigned NOT NULL DEFAULT 0,
  `ip_end` int(10) unsigned NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `last_access` datetime /* mariadb-5.3 */ DEFAULT NULL,
  PRIMARY KEY (`range_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_security` (
  `ip` varchar(15) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `last_access` datetime /* mariadb-5.3 */ DEFAULT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `link_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `band_id` mediumint(8) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `our` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `partner` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `label` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `blog` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `ear` varchar(20) DEFAULT NULL,
  `button` varchar(20) DEFAULT NULL,
  `priority` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `xif1links` (`band_id`),
  KEY `xie2links` (`partner`),
  KEY `xie3links` (`our`),
  KEY `xie4links` (`label`),
  KEY `xie5links` (`blog`)
) ENGINE=MyISAM AUTO_INCREMENT=3102 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `log_date` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` enum('R','E') NOT NULL DEFAULT 'R',
  `user_text` text DEFAULT NULL,
  `moderator_text` text NOT NULL,
  `moderator_only` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `shop_log` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `user_id` mediumint(8) unsigned DEFAULT 0,
  PRIMARY KEY (`log_date`),
  KEY `xif1logs` (`user_id`),
  KEY `xif2logs` (`language`,`moderator_only`,`shop_log`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m_from` varchar(255) NOT NULL DEFAULT '',
  `m_to` varchar(255) NOT NULL DEFAULT '',
  `m_type` enum('text','html') NOT NULL DEFAULT 'text',
  `m_date` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  `m_subject` text DEFAULT NULL,
  `m_text` text DEFAULT NULL,
  `m_images` text DEFAULT NULL,
  `attempts` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `message_time` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  `topic_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(15) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `now_playing` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`message_id`),
  KEY `xif1messages` (`user_id`),
  KEY `xif2messages` (`topic_id`),
  KEY `xif3messages` (`message_time`),
  KEY `xif5messages` (`ip`),
  FULLTEXT KEY `f_message` (`message`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_on_site` (
  `band_id` mediumint(8) unsigned NOT NULL,
  `album_id` int(10) unsigned NOT NULL DEFAULT 0,
  `language` enum('R','E') NOT NULL DEFAULT 'R',
  `change_date` date NOT NULL,
  `changes` text NOT NULL,
  PRIMARY KEY (`band_id`,`album_id`,`language`,`change_date`),
  KEY `xie1_new_on_site` (`change_date`),
  KEY `xif2_new_on_site` (`band_id`),
  KEY `xif3_new_on_site` (`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsmakers` (
  `newsmaker_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `login` varchar(25) NOT NULL DEFAULT '',
  `password` varchar(25) NOT NULL DEFAULT '',
  `editor` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `admin` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `shop_admin` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `notify` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `notify_soundcheck` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `field` varchar(50) DEFAULT NULL,
  `icq` bigint(20) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_title` varchar(255) DEFAULT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  `fave_bands` text DEFAULT NULL,
  `hate_bands` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`newsmaker_id`),
  UNIQUE KEY `xaknewsmakers` (`login`),
  KEY `xif1newsmakers` (`notify`),
  KEY `xif2newsmakers` (`notify_soundcheck`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `good_id` int(10) unsigned NOT NULL DEFAULT 0,
  `order_id` int(10) unsigned NOT NULL DEFAULT 0,
  `good_count` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`good_id`,`order_id`),
  KEY `xif1order_details` (`good_id`),
  KEY `xif2order_details` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `order_date` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('active','checked','frozen','fulfilled','np') NOT NULL DEFAULT 'active',
  `price` double NOT NULL DEFAULT 0,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `xif1orders` (`user_id`),
  KEY `xif2orders` (`status`),
  KEY `xif3orders` (`order_date`)
) ENGINE=MyISAM AUTO_INCREMENT=1753 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned DEFAULT NULL,
  `band_id` mediumint(8) unsigned DEFAULT NULL,
  `content_id` int(10) unsigned DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `attribute` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `xif1photos` (`album_id`),
  KEY `xif2photos` (`band_id`),
  KEY `xif3photos` (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30775 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `picture_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `photo` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `txt` text DEFAULT NULL,
  `alt_en` varchar(255) DEFAULT NULL,
  `txt_en` text DEFAULT NULL,
  PRIMARY KEY (`picture_id`),
  KEY `xif1pictures` (`gallery_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63054 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points` (
  `point_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `answer` varchar(255) NOT NULL DEFAULT '',
  `answer_en` varchar(255) DEFAULT NULL,
  `voices` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`point_id`),
  KEY `xif1points` (`poll_id`)
) ENGINE=MyISAM AUTO_INCREMENT=947 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls` (
  `poll_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `poll_date` date NOT NULL DEFAULT '0000-00-00',
  `question` varchar(255) NOT NULL DEFAULT '',
  `question_en` varchar(255) DEFAULT NULL,
  `multiple_choice` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`poll_id`)
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_bands` (
  `poll_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `band_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`poll_id`,`band_id`),
  KEY `xif1polls_bands` (`poll_id`),
  KEY `xif2polls_bands` (`band_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rebates` (
  `range_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `start` double NOT NULL DEFAULT 0,
  `rebate` double NOT NULL DEFAULT 0,
  `local` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`range_id`),
  KEY `xif1rebates` (`local`),
  KEY `xif2rebates` (`start`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=871 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `samples` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned NOT NULL DEFAULT 0,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `song` varchar(100) DEFAULT NULL,
  `modified_date` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sample_id`),
  KEY `xif1samples` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3717 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `file_title` varchar(255) NOT NULL DEFAULT '',
  `priority` int(10) unsigned DEFAULT NULL,
  `language` enum('R','E') NOT NULL DEFAULT 'R',
  PRIMARY KEY (`file_id`),
  KEY `xie1shop_files` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_stats` (
  `good_id` int(10) unsigned NOT NULL DEFAULT 0,
  `stat_month` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `stat_year` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sold` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`good_id`,`stat_month`,`stat_year`),
  KEY `xif1stat` (`good_id`),
  KEY `xif2stat` (`stat_year`),
  KEY `xif3stat` (`stat_month`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soundcheck` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `album_id` int(10) unsigned NOT NULL DEFAULT 0,
  `score` double NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `added` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`album_id`),
  KEY `xif1soundcheck` (`user_id`),
  KEY `xif2soundcheck` (`album_id`),
  KEY `xie3soundcheck` (`added`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spammers` (
  `ip` varchar(15) NOT NULL DEFAULT '',
  `attempts` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `last_attempt` timestamp /* mariadb-5.3 */ NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stop_list` (
  `owner_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`owner_id`,`user_id`),
  KEY `xif1black_list` (`owner_id`),
  KEY `xif2black_list` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `styles` (
  `style_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `style` varchar(35) NOT NULL DEFAULT '',
  `mp3_genre` varchar(50) NOT NULL DEFAULT 'Metal',
  `style_ai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`style_id`)
) ENGINE=MyISAM AUTO_INCREMENT=188 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_notify` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`topic_id`,`user_id`),
  KEY `xif1topic_notify` (`user_id`),
  KEY `xif2topic_notify` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `language` enum('R','E') NOT NULL DEFAULT 'R',
  `status` enum('immortal','mboard','trash') NOT NULL DEFAULT 'mboard',
  `title` varchar(100) NOT NULL DEFAULT '',
  `hint` varchar(255) NOT NULL DEFAULT '',
  `postings` int(10) unsigned NOT NULL DEFAULT 0,
  `viewed` bigint(20) unsigned NOT NULL DEFAULT 0,
  `viewed_today` int(10) unsigned NOT NULL DEFAULT 0,
  `created` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_access` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_posting` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`topic_id`),
  KEY `xif1topics` (`user_id`),
  KEY `xif2topics` (`language`,`status`),
  KEY `xif3topics` (`last_posting`),
  KEY `xif4topics` (`last_access`),
  FULLTEXT KEY `f_topic` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=131072 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_modified` (
  `url_frame` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`url_frame`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urls` (
  `url_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_id`),
  UNIQUE KEY `xakurls` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=65114 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urls_indexes` (
  `word_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `url_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `weight` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`word_id`,`url_id`),
  KEY `xif1coords` (`url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `moderator` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `soundchecker` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `user_name` varchar(50) NOT NULL DEFAULT '',
  `dry_name` varchar(50) NOT NULL DEFAULT '',
  `user_password` varchar(20) NOT NULL DEFAULT '',
  `photo` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fio` varchar(255) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `icq` bigint(20) unsigned DEFAULT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_title` varchar(100) DEFAULT NULL,
  `last_date` timestamp /* mariadb-5.3 */ NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `session` text DEFAULT NULL,
  `orders_sum` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `xak1users` (`user_email`),
  KEY `xif1users` (`moderator`),
  KEY `xif3users` (`dry_name`),
  KEY `xif2users` (`soundchecker`)
) ENGINE=MyISAM AUTO_INCREMENT=235090 DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voices` (
  `poll_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `voice_ip` varchar(15) NOT NULL DEFAULT '',
  `vote_date` datetime /* mariadb-5.3 */ NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`poll_id`,`voice_ip`),
  KEY `xif1voices` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
