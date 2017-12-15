-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 14. 12 2017 kl. 09:08:43
-- Serverversion: 10.1.26-MariaDB
-- PHP-version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hi-fi`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `accestokens`
--

CREATE TABLE `accestokens` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `token` varchar(600) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `accestokens`
--

INSERT INTO `accestokens` (`id`, `userid`, `token`, `created`) VALUES
(1, 1, '6046b786d97f8fff54f76debae75aad5875277a59a9e7743c2baa040db07e2af09b7dd98df6486ad9ada831c092bef0d206ee89feee1859257e8725f9efe9cb840c8d2182151cb5d69d059906a083bfe3e7d808565ab40c51dc0dea58cedff14c4c584e8713562617bbfe51b82e5c36c09e488146ba2780839f82d4eaa4731d9707169393b1fcd77270d61b17af10ac44d0379bf32385d08803f772be6dd4da5b7c2dce89df54d242ec942b3eb3a3440ec4da7b543127e5b6e0d875fa3849661857f78e08592da783bf0da87213b0867642fc2f57eb883bc381248e61c3bb3c87f87675a8955f2a7380b31756c500cfdba43b71fe50c8644d568f0cc79b3a903', '2017-11-09 12:40:23'),
(2, 1, 'f7fc94c3836b55725ccc89a56e9fe7f1b9925c83ae516e59ffa3d8d4127690a844ed8a6f5adeb8678d55a39e5ff0dfaff2704f6d2e8c9fffa9b893dd57f0b49c6ac4aa74158c6d567be4bd8126fc40689138951b60cde5cf5545e9d6787a86f5fcd1173e9acc7e8488b464b251adbfd9d7418b2d952b5ddc931b2de14736260b001d474ecb60dcffdbac16ce35539e15c3265e1e07c562db46255d4c76c7f444756058af589a763591138a5b9294fd7e158d4b3a287308cee6593d125a6a4976bd4385ceff102b105e2cb88d98337b5095cadb70dfb32afd8ba1efde5ef1f7df5a2efafb516043132c23a972f51039fe79266c6d1588f82cdced4923da5ac124', '2017-11-09 12:41:37');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bruger`
--

CREATE TABLE `bruger` (
  `Id` int(10) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `bruger`
--

INSERT INTO `bruger` (`Id`, `Username`, `Password`, `Email`) VALUES
(1, 'admin', 'sha1$804cf862$1$115c440807b35e4aa428c3935a90c0dd684432f8', 'admin@admin.dk'),
(2, 'ChristofferSaaby', 'christoffer123', 'Madman1@live.dk'),
(3, 'MartinLaursen', 'martin123', 'martin@gmail.com');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vare`
--

CREATE TABLE `vare` (
  `Id` int(12) NOT NULL,
  `Varenavn` varchar(50) NOT NULL,
  `Pris` decimal(10,2) NOT NULL,
  `Gruppe` int(10) NOT NULL,
  `Varenummer` int(22) NOT NULL,
  `Billed` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `vare`
--

INSERT INTO `vare` (`Id`, `Varenavn`, `Pris`, `Gruppe`, `Varenummer`, `Billed`) VALUES
(1, 'B&W 700Series', '1000.00', 5, 5000, 'Hoojtaler.jpg'),
(2, 'Huawei Mate 9 Porsche', '11999.00', 9, 9000, 'Telefon.jpg'),
(3, 'Philips Mikroanlæg', '1999.00', 1, 1000, 'CD_afspiller.jpg'),
(4, 'Sony 4K UHD Blu-ray', '1299.00', 2, 2000, 'DVD_afspiller.jpg'),
(5, 'Marantz MM7025 ', '6000.00', 3, 3000, 'Effektforstaerker.jpg'),
(6, 'Bose Lifestyle SA-3', '599.00', 4, 4000, 'Forstaerker.jpg'),
(7, 'Pioneer Pl-30-K', '7499.00', 6, 6000, 'Pladespiller.jpg'),
(8, 'Samsung 82\" 4K Smart TV ', '39999.00', 7, 7000, 'Fladskraeme.png'),
(9, 'MacBook Pro 15', '19337.00', 8, 8000, 'Macbook_pro.jpg'),
(10, 'Philips CD afspiller', '20.00', 1, 1001, 'cd-afspiller1.jpg'),
(11, 'B&O', '1200.00', 1, 1002, 'cd-afspiller2.jpg'),
(22, 'B&O1000', '2000.00', 2, 2001, 'dvd-afspiller1.jpg'),
(23, 'Fona 2000 DVD', '25.00', 2, 2002, 'dvd-afspiller2.jpg'),
(24, 'Effektforstærker2000', '400.00', 3, 3001, 'effektforstærkere1.jpg'),
(25, 'Effektforstærker1000', '300.00', 3, 3002, 'effektforstærkere2.jpg'),
(26, 'Forstærker1000', '300.00', 4, 4001, 'forstærkere1.jpg'),
(27, 'Forstærker2000', '500.00', 4, 4002, 'forstærkere2.jpg'),
(28, 'Højtaler1000', '700.00', 5, 5001, 'højtalere1.jpg'),
(29, 'Højtaler2000', '900.00', 5, 5002, 'højtalere.jpg'),
(30, 'Pladespiller1000', '400.00', 6, 6001, 'pladespiller1.jpg'),
(31, 'Pladespiller2000', '200.00', 6, 6002, 'pladespiller.jpg'),
(32, 'TV1000', '1200.00', 7, 7001, 'tv1.png'),
(33, 'TV2000', '2400.00', 7, 7002, 'tv2.jpg'),
(34, 'Computer1000', '4000.00', 8, 8001, 'computer1.jpg'),
(35, 'Computer2000', '3000.00', 8, 8002, 'computer2.jpg'),
(36, 'Telefon1000', '2000.00', 9, 9001, 'telefon1.jpg'),
(37, 'Telefon2000', '1250.00', 9, 9002, 'telefon2.jpg');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `varegrupper`
--

CREATE TABLE `varegrupper` (
  `Id` int(12) NOT NULL,
  `Gruppe` varchar(20) NOT NULL,
  `billede` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `varegrupper`
--

INSERT INTO `varegrupper` (`Id`, `Gruppe`, `billede`) VALUES
(1, 'CD Afspiller', 'cd-afspiller.jpg'),
(2, 'DVD Afspiller', 'dvd-afspiller.jpg'),
(3, 'Effektforstærkere', 'effektforstærker.jpg'),
(4, 'Forforstærkere', 'forstærker.jpg'),
(5, 'Højtalere', 'højtalere.jpg'),
(6, 'Pladespillere', 'pladespillere.jpg'),
(7, 'TV', 'tv.jpg'),
(8, 'Computer', 'computer.jpg'),
(9, 'Telefoner', 'telefoner.jpg');

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `accestokens`
--
ALTER TABLE `accestokens`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `bruger`
--
ALTER TABLE `bruger`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `User` (`Username`);

--
-- Indeks for tabel `vare`
--
ALTER TABLE `vare`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Varenavn` (`Varenavn`);

--
-- Indeks for tabel `varegrupper`
--
ALTER TABLE `varegrupper`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Gruppe` (`Gruppe`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `accestokens`
--
ALTER TABLE `accestokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Tilføj AUTO_INCREMENT i tabel `bruger`
--
ALTER TABLE `bruger`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Tilføj AUTO_INCREMENT i tabel `vare`
--
ALTER TABLE `vare`
  MODIFY `Id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- Tilføj AUTO_INCREMENT i tabel `varegrupper`
--
ALTER TABLE `varegrupper`
  MODIFY `Id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
