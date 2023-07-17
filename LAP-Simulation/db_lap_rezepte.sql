-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 30. Jul 2020 um 16:14
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_lap_rezepte`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_einheiten`
--

CREATE TABLE `tbl_einheiten` (
  `IDEinheit` int(10) UNSIGNED NOT NULL,
  `Bezeichnung` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_einheiten`
--

INSERT INTO `tbl_einheiten` (`IDEinheit`, `Bezeichnung`) VALUES
(6, 'Dose'),
(3, 'EL'),
(1, 'g'),
(2, 'ml'),
(4, 'Prise'),
(8, 'Saft von'),
(7, 'Spritzer'),
(9, 'Stk.'),
(5, 'TL');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_rezepte`
--

CREATE TABLE `tbl_rezepte` (
  `IDRezept` int(10) UNSIGNED NOT NULL,
  `Titel` varchar(128) NOT NULL,
  `Beschreibung` text DEFAULT NULL,
  `DauerVorbereitung` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `DauerZubereitung` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `DauerRuhen` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `Titelbild` varchar(255) DEFAULT NULL,
  `AnzahlPersonen` tinyint(3) UNSIGNED NOT NULL,
  `FIDUser` int(10) UNSIGNED NOT NULL,
  `FIDSchwierigkeitsgrad` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_rezepte`
--

INSERT INTO `tbl_rezepte` (`IDRezept`, `Titel`, `Beschreibung`, `DauerVorbereitung`, `DauerZubereitung`, `DauerRuhen`, `Titelbild`, `AnzahlPersonen`, `FIDUser`, `FIDSchwierigkeitsgrad`) VALUES
(1, 'Cashew-Ricotta', NULL, 480, 30, 120, NULL, 2, 1, 1),
(2, 'Veganer Parmesan', NULL, 0, 20, 0, NULL, 4, 3, 1),
(3, 'Veganer Mozzarella (schnittfest)', NULL, 480, 5, 240, NULL, 4, 1, 1),
(4, 'Veganer Mozzarella (zum Überbacken)', NULL, 480, 10, 0, NULL, 4, 2, 1),
(5, 'Nussmus', NULL, 480, 15, 0, NULL, 4, 4, 1),
(6, 'Nussmilch', 'Mit optionalen Zutaten für ein anderes Aroma.', 480, 10, 0, NULL, 1, 1, 2),
(7, 'Schnelle Nussmilch', NULL, 0, 3, 0, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_rezepte_zutaten`
--

CREATE TABLE `tbl_rezepte_zutaten` (
  `IDRezeptZutat` int(10) UNSIGNED NOT NULL,
  `FIDRezept` int(10) UNSIGNED NOT NULL,
  `Anzahl` double(5,2) UNSIGNED NOT NULL,
  `FIDEinheit` int(10) UNSIGNED DEFAULT NULL,
  `FIDZutat` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_rezepte_zutaten`
--

INSERT INTO `tbl_rezepte_zutaten` (`IDRezeptZutat`, `FIDRezept`, `Anzahl`, `FIDEinheit`, `FIDZutat`) VALUES
(28, 1, 250.00, 1, 1),
(29, 1, 50.00, NULL, 3),
(30, 1, 1.00, 8, 4),
(31, 1, 1.00, NULL, 5),
(32, 1, 1.00, 4, 6),
(33, 1, 2.50, 3, 7),
(34, 1, 1.00, NULL, 8),
(35, 1, 1.00, NULL, 9),
(36, 2, 50.00, 1, 1),
(37, 2, 30.00, 1, 10),
(38, 2, 40.00, 1, 7),
(39, 2, 1.00, 5, 8),
(40, 2, 1.00, 5, 17),
(41, 3, 60.00, 1, 1),
(42, 3, 150.00, 2, 11),
(43, 3, 2.00, 3, 12),
(44, 3, 1.00, 3, 17),
(45, 3, 1.00, 3, 7),
(46, 4, 150.00, 1, 1),
(47, 4, 250.00, 2, 18),
(48, 4, 3.00, 3, 13),
(49, 4, 2.00, 3, 7),
(50, 4, 1.00, 5, 17),
(51, 4, 0.50, 5, 8),
(52, 4, 0.50, 5, 14),
(53, 4, 0.25, 5, 15),
(54, 5, 250.00, 1, 16),
(55, 6, 300.00, 1, 16),
(56, 6, 500.00, 2, 3),
(57, 6, 1.00, 4, 19),
(58, 6, 1.00, 5, 20),
(59, 6, 1.00, 5, 21),
(60, 6, 1.00, 5, 22),
(61, 6, 1.00, 5, 23),
(62, 6, 1.00, NULL, 24),
(63, 6, 1.00, NULL, 25),
(64, 6, 1.00, NULL, 26),
(65, 6, 1.00, NULL, 27),
(66, 6, 1.00, NULL, 28),
(67, 7, 2.50, 3, 29),
(68, 7, 200.00, 2, 30),
(69, 7, 1.00, 9, 31);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_schwierigkeitsgrade`
--

CREATE TABLE `tbl_schwierigkeitsgrade` (
  `IDSchwierigkeitsgrad` int(10) UNSIGNED NOT NULL,
  `Titel` varchar(32) NOT NULL,
  `Beschreibung` text NOT NULL,
  `Reihenfolge` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_schwierigkeitsgrade`
--

INSERT INTO `tbl_schwierigkeitsgrade` (`IDSchwierigkeitsgrad`, `Titel`, `Beschreibung`, `Reihenfolge`) VALUES
(1, 'Einfach', 'Ohne Probleme zu bewältigen', 1),
(2, 'Mittel', 'Mit etwas Aufwand verbunden', 2),
(3, 'Schwierig', 'Einiges an Arbeit zu erledigen', 3),
(4, 'Sehr schwierig', 'Da muss man sich schon ins Zeug werfen!', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_user`
--

CREATE TABLE `tbl_user` (
  `IDUser` int(10) UNSIGNED NOT NULL,
  `Vorname` varchar(32) NOT NULL,
  `Nachname` varchar(64) NOT NULL,
  `Emailadresse` varchar(128) NOT NULL,
  `Passwort` varchar(255) NOT NULL,
  `Adresse` varchar(64) NOT NULL,
  `PLZ` smallint(4) UNSIGNED NOT NULL,
  `Ort` varchar(64) NOT NULL,
  `GebDatum` date DEFAULT NULL,
  `Kommentar` text DEFAULT NULL,
  `Profilbild` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_user`
--

INSERT INTO `tbl_user` (`IDUser`, `Vorname`, `Nachname`, `Emailadresse`, `Passwort`, `Adresse`, `PLZ`, `Ort`, `GebDatum`, `Kommentar`, `Profilbild`) VALUES
(1, 'Uwe', 'Mutz', 'uwe.mutz@syne.at', 'test123', 'Mozartstr. 1', 4020, 'Linz', '1972-10-17', NULL, NULL),
(2, 'Uwe', 'Seeler', 'uwe.seeler@hsv.de', 'test456', 'Adamstr. 23', 4600, 'Wels', NULL, NULL, NULL),
(3, 'Silvia', 'Mutz', 'silvia.mutz@syne.at', 'test789', 'Mozartstr. 1', 4020, 'Linz', '1978-05-02', 'Köchin des Jahres', NULL),
(4, 'Herbert', 'Mairhofer', 'hm@hm1.com', 'test012', 'Eggenweg 19', 4053, 'Haid', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_zubereitungsschritte`
--

CREATE TABLE `tbl_zubereitungsschritte` (
  `IDZubereitungsschritt` int(10) UNSIGNED NOT NULL,
  `FIDRezept` int(10) UNSIGNED NOT NULL,
  `Titel` varchar(64) DEFAULT NULL,
  `Beschreibung` text NOT NULL,
  `Reihenfolge` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_zubereitungsschritte`
--

INSERT INTO `tbl_zubereitungsschritte` (`IDZubereitungsschritt`, `FIDRezept`, `Titel`, `Beschreibung`, `Reihenfolge`) VALUES
(1, 1, NULL, 'Cashewkerne über Nacht in ausreichend Wasser einweichen.', 1),
(2, 1, NULL, 'Einweichwasser abgießen und die Cashews dann mit den restlichen Zutaten in den Hochleistungsmixer geben und so lange pürieren, bis eine cremige Masse entstanden ist.', 2),
(3, 1, NULL, 'Anschließend mit Salz und Pfeffer abschmecken und für eine bessere Konsistenz 1-2 Stunden in den Kühlschrank stellen.', 3),
(4, 1, NULL, 'Falls die Masse anschließend zu fest sein sollte, einfach einen Spritzer Wasser unterrühren.', 4),
(5, 2, NULL, 'Alle Zutaten, bis auf den Zitronensaft, in den Hochleistungsmixer geben und fein zerkleinern.', 1),
(6, 2, NULL, 'Dann den Zitronensaft unterrühren und anschließend ca. 10-15 Minuten trocknen lassen.', 2),
(7, 2, NULL, 'Den Parmesan in ein Glas mit Verschluss füllen und im Kühlschrank lagern. Er ist ca. 14 Tage gekühlt haltbar.', 3),
(8, 3, NULL, 'Die Cashewkerne über Nacht in ausreichend Wasser einweichen.', 1),
(9, 3, NULL, 'Einweichwasser abgießen und die eingeweichten Cashews mit den restlichen Zutaten in den Hochleistungsmixer geben und fein pürieren, bis eine glatte Masse entsteht.', 2),
(10, 3, NULL, 'In eine kleine Schüssel (oder eine beliebige Form) füllen und mindestens vier Stunden im Kühlschrank fest werden lassen.', 3),
(11, 4, NULL, 'Die Cashewkerne über Nacht in ausreichend Wasser einweichen.', 1),
(12, 4, NULL, 'Einweichwasser abgießen und die Cashews mit den restlichen Zutaten in den Hochleistungsmixer geben. Fein pürieren, bis eine glatte Masse entsteht.', 2),
(13, 4, NULL, 'In einem kleinen hohen Topf bei mittlerer Hitze ca. 5 Minuten köcheln, dabei kontinuierlich rühren, bis die Masse eine käsige Konsistenz hat. Anschließend noche ine weitere Minute köcheln lassen.', 3),
(14, 5, NULL, 'Nüsse über Nacht in ausreichend Wasser einweichen.', 1),
(15, 5, NULL, 'Einweichwasser abgießen und die eingeweichten Nüsse nun entweder direkt in den Hochleistungsmixer geben und cremig pürieren (ab Schritt 4) oder vorher noch im Ofen rösten, um ihnen ein zusätzliches Aroma zu verleihen.', 2),
(16, 5, NULL, 'Um sie zu rösten, die Nüsse auf ein mit Backpapier ausgelegtes Backblech verteilen und im vorgeheizten Backofen auf der mittleren Schiene bei 160°C Umluft (oder 180°C Ober- und Unterhitze) für ca. 10 Minuten rösten. Anschließend etwas abkühlen lassen.', 3),
(17, 5, NULL, 'Die Nüsse dann in den Hochleistungsmixer geben und zunächst mit der Impulsfunktion zerkleinern. Dann so lange normal weitermixen, bis eine cremige Masse entsteht. Dabei den Mixer zwischendurch anhalten, um die Nussmasse von den Seiten abzuschaben.', 4),
(18, 5, NULL, 'Das Nussmus in ein Glas mit Verschluss füllen und fest verschlossen im Kühlschrank lagern.', 5),
(19, 6, NULL, 'Nüsse über Nacht in ausreichend Wasser einweichen.', 1),
(20, 6, NULL, 'Einweichwasser abgießen und Nüsse zusammen mit dem lauwarmen Wasser und Meersalz in den Mixer geben. Ca. eine Minute mixen, bis eine homogene Flüssigkeit entsteht. Dann die Milch eine Stunde in den Kühlschrank stellen und abkühlen lassen. So wird die Konsistenz etwas cremiger.', 2),
(21, 6, NULL, 'Anschließend die Milch durch ein feines Sieb in einen Behälter füllen.', 3),
(22, 6, NULL, 'Die filtrierte Milch noch einmal in den Mixer geben und gegebenenfalls Süßungsmittel oder Aroma hinzufügen.', 4),
(23, 6, NULL, 'Danach in einem verschließbaren Behälter füllen. Die Milch hält sich drei bis vier Tage im Kühlschrank. Vor dem Verzehr bitte gut schütteln!', 5),
(24, 7, NULL, 'Wasser, Nussmus und Süßungsmittel mit einem Pürierstab so lange mixen, bis eine glatte Masse entsteht.', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_zutaten`
--

CREATE TABLE `tbl_zutaten` (
  `IDZutat` int(10) UNSIGNED NOT NULL,
  `Bezeichnung` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_zutaten`
--

INSERT INTO `tbl_zutaten` (`IDZutat`, `Bezeichnung`) VALUES
(21, 'Agavensirup'),
(20, 'Ahornsirup'),
(28, 'Bananen'),
(2, 'blanchierte Mandeln'),
(1, 'Cashewkerne'),
(31, 'Datteln'),
(27, 'Erdbeeren'),
(12, 'Flohsamenschalen gemahlen'),
(7, 'Hefeflocken'),
(25, 'Kakaopulver'),
(14, 'Knoblauchpulver'),
(5, 'Knoblauchzehe'),
(30, 'Leitungswasser'),
(18, 'Mandelmilch ungesüßt'),
(10, 'Mandeln'),
(19, 'Meersalz'),
(11, 'Milch (pflanzlich)'),
(16, 'Nüsse'),
(29, 'Nussmus'),
(15, 'Paprikapulver geräuchert'),
(9, 'Pfeffer'),
(22, 'Reissirup braun'),
(8, 'Salz'),
(23, 'Stevia'),
(13, 'Tapiokastärke'),
(24, 'Vanille'),
(3, 'Wasser'),
(26, 'Zimt gemahlen'),
(4, 'Zitrone'),
(17, 'Zitronensaft'),
(6, 'Zwiebelpulver');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_einheiten`
--
ALTER TABLE `tbl_einheiten`
  ADD PRIMARY KEY (`IDEinheit`),
  ADD UNIQUE KEY `Bezeichnung` (`Bezeichnung`);

--
-- Indizes für die Tabelle `tbl_rezepte`
--
ALTER TABLE `tbl_rezepte`
  ADD PRIMARY KEY (`IDRezept`),
  ADD KEY `FIDUser` (`FIDUser`),
  ADD KEY `FIDSchwierigkeitsgrad` (`FIDSchwierigkeitsgrad`);

--
-- Indizes für die Tabelle `tbl_rezepte_zutaten`
--
ALTER TABLE `tbl_rezepte_zutaten`
  ADD PRIMARY KEY (`IDRezeptZutat`),
  ADD KEY `FIDRezept` (`FIDRezept`),
  ADD KEY `FIDEinheit` (`FIDEinheit`),
  ADD KEY `FIDZutat` (`FIDZutat`);

--
-- Indizes für die Tabelle `tbl_schwierigkeitsgrade`
--
ALTER TABLE `tbl_schwierigkeitsgrade`
  ADD PRIMARY KEY (`IDSchwierigkeitsgrad`);

--
-- Indizes für die Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`IDUser`),
  ADD UNIQUE KEY `Emailadresse` (`Emailadresse`);

--
-- Indizes für die Tabelle `tbl_zubereitungsschritte`
--
ALTER TABLE `tbl_zubereitungsschritte`
  ADD PRIMARY KEY (`IDZubereitungsschritt`),
  ADD KEY `FIDRezept` (`FIDRezept`);

--
-- Indizes für die Tabelle `tbl_zutaten`
--
ALTER TABLE `tbl_zutaten`
  ADD PRIMARY KEY (`IDZutat`),
  ADD UNIQUE KEY `Bezeichnung` (`Bezeichnung`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_einheiten`
--
ALTER TABLE `tbl_einheiten`
  MODIFY `IDEinheit` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `tbl_rezepte`
--
ALTER TABLE `tbl_rezepte`
  MODIFY `IDRezept` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `tbl_rezepte_zutaten`
--
ALTER TABLE `tbl_rezepte_zutaten`
  MODIFY `IDRezeptZutat` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT für Tabelle `tbl_schwierigkeitsgrade`
--
ALTER TABLE `tbl_schwierigkeitsgrade`
  MODIFY `IDSchwierigkeitsgrad` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `IDUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `tbl_zubereitungsschritte`
--
ALTER TABLE `tbl_zubereitungsschritte`
  MODIFY `IDZubereitungsschritt` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `tbl_zutaten`
--
ALTER TABLE `tbl_zutaten`
  MODIFY `IDZutat` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_rezepte`
--
ALTER TABLE `tbl_rezepte`
  ADD CONSTRAINT `tbl_rezepte_ibfk_1` FOREIGN KEY (`FIDSchwierigkeitsgrad`) REFERENCES `tbl_schwierigkeitsgrade` (`IDSchwierigkeitsgrad`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_rezepte_ibfk_2` FOREIGN KEY (`FIDUser`) REFERENCES `tbl_user` (`IDUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_rezepte_zutaten`
--
ALTER TABLE `tbl_rezepte_zutaten`
  ADD CONSTRAINT `tbl_rezepte_zutaten_ibfk_1` FOREIGN KEY (`FIDEinheit`) REFERENCES `tbl_einheiten` (`IDEinheit`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_rezepte_zutaten_ibfk_2` FOREIGN KEY (`FIDRezept`) REFERENCES `tbl_rezepte` (`IDRezept`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_rezepte_zutaten_ibfk_3` FOREIGN KEY (`FIDZutat`) REFERENCES `tbl_zutaten` (`IDZutat`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_zubereitungsschritte`
--
ALTER TABLE `tbl_zubereitungsschritte`
  ADD CONSTRAINT `tbl_zubereitungsschritte_ibfk_1` FOREIGN KEY (`FIDRezept`) REFERENCES `tbl_rezepte` (`IDRezept`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
