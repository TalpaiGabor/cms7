-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Gép: localhost
-- Létrehozás ideje: 2017. Aug 31. 18:42
-- Kiszolgáló verziója: 10.1.13-MariaDB
-- PHP verzió: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `nubes_common`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `com_company`
--

CREATE TABLE `com_company` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `federal_tax_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `db_name` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `db_user` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `db_password` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `db_source` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `db_prefix` varchar(40) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `com_company`
--

INSERT INTO `com_company` (`id`, `name`, `federal_tax_id`, `partner_id`, `db_name`, `db_user`, `db_password`, `db_source`, `db_prefix`) VALUES
(1, 'Test', 1, 1, 'mhzq', 'root', '', '127.0.0.1', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `com_company_settings`
--

CREATE TABLE `com_company_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `com_company_settings`
--

INSERT INTO `com_company_settings` (`id`, `name`) VALUES
(1, 'Test');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `com_partner`
--

CREATE TABLE `com_partner` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `first_name` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `com_partner`
--

INSERT INTO `com_partner` (`id`, `name`, `first_name`, `last_name`) VALUES
(1, 'Partner Péter', 'Péter', 'Partner');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `com_company`
--
ALTER TABLE `com_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- A tábla indexei `com_company_settings`
--
ALTER TABLE `com_company_settings`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `com_partner`
--
ALTER TABLE `com_partner`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `com_company`
--
ALTER TABLE `com_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT a táblához `com_company_settings`
--
ALTER TABLE `com_company_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT a táblához `com_partner`
--
ALTER TABLE `com_partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `com_company`
--
ALTER TABLE `com_company`
  ADD CONSTRAINT `com_company_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `com_partner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
