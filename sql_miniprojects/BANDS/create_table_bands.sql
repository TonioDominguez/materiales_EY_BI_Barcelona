CREATE DATABASE IF NOT EXISTS bands;
USE bands;

CREATE TABLE `band` (
  `band_id` int NOT NULL AUTO_INCREMENT,
  `band_url` varchar(120) DEFAULT NULL,
  `band_name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`band_id`)
) ;

CREATE TABLE `album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `band_id` int DEFAULT NULL,
  `album_name` varchar(120) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `abstract` longtext,
  `run_time` float DEFAULT NULL,
  `sales_amount` int DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `band_id` (`band_id`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`band_id`) REFERENCES `band` (`band_id`)
) ;

CREATE TABLE `band_genre` (
  `band_id` int NOT NULL,
  `genre_name` varchar(120) NOT NULL,
  PRIMARY KEY (`band_id`,`genre_name`),
  CONSTRAINT `band_genre_ibfk_1` FOREIGN KEY (`band_id`) REFERENCES `band` (`band_id`)
) ;

CREATE TABLE `musician` (
  `musician_id` int NOT NULL AUTO_INCREMENT,
  `musician_url` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`musician_id`)
) ;

CREATE TABLE `band_musician` (
  `band_id` int NOT NULL,
  `musician_id` int NOT NULL,
  `musician_status` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`band_id`,`musician_id`),
  CONSTRAINT `band_musician_ibfk_1` FOREIGN KEY (`band_id`) REFERENCES `band` (`band_id`),
  CONSTRAINT `band_musician_ibfk_2` FOREIGN KEY (`musician_id`) REFERENCES `musician` (`musician_id`)
) ;-- KEY `musician_id` (`musician_id`),


CREATE TABLE `musician_name` (
  `musician_id` int NOT NULL,
  `musician_name` varchar(120) NOT NULL,
  PRIMARY KEY (`musician_id`,`musician_name`),
  CONSTRAINT `musician_name_ibfk_1` FOREIGN KEY (`musician_id`) REFERENCES `musician` (`musician_id`)
) ;

