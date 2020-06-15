-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 15 Haz 2020, 20:39:37
-- Sunucu sürümü: 5.7.23
-- PHP Sürümü: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `javaodev`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolum`
--

DROP TABLE IF EXISTS `bolum`;
CREATE TABLE IF NOT EXISTS `bolum` (
  `BolumID` int(11) NOT NULL AUTO_INCREMENT,
  `BolumADI` text COLLATE utf8mb4_turkish_ci,
  PRIMARY KEY (`BolumID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `bolum`
--

INSERT INTO `bolum` (`BolumID`, `BolumADI`) VALUES
(1, 'Yazılım'),
(2, 'Temizlikçi'),
(3, 'Güvenlikçi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisan`
--

DROP TABLE IF EXISTS `calisan`;
CREATE TABLE IF NOT EXISTS `calisan` (
  `CalisanID` int(11) NOT NULL AUTO_INCREMENT,
  `CalisanAD` varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `CalisanSIFRE` varchar(16) COLLATE utf8mb4_turkish_ci NOT NULL,
  `BolumIDFK` int(11) NOT NULL,
  `CalisanSOYAD` varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `Adres` text COLLATE utf8mb4_turkish_ci,
  `Tel` varchar(11) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `Durum` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CalisanID`),
  KEY `BolumIDFK` (`BolumIDFK`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `calisan`
--

INSERT INTO `calisan` (`CalisanID`, `CalisanAD`, `CalisanSIFRE`, `BolumIDFK`, `CalisanSOYAD`, `Adres`, `Tel`, `Durum`) VALUES
(1, 'Zafer', '123', 1, 'koç', 'asdsadasd', '05414671046', 1),
(2, 'Alper', '123', 1, 'koç', 'adasdasd', '123123', 0),
(3, 'Melike', '123', 3, 'koç', 'asdasd', '123123', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gorev`
--

DROP TABLE IF EXISTS `gorev`;
CREATE TABLE IF NOT EXISTS `gorev` (
  `GorevID` int(11) NOT NULL AUTO_INCREMENT,
  `Gorev` text COLLATE utf8mb4_turkish_ci,
  `GorevBaslangicTarihi` varchar(10) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `GorevBitisTarihi` varchar(10) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `CalisanIDFK` int(11) DEFAULT NULL,
  `YoneticiIDFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`GorevID`),
  KEY `CalisanIDFK` (`CalisanIDFK`),
  KEY `YoneticiIDFK` (`YoneticiIDFK`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `gorev`
--

INSERT INTO `gorev` (`GorevID`, `Gorev`, `GorevBaslangicTarihi`, `GorevBitisTarihi`, `CalisanIDFK`, `YoneticiIDFK`) VALUES
(3, 'Proje tasarımı', '05/11/2020', '20/11/2020', 1, 1),
(5, 'asdasd', '05-11-2023', '05-12-2023', 3, 4),
(7, 'qwe', 'q', 'q', 1, 1),
(8, 'asdasd', '12/05/2012', '17/11/2025', 2, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yonetici`
--

DROP TABLE IF EXISTS `yonetici`;
CREATE TABLE IF NOT EXISTS `yonetici` (
  `YoneticiID` int(11) NOT NULL AUTO_INCREMENT,
  `YoneticiAD` varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `YoneticiSOYAD` varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `YoneticiSifre` varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `BolumIDFK` int(11) NOT NULL,
  `YoneticiADRES` text COLLATE utf8mb4_turkish_ci,
  `YoneticiTEL` varchar(11) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`YoneticiID`),
  KEY `BolumIDFK` (`BolumIDFK`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `yonetici`
--

INSERT INTO `yonetici` (`YoneticiID`, `YoneticiAD`, `YoneticiSOYAD`, `YoneticiSifre`, `BolumIDFK`, `YoneticiADRES`, `YoneticiTEL`) VALUES
(1, 'Zafer2', 'koç', '123', 1, 'asdasdas', '05549511141'),
(2, 'Alper2', 'koç', '123', 1, 'qweqwe', '123123'),
(3, 'Melike2', 'koç', '123', 3, 'adasdasd', '123123'),
(4, 'Leyla2', 'koç', '123', 3, 'asdasdads', '213123');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `calisan`
--
ALTER TABLE `calisan`
  ADD CONSTRAINT `calisan_ibfk_1` FOREIGN KEY (`BolumIDFK`) REFERENCES `bolum` (`BolumID`);

--
-- Tablo kısıtlamaları `gorev`
--
ALTER TABLE `gorev`
  ADD CONSTRAINT `gorev_ibfk_1` FOREIGN KEY (`CalisanIDFK`) REFERENCES `calisan` (`CalisanID`) ON DELETE CASCADE,
  ADD CONSTRAINT `gorev_ibfk_2` FOREIGN KEY (`YoneticiIDFK`) REFERENCES `yonetici` (`YoneticiID`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `yonetici`
--
ALTER TABLE `yonetici`
  ADD CONSTRAINT `yonetici_ibfk_1` FOREIGN KEY (`BolumIDFK`) REFERENCES `bolum` (`BolumID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
