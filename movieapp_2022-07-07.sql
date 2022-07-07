# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.29)
# Database: movieapp
# Generation Time: 2022-07-07 11:14:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table casts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `casts`;

CREATE TABLE `casts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `casts` WRITE;
/*!40000 ALTER TABLE `casts` DISABLE KEYS */;

INSERT INTO `casts` (`id`, `name`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'Tom Cruise',NULL,NULL,NULL),
	(2,'Miles Teller',NULL,NULL,NULL),
	(3,'Jennifer Connelly',NULL,NULL,NULL),
	(4,'Chris Pratt',NULL,NULL,NULL),
	(5,'Bryce Dallas Howard',NULL,NULL,NULL),
	(6,'Laura Dern',NULL,NULL,NULL),
	(7,'Elif Gizem Aykul',NULL,NULL,NULL),
	(8,'Hakan Coşar',NULL,NULL,NULL),
	(9,'Elifcan Kamiloğlu',NULL,NULL,NULL),
	(10,'Dan Stevens',NULL,NULL,NULL),
	(11,'Alison Brie',NULL,NULL,NULL),
	(12,'Sheila Vand',NULL,NULL,NULL),
	(13,'Berat Efe Parlar',NULL,NULL,NULL),
	(14,'Gürgen Öz',NULL,NULL,NULL),
	(15,'Burak Hakkı',NULL,NULL,NULL),
	(16,'Benedict Cumberbatch',NULL,NULL,NULL),
	(17,'Elizabeth Olsen',NULL,NULL,NULL),
	(18,'Chiwetel Ejiofor',NULL,NULL,NULL);

/*!40000 ALTER TABLE `casts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Aksiyon',NULL,NULL),
	(2,'Bilim Kurgu',NULL,NULL),
	(3,'Animasyon',NULL,NULL),
	(4,'Korku',NULL,NULL),
	(5,'Aile',NULL,NULL),
	(6,'Fantastik',NULL,NULL);

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;

INSERT INTO `images` (`id`, `movie_id`, `uri`, `created_at`, `updated_at`)
VALUES
	(1,1,'https://tr.web.img2.acsta.net/c_310_420/pictures/22/05/23/12/43/0003377.jpg',NULL,NULL),
	(2,2,'https://tr.web.img3.acsta.net/c_310_420/pictures/22/04/29/10/46/0161380.jpg',NULL,NULL),
	(3,3,'https://tr.web.img3.acsta.net/c_310_420/pictures/22/06/13/17/27/0783178.jpg',NULL,NULL),
	(4,4,'https://tr.web.img4.acsta.net/c_310_420/pictures/22/05/31/10/28/5521387.jpg',NULL,NULL),
	(5,5,'https://tr.web.img2.acsta.net/c_310_420/pictures/22/01/21/08/01/4754829.jpg',NULL,NULL),
	(6,6,'https://tr.web.img4.acsta.net/c_310_420/pictures/22/05/05/14/02/4321698.jpg',NULL,NULL);

/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2022_06_20_162943_create_categories_table',1),
	(6,'2022_06_20_162952_create_casts_table',1),
	(7,'2022_06_20_163002_create_images_table',1),
	(8,'2022_06_20_163014_create_movies_table',1),
	(9,'2022_06_20_163059_create_movie_casts_table',1),
	(10,'2022_06_21_100505_create_notifications_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table movie_casts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movie_casts`;

CREATE TABLE `movie_casts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `cast_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `movie_casts` WRITE;
/*!40000 ALTER TABLE `movie_casts` DISABLE KEYS */;

INSERT INTO `movie_casts` (`id`, `movie_id`, `cast_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,NULL,NULL),
	(2,1,2,NULL,NULL),
	(3,1,3,NULL,NULL),
	(4,2,4,NULL,NULL),
	(5,2,5,NULL,NULL),
	(6,2,6,NULL,NULL),
	(7,3,7,NULL,NULL),
	(8,3,8,NULL,NULL),
	(9,3,9,NULL,NULL),
	(10,4,10,NULL,NULL),
	(11,4,11,NULL,NULL),
	(12,4,12,NULL,NULL),
	(13,5,13,NULL,NULL),
	(14,5,14,NULL,NULL),
	(15,5,15,NULL,NULL),
	(16,6,16,NULL,NULL),
	(17,6,17,NULL,NULL),
	(18,6,18,NULL,NULL);

/*!40000 ALTER TABLE `movie_casts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table movies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryIds` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` double NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `director` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int NOT NULL DEFAULT '1' COMMENT '1: aktif, 0: pasif',
  `isHome` int NOT NULL DEFAULT '0' COMMENT '0 ise anasayfada gösterme , 1 ise anasayfada göster',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;

INSERT INTO `movies` (`id`, `name`, `categoryIds`, `time`, `star`, `title`, `text`, `video`, `director`, `active`, `isHome`, `created_at`, `updated_at`)
VALUES
	(1,'Top Gun: Maverick','1','2s 11dk',4.5,'Top Gun: Maverick, pilot Pete “Maverick” Mitchell\'in hava kuvvetlerine geri dönüşü sonrası yaşananlara odaklanıyor.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','https://imdb-video.media-imdb.com/vi632472089/1434659607842-pgv4ql-1648562542211.mp4?Expires=1655813030&Signature=rj~mbcVSvYwdcItSkYZWtZyNBAjNWbRENrHtY0SCCBArO5A1R3zz807inZyj1p8X6BFpgwwgTqG5bRlrMgvTrjbWHNbAndyvk7qXJ2rj5-KA2F3SrlNQoyr-VJb84lzb7lQR6gHIsa8rO','Joseph Kosinski',1,0,NULL,NULL),
	(2,'Jurassic World: Hakimiyet','2','2s 26dk',3,'Jurassic World: Hakimiyet, ikinci film sonunda tutuldukları yerden dünyaya yayılarak hayatta kalmayı başaran dinozorlarla insanların tarihte ilk defa bir arada yaşadığı bir dönemi anlatıyor.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',NULL,'Colin Trevorrow',1,0,NULL,NULL),
	(3,'Mutlu Oyuncak Dükkanı','3','1s 20dk',5,'Mutlu Oyuncak Dükkanı, bir arkadaşına yardım etmeye çalışan Kıpır\'ın hikayesini konu ediyor.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',NULL,'H. Sinan Güngör, Semih Turalı',1,0,NULL,NULL),
	(4,'Issız Ev','4','1s 28dk',2,'Issız Ev, hafta sonu kaçamağı yapmak için ev kiralayan iki çiftin başına gelen korkunç olayları konu ediyor.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',NULL,'Dave Franco',1,0,NULL,NULL),
	(5,'Afacanlar: İş Başa Düştü','5','1s 26dk',3.5,'Afacanlar: İş Başa Düştü, sabaha kadar oyun oynamak için gittikleri AVM\'ye giren hırsızlarla büyük bir mücadeleye girişen bir grup çocuğun hikayesini konu ediyor.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',NULL,'Enes Ateş',1,0,NULL,NULL),
	(6,'Doktor Strange: Çoklu Evren Çılgınlığında','6,2','2s 6dk',4,'Doktor Strange: Çoklu Evren Çılgınlığında, eski ve yeni mistik müttefiklerinin yardımıyla bilinmeyene yolculuk eden Doktor Strange\'in macerlarını konu ediyor.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',NULL,'Sam Raimi',1,0,NULL,NULL);

/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` int NOT NULL DEFAULT '5',
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;

INSERT INTO `notifications` (`id`, `title`, `badge`, `image`, `star`, `uri`, `created_at`, `updated_at`)
VALUES
	(1,'Doktor Strange: Çoklu Evren Çılgınlığında','Yeni çıkanlar','https://tr.web.img4.acsta.net/c_310_420/pictures/22/05/05/14/02/4321698.jpg',5,NULL,NULL,NULL);

/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
