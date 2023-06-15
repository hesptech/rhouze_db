-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 14, 2023 alle 14:35
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `colposcopy_2023`
--



-- --------------------------------------------------------

--
-- Struttura della tabella `access_users`
--

CREATE TABLE `access_users` (
  `id_access` int(11) NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `date_access` datetime NOT NULL,
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `casi`
--

CREATE TABLE `casi` (
  `id_caso` int(10) UNSIGNED NOT NULL,
  `test` int(10) UNSIGNED NOT NULL,
  `num_caso` int(10) UNSIGNED NOT NULL,
  `soluzione_1` tinyint(3) UNSIGNED NOT NULL,
  `soluzione_2` tinyint(3) UNSIGNED NOT NULL,
  `soluzione_3` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `codici`
--

CREATE TABLE `codici` (
  `id_codice` int(10) UNSIGNED NOT NULL,
  `acc_cod` varchar(16) NOT NULL,
  `tipo` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppi`
--

CREATE TABLE `gruppi` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppi_codici`
--

CREATE TABLE `gruppi_codici` (
  `id_gruppo` int(11) NOT NULL,
  `id_codice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppi_tests`
--

CREATE TABLE `gruppi_tests` (
  `id_gruppo` int(11) NOT NULL,
  `id_test` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini`
--

CREATE TABLE `immagini` (
  `id_immagine` int(11) NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `nome_img` varchar(255) NOT NULL,
  `nome_thumb` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `larghezza` smallint(6) NOT NULL,
  `altezza` smallint(6) NOT NULL,
  `size` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT 'Immagine',
  `commento` text DEFAULT NULL,
  `risposta_1` tinyint(1) NOT NULL,
  `risposta_2` tinyint(1) NOT NULL,
  `risposta_3` tinyint(1) NOT NULL,
  `mapcode` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `risposte`
--

CREATE TABLE `risposte` (
  `id_risposta` int(10) UNSIGNED NOT NULL,
  `caso` int(10) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `risposta_1` tinyint(3) UNSIGNED NOT NULL,
  `risposta_2` tinyint(3) UNSIGNED NOT NULL,
  `risposta_3` tinyint(3) UNSIGNED NOT NULL,
  `risposta_bio` tinyint(3) UNSIGNED NOT NULL,
  `point` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `test`
--

CREATE TABLE `test` (
  `id_test` int(10) UNSIGNED NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `num_casi` smallint(5) UNSIGNED NOT NULL,
  `domanda_1` text NOT NULL,
  `domanda_2` text NOT NULL,
  `domanda_3` text NOT NULL,
  `attivo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `testimages`
--

CREATE TABLE `testimages` (
  `id_testimage` int(11) NOT NULL,
  `caso` int(10) UNSIGNED NOT NULL,
  `nome_img` varchar(255) NOT NULL,
  `nome_thumb` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `larghezza` smallint(6) NOT NULL,
  `altezza` smallint(6) NOT NULL,
  `size` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT 'Immagine',
  `didascalia` text DEFAULT NULL,
  `mapcode` text DEFAULT NULL,
  `didascalia_diagnosi` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `codice` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `pwd_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id_utente` int(10) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `superuser` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`id_access`),
  ADD KEY `utente` (`utente`);

--
-- Indici per le tabelle `access_users`
--
ALTER TABLE `access_users`
  ADD PRIMARY KEY (`id_access`),
  ADD KEY `user` (`user`);

--
-- Indici per le tabelle `casi`
--
ALTER TABLE `casi`
  ADD PRIMARY KEY (`id_caso`),
  ADD KEY `test` (`test`);

--
-- Indici per le tabelle `codici`
--
ALTER TABLE `codici`
  ADD PRIMARY KEY (`id_codice`),
  ADD UNIQUE KEY `acc_cod` (`acc_cod`);

--
-- Indici per le tabelle `gruppi`
--
ALTER TABLE `gruppi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indici per le tabelle `gruppi_codici`
--
ALTER TABLE `gruppi_codici`
  ADD PRIMARY KEY (`id_gruppo`,`id_codice`);

--
-- Indici per le tabelle `gruppi_tests`
--
ALTER TABLE `gruppi_tests`
  ADD PRIMARY KEY (`id_gruppo`,`id_test`);

--
-- Indici per le tabelle `immagini`
--
ALTER TABLE `immagini`
  ADD PRIMARY KEY (`id_immagine`),
  ADD KEY `user` (`user`);

--
-- Indici per le tabelle `risposte`
--
ALTER TABLE `risposte`
  ADD PRIMARY KEY (`id_risposta`),
  ADD KEY `caso` (`caso`),
  ADD KEY `user` (`user`);

--
-- Indici per le tabelle `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id_test`);

--
-- Indici per le tabelle `testimages`
--
ALTER TABLE `testimages`
  ADD PRIMARY KEY (`id_testimage`),
  ADD KEY `caso` (`caso`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_users` (`codice`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id_utente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `access`
--
ALTER TABLE `access`
  MODIFY `id_access` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `access_users`
--
ALTER TABLE `access_users`
  MODIFY `id_access` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `casi`
--
ALTER TABLE `casi`
  MODIFY `id_caso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `codici`
--
ALTER TABLE `codici`
  MODIFY `id_codice` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `gruppi`
--
ALTER TABLE `gruppi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `immagini`
--
ALTER TABLE `immagini`
  MODIFY `id_immagine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `risposte`
--
ALTER TABLE `risposte`
  MODIFY `id_risposta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `test`
--
ALTER TABLE `test`
  MODIFY `id_test` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `testimages`
--
ALTER TABLE `testimages`
  MODIFY `id_testimage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id_utente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
