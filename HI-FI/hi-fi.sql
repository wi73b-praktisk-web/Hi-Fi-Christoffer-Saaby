-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Vært: 127.0.0.1
-- Genereringstid: 21. 12 2017 kl. 12:52:51
-- Serverversion: 5.6.24
-- PHP-version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hi-fi`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `accestokens`
--

CREATE TABLE IF NOT EXISTS `accestokens` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `token` varchar(600) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `accestokens`
--

INSERT INTO `accestokens` (`id`, `userid`, `token`, `created`) VALUES
(1, 1, '6046b786d97f8fff54f76debae75aad5875277a59a9e7743c2baa040db07e2af09b7dd98df6486ad9ada831c092bef0d206ee89feee1859257e8725f9efe9cb840c8d2182151cb5d69d059906a083bfe3e7d808565ab40c51dc0dea58cedff14c4c584e8713562617bbfe51b82e5c36c09e488146ba2780839f82d4eaa4731d9707169393b1fcd77270d61b17af10ac44d0379bf32385d08803f772be6dd4da5b7c2dce89df54d242ec942b3eb3a3440ec4da7b543127e5b6e0d875fa3849661857f78e08592da783bf0da87213b0867642fc2f57eb883bc381248e61c3bb3c87f87675a8955f2a7380b31756c500cfdba43b71fe50c8644d568f0cc79b3a903', '2017-11-09 12:40:23'),
(2, 1, 'f7fc94c3836b55725ccc89a56e9fe7f1b9925c83ae516e59ffa3d8d4127690a844ed8a6f5adeb8678d55a39e5ff0dfaff2704f6d2e8c9fffa9b893dd57f0b49c6ac4aa74158c6d567be4bd8126fc40689138951b60cde5cf5545e9d6787a86f5fcd1173e9acc7e8488b464b251adbfd9d7418b2d952b5ddc931b2de14736260b001d474ecb60dcffdbac16ce35539e15c3265e1e07c562db46255d4c76c7f444756058af589a763591138a5b9294fd7e158d4b3a287308cee6593d125a6a4976bd4385ceff102b105e2cb88d98337b5095cadb70dfb32afd8ba1efde5ef1f7df5a2efafb516043132c23a972f51039fe79266c6d1588f82cdced4923da5ac124', '2017-11-09 12:41:37'),
(3, 1, '50d290bb27c8fba6898d48822f99d24217b0124a0646afc72d852c2ddc267c29cd5deb8fe3c099c8451e2199014113759ea6892a77e650b14d06e34ec0b0536a442416f1eb752688a15b509594b725d48a1b1a29b33c2d83e98d0070338ae0d888d9db704399bd088b6eaefafe3a1948d010587de9991d0338604fd6fff40a6b43c6e916a1e639119a7db4167ebc3f13304afd2a43c86e734a4956254dd6b8453287e36f66ff6cc5e5effa59977684d52497ae163394720ed3cbf0ee954e1628589b6663ec2b81cf724ba7c6bf13e7c33fc78e18251976fd89a4c54c2ecbb7520c079798487c14acb9109c3912af1493440f28873ff509ca284dbf1cf1464bf0', '2017-12-20 09:06:45'),
(4, 1, 'ae343c13166b672e0aef116a954516416844ba38b093eb7a70a6e822adb034165a9ae4c1be01a40d006901996b1273e3d8d20da9e4ef1ae7c25654ab60c45c128d07103b4de81fdaf543ce6e430579c24a7aebceeb7b6b908a00cb8f601d55751d39e87b0c4edd6f6332a46948f0d5363126ebd34b1f50f3776c8c0dd1aad4ffb6adefca84122e0ce1c4e96f847edc01576cca115f1521cfd817e0364d5f12dac18b3c5de3263063eb48db952661a0c87967da8f0a3d5a888418a301b2dcbe9a6244c776e6b0f1f46d20f8fc15e4eb6eb4d90dc30b660916429f9f203423d435466277adb2997dbe48443b311a74127f771154402fde7c805974f2400423070f', '2017-12-20 09:06:46');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bruger`
--

CREATE TABLE IF NOT EXISTS `bruger` (
  `id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `bruger`
--

INSERT INTO `bruger` (`id`, `username`, `password`, `email`) VALUES
(1, 'admin', 'sha1$804cf862$1$115c440807b35e4aa428c3935a90c0dd684432f8', 'admin@admin.dk'),
(2, 'ChristofferSaaby', 'sha1$804cf862$1$115c440807b35e4aa428c3935a90c0dd684432f8', 'Madman1@live.dk'),
(3, 'MartinLaursen', 'sha1$804cf862$1$115c440807b35e4aa428c3935a90c0dd684432f8', 'martin@gmail.com');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vare`
--

CREATE TABLE IF NOT EXISTS `vare` (
  `id` int(12) NOT NULL,
  `varenavn` varchar(50) NOT NULL,
  `pris` decimal(10,2) NOT NULL,
  `gruppe` int(10) NOT NULL,
  `varenummer` int(22) NOT NULL,
  `billed` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `vare`
--

INSERT INTO `vare` (`id`, `varenavn`, `pris`, `gruppe`, `varenummer`, `billed`) VALUES
(1, 'B&W 700Series', '1000.00', 5, 5000, 'Hoojtaler.jpg'),
(2, 'Huawei Mate 9 Porsche', '11999.00', 9, 9000, 'Telefon.jpg'),
(3, 'Philips Mikroanlæg', '1999.00', 1, 1000, 'CD_afspiller.jpg'),
(4, 'Sony 4K UHD Blu-ray', '1299.00', 2, 2000, 'DVD_afspiller.jpg'),
(5, 'Marantz MM7025 ', '6000.00', 3, 3000, 'Effektforstaerker.jpg'),
(6, 'Bose Lifestyle SA-3', '599.00', 4, 4000, 'Forstaerker.jpg'),
(7, 'Pioneer Pl-30-K', '7499.00', 6, 6000, 'Pladespiller.jpg'),
(8, 'Samsung 82" 4K Smart TV ', '39999.00', 7, 7000, 'Fladskraeme.png'),
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

CREATE TABLE IF NOT EXISTS `varegrupper` (
  `id` int(12) NOT NULL,
  `gruppe` varchar(20) NOT NULL,
  `billede` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `varegrupper`
--

INSERT INTO `varegrupper` (`id`, `gruppe`, `billede`) VALUES
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
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `User` (`username`);

--
-- Indeks for tabel `vare`
--
ALTER TABLE `vare`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `Varenavn` (`varenavn`);

--
-- Indeks for tabel `varegrupper`
--
ALTER TABLE `varegrupper`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `Gruppe` (`gruppe`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `accestokens`
--
ALTER TABLE `accestokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `bruger`
--
ALTER TABLE `bruger`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Tilføj AUTO_INCREMENT i tabel `vare`
--
ALTER TABLE `vare`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- Tilføj AUTO_INCREMENT i tabel `varegrupper`
--
ALTER TABLE `varegrupper`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
