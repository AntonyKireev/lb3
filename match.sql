-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 10 2022 г., 18:22
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `match`
--

-- --------------------------------------------------------

--
-- Структура таблицы `game`
--

CREATE TABLE `game` (
  `ID_Game` int(11) NOT NULL,
  `date` date NOT NULL,
  `place` text NOT NULL,
  `score` text NOT NULL,
  `FID_Team1` int(11) NOT NULL,
  `FID_Team2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `game`
--

INSERT INTO `game` (`ID_Game`, `date`, `place`, `score`, `FID_Team1`, `FID_Team2`) VALUES
(7, '2022-06-01', 'Germany', '0-1', 16, 17),
(8, '2022-06-15', 'Ukrain', '1-0', 18, 19),
(9, '2022-06-30', 'UK', '2-1', 19, 20),
(10, '2021-06-01', 'Germany', '3-2', 16, 18),
(11, '2020-06-17', 'Ukrain', '5-2', 17, 19),
(12, '2019-06-19', 'UK', '3-4', 18, 20),
(13, '2023-06-22', 'Germany', '5-1', 16, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `player`
--

CREATE TABLE `player` (
  `ID_player` int(11) NOT NULL,
  `name` text NOT NULL,
  `FID_Team` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `player`
--

INSERT INTO `player` (`ID_player`, `name`, `FID_Team`) VALUES
(45, 'Bob', 16),
(46, 'Sam', 20),
(47, 'Rani', 20),
(48, 'Dilan', 19),
(49, 'Hob', 19),
(50, 'Nik', 18),
(51, 'Tarik', 18),
(52, 'Logan', 17),
(53, 'Tom', 17),
(54, 'Ramus', 16),
(55, 'John', 16),
(56, 'Jeremi', 17),
(57, 'Levi', 18),
(58, 'Roman', 19),
(59, 'Bill', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `team`
--

CREATE TABLE `team` (
  `ID_Team` int(11) NOT NULL,
  `name` text NOT NULL,
  `league` text NOT NULL,
  `coach` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `team`
--

INSERT INTO `team` (`ID_Team`, `name`, `league`, `coach`) VALUES
(16, 'Team1', 'League1', 'Bobby'),
(17, 'Team2', 'League2', 'Kill'),
(18, 'Team3', 'League4', 'Galio'),
(19, 'Team4', 'League4', 'Bob'),
(20, 'Team5', 'League5', 'Sam');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`ID_Game`),
  ADD KEY `FID_Team1` (`FID_Team1`),
  ADD KEY `FID_Team2` (`FID_Team2`);

--
-- Индексы таблицы `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`ID_player`),
  ADD KEY `FID_Team` (`FID_Team`);

--
-- Индексы таблицы `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`ID_Team`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `game`
--
ALTER TABLE `game`
  MODIFY `ID_Game` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `player`
--
ALTER TABLE `player`
  MODIFY `ID_player` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблицы `team`
--
ALTER TABLE `team`
  MODIFY `ID_Team` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`FID_Team1`) REFERENCES `team` (`ID_Team`),
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`FID_Team2`) REFERENCES `team` (`ID_Team`);

--
-- Ограничения внешнего ключа таблицы `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`FID_Team`) REFERENCES `team` (`ID_Team`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
