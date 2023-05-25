SELECT cities.name, regions.name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE cities.population >= 350000;

SELECT cities.name, regions.name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `lines` (`id`, `name`) VALUES
(1,	'blue'),
(2,	'red'),
(3,	'green');

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prev` int(3) unsigned DEFAULT NULL,
  `next` int(3) unsigned DEFAULT NULL,
  `line_id` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `stations` (`id`, `name`, `prev`, `next`, `line_id`) VALUES
(1,	'Героїв праці',	NULL,	2,	1),
(2,	'Студентська',	1,	3,	1),
(3,	'Академіка Павлова',	2,	4,	1),
(4,	'Історичний музей',	3,	5,	1),
(5,	'Київська',	4,	6,	1),
(6,	'Пушкінська',	5,	7,	1),
(7,	'Індустріальна',	6,	8,	1),
(8,	'Академіка Барабашова',	7,	NULL,	1),
(9,	'Університет',	NULL,	10,	2),
(10,	'Тракторний завод',	9,	10,	2),
(11,	'ім. О.С.Масельського',	10,	12,	2),
(12,	'Армійська',	11,	13,	2),
(13,	'Проспект Гагаріна',	12,	14,	2),
(14,	'Турбоатом',	13,	15,	2),
(15,	'Завод ім.Малишева',	14,	16,	2),
(16,	'Спортивна',	15,	17,	2),
(17,	'Палац спорту',	16,	18,	2),
(18,	'Південний вокзал',	17,	19,	2),
(19,	'Центральний ринок',	18,	20,	2),
(20,	'Майдан Конституції',	19,	21,	2),
(21,	'Холодна гора',	20,	NULL,	2),
(22,	'Перемога',	NULL,	23,	3),
(23,	'Олексіївська',	22,	24,	3),
(24,	'23 Серпня',	23,	25,	3),
(25,	'Держпром',	24,	26,	3),
(26,	'Наукова',	25,	27,	3),
(27,	'Ботанічний сад',	26,	28,	3),
(28,	'Архітектора Бекетова',	27,	29,	3),
(29,	'Метробудівників',	28,	30,	3),
(30,	'Захисників України',	29,	NULL,	3);

DROP TABLE IF EXISTS `transitions`;
CREATE TABLE `transitions` (
  `station_id_1` int(3) unsigned NOT NULL,
  `station_id_2` int(3) unsigned NOT NULL,
  PRIMARY KEY (`station_id_1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `transitions` (`station_id_1`, `station_id_2`) VALUES
(9,	25),
(4,	20),
(13, 29);