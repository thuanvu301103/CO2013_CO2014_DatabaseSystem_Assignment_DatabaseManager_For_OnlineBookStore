-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2023 at 05:28 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebookstore`
--

CREATE DATABASE IF NOT EXISTS `ebookstore` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `ebookstore`;

-- --------------------------------------------------------

--
-- Table structure for table `VAN_PHONG_PHAM`
--

CREATE TABLE `VAN_PHONG_PHAM` (
  `ma_san_pham` INT NOT NULL,
  `chat_lieu` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ma_san_pham`, `chat_lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `VAN_PHONG_PHAM`
--

INSERT INTO `VAN_PHONG_PHAM` (`ma_san_pham`, `chat_lieu`) VALUES
(1, 'kim loại'),
(2, 'gỗ');

-- --------------------------------------------------------

--
-- Table structure for table `MA_SERIES`
--

CREATE TABLE `MA_SERIES` (
  `ma_series` INT NOT NULL,
  `chat_lieu` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ma_san_pham`, `chat_lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MA_SERIES`
--

INSERT INTO `MA_SERIES` (`ma_series`, `chat_lieu`) VALUES
(1, 'kim loại'),
(2, 'gỗ');

-- --------------------------------------------------------

--
-- Table structure for table `CHAT_LIEU`
--

CREATE TABLE `CHAT_LIEU` (
  `ma_san_pham` INT NOT NULL,
  `chat_lieu` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ma_san_pham`, `chat_lieu`),
  FOREIGN KEY (`ma_san_pham`) REFERENCES `VAN_PHONG_PHAM`(`ma_san_pham`)
	ON DELETE CASCADE	ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CHAT_LIEU`
--

INSERT INTO `CHAT_LIEU` (`ma_san_pham`, `chat_lieu`) VALUES
(1, 'kim loại'),
(1, 'thủy tinh'),
(2, 'gỗ'),
(2, 'kim loại');

-- --------------------------------------------------------

--
-- Table structure for table `MAU_SAC`
--

CREATE TABLE `MAU_SAC` (
  `ma_san_pham` INT NOT NULL,
  `mau_sac` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ma_san_pham`, `mau_sac`),
  FOREIGN KEY (`ma_san_pham`) REFERENCES `VAN_PHONG_PHAM`(`ma_san_pham`)
	ON DELETE CASCADE	ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MAU_SAC`
--

INSERT INTO `MAU_SAC` (`ma_san_pham`, `mau_sac`) VALUES
(1, 'đỏ'),
(1, 'đen'),
(1, 'xám'),
(2, 'lục');

-- --------------------------------------------------------

--
-- Table structure for table `BAO_GOM`
--

CREATE TABLE `BAO_GOM` (
  `ma_san_pham` INT NOT NULL,
  `mau_series` INT NOT NULL,
  PRIMARY KEY (`ma_san_pham`),
  FOREIGN KEY (`ma_san_pham`) REFERENCES `SACH`(`ma_san_pham`)
	ON DELETE CASCADE	ON UPDATE CASCADE
  FOREIGN KEY (`ma_series`) REFERENCES `SERIES_SACH`(`ma_series`)
	ON DELETE CASCADE	ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MAU_SAC`
--

INSERT INTO `BAO_GOM` (`ma_san_pham`, `mau_sac`) VALUES
(1, 'đỏ'),
(1, 'đen'),
(1, 'xám'),
(2, 'lục');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `student_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `borrow_date` date NOT NULL DEFAULT current_timestamp(),
  `return_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `document_id` int(11) NOT NULL,
  `doc_name` varchar(4096) NOT NULL,
  `type` varchar(255) NOT NULL,
  `author` varchar(4096) NOT NULL,
  `publisher` varchar(4096) NOT NULL,
  `publish_year` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`document_id`, `doc_name`, `type`, `author`, `publisher`, `publish_year`, `quantity`) VALUES
(1, 'Kiến trúc máy tính', 'Sách cơ sở ngành', 'Phạm Quốc Cường', 'NXB Đại học Quốc gia TPHCM', 2019, 1),
(3, 'Cấu trúc dữ liệu và giải thuật', 'Sách cơ sở ngành', 'Nguyễn Trung Trực', 'NXB Đại học Quốc gia TPHCM', 2019, 1);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `email` varchar(127) NOT NULL,
  `password` varchar(127) NOT NULL,
  `state` varchar(127) NOT NULL,
  `join_date` date NOT NULL DEFAULT current_timestamp(),
  `permission` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`student_id`, `student_name`, `email`, `password`, `state`, `join_date`, `permission`) VALUES
(0, 'Trần Văn A', 'tranvanA@hcmut.edu.vn', 'tranvana', '', '2023-11-09', '');

-- --------------------------------------------------------

--
-- Table structure for table `requestborrow`
--

CREATE TABLE `requestborrow` (
  `student_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `request_day` date NOT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `update_date` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `received_day` date DEFAULT NULL,
  `returned_day` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requestborrow`
--

INSERT INTO `requestborrow` (`student_id`, `document_id`, `request_day`, `state`, `update_date`, `id`, `received_day`, `returned_day`) VALUES
(1, 1, '2023-11-15', 0, '2023-11-20', 1, NULL, NULL),
(5, 3, '0000-00-00', 0, NULL, 2, NULL, NULL),
(5, 1, '2023-12-23', 0, NULL, 3, NULL, NULL),
(5, 2, '2023-11-08', 0, NULL, 4, NULL, NULL),
(5, 2, '2023-11-09', 0, NULL, 5, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `document_id` (`document_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `requestborrow`
--
ALTER TABLE `requestborrow`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `requestborrow`
--
ALTER TABLE `requestborrow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `members` (`student_id`),
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `documents` (`document_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
