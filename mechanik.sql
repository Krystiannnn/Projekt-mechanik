-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 07 Lis 2022, 19:13
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mechanik`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `appointment`
--

INSERT INTO `appointment` (`id`, `staff_id`, `date`) VALUES
(1, 1, '2022-03-24 12:00:00'),
(2, 1, '2022-03-24 14:00:00'),
(3, 2, '2022-03-24 13:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phone` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `patient`
--

INSERT INTO `patient` (`id`, `firstName`, `lastName`, `phone`) VALUES
(1, 'Stefek', 'Burczymucha', '+48666666666'),
(2, 'Edwin', 'Piatek', '+48789456123'),
(3, 'jskejd', 'asdcwjdhcc', '+48666666661'),
(5, 'kkrrrrrrr', 'sssssssss', '26342743623874'),
(6, 'rhtyhtyjtyjyjyy', 'eeerrrrrrrr', '33453453454'),
(7, 'rgrrrrfr', 'rrrrrrrrrrrrrrrr', '44444444444'),
(8, 'hhhhhhhhh', 'rrrrrrrrrrrrrrrr', '0000000000000'),
(9, 'patyczak', 'patyczak', '63636363636'),
(10, 'patyczak', 'patyczak', '63636363636'),
(11, 'patyczak', 'patyczak', '63636363636'),
(12, 'parapapapapapa', 'oooooooooooo', '5252525252');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `patientappointment`
--

CREATE TABLE `patientappointment` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `patientappointment`
--

INSERT INTO `patientappointment` (`id`, `patient_id`, `appointment_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 3),
(5, 3, 5),
(6, 6, 2),
(7, 7, 3),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `staff`
--

INSERT INTO `staff` (`id`, `firstName`, `lastName`) VALUES
(1, 'wizualny', '.'),
(2, 'mechaniczny', '.'),
(3, 'kompleksowy', '.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `user` text COLLATE utf8mb4_polish_ci NOT NULL,
  `pass` text COLLATE utf8mb4_polish_ci NOT NULL,
  `email` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `user`, `pass`, `email`) VALUES
(1, 'adam', '$2y$10$7sE9.mvUTFA9IWmwKtVO3eT7kOjbzZ5t26Q1qHSnjiTo5DbZJZZ8.', ''),
(2, 'patyczak', '$2y$10$ThFTaBEEZ6MoHkQHpe8ABOB4SaxXD5DiDjhDIYt31sswA71h1usui', 'shsds@o2.pl');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indeksy dla tabeli `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `patientappointment`
--
ALTER TABLE `patientappointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indeksy dla tabeli `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `patientappointment`
--
ALTER TABLE `patientappointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
