-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2025 年 1 月 23 日 21:36
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `kadai_php04`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `user_data_04`
--

CREATE TABLE `user_data_04` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` char(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `balcony_orientation` enum('N','E','S','W') NOT NULL,
  `indate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `user_data_04`
--

INSERT INTO `user_data_04` (`user_id`, `email`, `password_hash`, `name`, `address`, `balcony_orientation`, `indate`) VALUES
(3, 'yamamoto@email.com', 'yamamoto', '山本', '東京都', 'E', '2025-01-03 10:25:34'),
(4, 'tanaka@email.com', '$2y$10$WEwyWj/6k0Kfpj93H6YvEePx588OkqdcLlE4wzD/Qtd1RI9Ev5MQy', '田中', '岡山県', 'N', '2025-01-24 04:57:08'),
(5, 'yamada@email.com', 'yamada', '山田', '大阪府', 'S', '2025-01-03 11:57:43'),
(6, 'nakamura@email.com', 'nakamura', '中村', '鹿児島', 'W', '2025-01-23 02:29:43'),
(7, 'okada@email.com', 'okada', '岡田', '宮崎', 'S', '2025-01-23 02:30:32');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `user_data_04`
--
ALTER TABLE `user_data_04`
  ADD PRIMARY KEY (`user_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `user_data_04`
--
ALTER TABLE `user_data_04`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
