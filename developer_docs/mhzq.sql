-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Gép: localhost
-- Létrehozás ideje: 2017. Okt 07. 05:00
-- Kiszolgáló verziója: 10.1.13-MariaDB
-- PHP verzió: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `mhzq`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `amount`
--

CREATE TABLE `amount` (
  `id` int(11) NOT NULL,
  `name` varchar(7) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `amount`
--

INSERT INTO `amount` (`id`, `name`, `description`) VALUES
(1, 'kevés', 'asdasdasd'),
(2, 'köz', 'közepes'),
(3, 'sok', 'sokkal több'),
(4, 'asd', 'lldld'),
(5, 'ötödik', 'leírás');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `attachments`
--

CREATE TABLE `attachments` (
  `id1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `company_data`
--

CREATE TABLE `company_data` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(4) NOT NULL,
  `exchange_price` decimal(9,6) NOT NULL,
  `correction` varchar(21) NOT NULL,
  `decimal_place` int(6) NOT NULL,
  `description` varchar(50) NOT NULL,
  `end_correction` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `currency`
--

INSERT INTO `currency` (`id`, `name`, `exchange_price`, `correction`, `decimal_place`, `description`, `end_correction`) VALUES
(1, 'eu', '1.000000', '0,5', 0, 'euró', 0),
(2, 'USDD', '0.800000', '5%', 2, 'amerikai dollár', 1),
(3, 'HUF', '315.000000', '1%', 0, 'magyar forint', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `employer`
--

CREATE TABLE `employer` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `birth_date` date NOT NULL,
  `id_card_number` int(13) NOT NULL,
  `username` varchar(32) NOT NULL,
  `passwd` varchar(60) NOT NULL,
  `default_pay_office` varchar(20) NOT NULL,
  `comment` varchar(254) NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `employer`
--

INSERT INTO `employer` (`id`, `name`, `birth_date`, `id_card_number`, `username`, `passwd`, `default_pay_office`, `comment`, `last_login`) VALUES
(1, 'a', '1952-12-12', 1235489, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'otpd', 'asd', '2017-10-07 02:24:38'),
(2, 'name', '1999-05-05', 123, 'name', 'b068931cc450442b63f5b3d276ea4297', 'asd', 'asd', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `exception`
--

CREATE TABLE `exception` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unique_name` varchar(255) NOT NULL,
  `message_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `exception`
--

INSERT INTO `exception` (`id`, `name`, `unique_name`, `message_type`) VALUES
(1, 'Hiba! Üresen maradt az egyik mező!', 'hiba_uresen_maradt_az_egyik_mezo', 'error'),
(2, 'Hiba! Rossz jelszó!', 'hiba_rossz_jelszo', 'error'),
(3, 'Hiba! Üresen maradt mező(k)!!', 'hiba_uresen_maradt_mezok', 'error'),
(4, 'Hibásan megadott adat!', 'hibasan_megadott_adat', 'error'),
(5, 'Sikertelen partnerfelvitel!', 'sikertelen_partnerfelvitel', 'error'),
(7, 'Nem adtál meg adatokat!', 'nem_adtal_meg_adatokat', 'error');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `exception_lang`
--

CREATE TABLE `exception_lang` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `exception_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `exception_lang`
--

INSERT INTO `exception_lang` (`id`, `message`, `lang_id`, `exception_id`) VALUES
(1, 'Hiba! Üresen maradt az egyik mező!', 1, 1),
(2, 'Hiba! Üresen maradt az egyik mező!', 2, 1),
(3, 'Hiba! Üresen maradt az egyik mező!', 3, 1),
(4, 'Hiba! Üresen maradt az egyik mező!', 4, 1),
(5, 'Hiba! Üresen maradt az egyik mező!', 5, 1),
(6, 'Hiba! Üresen maradt az egyik mező!', 6, 1),
(7, 'Hiba! Üresen maradt az egyik mező!', 7, 1),
(8, 'Hiba! Rossz jelszó!', 1, 2),
(9, 'Hiba! Rossz jelszó!', 2, 2),
(10, 'Hiba! Rossz jelszó!', 3, 2),
(11, 'Hiba! Rossz jelszó!', 4, 2),
(12, 'Hiba! Rossz jelszó!', 5, 2),
(13, 'Hiba! Rossz jelszó!', 6, 2),
(14, 'Hiba! Rossz jelszó!', 7, 2),
(99, 'Hiba! Üresen maradt mező(k)!!', 1, 15),
(100, 'Hiba! Üresen maradt mező(k)!!', 2, 15),
(101, 'Hiba! Üresen maradt mező(k)!!', 3, 15),
(102, 'Hiba! Üresen maradt mező(k)!!', 4, 15),
(103, 'Hiba! Üresen maradt mező(k)!!', 5, 15),
(104, 'Hiba! Üresen maradt mező(k)!!', 6, 15),
(105, 'Hiba! Üresen maradt mező(k)!!', 7, 15),
(106, 'Hibásan megadott adat!', 1, 16),
(107, 'Hibásan megadott adat!', 2, 16),
(108, 'Hibásan megadott adat!', 3, 16),
(109, 'Hibásan megadott adat!', 4, 16),
(110, 'Hibásan megadott adat!', 5, 16),
(111, 'Hibásan megadott adat!', 6, 16),
(112, 'Hibásan megadott adat!', 7, 16),
(113, 'Már van felhasználó ezzel az email címmel', 1, 17),
(114, 'Már van felhasználó ezzel az email címmel', 2, 17),
(115, 'Már van felhasználó ezzel az email címmel', 3, 17),
(116, 'Már van felhasználó ezzel az email címmel', 4, 17),
(117, 'Már van felhasználó ezzel az email címmel', 5, 17),
(118, 'Már van felhasználó ezzel az email címmel', 6, 17),
(119, 'Már van felhasználó ezzel az email címmel', 7, 17),
(120, 'Már van felhasználó ezzel a névvel címmel', 1, 18),
(121, 'Már van felhasználó ezzel a névvel címmel', 2, 18),
(122, 'Már van felhasználó ezzel a névvel címmel', 3, 18),
(123, 'Már van felhasználó ezzel a névvel címmel', 4, 18),
(124, 'Már van felhasználó ezzel a névvel címmel', 5, 18),
(125, 'Már van felhasználó ezzel a névvel címmel', 6, 18),
(126, 'Már van felhasználó ezzel a névvel címmel', 7, 18),
(127, 'Sikertelen partnerfelvitel!', 1, 5),
(128, 'Sikertelen partnerfelvitel!', 2, 5),
(129, 'Sikertelen partnerfelvitel!', 3, 5),
(130, 'Sikertelen partnerfelvitel!', 4, 5),
(131, 'Sikertelen partnerfelvitel!', 5, 5),
(132, 'Sikertelen partnerfelvitel!', 6, 5),
(133, 'Sikertelen partnerfelvitel!', 7, 5),
(141, 'Nem adtál meg adatokat!', 1, 7),
(142, 'Nem adtál meg adatokat!', 2, 7),
(143, 'Nem adtál meg adatokat!', 3, 7),
(144, 'Nem adtál meg adatokat!', 4, 7),
(145, 'Nem adtál meg adatokat!', 5, 7),
(146, 'Nem adtál meg adatokat!', 6, 7),
(147, 'Nem adtál meg adatokat!', 7, 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(255) NOT NULL,
  `vtsz` varchar(20) NOT NULL,
  `amount_id` int(11) NOT NULL,
  `min_stock_qty` decimal(9,6) NOT NULL,
  `in_price` decimal(9,6) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `sold_amount` int(11) NOT NULL,
  `amount_exchange_number` decimal(9,6) NOT NULL,
  `is_stock` tinyint(1) NOT NULL,
  `is_buyable` tinyint(1) NOT NULL,
  `is_soldable` tinyint(1) NOT NULL,
  `cash_register_name` varchar(18) NOT NULL,
  `out_price` decimal(9,6) NOT NULL,
  `is_seriesable` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `series_type_id` int(11) DEFAULT NULL,
  `delete_time` datetime NOT NULL,
  `delete_user_id` int(11) DEFAULT NULL,
  `update_time` datetime NOT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `container_unit` decimal(9,6) NOT NULL,
  `print_type` char(1) NOT NULL,
  `weight` decimal(9,6) NOT NULL,
  `package_unit` varchar(100) NOT NULL,
  `is_web` tinyint(1) NOT NULL,
  `is_web_action` tinyint(1) NOT NULL,
  `is_refresh_price_need` tinyint(1) NOT NULL,
  `max_stock_qty` decimal(9,6) NOT NULL,
  `create_date` datetime NOT NULL,
  `code_bar` varchar(254) NOT NULL,
  `batch_type` char(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `pack_length` decimal(9,6) NOT NULL,
  `pack_width` decimal(9,6) NOT NULL,
  `pack_height` decimal(9,6) NOT NULL,
  `pack_volume` decimal(9,6) NOT NULL,
  `pack_weight` decimal(9,6) NOT NULL,
  `sales_length` decimal(9,6) NOT NULL,
  `sales_width` decimal(9,6) NOT NULL,
  `sales_height` decimal(9,6) NOT NULL,
  `sales_volume` decimal(9,6) NOT NULL,
  `sales_weight` decimal(9,6) NOT NULL,
  `sales_unit_id` int(11) NOT NULL,
  `sales_unit_amount` decimal(9,6) NOT NULL,
  `sales_packing_id` int(11) NOT NULL,
  `sales_packing_amount` decimal(9,6) NOT NULL,
  `is_stock_quantityhandling` tinyint(1) NOT NULL,
  `min_order_quantity` decimal(9,6) NOT NULL,
  `order_lead_day` int(11) NOT NULL,
  `order_tolerance_day` int(11) NOT NULL,
  `production_method` char(1) NOT NULL,
  `production_realese_method` char(1) NOT NULL,
  `web_seq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `item`
--

INSERT INTO `item` (`id`, `code`, `name`, `vtsz`, `amount_id`, `min_stock_qty`, `in_price`, `currency_id`, `comment`, `sold_amount`, `amount_exchange_number`, `is_stock`, `is_buyable`, `is_soldable`, `cash_register_name`, `out_price`, `is_seriesable`, `deleted`, `series_type_id`, `delete_time`, `delete_user_id`, `update_time`, `update_user_id`, `container_unit`, `print_type`, `weight`, `package_unit`, `is_web`, `is_web_action`, `is_refresh_price_need`, `max_stock_qty`, `create_date`, `code_bar`, `batch_type`, `is_active`, `pack_length`, `pack_width`, `pack_height`, `pack_volume`, `pack_weight`, `sales_length`, `sales_width`, `sales_height`, `sales_volume`, `sales_weight`, `sales_unit_id`, `sales_unit_amount`, `sales_packing_id`, `sales_packing_amount`, `is_stock_quantityhandling`, `min_order_quantity`, `order_lead_day`, `order_tolerance_day`, `production_method`, `production_realese_method`, `web_seq`) VALUES
(1, 'asda', 'csa', 'ifa', 1, '4.300000', '5.400000', 2, 'asd', 1, '8.100000', 1, 1, 1, 'asd', '5.400000', 1, 1, 1, '2017-09-06 00:00:00', 1, '2017-09-09 00:00:00', 1, '5.400000', '1', '5.400000', 'asd', 0, 1, 1, '5.400000', '2017-09-10 00:00:00', 'asd', 'a', 1, '5.400000', '89.099998', '5.400000', '5.400000', '5.400000', '5.400000', '5.400000', '5.400000', '5.400000', '5.400000', 1, '5.400000', 1, '5.400000', 1, '5.400000', 1, 1, 'a', 'a', 1),
(2, '', '', 'áfa', 1, '0.000000', '0.000000', 2, '', 1, '0.000000', 0, 1, 0, '', '0.000000', 0, 0, 2, '0000-00-00 00:00:00', 2, '0000-00-00 00:00:00', 2, '0.000000', '', '0.000000', '', 0, 0, 0, '0.000000', '0000-00-00 00:00:00', '', '', 0, '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', '0.000000', 1, '0.000000', 1, '0.000000', 0, '0.000000', 0, 0, '', '', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `lang`
--

CREATE TABLE `lang` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `iso2` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `lang`
--

INSERT INTO `lang` (`id`, `name`, `description`, `iso2`) VALUES
(1, 'Magyar', 'Magyar nyelv', 'HU'),
(2, 'english', '', 'EN'),
(3, 'italiano', '', 'IT'),
(4, 'deutsch', '', 'DE'),
(5, 'serbski', '', 'SR'),
(6, 'romana', '', 'RO'),
(7, 'hrvatski', '', 'HR');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sign` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `package`
--

INSERT INTO `package` (`id`, `name`, `sign`) VALUES
(1, 'doboz', 'AD1'),
(2, 'fólia', 'AD3'),
(3, 'ponyva', 'AD4');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `partner`
--

CREATE TABLE `partner` (
  `id` int(11) NOT NULL,
  `name` varchar(90) NOT NULL,
  `is_customer` tinyint(1) NOT NULL,
  `is_supplier` tinyint(1) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `web` varchar(40) NOT NULL,
  `fax` int(15) NOT NULL,
  `pay_mode` int(11) NOT NULL,
  `discount` varchar(7) NOT NULL,
  `late_charges` varchar(7) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `delete_time` datetime NOT NULL,
  `delete_user` int(11) DEFAULT NULL,
  `company_registration_number` int(8) NOT NULL,
  `id_card_number` int(13) NOT NULL,
  `mothers_name` varchar(40) NOT NULL,
  `birth_city` varchar(1000) NOT NULL,
  `birth_date` date NOT NULL,
  `recipient` varchar(1000) NOT NULL,
  `recipient_tax` varchar(6) NOT NULL,
  `bill_email` varchar(26) NOT NULL,
  `commnt` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `partner`
--

INSERT INTO `partner` (`id`, `name`, `is_customer`, `is_supplier`, `phone`, `email`, `web`, `fax`, `pay_mode`, `discount`, `late_charges`, `is_deleted`, `delete_time`, `delete_user`, `company_registration_number`, `id_card_number`, `mothers_name`, `birth_city`, `birth_date`, `recipient`, `recipient_tax`, `bill_email`, `commnt`) VALUES
(1, 'pasd', 1, 1, '12', 'asd@gmail.com', 'asd.hu', 122, 1, '10%', '5%', 0, '0000-00-00 00:00:00', NULL, 1, 1, 'a', 'a', '1952-12-12', 'a', 'a', 'aaa', 'asdasd'),
(2, 'namea', 0, 0, '06201234556', 'aaaaaasd@gmail.com', 'adasd.hu', 2, 2, '25%', '12%', 0, '0000-00-00 00:00:00', NULL, 2, 2, 'b', 'b', '1952-12-12', 'b', 'b', 'b', 'b');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `partner_address`
--

CREATE TABLE `partner_address` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `country_id` int(11) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zip_code` int(5) NOT NULL,
  `city` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `address_attribute` varchar(20) NOT NULL,
  `number` varchar(20) NOT NULL,
  `building` varchar(20) NOT NULL,
  `staircase` int(20) NOT NULL,
  `building_level` int(20) NOT NULL,
  `door` int(20) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `status_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `partner_address`
--

INSERT INTO `partner_address` (`id`, `name`, `type`, `country_id`, `country`, `zip_code`, `city`, `district`, `street`, `address_attribute`, `number`, `building`, `staircase`, `building_level`, `door`, `latitude`, `longitude`, `status_id`, `partner_id`) VALUES
(1, 'p', 'S', 33, 'Austria', 1232, 'Wiena', 'Mariahilfer', 'asdasdads', '1223', '123', '1231', 21, 1, 23, '43.345673', '21.564423', 45, 1),
(5, 'pbbb', 'S', 0, 'asd', 1, 'Wiena', 'asd', 'asd', 'asda', 'asd', 'a', 1, 1, 1, '123.656563', '47.659878', 12, 1),
(6, 'as', 'S', 0, 'as', 122, 'as', 'as', 'as', 'as', '11', '1', 1, 1, 1, '123.656563', '47.659878', 12, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `partner_contact`
--

CREATE TABLE `partner_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) NOT NULL,
  `feor_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `phone` int(15) NOT NULL,
  `mobile_phone` int(15) NOT NULL,
  `fax` int(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `commnt` varchar(254) NOT NULL,
  `passwd` varchar(60) NOT NULL,
  `country_id` int(11) NOT NULL,
  `default_bill` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `partner_contact`
--

INSERT INTO `partner_contact` (`id`, `name`, `first_name`, `last_name`, `middle_name`, `feor_id`, `partner_id`, `phone`, `mobile_phone`, `fax`, `email`, `commnt`, `passwd`, `country_id`, `default_bill`) VALUES
(1, 'pasdaa', 'István', 'Kovács', 'Kokó', 31, 1, 23426, 0, 6218556, 'koko@koko.com', 'kjdsjfkaskdajsdjahsdh', 'passwddasdk', 23, '0'),
(2, 'asd', 'asd', 'asd', 'asd', 12, 2, 123, 123, 123, 'asd@asd.as', 'asdasd', 'asd', 12, '123');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pictures`
--

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `property_values`
--

CREATE TABLE `property_values` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `series_type`
--

CREATE TABLE `series_type` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `delete_user_id` int(11) DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `update_user_id` int(11) NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `series_type`
--

INSERT INTO `series_type` (`id`, `name`, `deleted`, `delete_user_id`, `delete_time`, `update_user_id`, `update_time`) VALUES
(1, 'csavar', 0, NULL, NULL, 2, '2017-09-03 00:00:00'),
(2, 'valami', 0, NULL, NULL, 1, '2017-09-05 00:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `translate`
--

CREATE TABLE `translate` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unique_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `translate`
--

INSERT INTO `translate` (`id`, `name`, `unique_name`) VALUES
(1, 'E-mail', 'e_mail'),
(2, 'Jelszó', 'jelszo'),
(3, 'Bejelentkezés', 'bejelentkezes'),
(4, 'Keresztnév', 'keresztnev'),
(5, 'Vezetéknév', 'vezeteknev'),
(6, 'Meghívó azonosító', 'meghivo_azonosito'),
(7, 'Regisztráció', 'regisztracio'),
(8, 'Sikeres regisztráció', 'sikeres_regisztracio'),
(9, 'Regisztrációja sikeres...', 'regisztracioja_sikeres'),
(10, 'Regisztráció / Bejelentkezés', 'regisztracio_bejelentkezes'),
(11, 'Név', 'nev'),
(12, 'Érték', 'ertek'),
(13, 'Bevétel', 'bevetel'),
(14, 'Láthatóság', 'lathatosag'),
(15, 'Hozzáadás', 'hozzaadas'),
(16, 'Kép', 'kep'),
(17, 'Megtekintés', 'megtekintes'),
(18, 'Termék', 'termek'),
(19, 'adatlap', 'adatlap'),
(20, 'Meghívottjaim', 'meghivottjaim'),
(21, 'Fiókom', 'fiokom'),
(22, 'Pontvásárlás', 'pontvasarlas'),
(23, 'Egyedi ajánlat', 'egyedi_ajanlat'),
(24, 'Teljesítmény', 'teljesitmeny'),
(25, 'Keresés', 'kereses'),
(26, 'Kijelentkezés', 'kijelentkezes'),
(27, 'Bejelentkezve', 'bejelentkezve'),
(28, 'Kitüntetések', 'kituntetesek'),
(29, 'Utolsó bejelentkezés', 'utolso_bejelentkezes'),
(30, 'Hó végéig levásárolható pontjaim', 'ho_vegeig_levasarolhato_pontjaim'),
(31, 'Gyűjtött pontjaim', 'gyujtott_pontjaim'),
(32, 'Részfa pontok', 'reszfa_pontok'),
(33, 'Telefon', 'telefon'),
(34, 'Szélesség', 'szelesseg'),
(35, 'Hosszúság', 'hosszusag'),
(36, 'Irányítószám', 'iranyitoszam'),
(37, 'Város', 'varos'),
(38, 'Utca', 'utca'),
(39, 'Kerület', 'kerulet'),
(40, 'Közterület jellege', 'kozterulet_jellege'),
(41, 'Épület', 'epulet'),
(42, 'Emelet', 'emelet'),
(43, 'Szint', 'szint'),
(44, 'Ajtó', 'ajto'),
(45, 'Régi jelszó', 'regi_jelszo'),
(46, 'Új jelszó', 'uj_jelszo'),
(47, 'Új jelszó újra', 'uj_jelszo_ujra'),
(48, 'Törlés', 'torles'),
(49, 'Leírás', 'leiras'),
(50, 'Számlázási adatok', 'szamlazasi_adatok'),
(51, 'Alap adatok', 'alap_adatok'),
(52, 'Video feltöltés', 'video_feltoltes'),
(53, 'Nézettségi korlát', 'nezettsegi_korlat'),
(54, 'Mentés', 'mentes'),
(55, 'Hol szerepeljen a videód a világban?', 'hol_szerepeljen_a_videod_a_vilagban'),
(56, 'Műveletek', 'muveletek'),
(57, 'Adatok', 'adatok'),
(58, 'Pénznemek', 'penznemek'),
(59, 'Nyelvek', 'nyelvek'),
(60, 'Fordítások', 'forditasok'),
(61, 'Felhasználók', 'felhasznalok'),
(62, 'Videók', 'videok'),
(63, 'Termékek', 'termekek'),
(64, 'Beállítások', 'beallitasok'),
(65, 'Általános', 'altalanos'),
(66, 'Pont árazás', 'pont_arazas'),
(67, 'Kategóriák', 'kategoriak'),
(68, 'Youtube id', 'youtube_id'),
(69, 'Video hossza', 'video_hossza'),
(70, 'Megtekintések', 'megtekintesek'),
(71, 'Térkép', 'terkep'),
(72, 'Távolság', 'tavolsag'),
(74, 'E-mail sablonok', 'e_mail_sablonok'),
(75, 'E-mail sablon szerkesztés', 'e_mail_sablon_szerkesztes'),
(76, 'Üzenet tárgya', 'uzenet_targya'),
(77, 'Tartalom', 'tartalom'),
(78, 'Egyedi név', 'egyedi_nev'),
(79, 'Elfelejtett jelszó', 'elfelejtett_jelszo'),
(80, 'Elfelejtettem a jelszavam', 'elfelejtettem_a_jelszavam'),
(81, 'Tovább', 'tovabb'),
(82, 'Összesen', 'osszesen'),
(83, 'Video feltöltés plusz megtekintés', 'video_feltoltes_plusz_megtekintes'),
(84, 'Pont', 'pont'),
(85, 'Videó', 'video'),
(86, 'Sikeres videó feltöltés', 'sikeres_video_feltoltes'),
(87, 'Video feltöltésed sikeres volt...', 'video_feltoltesed_sikeres_volt'),
(88, 'Egyedi ajánlat lassulás alap', 'egyedi_ajanlat_lassulas_alap'),
(89, 'Egyedi ajánlat lassulás', 'egyedi_ajanlat_lassulas'),
(90, 'Egyedi ajánlat számláló', 'egyedi_ajanlat_szamlalo'),
(91, 'Egyedi ajánlat megnézendő óra', 'egyedi_ajanlat_megnezendo_ora'),
(92, 'Felhasználó', 'felhasznalo'),
(93, 'Státusz', 'statusz'),
(94, 'Értékelés', 'ertekeles'),
(95, 'Nézettség', 'nezettseg'),
(96, 'Letöltés', 'letoltes'),
(97, 'Új videók', 'uj_videok'),
(98, 'Hó végi zárás', 'ho_vegi_zaras'),
(99, 'Zárás indítása', 'zaras_inditasa'),
(100, 'Zárás érték pont beállítás', 'zaras_ertek_pont_beallitas'),
(101, 'Havi zárás még nem készült el!', 'havi_zaras_meg_nem_keszult_el'),
(102, 'Biztosan elindítja a hó végi zárást?', 'biztosan_elinditja_a_ho_vegi_zarast'),
(103, 'Év', 'ev'),
(104, 'Hónap', 'honap'),
(105, 'Bejelentkezés facebookkal', 'bejelentkezes_facebookkal'),
(106, 'Ez miez?', 'ez_miez'),
(107, 'Url vagy keresés', 'url_vagy_kereses'),
(108, 'Zárva', 'zarva'),
(109, 'Statikus oldalak', 'statikus_oldalak'),
(110, 'Cím', 'cim'),
(111, 'Keresett oldal nem található', 'keresett_oldal_nem_talalhato'),
(112, 'Elfogadom az Általános Szerződési Feltételeket melyet itt tudok elolvasni', 'elfogadom_az_altalanos_szerzodesi_felteteleket_melyet_itt_tudok_elolvasni'),
(113, 'Profilkép látható?', 'profilkep_lathato'),
(114, 'További képek', 'tovabbi_kepek'),
(115, 'Termék adatok', 'termek_adatok'),
(116, 'Ajánlattétel', 'ajanlattetel'),
(117, 'Meghívó küldés', 'meghivo_kuldes'),
(118, 'Küldés', 'kuldes'),
(119, 'Sikeres meghívóküldés', 'sikeres_meghivokuldes'),
(120, 'Felhasználás', 'felhasznalas'),
(121, 'Pontokból', 'pontokbol'),
(122, 'Kapott ajándékból', 'kapott_ajandekbol'),
(123, 'Ajánlat ár-tól', 'ajanlat_ar_tol'),
(124, '-ig', '_ig'),
(125, 'Előző termék', 'elozo_termek'),
(126, 'Következő termék', 'kovetkezo_termek'),
(127, 'Az előző hónapról...', 'az_elozo_honaprol'),
(128, 'Meghívottjaim teljesítménye a sajátom alapján', 'meghivottjaim_teljesitmenye_a_sajatom_alapjan'),
(129, 'Óra', 'ora'),
(130, 'Főoldal', 'fooldal'),
(131, 'Csak egy ajánlat megadása', 'csak_egy_ajanlat_megadasa'),
(132, 'Több ajánlat egyszerre', 'tobb_ajanlat_egyszerre'),
(133, 'Egy ajánlat', 'egy_ajanlat'),
(134, 'Termék előrehaladása', 'termek_elorehaladasa'),
(135, 'Ha 100%-on teljesítettem volna', 'ha_100_on_teljesitettem_volna'),
(136, 'Számlázási név / cégnév', 'szamlazasi_nev_cegnev'),
(137, 'Hol vagyok? Bejelölöm a térképen', 'hol_vagyok_bejelolom_a_terkepen'),
(138, 'Nézettség korlát árbeállítás', 'nezettseg_korlat_arbeallitas'),
(139, 'Hirdetésmentesség (+25% pont)', 'hirdetesmentesseg_25_pont'),
(140, 'Video hossza magyarázat', 'video_hossza_magyarazat'),
(141, 'másodperc', 'masodperc'),
(142, 'Szeretnék kupont hozzáadni', 'szeretnek_kupont_hozzaadni'),
(143, 'Kupon szövege', 'kupon_szovege'),
(144, 'Dátum -tól', 'datum_tol'),
(145, 'Dátum -ig', 'datum_ig'),
(146, 'Érvényesség', 'ervenyesseg'),
(147, 'Kupon gyűjtőm', 'kupon_gyujtom'),
(148, 'Videóim', 'videoim'),
(149, 'Kupon', 'kupon'),
(150, 'Nyomtatás', 'nyomtatas'),
(151, 'Továbbiak', 'tovabbiak'),
(153, 'Hosszabbítás', 'hosszabbitas'),
(154, 'Video megtekintés hosszabbítás', 'video_megtekintes_hosszabbitas'),
(155, 'Infó dobozok', 'info_dobozok'),
(156, 'Infó doboz szerkesztés', 'info_doboz_szerkesztes'),
(157, 'Sikeres visszaigazolás', 'sikeres_visszaigazolas'),
(158, 'Össz nézettség', 'ossz_nezettseg'),
(159, 'Össz ajánlat', 'ossz_ajanlat'),
(160, 'Ajánlatok pontból', 'ajanlatok_pontbol'),
(161, 'Meghívó azonosító megadása', 'meghivo_azonosito_megadasa'),
(162, 'Napi nézettség', 'napi_nezettseg'),
(163, 'Kapott ajándék db', 'kapott_ajandek_db'),
(164, 'Felhasználható ajándék pontok', 'felhasznalhato_ajandek_pontok'),
(165, 'Kategóriák megadása', 'kategoriak_megadasa'),
(166, 'Olvasd be a QR-kódot a regisztrációhoz', 'olvasd_be_a_qr_kodot_a_regisztraciohoz'),
(167, 'Névjegykártya elkészítése', 'nevjegykartya_elkeszitese'),
(168, 'Info', 'info'),
(169, 'Webshop', 'webshop'),
(170, 'Tetszik', 'tetszik'),
(171, 'Kedvenc videóim', 'kedvenc_videoim'),
(172, 'Meghívó kód', 'meghivo_kod'),
(173, 'Kupon kód ellenőrzés', 'kupon_kod_ellenorzes'),
(174, 'Ellenőrzés', 'ellenorzes'),
(175, 'Érvényes', 'ervenyes'),
(176, 'Nem érvényes', 'nem_ervenyes'),
(177, 'Weboldal', 'weboldal'),
(178, 'Nap', 'nap'),
(179, 'Letöltés utáni élettartam', 'letoltes_utani_elettartam'),
(180, 'Unod a felugró videót? Kattints ide!', 'unod_a_felugro_videot_kattints_ide'),
(181, 'Windows alkalmazás letöltése', 'windows_alkalmazas_letoltese'),
(182, 'Nincs még adat', 'nincs_meg_adat'),
(183, 'Csökkentett adatforgalom', 'csokkentett_adatforgalom'),
(184, 'Normál adatforgalom', 'normal_adatforgalom'),
(185, 'db', 'db'),
(186, 'Statisztikák', 'statisztikak'),
(187, 'E-mail küldés', 'e_mail_kuldes'),
(188, 'Vesszővel elválasztva', 'vesszovel_elvalasztva'),
(189, 'Egyéb címzettek', 'egyeb_cimzettek'),
(190, 'Belépés', 'belepes'),
(191, 'Felhasználónév', 'felhasznalonev'),
(192, 'Születésnap', 'szuletesnap'),
(193, 'Személyi azonosító szám', 'szemelyi_azonosito_szam'),
(194, 'Alapértelmezett kifizető hely', 'alapertelmezett_kifizeto_hely'),
(195, 'Megjegyzés', 'megjegyzes'),
(196, 'Törzsadatok', 'torzsadatok'),
(197, 'Partnerek', 'partnerek'),
(198, 'Vásárló', 'vasarlo'),
(199, 'Szállító', 'szallito'),
(200, 'Fax', 'fax'),
(201, 'Fizetési mód', 'fizetesi_mod'),
(202, 'Kedvezmény', 'kedvezmeny'),
(203, 'Késedelmi kamat', 'kesedelmi_kamat'),
(204, 'Cég regisztrációs szám', 'ceg_regisztracios_szam'),
(205, 'Anyja neve', 'anyja_neve'),
(206, 'Születési hely', 'szuletesi_hely'),
(207, 'Kedvezményes adó', 'kedvezmenyes_ado'),
(208, 'Számlaszám', 'szamlaszam'),
(209, 'Módosít', 'modosit'),
(210, 'Címek', 'cimek'),
(211, 'Elérhetőség', 'elerhetoseg'),
(212, 'Típus', 'tipus'),
(213, 'Ország azonosító', 'orszag_azonosito'),
(214, 'Ország', 'orszag'),
(215, 'Zip kód', 'zip_kod'),
(216, 'Körzet', 'korzet'),
(217, 'Közterület neve', 'kozterulet_neve'),
(218, 'Szám', 'szam'),
(219, 'Lépcsőház', 'lepcsohaz'),
(220, 'Bővebben', 'bovebben'),
(221, 'Címadat', 'cimadat'),
(222, 'Középső név', 'kozepso_nev'),
(223, 'Munkaköri azonosító', 'munkakori_azonosito'),
(224, 'Partner azonosító', 'partner_azonosito'),
(225, 'Mobiltelefonszám', 'mobiltelefonszam'),
(226, 'Áfakulcs', 'afakulcs'),
(227, 'Áfamentes', 'afamentes'),
(228, 'Fordított adó', 'forditott_ado'),
(229, 'Azonosító', 'azonosito'),
(230, 'Árfolyam', 'arfolyam'),
(231, 'Kerekítés', 'kerekites'),
(232, 'Tizedesjegy', 'tizedesjegy'),
(233, 'Végkerekítés', 'vegkerekites'),
(234, 'Törölt', 'torolt'),
(235, 'Törlő dolgozó', 'torlo_dolgozo'),
(236, 'Törlés dátuma', 'torles_datuma'),
(237, 'Módosító dolgozó azonosító', 'modosito_dolgozo_azonosito'),
(238, 'Módosítás dátuma', 'modositas_datuma'),
(239, 'Jel', 'jel'),
(240, 'Cikkszám', 'cikkszam'),
(241, 'Mennyiségi egység azonosító', 'mennyisegi_egyseg_azonosito'),
(242, 'Minimum mennyiség figyelés raktáron', 'minimum_mennyiseg_figyeles_raktaron'),
(243, 'Aktuális beszerzési ár', 'aktualis_beszerzesi_ar'),
(244, 'Deviza', 'deviza'),
(245, 'Eladási mennyiségi egység', 'eladasi_mennyisegi_egyseg'),
(246, 'Mennyiségi váltószám', 'mennyisegi_valtoszam'),
(247, 'Készletezhető', 'keszletezheto'),
(248, 'Beszerezhető', 'beszerezheto'),
(249, 'Eladható', 'eladhato'),
(250, 'Pénztárgép név', 'penztargep_nev'),
(251, 'Árlistás ár', 'arlistas_ar'),
(252, 'Sorszámkezelés', 'sorszamkezeles'),
(253, 'Sorszám kezelés típus azonosító', 'sorszam_kezeles_tipus_azonosito'),
(254, 'Kiszerelési egység', 'kiszerelesi_egyseg'),
(255, 'Nyomtatványtípus', 'nyomtatvanytipus'),
(256, 'Tömeg', 'tomeg'),
(257, 'Csomagolási egység', 'csomagolasi_egyseg'),
(258, 'Webes', 'webes'),
(259, 'Web akció', 'web_akcio'),
(260, 'Árat frissíteni', 'arat_frissiteni'),
(261, 'Maximális készlet', 'maximalis_keszlet'),
(262, 'Létrehozás dátuma', 'letrehozas_datuma'),
(263, 'Vonalkód', 'vonalkod'),
(264, 'Sorozatszám', 'sorozatszam'),
(265, 'Aktív-e', 'aktiv_e'),
(266, 'Beszerzési hosszúság', 'beszerzesi_hosszusag'),
(267, 'Beszerzési szélesség', 'beszerzesi_szelesseg'),
(268, 'Beszerzési magasság', 'beszerzesi_magassag'),
(269, 'Beszerzési térfogat', 'beszerzesi_terfogat'),
(270, 'Beszerzési súly', 'beszerzesi_suly'),
(271, 'Eladási hosszúság', 'eladasi_hosszusag'),
(272, 'Eladási szélesség', 'eladasi_szelesseg'),
(273, 'Eladási magasság', 'eladasi_magassag'),
(274, 'Eladási térfogat', 'eladasi_terfogat'),
(275, 'Eladási súly', 'eladasi_suly'),
(276, 'Eladási egység azonosítója', 'eladasi_egyseg_azonositoja'),
(277, 'Eladási egység mennyisége', 'eladasi_egyseg_mennyisege'),
(278, 'Eladási csomagolás azonosító', 'eladasi_csomagolas_azonosito'),
(279, 'Eladási csomagolás mennyisége', 'eladasi_csomagolas_mennyisege'),
(280, 'Raktárankénti Min-Max kezelés', 'raktarankenti_min_max_kezeles'),
(281, 'Minimális rendelési mennyiség', 'minimalis_rendelesi_mennyiseg'),
(282, 'Rendelés átfutási idő', 'rendeles_atfutasi_ido'),
(283, 'Rendelés tűrési idő', 'rendeles_turesi_ido'),
(284, 'Beszerzési metódus', 'beszerzesi_metodus'),
(285, 'Gyártás során alkatrészek készletkiadási módszere', 'gyartas_soran_alkatreszek_keszletkiadasi_modszere'),
(286, 'Web lista sorszám', 'web_lista_sorszam'),
(287, 'Cikktörzsadat', 'cikktorzsadat'),
(288, 'Készlet', 'keszlet'),
(289, 'Mennyiségi egység', 'mennyisegi_egyseg'),
(290, 'Valuta', 'valuta'),
(291, 'Csomagolás', 'csomagolas'),
(292, 'Sorozat', 'sorozat'),
(293, 'Vámtarifaszám', 'vamtarifaszam');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `translate_lang`
--

CREATE TABLE `translate_lang` (
  `id` int(11) NOT NULL,
  `translate_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `lang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `translate_lang`
--

INSERT INTO `translate_lang` (`id`, `translate_id`, `text`, `lang_id`) VALUES
(1, 1, 'E-mail', 1),
(2, 1, 'E-mail', 2),
(3, 1, 'E-mail', 3),
(4, 1, 'E-mail', 4),
(5, 1, 'E-mail', 5),
(6, 1, 'E-mail', 6),
(7, 1, 'E-mail', 7),
(8, 2, 'Jelszó', 1),
(9, 2, 'Password', 2),
(10, 2, 'Jelszó', 3),
(11, 2, 'Jelszó', 4),
(12, 2, 'Jelszó', 5),
(13, 2, 'Jelszó', 6),
(14, 2, 'Jelszó', 7),
(15, 3, 'Bejelentkezés', 1),
(16, 3, 'Login', 2),
(17, 3, 'Bejelentkezés', 3),
(18, 3, 'Bejelentkezés', 4),
(19, 3, 'Bejelentkezés', 5),
(20, 3, 'Bejelentkezés', 6),
(21, 3, 'Bejelentkezés', 7),
(22, 4, 'Keresztnév', 1),
(23, 4, 'First Name', 2),
(24, 4, 'Keresztnév', 3),
(25, 4, 'Keresztnév', 4),
(26, 4, 'Keresztnév', 5),
(27, 4, 'Keresztnév', 6),
(28, 4, 'Keresztnév', 7),
(29, 5, 'Vezetéknév', 1),
(30, 5, 'Last Name', 2),
(31, 5, 'Vezetéknév', 3),
(32, 5, 'Vezetéknév', 4),
(33, 5, 'Vezetéknév', 5),
(34, 5, 'Vezetéknév', 6),
(35, 5, 'Vezetéknév', 7),
(36, 6, 'Meghívó azonosító', 1),
(37, 6, 'Invite account code', 2),
(38, 6, 'Meghívó azonosító', 3),
(39, 6, 'Meghívó azonosító', 4),
(40, 6, 'Meghívó azonosító', 5),
(41, 6, 'Meghívó azonosító', 6),
(42, 6, 'Meghívó azonosító', 7),
(43, 7, 'Regisztráció', 1),
(44, 7, 'Registration', 2),
(45, 7, 'Regisztráció', 3),
(46, 7, 'Regisztráció', 4),
(47, 7, 'Regisztráció', 5),
(48, 7, 'Regisztráció', 6),
(49, 7, 'Regisztráció', 7),
(50, 8, 'Sikeres regisztráció', 1),
(51, 8, 'Success registration', 2),
(52, 8, 'Sikeres regisztráció', 3),
(53, 8, 'Sikeres regisztráció', 4),
(54, 8, 'Sikeres regisztráció', 5),
(55, 8, 'Sikeres regisztráció', 6),
(56, 8, 'Sikeres regisztráció', 7),
(57, 9, 'Regisztrációd sikeres volt, ellenőrizd emailjeid és erősítsd meg felhasználói fiókod!', 1),
(58, 9, 'Your registration was successful! Please visit your emails and sign your account', 2),
(59, 9, 'Regisztrációja sikeres...', 3),
(60, 9, 'Regisztrációja sikeres...', 4),
(61, 9, 'Regisztrációja sikeres...', 5),
(62, 9, 'Regisztrációja sikeres...', 6),
(63, 9, 'Regisztrációja sikeres...', 7),
(64, 10, 'Regisztráció / Bejelentkezés', 1),
(65, 10, 'Sign up / Sign in', 2),
(66, 10, 'Regisztráció / Bejelentkezés', 3),
(67, 10, 'Regisztráció / Bejelentkezés', 4),
(68, 10, 'Regisztráció / Bejelentkezés', 5),
(69, 10, 'Regisztráció / Bejelentkezés', 6),
(70, 10, 'Regisztráció / Bejelentkezés', 7),
(71, 11, 'Név', 1),
(72, 11, 'Name', 2),
(73, 11, 'Név', 3),
(74, 11, 'Név', 4),
(75, 11, 'Név', 5),
(76, 11, 'Név', 6),
(77, 11, 'Név', 7),
(78, 12, 'Érték', 1),
(79, 12, 'Value', 2),
(80, 12, 'Érték', 3),
(81, 12, 'Érték', 4),
(82, 12, 'Érték', 5),
(83, 12, 'Érték', 6),
(84, 12, 'Érték', 7),
(85, 13, 'Bevétel', 1),
(86, 13, 'Income', 2),
(87, 13, 'Bevétel', 3),
(88, 13, 'Bevétel', 4),
(89, 13, 'Bevétel', 5),
(90, 13, 'Bevétel', 6),
(91, 13, 'Bevétel', 7),
(92, 14, 'Láthatóság', 1),
(93, 14, 'Visibility', 2),
(94, 14, 'Láthatóság', 3),
(95, 14, 'Láthatóság', 4),
(96, 14, 'Láthatóság', 5),
(97, 14, 'Láthatóság', 6),
(98, 14, 'Láthatóság', 7),
(99, 15, 'Hozzáadás', 1),
(100, 15, 'Add', 2),
(101, 15, 'Hozzáadás', 3),
(102, 15, 'Hozzáadás', 4),
(103, 15, 'Hozzáadás', 5),
(104, 15, 'Hozzáadás', 6),
(105, 15, 'Hozzáadás', 7),
(106, 16, 'Kép', 1),
(107, 16, 'Picture', 2),
(108, 16, 'Kép', 3),
(109, 16, 'Kép', 4),
(110, 16, 'Kép', 5),
(111, 16, 'Kép', 6),
(112, 16, 'Kép', 7),
(113, 17, 'Megtekintés', 1),
(114, 17, 'View', 2),
(115, 17, 'Megtekintés', 3),
(116, 17, 'Megtekintés', 4),
(117, 17, 'Megtekintés', 5),
(118, 17, 'Megtekintés', 6),
(119, 17, 'Megtekintés', 7),
(120, 18, 'Termék', 1),
(121, 18, 'Product', 2),
(122, 18, 'Termék', 3),
(123, 18, 'Termék', 4),
(124, 18, 'Termék', 5),
(125, 18, 'Termék', 6),
(126, 18, 'Termék', 7),
(127, 19, 'adatlap', 1),
(128, 19, 'sheet', 2),
(129, 19, 'adatlap', 3),
(130, 19, 'adatlap', 4),
(131, 19, 'adatlap', 5),
(132, 19, 'adatlap', 6),
(133, 19, 'adatlap', 7),
(134, 20, 'Meghívottjaim', 1),
(135, 20, 'Invites', 2),
(136, 20, 'Meghívottjaim', 3),
(137, 20, 'Meghívottjaim', 4),
(138, 20, 'Meghívottjaim', 5),
(139, 20, 'Meghívottjaim', 6),
(140, 20, 'Meghívottjaim', 7),
(141, 21, 'Fiókom', 1),
(142, 21, 'Account', 2),
(143, 21, 'Fiók', 3),
(144, 21, 'Fiók', 4),
(145, 21, 'Fiók', 5),
(146, 21, 'Fiók', 6),
(147, 21, 'Fiók', 7),
(148, 22, 'Pontvásárlás', 1),
(149, 22, 'Buy points', 2),
(150, 22, 'Pontvásárlás', 3),
(151, 22, 'Pontvásárlás', 4),
(152, 22, 'Pontvásárlás', 5),
(153, 22, 'Pontvásárlás', 6),
(154, 22, 'Pontvásárlás', 7),
(155, 23, 'Egyedi ajánlat', 1),
(156, 23, 'Unique offer', 2),
(157, 23, 'Egyedi ajánlat', 3),
(158, 23, 'Egyedi ajánlat', 4),
(159, 23, 'Egyedi ajánlat', 5),
(160, 23, 'Egyedi ajánlat', 6),
(161, 23, 'Egyedi ajánlat', 7),
(162, 24, 'Teljesítmény', 1),
(163, 24, 'Performance', 2),
(164, 24, 'Teljesítmény', 3),
(165, 24, 'Teljesítmény', 4),
(166, 24, 'Teljesítmény', 5),
(167, 24, 'Teljesítmény', 6),
(168, 24, 'Teljesítmény', 7),
(169, 25, 'Keresés', 1),
(170, 25, 'Search', 2),
(171, 25, 'Keresés', 3),
(172, 25, 'Keresés', 4),
(173, 25, 'Keresés', 5),
(174, 25, 'Keresés', 6),
(175, 25, 'Keresés', 7),
(176, 26, 'Kijelentkezés', 1),
(177, 26, 'Log out', 2),
(178, 26, 'Kijelentkezés', 3),
(179, 26, 'Kijelentkezés', 4),
(180, 26, 'Kijelentkezés', 5),
(181, 26, 'Kijelentkezés', 6),
(182, 26, 'Kijelentkezés', 7),
(183, 27, 'Bejelentkezve', 1),
(184, 27, 'Logged in', 2),
(185, 27, 'Bejelentkezve', 3),
(186, 27, 'Bejelentkezve', 4),
(187, 27, 'Bejelentkezve', 5),
(188, 27, 'Bejelentkezve', 6),
(189, 27, 'Bejelentkezve', 7),
(190, 28, 'Kitüntetések', 1),
(191, 28, 'Stars', 2),
(192, 28, 'Kitüntetések', 3),
(193, 28, 'Kitüntetések', 4),
(194, 28, 'Kitüntetések', 5),
(195, 28, 'Kitüntetések', 6),
(196, 28, 'Kitüntetések', 7),
(197, 29, 'Utolsó bejelentkezés', 1),
(198, 29, 'Last login', 2),
(199, 29, 'Utolsó bejelentkezés', 3),
(200, 29, 'Utolsó bejelentkezés', 4),
(201, 29, 'Utolsó bejelentkezés', 5),
(202, 29, 'Utolsó bejelentkezés', 6),
(203, 29, 'Utolsó bejelentkezés', 7),
(204, 30, 'Hó végéig levásárolható pontjaim', 1),
(205, 30, 'Actual points', 2),
(206, 30, 'Aktuális pontjaim', 3),
(207, 30, 'Aktuális pontjaim', 4),
(208, 30, 'Aktuális pontjaim', 5),
(209, 30, 'Aktuális pontjaim', 6),
(210, 30, 'Aktuális pontjaim', 7),
(211, 31, 'Gyűjtött pontjaim', 1),
(212, 31, 'Collected points', 2),
(213, 31, 'Gyűjtött pontjaim', 3),
(214, 31, 'Gyűjtött pontjaim', 4),
(215, 31, 'Gyűjtött pontjaim', 5),
(216, 31, 'Gyűjtött pontjaim', 6),
(217, 31, 'Gyűjtött pontjaim', 7),
(218, 32, 'Részfa pontok', 1),
(219, 32, 'Tree points', 2),
(220, 32, 'Részfa pontok', 3),
(221, 32, 'Részfa pontok', 4),
(222, 32, 'Részfa pontok', 5),
(223, 32, 'Részfa pontok', 6),
(224, 32, 'Részfa pontok', 7),
(225, 33, 'Telefon', 1),
(226, 33, 'Phone', 2),
(227, 33, 'Telefon', 3),
(228, 33, 'Telefon', 4),
(229, 33, 'Telefon', 5),
(230, 33, 'Telefon', 6),
(231, 33, 'Telefon', 7),
(232, 34, 'Szélesség', 1),
(233, 34, 'Lattitude', 2),
(234, 34, 'Szélesség', 3),
(235, 34, 'Szélesség', 4),
(236, 34, 'Szélesség', 5),
(237, 34, 'Szélesség', 6),
(238, 34, 'Szélesség', 7),
(239, 35, 'Hosszúság', 1),
(240, 35, 'Longitude', 2),
(241, 35, 'Hosszúság', 3),
(242, 35, 'Hosszúság', 4),
(243, 35, 'Hosszúság', 5),
(244, 35, 'Hosszúság', 6),
(245, 35, 'Hosszúság', 7),
(246, 36, 'Irányítószám', 1),
(247, 36, 'Zip code', 2),
(248, 36, 'Irányítószám', 3),
(249, 36, 'Irányítószám', 4),
(250, 36, 'Irányítószám', 5),
(251, 36, 'Irányítószám', 6),
(252, 36, 'Irányítószám', 7),
(253, 37, 'város', 1),
(254, 37, 'City', 2),
(255, 37, 'város', 3),
(256, 37, 'város', 4),
(257, 37, 'város', 5),
(258, 37, 'város', 6),
(259, 37, 'város', 7),
(260, 38, 'Utca', 1),
(261, 38, 'Street', 2),
(262, 38, 'Utca', 3),
(263, 38, 'Utca', 4),
(264, 38, 'Utca', 5),
(265, 38, 'Utca', 6),
(266, 38, 'Utca', 7),
(267, 39, 'Kerület', 1),
(268, 39, 'District', 2),
(269, 39, 'Kerület', 3),
(270, 39, 'Kerület', 4),
(271, 39, 'Kerület', 5),
(272, 39, 'Kerület', 6),
(273, 39, 'Kerület', 7),
(274, 40, 'Közterület jellege', 1),
(275, 40, 'Address character', 2),
(276, 40, 'Közterület jellege', 3),
(277, 40, 'Közterület jellege', 4),
(278, 40, 'Közterület jellege', 5),
(279, 40, 'Közterület jellege', 6),
(280, 40, 'Közterület jellege', 7),
(281, 41, 'Épület', 1),
(282, 41, 'Building', 2),
(283, 41, 'Épület', 3),
(284, 41, 'Épület', 4),
(285, 41, 'Épület', 5),
(286, 41, 'Épület', 6),
(287, 41, 'Épület', 7),
(288, 42, 'Emelet', 1),
(289, 42, 'Staircase', 2),
(290, 42, 'Emelet', 3),
(291, 42, 'Emelet', 4),
(292, 42, 'Emelet', 5),
(293, 42, 'Emelet', 6),
(294, 42, 'Emelet', 7),
(295, 43, 'Szint', 1),
(296, 43, 'Level', 2),
(297, 43, 'Szint', 3),
(298, 43, 'Szint', 4),
(299, 43, 'Szint', 5),
(300, 43, 'Szint', 6),
(301, 43, 'Szint', 7),
(302, 44, 'Ajtó', 1),
(303, 44, 'Door', 2),
(304, 44, 'Ajtó', 3),
(305, 44, 'Ajtó', 4),
(306, 44, 'Ajtó', 5),
(307, 44, 'Ajtó', 6),
(308, 44, 'Ajtó', 7),
(309, 45, 'Régi jelszó', 1),
(310, 45, 'Old password', 2),
(311, 45, 'Régi jelszó', 3),
(312, 45, 'Régi jelszó', 4),
(313, 45, 'Régi jelszó', 5),
(314, 45, 'Régi jelszó', 6),
(315, 45, 'Régi jelszó', 7),
(316, 46, 'Új jelszó', 1),
(317, 46, 'New password', 2),
(318, 46, 'Új jelszó', 3),
(319, 46, 'Új jelszó', 4),
(320, 46, 'Új jelszó', 5),
(321, 46, 'Új jelszó', 6),
(322, 46, 'Új jelszó', 7),
(323, 47, 'Új jelszó újra', 1),
(324, 47, 'Password again', 2),
(325, 47, 'Új jelszó újra', 3),
(326, 47, 'Új jelszó újra', 4),
(327, 47, 'Új jelszó újra', 5),
(328, 47, 'Új jelszó újra', 6),
(329, 47, 'Új jelszó újra', 7),
(330, 48, 'Törlés', 1),
(331, 48, 'Delete', 2),
(332, 48, 'Törlés', 3),
(333, 48, 'Törlés', 4),
(334, 48, 'Törlés', 5),
(335, 48, 'Törlés', 6),
(336, 48, 'Törlés', 7),
(337, 49, 'Leírás', 1),
(338, 49, 'Description', 2),
(339, 49, 'Leírás', 3),
(340, 49, 'Leírás', 4),
(341, 49, 'Leírás', 5),
(342, 49, 'Leírás', 6),
(343, 49, 'Leírás', 7),
(344, 50, 'Számlázási adatok', 1),
(345, 50, 'Bill data', 2),
(346, 50, 'Számlázási adatok', 3),
(347, 50, 'Számlázási adatok', 4),
(348, 50, 'Számlázási adatok', 5),
(349, 50, 'Számlázási adatok', 6),
(350, 50, 'Számlázási adatok', 7),
(351, 51, 'Alap adatok', 1),
(352, 51, 'Main data', 2),
(353, 51, 'Alap adatok', 3),
(354, 51, 'Alap adatok', 4),
(355, 51, 'Alap adatok', 5),
(356, 51, 'Alap adatok', 6),
(357, 51, 'Alap adatok', 7),
(358, 52, 'Video feltöltés', 1),
(359, 52, 'Upload video', 2),
(360, 52, 'Video feltöltés', 3),
(361, 52, 'Video feltöltés', 4),
(362, 52, 'Video feltöltés', 5),
(363, 52, 'Video feltöltés', 6),
(364, 52, 'Video feltöltés', 7),
(365, 53, 'Nézettségi korlát', 1),
(366, 53, 'Max video view', 2),
(367, 53, 'Nézettségi korlát', 3),
(368, 53, 'Nézettségi korlát', 4),
(369, 53, 'Nézettségi korlát', 5),
(370, 53, 'Nézettségi korlát', 6),
(371, 53, 'Nézettségi korlát', 7),
(372, 54, 'Mentés', 1),
(373, 54, 'Save', 2),
(374, 54, 'Mentés', 3),
(375, 54, 'Mentés', 4),
(376, 54, 'Mentés', 5),
(377, 54, 'Mentés', 6),
(378, 54, 'Mentés', 7),
(379, 55, 'Hol szerepeljen a videód a világban? Jelöld be!', 1),
(380, 55, 'Where schould be your video in world? Place it!', 2),
(381, 55, 'Hol szerepeljen a videód a világban? Jelöld be!', 3),
(382, 55, 'Hol szerepeljen a videód a világban? Jelöld be!', 4),
(383, 55, 'Hol szerepeljen a videód a világban? Jelöld be!', 5),
(384, 55, 'Hol szerepeljen a videód a világban? Jelöld be!', 6),
(385, 55, 'Hol szerepeljen a videód a világban? Jelöld be!', 7),
(386, 56, 'Műveletek', 1),
(387, 56, 'Tools', 2),
(388, 56, 'Műveletek', 3),
(389, 56, 'Műveletek', 4),
(390, 56, 'Műveletek', 5),
(391, 56, 'Műveletek', 6),
(392, 56, 'Műveletek', 7),
(393, 57, 'Adatok', 1),
(394, 57, 'Data', 2),
(395, 57, 'Adatok', 3),
(396, 57, 'Adatok', 4),
(397, 57, 'Adatok', 5),
(398, 57, 'Adatok', 6),
(399, 57, 'Adatok', 7),
(400, 58, 'Pénznemek', 1),
(401, 58, 'Currency', 2),
(402, 58, 'Pénznemek', 3),
(403, 58, 'Pénznemek', 4),
(404, 58, 'Pénznemek', 5),
(405, 58, 'Pénznemek', 6),
(406, 58, 'Pénznemek', 7),
(407, 59, 'Nyelvek', 1),
(408, 59, 'Languages', 2),
(409, 59, 'Nyelvek', 3),
(410, 59, 'Nyelvek', 4),
(411, 59, 'Nyelvek', 5),
(412, 59, 'Nyelvek', 6),
(413, 59, 'Nyelvek', 7),
(414, 60, 'Fordítások', 1),
(415, 60, 'Translates', 2),
(416, 60, 'Fordítások', 3),
(417, 60, 'Fordítások', 4),
(418, 60, 'Fordítások', 5),
(419, 60, 'Fordítások', 6),
(420, 60, 'Fordítások', 7),
(421, 61, 'Felhasználók', 1),
(422, 61, 'Users', 2),
(423, 61, 'Felhasználók', 3),
(424, 61, 'Felhasználók', 4),
(425, 61, 'Felhasználók', 5),
(426, 61, 'Felhasználók', 6),
(427, 61, 'Felhasználók', 7),
(428, 62, 'Videók', 1),
(429, 62, 'Videos', 2),
(430, 62, 'Videók', 3),
(431, 62, 'Videók', 4),
(432, 62, 'Videók', 5),
(433, 62, 'Videók', 6),
(434, 62, 'Videók', 7),
(435, 63, 'Termékek', 1),
(436, 63, 'Products', 2),
(437, 63, 'Termékek', 3),
(438, 63, 'Termékek', 4),
(439, 63, 'Termékek', 5),
(440, 63, 'Termékek', 6),
(441, 63, 'Termékek', 7),
(442, 64, 'Beállítások', 1),
(443, 64, 'Settings', 2),
(444, 64, 'Beállítások', 3),
(445, 64, 'Beállítások', 4),
(446, 64, 'Beállítások', 5),
(447, 64, 'Beállítások', 6),
(448, 64, 'Beállítások', 7),
(449, 65, 'Általános', 1),
(450, 65, 'General', 2),
(451, 65, 'Általános', 3),
(452, 65, 'Általános', 4),
(453, 65, 'Általános', 5),
(454, 65, 'Általános', 6),
(455, 65, 'Általános', 7),
(456, 66, 'Pont árazás', 1),
(457, 66, 'Pricing points', 2),
(458, 66, 'Pont árazás', 3),
(459, 66, 'Pont árazás', 4),
(460, 66, 'Pont árazás', 5),
(461, 66, 'Pont árazás', 6),
(462, 66, 'Pont árazás', 7),
(463, 67, 'Kategóriák', 1),
(464, 67, 'Categories', 2),
(465, 67, 'Kategóriák', 3),
(466, 67, 'Kategóriák', 4),
(467, 67, 'Kategóriák', 5),
(468, 67, 'Kategóriák', 6),
(469, 67, 'Kategóriák', 7),
(470, 68, 'Youtube id', 1),
(471, 68, 'Youtube id', 2),
(472, 68, 'Youtube id', 3),
(473, 68, 'Youtube id', 4),
(474, 68, 'Youtube id', 5),
(475, 68, 'Youtube id', 6),
(476, 68, 'Youtube id', 7),
(477, 69, 'Video hossza', 1),
(478, 69, 'Length of the video', 2),
(479, 69, 'Video hossza', 3),
(480, 69, 'Video hossza', 4),
(481, 69, 'Video hossza', 5),
(482, 69, 'Video hossza', 6),
(483, 69, 'Video hossza', 7),
(484, 70, 'Megtekintések', 1),
(485, 70, 'Views', 2),
(486, 70, 'Megtekintések', 3),
(487, 70, 'Megtekintések', 4),
(488, 70, 'Megtekintések', 5),
(489, 70, 'Megtekintések', 6),
(490, 70, 'Megtekintések', 7),
(491, 71, 'Térkép', 1),
(492, 71, 'Location', 2),
(493, 71, 'Térkép', 3),
(494, 71, 'Térkép', 4),
(495, 71, 'Térkép', 5),
(496, 71, 'Térkép', 6),
(497, 71, 'Térkép', 7),
(498, 72, 'Távolság', 1),
(499, 72, 'Distance', 2),
(500, 72, 'Távolság', 3),
(501, 72, 'Távolság', 4),
(502, 72, 'Távolság', 5),
(503, 72, 'Távolság', 6),
(504, 72, 'Távolság', 7),
(512, 74, 'E-mail sablonok', 1),
(513, 74, 'E-mail sablonok', 2),
(514, 74, 'E-mail sablonok', 3),
(515, 74, 'E-mail sablonok', 4),
(516, 74, 'E-mail sablonok', 5),
(517, 74, 'E-mail sablonok', 6),
(518, 74, 'E-mail sablonok', 7),
(519, 75, 'E-mail sablon szerkesztés', 1),
(520, 75, 'E-mail sablon szerkesztés', 2),
(521, 75, 'E-mail sablon szerkesztés', 3),
(522, 75, 'E-mail sablon szerkesztés', 4),
(523, 75, 'E-mail sablon szerkesztés', 5),
(524, 75, 'E-mail sablon szerkesztés', 6),
(525, 75, 'E-mail sablon szerkesztés', 7),
(526, 76, 'Üzenet tárgya', 1),
(527, 76, 'Üzenet tárgya', 2),
(528, 76, 'Üzenet tárgya', 3),
(529, 76, 'Üzenet tárgya', 4),
(530, 76, 'Üzenet tárgya', 5),
(531, 76, 'Üzenet tárgya', 6),
(532, 76, 'Üzenet tárgya', 7),
(533, 77, 'Tartalom', 1),
(534, 77, 'Tartalom', 2),
(535, 77, 'Tartalom', 3),
(536, 77, 'Tartalom', 4),
(537, 77, 'Tartalom', 5),
(538, 77, 'Tartalom', 6),
(539, 77, 'Tartalom', 7),
(540, 78, 'Egyedi név', 1),
(541, 78, 'Egyedi név', 2),
(542, 78, 'Egyedi név', 3),
(543, 78, 'Egyedi név', 4),
(544, 78, 'Egyedi név', 5),
(545, 78, 'Egyedi név', 6),
(546, 78, 'Egyedi név', 7),
(547, 79, 'Elfelejtett jelszó', 1),
(548, 79, 'Elfelejtett jelszó', 2),
(549, 79, 'Elfelejtett jelszó', 3),
(550, 79, 'Elfelejtett jelszó', 4),
(551, 79, 'Elfelejtett jelszó', 5),
(552, 79, 'Elfelejtett jelszó', 6),
(553, 79, 'Elfelejtett jelszó', 7),
(554, 80, 'Elfelejtettem a jelszavam', 1),
(555, 80, 'Elfelejtettem a jelszavam', 2),
(556, 80, 'Elfelejtettem a jelszavam', 3),
(557, 80, 'Elfelejtettem a jelszavam', 4),
(558, 80, 'Elfelejtettem a jelszavam', 5),
(559, 80, 'Elfelejtettem a jelszavam', 6),
(560, 80, 'Elfelejtettem a jelszavam', 7),
(561, 81, 'Tovább', 1),
(562, 81, 'Next', 2),
(563, 81, 'Tovább', 3),
(564, 81, 'Tovább', 4),
(565, 81, 'Tovább', 5),
(566, 81, 'Tovább', 6),
(567, 81, 'Tovább', 7),
(568, 82, 'Összesen', 1),
(569, 82, 'Összesen', 2),
(570, 82, 'Összesen', 3),
(571, 82, 'Összesen', 4),
(572, 82, 'Összesen', 5),
(573, 82, 'Összesen', 6),
(574, 82, 'Összesen', 7),
(575, 83, 'Video feltöltés plusz megtekintés', 1),
(576, 83, 'Video feltöltés plusz megtekintés', 2),
(577, 83, 'Video feltöltés plusz megtekintés', 3),
(578, 83, 'Video feltöltés plusz megtekintés', 4),
(579, 83, 'Video feltöltés plusz megtekintés', 5),
(580, 83, 'Video feltöltés plusz megtekintés', 6),
(581, 83, 'Video feltöltés plusz megtekintés', 7),
(582, 84, 'Pont', 1),
(583, 84, 'Pont', 2),
(584, 84, 'Pont', 3),
(585, 84, 'Pont', 4),
(586, 84, 'Pont', 5),
(587, 84, 'Pont', 6),
(588, 84, 'Pont', 7),
(589, 85, 'Videó', 1),
(590, 85, 'Videó', 2),
(591, 85, 'Videó', 3),
(592, 85, 'Videó', 4),
(593, 85, 'Videó', 5),
(594, 85, 'Videó', 6),
(595, 85, 'Videó', 7),
(596, 86, 'Sikeres videó feltöltés', 1),
(597, 86, 'Sikeres videó feltöltés', 2),
(598, 86, 'Sikeres videó feltöltés', 3),
(599, 86, 'Sikeres videó feltöltés', 4),
(600, 86, 'Sikeres videó feltöltés', 5),
(601, 86, 'Sikeres videó feltöltés', 6),
(602, 86, 'Sikeres videó feltöltés', 7),
(603, 87, 'Video feltöltésed sikeres volt, küldtünk egy üzenetet az email címedre!', 1),
(604, 87, 'Video feltöltésed sikeres volt, küldtünk egy üzenetet az email címedre!', 2),
(605, 87, 'Video feltöltésed sikeres volt, küldtünk egy üzenetet az email címedre!', 3),
(606, 87, 'Video feltöltésed sikeres volt, küldtünk egy üzenetet az email címedre!', 4),
(607, 87, 'Video feltöltésed sikeres volt, küldtünk egy üzenetet az email címedre!', 5),
(608, 87, 'Video feltöltésed sikeres volt, küldtünk egy üzenetet az email címedre!', 6),
(609, 87, 'Video feltöltésed sikeres volt, küldtünk egy üzenetet az email címedre!', 7),
(610, 88, 'Egyedi ajánlat lassulás alap', 1),
(611, 88, 'Egyedi ajánlat lassulás alap', 2),
(612, 88, 'Egyedi ajánlat lassulás alap', 3),
(613, 88, 'Egyedi ajánlat lassulás alap', 4),
(614, 88, 'Egyedi ajánlat lassulás alap', 5),
(615, 88, 'Egyedi ajánlat lassulás alap', 6),
(616, 88, 'Egyedi ajánlat lassulás alap', 7),
(617, 89, 'Egyedi ajánlat lassulás', 1),
(618, 89, 'Egyedi ajánlat lassulás', 2),
(619, 89, 'Egyedi ajánlat lassulás', 3),
(620, 89, 'Egyedi ajánlat lassulás', 4),
(621, 89, 'Egyedi ajánlat lassulás', 5),
(622, 89, 'Egyedi ajánlat lassulás', 6),
(623, 89, 'Egyedi ajánlat lassulás', 7),
(624, 90, 'Egyedi ajánlat számláló', 1),
(625, 90, 'Egyedi ajánlat számláló', 2),
(626, 90, 'Egyedi ajánlat számláló', 3),
(627, 90, 'Egyedi ajánlat számláló', 4),
(628, 90, 'Egyedi ajánlat számláló', 5),
(629, 90, 'Egyedi ajánlat számláló', 6),
(630, 90, 'Egyedi ajánlat számláló', 7),
(631, 91, 'Egyedi ajánlat megnézendő óra', 1),
(632, 91, 'Egyedi ajánlat megnézendő óra', 2),
(633, 91, 'Egyedi ajánlat megnézendő óra', 3),
(634, 91, 'Egyedi ajánlat megnézendő óra', 4),
(635, 91, 'Egyedi ajánlat megnézendő óra', 5),
(636, 91, 'Egyedi ajánlat megnézendő óra', 6),
(637, 91, 'Egyedi ajánlat megnézendő óra', 7),
(638, 92, 'Felhasználó', 1),
(639, 92, 'Felhasználó', 2),
(640, 92, 'Felhasználó', 3),
(641, 92, 'Felhasználó', 4),
(642, 92, 'Felhasználó', 5),
(643, 92, 'Felhasználó', 6),
(644, 92, 'Felhasználó', 7),
(645, 93, 'Státusz', 1),
(646, 93, 'Státusz', 2),
(647, 93, 'Státusz', 3),
(648, 93, 'Státusz', 4),
(649, 93, 'Státusz', 5),
(650, 93, 'Státusz', 6),
(651, 93, 'Státusz', 7),
(652, 94, 'Értékelés', 1),
(653, 94, 'Értékelés', 2),
(654, 94, 'Értékelés', 3),
(655, 94, 'Értékelés', 4),
(656, 94, 'Értékelés', 5),
(657, 94, 'Értékelés', 6),
(658, 94, 'Értékelés', 7),
(659, 95, 'Nézettség', 1),
(660, 95, 'Nézettség', 2),
(661, 95, 'Nézettség', 3),
(662, 95, 'Nézettség', 4),
(663, 95, 'Nézettség', 5),
(664, 95, 'Nézettség', 6),
(665, 95, 'Nézettség', 7),
(666, 96, 'Letöltés', 1),
(667, 96, 'Letöltés', 2),
(668, 96, 'Letöltés', 3),
(669, 96, 'Letöltés', 4),
(670, 96, 'Letöltés', 5),
(671, 96, 'Letöltés', 6),
(672, 96, 'Letöltés', 7),
(673, 97, 'Új videók', 1),
(674, 97, 'Új videók', 2),
(675, 97, 'Új videók', 3),
(676, 97, 'Új videók', 4),
(677, 97, 'Új videók', 5),
(678, 97, 'Új videók', 6),
(679, 97, 'Új videók', 7),
(680, 98, 'Hó végi zárás', 1),
(681, 98, 'Month Closure', 2),
(682, 98, 'Hó végi zárás', 3),
(683, 98, 'Hó végi zárás', 4),
(684, 98, 'Hó végi zárás', 5),
(685, 98, 'Hó végi zárás', 6),
(686, 98, 'Hó végi zárás', 7),
(687, 99, 'Zárás indítása', 1),
(688, 99, 'Zárás indítása', 2),
(689, 99, 'Zárás indítása', 3),
(690, 99, 'Zárás indítása', 4),
(691, 99, 'Zárás indítása', 5),
(692, 99, 'Zárás indítása', 6),
(693, 99, 'Zárás indítása', 7),
(694, 100, 'Zárás érték pont beállítás', 1),
(695, 100, 'Zárás érték pont beállítás', 2),
(696, 100, 'Zárás érték pont beállítás', 3),
(697, 100, 'Zárás érték pont beállítás', 4),
(698, 100, 'Zárás érték pont beállítás', 5),
(699, 100, 'Zárás érték pont beállítás', 6),
(700, 100, 'Zárás érték pont beállítás', 7),
(701, 101, 'Havi zárás még nem készült el!', 1),
(702, 101, 'Havi zárás még nem készült el!', 2),
(703, 101, 'Havi zárás még nem készült el!', 3),
(704, 101, 'Havi zárás még nem készült el!', 4),
(705, 101, 'Havi zárás még nem készült el!', 5),
(706, 101, 'Havi zárás még nem készült el!', 6),
(707, 101, 'Havi zárás még nem készült el!', 7),
(708, 102, 'Biztosan elindítja a hó végi zárást?', 1),
(709, 102, 'Biztosan elindítja a hó végi zárást?', 2),
(710, 102, 'Biztosan elindítja a hó végi zárást?', 3),
(711, 102, 'Biztosan elindítja a hó végi zárást?', 4),
(712, 102, 'Biztosan elindítja a hó végi zárást?', 5),
(713, 102, 'Biztosan elindítja a hó végi zárást?', 6),
(714, 102, 'Biztosan elindítja a hó végi zárást?', 7),
(715, 103, 'Év', 1),
(716, 103, 'Év', 2),
(717, 103, 'Év', 3),
(718, 103, 'Év', 4),
(719, 103, 'Év', 5),
(720, 103, 'Év', 6),
(721, 103, 'Év', 7),
(722, 104, 'Hónap', 1),
(723, 104, 'Hónap', 2),
(724, 104, 'Hónap', 3),
(725, 104, 'Hónap', 4),
(726, 104, 'Hónap', 5),
(727, 104, 'Hónap', 6),
(728, 104, 'Hónap', 7),
(729, 105, 'Bejelentkezés facebookkal', 1),
(730, 105, 'Log in with Facebook', 2),
(731, 105, 'Bejelentkezés facebookkal', 3),
(732, 105, 'Bejelentkezés facebookkal', 4),
(733, 105, 'Bejelentkezés facebookkal', 5),
(734, 105, 'Bejelentkezés facebookkal', 6),
(735, 105, 'Bejelentkezés facebookkal', 7),
(736, 106, 'Ez miez?', 1),
(737, 106, 'Ez miez', 2),
(738, 106, 'Ez miez', 3),
(739, 106, 'Ez miez', 4),
(740, 106, 'Ez miez', 5),
(741, 106, 'Ez miez', 6),
(742, 106, 'Ez miez', 7),
(743, 107, 'Url vagy keresés', 1),
(744, 107, 'Url vagy keresés', 2),
(745, 107, 'Url vagy keresés', 3),
(746, 107, 'Url vagy keresés', 4),
(747, 107, 'Url vagy keresés', 5),
(748, 107, 'Url vagy keresés', 6),
(749, 107, 'Url vagy keresés', 7),
(750, 108, 'Zárva', 1),
(751, 108, 'Zárva', 2),
(752, 108, 'Zárva', 3),
(753, 108, 'Zárva', 4),
(754, 108, 'Zárva', 5),
(755, 108, 'Zárva', 6),
(756, 108, 'Zárva', 7),
(757, 109, 'Statikus oldalak', 1),
(758, 109, 'Static Pages', 2),
(759, 109, 'Statikus oldalak', 3),
(760, 109, 'Statikus oldalak', 4),
(761, 109, 'Statikus oldalak', 5),
(762, 109, 'Statikus oldalak', 6),
(763, 109, 'Statikus oldalak', 7),
(764, 110, 'Cím', 1),
(765, 110, 'Cím', 2),
(766, 110, 'Cím', 3),
(767, 110, 'Cím', 4),
(768, 110, 'Cím', 5),
(769, 110, 'Cím', 6),
(770, 110, 'Cím', 7),
(771, 111, 'Keresett oldal nem található', 1),
(772, 111, 'Keresett oldal nem található', 2),
(773, 111, 'Keresett oldal nem található', 3),
(774, 111, 'Keresett oldal nem található', 4),
(775, 111, 'Keresett oldal nem található', 5),
(776, 111, 'Keresett oldal nem található', 6),
(777, 111, 'Keresett oldal nem található', 7),
(778, 112, 'Elfogadom az Általános Szerződési Feltételeket melyet itt tudok elolvasni', 1),
(779, 112, 'Elfogadom az Általános Szerződési Feltételeket melyet itt tudok elolvasni', 2),
(780, 112, 'Elfogadom az Általános Szerződési Feltételeket melyet itt tudok elolvasni', 3),
(781, 112, 'Elfogadom az Általános Szerződési Feltételeket melyet itt tudok elolvasni', 4),
(782, 112, 'Elfogadom az Általános Szerződési Feltételeket melyet itt tudok elolvasni', 5),
(783, 112, 'Elfogadom az Általános Szerződési Feltételeket melyet itt tudok elolvasni', 6),
(784, 112, 'Elfogadom az Általános Szerződési Feltételeket melyet itt tudok elolvasni', 7),
(785, 113, 'Profilkép látható?', 1),
(786, 113, 'Profilkép látható?', 2),
(787, 113, 'Profilkép látható?', 3),
(788, 113, 'Profilkép látható?', 4),
(789, 113, 'Profilkép látható?', 5),
(790, 113, 'Profilkép látható?', 6),
(791, 113, 'Profilkép látható?', 7),
(792, 114, 'További képek', 1),
(793, 114, 'További képek', 2),
(794, 114, 'További képek', 3),
(795, 114, 'További képek', 4),
(796, 114, 'További képek', 5),
(797, 114, 'További képek', 6),
(798, 114, 'További képek', 7),
(799, 115, 'Termék adatok', 1),
(800, 115, 'Termék adatok', 2),
(801, 115, 'Termék adatok', 3),
(802, 115, 'Termék adatok', 4),
(803, 115, 'Termék adatok', 5),
(804, 115, 'Termék adatok', 6),
(805, 115, 'Termék adatok', 7),
(806, 116, 'Ajánlattétel', 1),
(807, 116, 'Ajánlattétel', 2),
(808, 116, 'Ajánlattétel', 3),
(809, 116, 'Ajánlattétel', 4),
(810, 116, 'Ajánlattétel', 5),
(811, 116, 'Ajánlattétel', 6),
(812, 116, 'Ajánlattétel', 7),
(813, 117, 'Meghívó küldés', 1),
(814, 117, 'Meghívó küldés', 2),
(815, 117, 'Meghívó küldés', 3),
(816, 117, 'Meghívó küldés', 4),
(817, 117, 'Meghívó küldés', 5),
(818, 117, 'Meghívó küldés', 6),
(819, 117, 'Meghívó küldés', 7),
(820, 118, 'Küldés', 1),
(821, 118, 'Küldés', 2),
(822, 118, 'Küldés', 3),
(823, 118, 'Küldés', 4),
(824, 118, 'Küldés', 5),
(825, 118, 'Küldés', 6),
(826, 118, 'Küldés', 7),
(827, 119, 'Sikeres meghívóküldés', 1),
(828, 119, 'Sikeres meghívóküldés', 2),
(829, 119, 'Sikeres meghívóküldés', 3),
(830, 119, 'Sikeres meghívóküldés', 4),
(831, 119, 'Sikeres meghívóküldés', 5),
(832, 119, 'Sikeres meghívóküldés', 6),
(833, 119, 'Sikeres meghívóküldés', 7),
(834, 120, 'Felhasználás', 1),
(835, 120, 'Felhasználás', 2),
(836, 120, 'Felhasználás', 3),
(837, 120, 'Felhasználás', 4),
(838, 120, 'Felhasználás', 5),
(839, 120, 'Felhasználás', 6),
(840, 120, 'Felhasználás', 7),
(841, 121, 'Pontokból', 1),
(842, 121, 'Pontokból', 2),
(843, 121, 'Pontokból', 3),
(844, 121, 'Pontokból', 4),
(845, 121, 'Pontokból', 5),
(846, 121, 'Pontokból', 6),
(847, 121, 'Pontokból', 7),
(848, 122, 'Kapott ajándékból', 1),
(849, 122, 'Kapott ajándékból', 2),
(850, 122, 'Kapott ajándékból', 3),
(851, 122, 'Kapott ajándékból', 4),
(852, 122, 'Kapott ajándékból', 5),
(853, 122, 'Kapott ajándékból', 6),
(854, 122, 'Kapott ajándékból', 7),
(855, 123, 'Ajánlat ár-tól', 1),
(856, 123, 'Licit ár-tól', 2),
(857, 123, 'Licit ár-tól', 3),
(858, 123, 'Licit ár-tól', 4),
(859, 123, 'Licit ár-tól', 5),
(860, 123, 'Licit ár-tól', 6),
(861, 123, 'Licit ár-tól', 7),
(862, 124, '- ig', 1),
(863, 124, 'Licit ár-ig', 2),
(864, 124, 'Licit ár-ig', 3),
(865, 124, 'Licit ár-ig', 4),
(866, 124, 'Licit ár-ig', 5),
(867, 124, 'Licit ár-ig', 6),
(868, 124, 'Licit ár-ig', 7),
(869, 125, 'Előző termék', 1),
(870, 125, 'Előző termék', 2),
(871, 125, 'Előző termék', 3),
(872, 125, 'Előző termék', 4),
(873, 125, 'Előző termék', 5),
(874, 125, 'Előző termék', 6),
(875, 125, 'Előző termék', 7),
(876, 126, 'Következő termék', 1),
(877, 126, 'Következő termék', 2),
(878, 126, 'Következő termék', 3),
(879, 126, 'Következő termék', 4),
(880, 126, 'Következő termék', 5),
(881, 126, 'Következő termék', 6),
(882, 126, 'Következő termék', 7),
(883, 127, 'Az előző hónapról...', 1),
(884, 127, 'Az előző hónapról...', 2),
(885, 127, 'Az előző hónapról...', 3),
(886, 127, 'Az előző hónapról...', 4),
(887, 127, 'Az előző hónapról...', 5),
(888, 127, 'Az előző hónapról...', 6),
(889, 127, 'Az előző hónapról...', 7),
(890, 128, 'Meghívottjaim teljesítménye a sajátom alapján', 1),
(891, 128, 'Meghívottjaim teljesítménye a sajátom alapján', 2),
(892, 128, 'Meghívottjaim teljesítménye a sajátom alapján', 3),
(893, 128, 'Meghívottjaim teljesítménye a sajátom alapján', 4),
(894, 128, 'Meghívottjaim teljesítménye a sajátom alapján', 5),
(895, 128, 'Meghívottjaim teljesítménye a sajátom alapján', 6),
(896, 128, 'Meghívottjaim teljesítménye a sajátom alapján', 7),
(897, 129, 'Óra', 1),
(898, 129, 'Hour', 2),
(899, 129, 'Óra', 3),
(900, 129, 'Óra', 4),
(901, 129, 'Óra', 5),
(902, 129, 'Óra', 6),
(903, 129, 'Óra', 7),
(904, 130, 'Főoldal', 1),
(905, 130, 'Főoldal', 2),
(906, 130, 'Főoldal', 3),
(907, 130, 'Főoldal', 4),
(908, 130, 'Főoldal', 5),
(909, 130, 'Főoldal', 6),
(910, 130, 'Főoldal', 7),
(911, 131, 'Csak egy ajánlat megadása', 1),
(912, 131, 'Csak egy ajánlat megadása', 2),
(913, 131, 'Csak egy ajánlat megadása', 3),
(914, 131, 'Csak egy ajánlat megadása', 4),
(915, 131, 'Csak egy ajánlat megadása', 5),
(916, 131, 'Csak egy ajánlat megadása', 6),
(917, 131, 'Csak egy ajánlat megadása', 7),
(918, 132, 'Több ajánlat egyszerre', 1),
(919, 132, 'Több ajánlat egyszerre', 2),
(920, 132, 'Több ajánlat egyszerre', 3),
(921, 132, 'Több ajánlat egyszerre', 4),
(922, 132, 'Több ajánlat egyszerre', 5),
(923, 132, 'Több ajánlat egyszerre', 6),
(924, 132, 'Több ajánlat egyszerre', 7),
(925, 133, 'Egy ajánlat', 1),
(926, 133, 'Egy ajánlat', 2),
(927, 133, 'Egy ajánlat', 3),
(928, 133, 'Egy ajánlat', 4),
(929, 133, 'Egy ajánlat', 5),
(930, 133, 'Egy ajánlat', 6),
(931, 133, 'Egy ajánlat', 7),
(932, 134, 'Termék előrehaladása', 1),
(933, 134, 'Termék előrehaladása', 2),
(934, 134, 'Termék előrehaladása', 3),
(935, 134, 'Termék előrehaladása', 4),
(936, 134, 'Termék előrehaladása', 5),
(937, 134, 'Termék előrehaladása', 6),
(938, 134, 'Termék előrehaladása', 7),
(939, 135, 'Ha 100%-on teljesítettem volna', 1),
(940, 135, 'Ha 100%-on teljesítettem volna', 2),
(941, 135, 'Ha 100%-on teljesítettem volna', 3),
(942, 135, 'Ha 100%-on teljesítettem volna', 4),
(943, 135, 'Ha 100%-on teljesítettem volna', 5),
(944, 135, 'Ha 100%-on teljesítettem volna', 6),
(945, 135, 'Ha 100%-on teljesítettem volna', 7),
(946, 136, 'Számlázási név / cégnév', 1),
(947, 136, 'Számlázási név / cégnév', 2),
(948, 136, 'Számlázási név / cégnév', 3),
(949, 136, 'Számlázási név / cégnév', 4),
(950, 136, 'Számlázási név / cégnév', 5),
(951, 136, 'Számlázási név / cégnév', 6),
(952, 136, 'Számlázási név / cégnév', 7),
(953, 137, 'Hol vagyok? Bejelölöm a térképen hogy a hozzám legközelebb levő cégek reklámját kapjam meg elsősorban ', 1),
(954, 137, 'Bejelölöm a térképen', 2),
(955, 137, 'Bejelölöm a térképen', 3),
(956, 137, 'Bejelölöm a térképen', 4),
(957, 137, 'Bejelölöm a térképen', 5),
(958, 137, 'Bejelölöm a térképen', 6),
(959, 137, 'Bejelölöm a térképen', 7),
(960, 138, 'Nézettség korlát árbeállítás', 1),
(961, 138, 'Nézettség korlát árbeállítás', 2),
(962, 138, 'Nézettség korlát árbeállítás', 3),
(963, 138, 'Nézettség korlát árbeállítás', 4),
(964, 138, 'Nézettség korlát árbeállítás', 5),
(965, 138, 'Nézettség korlát árbeállítás', 6),
(966, 138, 'Nézettség korlát árbeállítás', 7),
(967, 139, 'Hirdetésmentesség (+25% pont)', 1),
(968, 139, 'Hirdetésmentesség (+25% pont)', 2),
(969, 139, 'Hirdetésmentesség (+25% pont)', 3),
(970, 139, 'Hirdetésmentesség (+25% pont)', 4),
(971, 139, 'Hirdetésmentesség (+25% pont)', 5),
(972, 139, 'Hirdetésmentesség (+25% pont)', 6),
(973, 139, 'Hirdetésmentesség (+25% pont)', 7),
(974, 140, 'A video hossza meghatározza az pontozást. Amennyiben 20 másodpercet meghaladja az ár a duplája, 40 m', 1),
(975, 140, 'Video hossza magyarázat', 2),
(976, 140, 'Video hossza magyarázat', 3),
(977, 140, 'Video hossza magyarázat', 4),
(978, 140, 'Video hossza magyarázat', 5),
(979, 140, 'Video hossza magyarázat', 6),
(980, 140, 'Video hossza magyarázat', 7),
(981, 141, 'másodperc', 1),
(982, 141, 'másodperc', 2),
(983, 141, 'másodperc', 3),
(984, 141, 'másodperc', 4),
(985, 141, 'másodperc', 5),
(986, 141, 'másodperc', 6),
(987, 141, 'másodperc', 7),
(988, 142, 'Szeretnék kupont hozzáadni', 1),
(989, 142, 'Szeretnék kupont hozzáadni', 2),
(990, 142, 'Szeretnék kupont hozzáadni', 3),
(991, 142, 'Szeretnék kupont hozzáadni', 4),
(992, 142, 'Szeretnék kupont hozzáadni', 5),
(993, 142, 'Szeretnék kupont hozzáadni', 6),
(994, 142, 'Szeretnék kupont hozzáadni', 7),
(995, 143, 'Kupon szövege', 1),
(996, 143, 'Kupon szövege', 2),
(997, 143, 'Kupon szövege', 3),
(998, 143, 'Kupon szövege', 4),
(999, 143, 'Kupon szövege', 5),
(1000, 143, 'Kupon szövege', 6),
(1001, 143, 'Kupon szövege', 7),
(1002, 144, 'Dátum -tól', 1),
(1003, 144, 'Dátum -tól', 2),
(1004, 144, 'Dátum -tól', 3),
(1005, 144, 'Dátum -tól', 4),
(1006, 144, 'Dátum -tól', 5),
(1007, 144, 'Dátum -tól', 6),
(1008, 144, 'Dátum -tól', 7),
(1009, 145, 'Dátum -ig', 1),
(1010, 145, 'Dátum -ig', 2),
(1011, 145, 'Dátum -ig', 3),
(1012, 145, 'Dátum -ig', 4),
(1013, 145, 'Dátum -ig', 5),
(1014, 145, 'Dátum -ig', 6),
(1015, 145, 'Dátum -ig', 7),
(1016, 146, 'Érvényesség', 1),
(1017, 146, 'Érvényesség', 2),
(1018, 146, 'Érvényesség', 3),
(1019, 146, 'Érvényesség', 4),
(1020, 146, 'Érvényesség', 5),
(1021, 146, 'Érvényesség', 6),
(1022, 146, 'Érvényesség', 7),
(1023, 147, 'Kupon gyűjtőm', 1),
(1024, 147, 'Kupon gyűjtőm', 2),
(1025, 147, 'Kupon gyűjtőm', 3),
(1026, 147, 'Kupon gyűjtőm', 4),
(1027, 147, 'Kupon gyűjtőm', 5),
(1028, 147, 'Kupon gyűjtőm', 6),
(1029, 147, 'Kupon gyűjtőm', 7),
(1030, 148, 'Videóim', 1),
(1031, 148, 'Videóim', 2),
(1032, 148, 'Videóim', 3),
(1033, 148, 'Videóim', 4),
(1034, 148, 'Videóim', 5),
(1035, 148, 'Videóim', 6),
(1036, 148, 'Videóim', 7),
(1037, 149, 'Kupon', 1),
(1038, 149, 'Coupon', 2),
(1039, 149, 'Kupon', 3),
(1040, 149, 'Kupon', 4),
(1041, 149, 'Kupon', 5),
(1042, 149, 'Kupon', 6),
(1043, 149, 'Kupon', 7),
(1044, 150, 'Nyomtatás', 1),
(1045, 150, 'Nyomtatás', 2),
(1046, 150, 'Nyomtatás', 3),
(1047, 150, 'Nyomtatás', 4),
(1048, 150, 'Nyomtatás', 5),
(1049, 150, 'Nyomtatás', 6),
(1050, 150, 'Nyomtatás', 7),
(1051, 151, 'Továbbiak', 1),
(1052, 151, 'Továbbiak', 2),
(1053, 151, 'Továbbiak', 3),
(1054, 151, 'Továbbiak', 4),
(1055, 151, 'Továbbiak', 5),
(1056, 151, 'Továbbiak', 6),
(1057, 151, 'Továbbiak', 7),
(1065, 153, 'Hosszabbítás', 1),
(1066, 153, 'Hosszabbítás', 2),
(1067, 153, 'Hosszabbítás', 3),
(1068, 153, 'Hosszabbítás', 4),
(1069, 153, 'Hosszabbítás', 5),
(1070, 153, 'Hosszabbítás', 6),
(1071, 153, 'Hosszabbítás', 7),
(1072, 154, 'Video megtekintés hosszabbítás', 1),
(1073, 154, 'Video megtekintés hosszabbítás', 2),
(1074, 154, 'Video megtekintés hosszabbítás', 3),
(1075, 154, 'Video megtekintés hosszabbítás', 4),
(1076, 154, 'Video megtekintés hosszabbítás', 5),
(1077, 154, 'Video megtekintés hosszabbítás', 6),
(1078, 154, 'Video megtekintés hosszabbítás', 7),
(1079, 155, 'Infó dobozok', 1),
(1080, 155, 'Infó dobozok', 2),
(1081, 155, 'Infó dobozok', 3),
(1082, 155, 'Infó dobozok', 4),
(1083, 155, 'Infó dobozok', 5),
(1084, 155, 'Infó dobozok', 6),
(1085, 155, 'Infó dobozok', 7),
(1086, 156, 'Infó doboz szerkesztés', 1),
(1087, 156, 'Infó doboz szerkesztés', 2),
(1088, 156, 'Infó doboz szerkesztés', 3),
(1089, 156, 'Infó doboz szerkesztés', 4),
(1090, 156, 'Infó doboz szerkesztés', 5),
(1091, 156, 'Infó doboz szerkesztés', 6),
(1092, 156, 'Infó doboz szerkesztés', 7),
(1093, 157, 'Sikeres visszaigazolás', 1),
(1094, 157, 'Sikeres visszaigazolás', 2),
(1095, 157, 'Sikeres visszaigazolás', 3),
(1096, 157, 'Sikeres visszaigazolás', 4),
(1097, 157, 'Sikeres visszaigazolás', 5),
(1098, 157, 'Sikeres visszaigazolás', 6),
(1099, 157, 'Sikeres visszaigazolás', 7),
(1100, 158, 'Össz nézettség', 1),
(1101, 158, 'Össz nézettség', 2),
(1102, 158, 'Össz nézettség', 3),
(1103, 158, 'Össz nézettség', 4),
(1104, 158, 'Össz nézettség', 5),
(1105, 158, 'Össz nézettség', 6),
(1106, 158, 'Össz nézettség', 7),
(1107, 159, 'Össz ajánlat', 1),
(1108, 159, 'Össz ajánlat', 2),
(1109, 159, 'Össz ajánlat', 3),
(1110, 159, 'Össz ajánlat', 4),
(1111, 159, 'Össz ajánlat', 5),
(1112, 159, 'Össz ajánlat', 6),
(1113, 159, 'Össz ajánlat', 7),
(1114, 160, 'Ajánlatok pontból', 1),
(1115, 160, 'Ajánlatok pontból', 2),
(1116, 160, 'Ajánlatok pontból', 3),
(1117, 160, 'Ajánlatok pontból', 4),
(1118, 160, 'Ajánlatok pontból', 5),
(1119, 160, 'Ajánlatok pontból', 6),
(1120, 160, 'Ajánlatok pontból', 7),
(1121, 161, 'Meghívó azonosító megadása', 1),
(1122, 161, 'Meghívó azonosító megadása', 2),
(1123, 161, 'Meghívó azonosító megadása', 3),
(1124, 161, 'Meghívó azonosító megadása', 4),
(1125, 161, 'Meghívó azonosító megadása', 5),
(1126, 161, 'Meghívó azonosító megadása', 6),
(1127, 161, 'Meghívó azonosító megadása', 7),
(1128, 162, 'Napi nézettség', 1),
(1129, 162, 'Napi nézettség', 2),
(1130, 162, 'Napi nézettség', 3),
(1131, 162, 'Napi nézettség', 4),
(1132, 162, 'Napi nézettség', 5),
(1133, 162, 'Napi nézettség', 6),
(1134, 162, 'Napi nézettség', 7),
(1135, 163, 'Kapott ajándék db', 1),
(1136, 163, 'Kapott ajándék db', 2),
(1137, 163, 'Kapott ajándék db', 3),
(1138, 163, 'Kapott ajándék db', 4),
(1139, 163, 'Kapott ajándék db', 5),
(1140, 163, 'Kapott ajándék db', 6),
(1141, 163, 'Kapott ajándék db', 7),
(1142, 164, 'Felhasználható ajándék pontok', 1),
(1143, 164, 'Felhasználható ajándék pontok', 2),
(1144, 164, 'Felhasználható ajándék pontok', 3),
(1145, 164, 'Felhasználható ajándék pontok', 4),
(1146, 164, 'Felhasználható ajándék pontok', 5),
(1147, 164, 'Felhasználható ajándék pontok', 6),
(1148, 164, 'Felhasználható ajándék pontok', 7),
(1149, 165, 'Kategóriák megadása', 1),
(1150, 165, 'Kategória hozzáadás', 2),
(1151, 165, 'Kategória hozzáadás', 3),
(1152, 165, 'Kategória hozzáadás', 4),
(1153, 165, 'Kategória hozzáadás', 5),
(1154, 165, 'Kategória hozzáadás', 6),
(1155, 165, 'Kategória hozzáadás', 7),
(1156, 166, 'Olvasd be a QR-kódot a regisztrációhoz', 1),
(1157, 166, 'Olvasd be a QR-kódot a regisztrációhoz', 2),
(1158, 166, 'Olvasd be a QR-kódot a regisztrációhoz', 3),
(1159, 166, 'Olvasd be a QR-kódot a regisztrációhoz', 4),
(1160, 166, 'Olvasd be a QR-kódot a regisztrációhoz', 5),
(1161, 166, 'Olvasd be a QR-kódot a regisztrációhoz', 6),
(1162, 166, 'Olvasd be a QR-kódot a regisztrációhoz', 7),
(1163, 167, 'Névjegykártya elkészítése', 1),
(1164, 167, 'Névjegykártya elkészítése', 2),
(1165, 167, 'Névjegykártya elkészítése', 3),
(1166, 167, 'Névjegykártya elkészítése', 4),
(1167, 167, 'Névjegykártya elkészítése', 5),
(1168, 167, 'Névjegykártya elkészítése', 6),
(1169, 167, 'Névjegykártya elkészítése', 7),
(1170, 168, 'Info', 1),
(1171, 168, 'Info', 2),
(1172, 168, 'Info', 3),
(1173, 168, 'Info', 4),
(1174, 168, 'Info', 5),
(1175, 168, 'Info', 6),
(1176, 168, 'Info', 7),
(1177, 169, 'Webshop', 1),
(1178, 169, 'Webshop', 2),
(1179, 169, 'Webshop', 3),
(1180, 169, 'Webshop', 4),
(1181, 169, 'Webshop', 5),
(1182, 169, 'Webshop', 6),
(1183, 169, 'Webshop', 7),
(1184, 170, 'Tetszik', 1),
(1185, 170, 'Like', 2),
(1186, 170, 'Tetszik', 3),
(1187, 170, 'Tetszik', 4),
(1188, 170, 'Tetszik', 5),
(1189, 170, 'Tetszik', 6),
(1190, 170, 'Tetszik', 7),
(1191, 171, 'Kedvenc videóim', 1),
(1192, 171, 'Kedvenc videóim', 2),
(1193, 171, 'Kedvenc videóim', 3),
(1194, 171, 'Kedvenc videóim', 4),
(1195, 171, 'Kedvenc videóim', 5),
(1196, 171, 'Kedvenc videóim', 6),
(1197, 171, 'Kedvenc videóim', 7),
(1198, 172, 'Meghívó kód', 1),
(1199, 172, 'Meghívó kód', 2),
(1200, 172, 'Meghívó kód', 3),
(1201, 172, 'Meghívó kód', 4),
(1202, 172, 'Meghívó kód', 5),
(1203, 172, 'Meghívó kód', 6),
(1204, 172, 'Meghívó kód', 7),
(1205, 173, 'Kupon kód ellenőrzés', 1),
(1206, 173, 'Kupon kód ellenőrzés', 2),
(1207, 173, 'Kupon kód ellenőrzés', 3),
(1208, 173, 'Kupon kód ellenőrzés', 4),
(1209, 173, 'Kupon kód ellenőrzés', 5),
(1210, 173, 'Kupon kód ellenőrzés', 6),
(1211, 173, 'Kupon kód ellenőrzés', 7),
(1212, 174, 'Ellenőrzés', 1),
(1213, 174, 'Ellenőrzés', 2),
(1214, 174, 'Ellenőrzés', 3),
(1215, 174, 'Ellenőrzés', 4),
(1216, 174, 'Ellenőrzés', 5),
(1217, 174, 'Ellenőrzés', 6),
(1218, 174, 'Ellenőrzés', 7),
(1219, 175, 'Érvényes', 1),
(1220, 175, 'Érvényes', 2),
(1221, 175, 'Érvényes', 3),
(1222, 175, 'Érvényes', 4),
(1223, 175, 'Érvényes', 5),
(1224, 175, 'Érvényes', 6),
(1225, 175, 'Érvényes', 7),
(1226, 176, 'Nem érvényes', 1),
(1227, 176, 'Nem érvényes', 2),
(1228, 176, 'Nem érvényes', 3),
(1229, 176, 'Nem érvényes', 4),
(1230, 176, 'Nem érvényes', 5),
(1231, 176, 'Nem érvényes', 6),
(1232, 176, 'Nem érvényes', 7),
(1233, 177, 'Weboldal', 1),
(1234, 177, 'Weboldal', 2),
(1235, 177, 'Weboldal', 3),
(1236, 177, 'Weboldal', 4),
(1237, 177, 'Weboldal', 5),
(1238, 177, 'Weboldal', 6),
(1239, 177, 'Weboldal', 7),
(1240, 178, 'Nap', 1),
(1241, 178, 'Nap', 2),
(1242, 178, 'Nap', 3),
(1243, 178, 'Nap', 4),
(1244, 178, 'Nap', 5),
(1245, 178, 'Nap', 6),
(1246, 178, 'Nap', 7),
(1247, 179, 'Letöltés utáni élettartam', 1),
(1248, 179, 'Letöltés utáni élettartam', 2),
(1249, 179, 'Letöltés utáni élettartam', 3),
(1250, 179, 'Letöltés utáni élettartam', 4),
(1251, 179, 'Letöltés utáni élettartam', 5),
(1252, 179, 'Letöltés utáni élettartam', 6),
(1253, 179, 'Letöltés utáni élettartam', 7),
(1254, 180, 'Unod a felugró videót? Kattints ide!', 1),
(1255, 180, 'Unod a felugró videót? Kattints ide!', 2),
(1256, 180, 'Unod a felugró videót? Kattints ide!', 3),
(1257, 180, 'Unod a felugró videót? Kattints ide!', 4),
(1258, 180, 'Unod a felugró videót? Kattints ide!', 5),
(1259, 180, 'Unod a felugró videót? Kattints ide!', 6),
(1260, 180, 'Unod a felugró videót? Kattints ide!', 7),
(1261, 181, 'Windows alkalmazás letöltése', 1),
(1262, 181, 'Windows alkalmazás letöltése', 2),
(1263, 181, 'Windows alkalmazás letöltése', 3),
(1264, 181, 'Windows alkalmazás letöltése', 4),
(1265, 181, 'Windows alkalmazás letöltése', 5),
(1266, 181, 'Windows alkalmazás letöltése', 6),
(1267, 181, 'Windows alkalmazás letöltése', 7),
(1268, 182, 'Nincs még adat', 1),
(1269, 182, 'Nincs még adat', 2),
(1270, 182, 'Nincs még adat', 3),
(1271, 182, 'Nincs még adat', 4),
(1272, 182, 'Nincs még adat', 5),
(1273, 182, 'Nincs még adat', 6),
(1274, 182, 'Nincs még adat', 7),
(1275, 183, 'Csökkentett adatforgalom', 1),
(1276, 183, 'Csökkentett adatforgalom', 2),
(1277, 183, 'Csökkentett adatforgalom', 3),
(1278, 183, 'Csökkentett adatforgalom', 4),
(1279, 183, 'Csökkentett adatforgalom', 5),
(1280, 183, 'Csökkentett adatforgalom', 6),
(1281, 183, 'Csökkentett adatforgalom', 7),
(1282, 184, 'Normál adatforgalom', 1),
(1283, 184, 'Normál adatforgalom', 2),
(1284, 184, 'Normál adatforgalom', 3),
(1285, 184, 'Normál adatforgalom', 4),
(1286, 184, 'Normál adatforgalom', 5),
(1287, 184, 'Normál adatforgalom', 6),
(1288, 184, 'Normál adatforgalom', 7),
(1289, 185, 'db', 1),
(1290, 185, 'db', 2),
(1291, 185, 'db', 3),
(1292, 185, 'db', 4),
(1293, 185, 'db', 5),
(1294, 185, 'db', 6),
(1295, 185, 'db', 7),
(1296, 186, 'Statisztikák', 1),
(1297, 186, 'Statisztikák', 2),
(1298, 186, 'Statisztikák', 3),
(1299, 186, 'Statisztikák', 4),
(1300, 186, 'Statisztikák', 5),
(1301, 186, 'Statisztikák', 6),
(1302, 186, 'Statisztikák', 7),
(1303, 187, 'E-mail küldés', 1),
(1304, 187, 'E-mail küldés', 2),
(1305, 187, 'E-mail küldés', 3),
(1306, 187, 'E-mail küldés', 4),
(1307, 187, 'E-mail küldés', 5),
(1308, 187, 'E-mail küldés', 6),
(1309, 187, 'E-mail küldés', 7),
(1310, 188, 'Vesszővel elválasztva', 1),
(1311, 188, 'Vesszővel elválasztva', 2),
(1312, 188, 'Vesszővel elválasztva', 3),
(1313, 188, 'Vesszővel elválasztva', 4),
(1314, 188, 'Vesszővel elválasztva', 5),
(1315, 188, 'Vesszővel elválasztva', 6),
(1316, 188, 'Vesszővel elválasztva', 7),
(1317, 189, 'Egyéb címzettek', 1),
(1318, 189, 'Egyéb címzettek', 2),
(1319, 189, 'Egyéb címzettek', 3),
(1320, 189, 'Egyéb címzettek', 4),
(1321, 189, 'Egyéb címzettek', 5),
(1322, 189, 'Egyéb címzettek', 6),
(1323, 189, 'Egyéb címzettek', 7),
(1324, 190, 'Belépés', 1),
(1325, 190, 'Belépés', 2),
(1326, 190, 'Belépés', 3),
(1327, 190, 'Belépés', 4),
(1328, 190, 'Belépés', 5),
(1329, 190, 'Belépés', 6),
(1330, 190, 'Belépés', 7),
(1337, 191, 'Felhasználónév', 1),
(1338, 191, 'Felhasználónév', 2),
(1339, 191, 'Felhasználónév', 3),
(1340, 191, 'Felhasználónév', 4),
(1341, 191, 'Felhasználónév', 5),
(1342, 191, 'Felhasználónév', 6),
(1343, 191, 'Felhasználónév', 7),
(1344, 192, 'Születésnap', 1),
(1345, 192, 'Születésnap', 2),
(1346, 192, 'Születésnap', 3),
(1347, 192, 'Születésnap', 4),
(1348, 192, 'Születésnap', 5),
(1349, 192, 'Születésnap', 6),
(1350, 192, 'Születésnap', 7),
(1351, 193, 'Személyi azonosító szám', 1),
(1352, 193, 'Személyi azonosító szám', 2),
(1353, 193, 'Személyi azonosító szám', 3),
(1354, 193, 'Személyi azonosító szám', 4),
(1355, 193, 'Személyi azonosító szám', 5),
(1356, 193, 'Személyi azonosító szám', 6),
(1357, 193, 'Személyi azonosító szám', 7),
(1358, 194, 'Alapértelmezett kifizető hely', 1),
(1359, 194, 'Alapértelmezett kifizető hely', 2),
(1360, 194, 'Alapértelmezett kifizető hely', 3),
(1361, 194, 'Alapértelmezett kifizető hely', 4),
(1362, 194, 'Alapértelmezett kifizető hely', 5),
(1363, 194, 'Alapértelmezett kifizető hely', 6),
(1364, 194, 'Alapértelmezett kifizető hely', 7),
(1365, 195, 'Megjegyzés', 1),
(1366, 195, 'Megjegyzés', 2),
(1367, 195, 'Megjegyzés', 3),
(1368, 195, 'Megjegyzés', 4),
(1369, 195, 'Megjegyzés', 5),
(1370, 195, 'Megjegyzés', 6),
(1371, 195, 'Megjegyzés', 7),
(1372, 196, 'Törzsadatok', 1),
(1373, 196, 'Törzsadatok', 2),
(1374, 196, 'Törzsadatok', 3),
(1375, 196, 'Törzsadatok', 4),
(1376, 196, 'Törzsadatok', 5),
(1377, 196, 'Törzsadatok', 6),
(1378, 196, 'Törzsadatok', 7),
(1379, 197, 'Partnerek', 1),
(1380, 197, 'Partnerek', 2),
(1381, 197, 'Partnerek', 3),
(1382, 197, 'Partnerek', 4),
(1383, 197, 'Partnerek', 5),
(1384, 197, 'Partnerek', 6),
(1385, 197, 'Partnerek', 7),
(1386, 198, 'Vásárló', 1),
(1387, 198, 'Vásárló', 2),
(1388, 198, 'Vásárló', 3),
(1389, 198, 'Vásárló', 4),
(1390, 198, 'Vásárló', 5),
(1391, 198, 'Vásárló', 6),
(1392, 198, 'Vásárló', 7),
(1393, 199, 'Szállító', 1),
(1394, 199, 'Szállító', 2),
(1395, 199, 'Szállító', 3),
(1396, 199, 'Szállító', 4),
(1397, 199, 'Szállító', 5),
(1398, 199, 'Szállító', 6),
(1399, 199, 'Szállító', 7),
(1400, 200, 'Fax', 1),
(1401, 200, 'Fax', 2),
(1402, 200, 'Fax', 3),
(1403, 200, 'Fax', 4),
(1404, 200, 'Fax', 5),
(1405, 200, 'Fax', 6),
(1406, 200, 'Fax', 7),
(1407, 201, 'Fizetési mód', 1),
(1408, 201, 'Fizetési mód', 2),
(1409, 201, 'Fizetési mód', 3),
(1410, 201, 'Fizetési mód', 4),
(1411, 201, 'Fizetési mód', 5),
(1412, 201, 'Fizetési mód', 6),
(1413, 201, 'Fizetési mód', 7),
(1415, 202, 'Kedvezmény', 1),
(1416, 202, 'Kedvezmény', 2),
(1417, 202, 'Kedvezmény', 3),
(1418, 202, 'Kedvezmény', 4),
(1419, 202, 'Kedvezmény', 5),
(1420, 202, 'Kedvezmény', 6),
(1421, 202, 'Kedvezmény', 7),
(1422, 203, 'Késedelmi kamat', 1),
(1423, 203, 'Késedelmi kamat', 2),
(1424, 203, 'Késedelmi kamat', 3),
(1425, 203, 'Késedelmi kamat', 4),
(1426, 203, 'Késedelmi kamat', 5),
(1427, 203, 'Késedelmi kamat', 6),
(1428, 203, 'Késedelmi kamat', 7),
(1429, 204, 'Cég regisztrációs szám', 1),
(1430, 204, 'Cég regisztrációs szám', 2),
(1431, 204, 'Cég regisztrációs szám', 3),
(1432, 204, 'Cég regisztrációs szám', 4),
(1433, 204, 'Cég regisztrációs szám', 5),
(1434, 204, 'Cég regisztrációs szám', 6),
(1435, 204, 'Cég regisztrációs szám', 7),
(1436, 205, 'Anyja neve', 1),
(1437, 205, 'Anyja neve', 2),
(1438, 205, 'Anyja neve', 3),
(1439, 205, 'Anyja neve', 4),
(1440, 205, 'Anyja neve', 5),
(1441, 205, 'Anyja neve', 6),
(1442, 205, 'Anyja neve', 7),
(1443, 206, 'Születési hely', 1),
(1444, 206, 'Születési hely', 2),
(1445, 206, 'Születési hely', 3),
(1446, 206, 'Születési hely', 4),
(1447, 206, 'Születési hely', 5),
(1448, 206, 'Születési hely', 6),
(1449, 206, 'Születési hely', 7),
(1451, 207, 'Kedvezményes adó', 1),
(1452, 207, 'Kedvezményes adó', 2),
(1453, 207, 'Kedvezményes adó', 3),
(1454, 207, 'Kedvezményes adó', 4),
(1455, 207, 'Kedvezményes adó', 5),
(1456, 207, 'Kedvezményes adó', 6),
(1457, 207, 'Kedvezményes adó', 7),
(1459, 208, 'Számlaszám', 1),
(1460, 208, 'Számlaszám', 2),
(1461, 208, 'Számlaszám', 3),
(1462, 208, 'Számlaszám', 4),
(1463, 208, 'Számlaszám', 5),
(1464, 208, 'Számlaszám', 6),
(1465, 208, 'Számlaszám', 7),
(1466, 209, 'Módosít', 1),
(1467, 209, 'Módosít', 2),
(1468, 209, 'Módosít', 3),
(1469, 209, 'Módosít', 4),
(1470, 209, 'Módosít', 5),
(1471, 209, 'Módosít', 6),
(1472, 209, 'Módosít', 7),
(1473, 210, 'Címek', 1),
(1474, 210, 'Címek', 2),
(1475, 210, 'Címek', 3),
(1476, 210, 'Címek', 4),
(1477, 210, 'Címek', 5),
(1478, 210, 'Címek', 6),
(1479, 210, 'Címek', 7),
(1480, 211, 'Elérhetőség', 1),
(1481, 211, 'Elérhetőség', 2),
(1482, 211, 'Elérhetőség', 3),
(1483, 211, 'Elérhetőség', 4),
(1484, 211, 'Elérhetőség', 5),
(1485, 211, 'Elérhetőség', 6),
(1486, 211, 'Elérhetőség', 7),
(1487, 212, 'Típus', 1),
(1488, 212, 'Típus', 2),
(1489, 212, 'Típus', 3),
(1490, 212, 'Típus', 4),
(1491, 212, 'Típus', 5),
(1492, 212, 'Típus', 6),
(1493, 212, 'Típus', 7),
(1494, 213, 'Ország azonosító', 1),
(1495, 213, 'Ország azonosító', 2),
(1496, 213, 'Ország azonosító', 3),
(1497, 213, 'Ország azonosító', 4),
(1498, 213, 'Ország azonosító', 5),
(1499, 213, 'Ország azonosító', 6),
(1500, 213, 'Ország azonosító', 7),
(1501, 214, 'Ország', 1),
(1502, 214, 'Ország', 2),
(1503, 214, 'Ország', 3),
(1504, 214, 'Ország', 4),
(1505, 214, 'Ország', 5),
(1506, 214, 'Ország', 6),
(1507, 214, 'Ország', 7),
(1508, 215, 'Zip kód', 1),
(1509, 215, 'Zip kód', 2),
(1510, 215, 'Zip kód', 3),
(1511, 215, 'Zip kód', 4),
(1512, 215, 'Zip kód', 5),
(1513, 215, 'Zip kód', 6),
(1514, 215, 'Zip kód', 7),
(1516, 216, 'Körzet', 1),
(1517, 216, 'Körzet', 2),
(1518, 216, 'Körzet', 3),
(1519, 216, 'Körzet', 4),
(1520, 216, 'Körzet', 5),
(1521, 216, 'Körzet', 6),
(1522, 216, 'Körzet', 7),
(1524, 217, 'Közterület neve', 1),
(1525, 217, 'Közterület neve', 2),
(1526, 217, 'Közterület neve', 3),
(1527, 217, 'Közterület neve', 4),
(1528, 217, 'Közterület neve', 5),
(1529, 217, 'Közterület neve', 6),
(1530, 217, 'Közterület neve', 7),
(1531, 218, 'Szám', 1),
(1532, 218, 'Szám', 2),
(1533, 218, 'Szám', 3),
(1534, 218, 'Szám', 4),
(1535, 218, 'Szám', 5),
(1536, 218, 'Szám', 6),
(1537, 218, 'Szám', 7),
(1538, 219, 'Lépcsőház', 1),
(1539, 219, 'Lépcsőház', 2),
(1540, 219, 'Lépcsőház', 3),
(1541, 219, 'Lépcsőház', 4),
(1542, 219, 'Lépcsőház', 5),
(1543, 219, 'Lépcsőház', 6),
(1544, 219, 'Lépcsőház', 7),
(1545, 220, 'Bővebben', 1),
(1546, 220, 'Bővebben', 2),
(1547, 220, 'Bővebben', 3),
(1548, 220, 'Bővebben', 4),
(1549, 220, 'Bővebben', 5),
(1550, 220, 'Bővebben', 6),
(1551, 220, 'Bővebben', 7),
(1552, 221, 'Címadat', 1),
(1553, 221, 'Címadat', 2),
(1554, 221, 'Címadat', 3),
(1555, 221, 'Címadat', 4),
(1556, 221, 'Címadat', 5),
(1557, 221, 'Címadat', 6),
(1558, 221, 'Címadat', 7),
(1559, 222, 'Középső név', 1),
(1560, 222, 'Középső név', 2),
(1561, 222, 'Középső név', 3),
(1562, 222, 'Középső név', 4),
(1563, 222, 'Középső név', 5),
(1564, 222, 'Középső név', 6),
(1565, 222, 'Középső név', 7),
(1566, 223, 'Munkaköri azonosító', 1),
(1567, 223, 'Munkaköri azonosító', 2),
(1568, 223, 'Munkaköri azonosító', 3),
(1569, 223, 'Munkaköri azonosító', 4),
(1570, 223, 'Munkaköri azonosító', 5),
(1571, 223, 'Munkaköri azonosító', 6),
(1572, 223, 'Munkaköri azonosító', 7),
(1573, 224, 'Partner azonosító', 1),
(1574, 224, 'Partner azonosító', 2),
(1575, 224, 'Partner azonosító', 3),
(1576, 224, 'Partner azonosító', 4),
(1577, 224, 'Partner azonosító', 5),
(1578, 224, 'Partner azonosító', 6),
(1579, 224, 'Partner azonosító', 7),
(1581, 225, 'Mobiltelefonszám', 1),
(1582, 225, 'Mobiltelefonszám', 2),
(1583, 225, 'Mobiltelefonszám', 3),
(1584, 225, 'Mobiltelefonszám', 4),
(1585, 225, 'Mobiltelefonszám', 5),
(1586, 225, 'Mobiltelefonszám', 6),
(1587, 225, 'Mobiltelefonszám', 7),
(1588, 226, 'Áfakulcs', 1),
(1589, 226, 'Áfakulcs', 2),
(1590, 226, 'Áfakulcs', 3),
(1591, 226, 'Áfakulcs', 4),
(1592, 226, 'Áfakulcs', 5),
(1593, 226, 'Áfakulcs', 6),
(1594, 226, 'Áfakulcs', 7),
(1595, 227, 'Áfamentes', 1),
(1596, 228, 'Fordított adó', 1),
(1597, 229, 'Azonosító', 1),
(1598, 230, 'Árfolyam', 1),
(1599, 231, 'Kerekítés', 1),
(1601, 232, 'Tizedesjegy', 1),
(1602, 233, 'Végkerekítés', 1),
(1603, 234, 'Törölt', 1),
(1604, 235, 'Törlő dolgozó', 1),
(1605, 236, 'Törlés dátuma', 1),
(1606, 237, 'Módosító dolgozó azonosító', 1),
(1607, 238, 'Módosítás dátuma', 1),
(1608, 239, 'Jel', 1),
(1609, 240, 'Cikkszám', 1),
(1610, 241, 'Mennyiségi egység azonosító', 1),
(1611, 242, 'Minimum mennyiség figyelés raktáron', 1),
(1612, 243, 'Aktuális beszerzési ár', 1),
(1613, 244, 'Deviza', 1),
(1614, 245, 'Eladási mennyiségi egység', 1),
(1615, 246, 'Mennyiségi váltószám', 1),
(1616, 247, 'Készletezhető', 1),
(1617, 248, 'Beszerezhető', 1),
(1618, 249, 'Eladható', 1),
(1619, 250, 'Pénztárgép név', 1),
(1620, 251, 'Árlistás ár', 1),
(1621, 252, 'Sorszámkezelés', 1),
(1622, 253, 'Sorszám kezelés típus azonosító', 1),
(1623, 254, 'Kiszerelési egység', 1),
(1624, 255, 'Nyomtatványtípus', 1),
(1625, 256, 'Tömeg', 1),
(1626, 257, 'Csomagolási egység', 1),
(1627, 258, 'Webes', 1),
(1628, 259, 'Web akció', 1),
(1629, 260, 'Árat frissíteni', 1),
(1630, 261, 'Maximális készlet', 1),
(1631, 262, 'Létrehozás dátuma', 1),
(1632, 263, 'Vonalkód', 1),
(1633, 264, 'Sorozatszám', 1),
(1634, 265, 'Aktív-e', 1);
INSERT INTO `translate_lang` (`id`, `translate_id`, `text`, `lang_id`) VALUES
(1635, 266, 'Beszerzési hosszúság', 1),
(1636, 267, 'Beszerzési szélesség', 1),
(1637, 268, 'Beszerzési magasság', 1),
(1638, 269, 'Beszerzési térfogat', 1),
(1639, 270, 'Beszerzési súly', 1),
(1640, 271, 'Eladási hosszúság', 1),
(1641, 272, 'Eladási szélesség', 1),
(1642, 273, 'Eladási magasság', 1),
(1643, 274, 'Eladási térfogat', 1),
(1644, 275, 'Eladási súly', 1),
(1645, 276, 'Eladási egység azonosítója', 1),
(1646, 277, 'Eladási egység mennyisége', 1),
(1647, 278, 'Eladási csomagolás azonosító', 1),
(1648, 279, 'Eladási csomagolás mennyisége', 1),
(1649, 280, 'Raktárankénti Min-Max kezelés', 1),
(1650, 281, 'Minimális rendelési mennyiség', 1),
(1651, 282, 'Rendelés Átfutási idő', 1),
(1652, 283, 'Rendelés Tűrési idő', 1),
(1653, 284, 'Beszerzési metódus', 1),
(1654, 285, 'Gyártás során alkatrészek készletkiadási módszere', 1),
(1655, 286, 'Web lista sorszám', 1),
(1656, 287, 'Cikktörzsadat', 1),
(1657, 288, 'Készlet', 1),
(1658, 289, 'Mennyiségi egység', 1),
(1659, 290, 'Valuta', 1),
(1660, 291, 'Csomagolás', 1),
(1661, 292, 'Sorozat', 1),
(1662, 293, 'Vámtarifaszám', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vtsz`
--

CREATE TABLE `vtsz` (
  `id` int(11) NOT NULL,
  `vtsz` varchar(20) NOT NULL,
  `vat` decimal(9,6) NOT NULL,
  `vat_free` tinyint(1) NOT NULL,
  `reverse_vat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `vtsz`
--

INSERT INTO `vtsz` (`id`, `vtsz`, `vat`, `vat_free`, `reverse_vat`) VALUES
(1, 'áfa', '3.200000', 1, 0),
(2, 'ifa', '8.300000', 1, 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `amount`
--
ALTER TABLE `amount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A tábla indexei `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id1`);

--
-- A tábla indexei `company_data`
--
ALTER TABLE `company_data`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A tábla indexei `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- A tábla indexei `exception`
--
ALTER TABLE `exception`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`unique_name`);

--
-- A tábla indexei `exception_lang`
--
ALTER TABLE `exception_lang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lang_id` (`lang_id`,`exception_id`),
  ADD KEY `fk_exception_lang_exception_id` (`exception_id`);

--
-- A tábla indexei `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_vtsz` (`vtsz`),
  ADD KEY `fk_amount_id` (`amount_id`),
  ADD KEY `fk_currency_id` (`currency_id`),
  ADD KEY `fk_sold_amount` (`sold_amount`),
  ADD KEY `fk_series_type_id` (`series_type_id`),
  ADD KEY `fk_delete_user_id` (`delete_user_id`),
  ADD KEY `fk_update_user_id` (`update_user_id`),
  ADD KEY `fk_sales_unit_id` (`sales_unit_id`),
  ADD KEY `fk_sales_packing_id` (`sales_packing_id`);

--
-- A tábla indexei `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delete_user` (`delete_user`);

--
-- A tábla indexei `partner_address`
--
ALTER TABLE `partner_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- A tábla indexei `partner_contact`
--
ALTER TABLE `partner_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_address_id` (`partner_id`);

--
-- A tábla indexei `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `property_values`
--
ALTER TABLE `property_values`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `series_type`
--
ALTER TABLE `series_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkd_series_type` (`delete_user_id`),
  ADD KEY `fku_series_type` (`update_user_id`);

--
-- A tábla indexei `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`unique_name`);

--
-- A tábla indexei `translate_lang`
--
ALTER TABLE `translate_lang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translate_id` (`translate_id`,`lang_id`),
  ADD UNIQUE KEY `translate_id_2` (`translate_id`,`lang_id`);

--
-- A tábla indexei `vtsz`
--
ALTER TABLE `vtsz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vtsz` (`vtsz`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `amount`
--
ALTER TABLE `amount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT a táblához `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id1` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `company_data`
--
ALTER TABLE `company_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT a táblához `employer`
--
ALTER TABLE `employer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT a táblához `exception`
--
ALTER TABLE `exception`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT a táblához `exception_lang`
--
ALTER TABLE `exception_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT a táblához `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT a táblához `lang`
--
ALTER TABLE `lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT a táblához `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT a táblához `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT a táblához `partner_address`
--
ALTER TABLE `partner_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT a táblához `partner_contact`
--
ALTER TABLE `partner_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT a táblához `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `property_values`
--
ALTER TABLE `property_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT a táblához `series_type`
--
ALTER TABLE `series_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT a táblához `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;
--
-- AUTO_INCREMENT a táblához `translate_lang`
--
ALTER TABLE `translate_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1663;
--
-- AUTO_INCREMENT a táblához `vtsz`
--
ALTER TABLE `vtsz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `exception_lang`
--
ALTER TABLE `exception_lang`
  ADD CONSTRAINT `fk_exception_lang_exception_id` FOREIGN KEY (`exception_id`) REFERENCES `exception` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_exception_lang_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk_amount_id` FOREIGN KEY (`amount_id`) REFERENCES `amount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_delete_user_id` FOREIGN KEY (`delete_user_id`) REFERENCES `employer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sales_packing_id` FOREIGN KEY (`sales_packing_id`) REFERENCES `package` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sales_unit_id` FOREIGN KEY (`sales_unit_id`) REFERENCES `package` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_series_type_id` FOREIGN KEY (`series_type_id`) REFERENCES `series_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sold_amount` FOREIGN KEY (`sold_amount`) REFERENCES `amount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_update_user_id` FOREIGN KEY (`update_user_id`) REFERENCES `employer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vtsz` FOREIGN KEY (`vtsz`) REFERENCES `vtsz` (`vtsz`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `series_type`
--
ALTER TABLE `series_type`
  ADD CONSTRAINT `fkd_series_type` FOREIGN KEY (`delete_user_id`) REFERENCES `employer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fku_series_type` FOREIGN KEY (`update_user_id`) REFERENCES `employer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `translate_lang`
--
ALTER TABLE `translate_lang`
  ADD CONSTRAINT `fmm_translate_lang_translate_id` FOREIGN KEY (`translate_id`) REFERENCES `translate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
