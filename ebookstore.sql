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

-- -------------------------------------------------------- Done

--
-- Table structure for table GIO_HANG
--

CREATE TABLE GIO_HANG (
    ma_gio_hang         int(30)         NOT NULL,
    so_luong_san_pham   int             NOT NULL    DEFAULT 0
        CHECK (so_luong_san_pham >= 0),
    PRIMARY KEY (ma_gio_hang)
);

--
-- Dumping data for table GIO_HANG
--

INSERT INTO GIO_HANG VALUES
(1, 3), (2, 5), (3, 4), (4,2), (5,2), (6,1), (7, 3);
INSERT INTO GIO_HANG (ma_gio_hang) VALUES
(8), (9), (10);


-- -------------------------------------------------------- Done

--
-- Table structure for table KHACH_HANG
--

CREATE TABLE KHACH_HANG (
    ma_khach_hang       int(30)         NOT NULL,
    ho_ten              varchar(100)    NOT NULL,
    gioi_tinh           varchar(6)      NOT NULL    DEFAULT 'None'
        CHECK (gioi_tinh IN ('Nam', 'Nữ', 'None')),
    ngay_sinh           date            NOT NULL,
    ten_nguoi_mua       varchar(100)    DEFAULT NULL,
    email_nhan_hoa_don  varchar(100)    DEFAULT NULL
        CHECK (email_nhan_hoa_don LIKE '%@%.%'),
    ma_so_thue          int(20)         DEFAULT NULL,
    ten_cong_ty         varchar(100)    DEFAULT NULL,
    ma_gio_hang         int(30)         UNIQUE      DEFAULT NULL,
    PRIMARY KEY (ma_khach_hang),
    FOREIGN KEY (ma_gio_hang) REFERENCES GIO_HANG(ma_gio_hang)
	    ON DELETE SET NULL	ON UPDATE CASCADE
);

--
-- Dumping data for table KHACH_HANG
--

INSERT INTO KHACH_HANG VALUES
(1, 'Nguyễn Văn A', 'Nam', '2003-11-25', NULL, NULL, NULL, NULL, 1),
(2, 'Trần Văn B', 'Nữ', '2001-10-1', 'Trần Văn B', 'tranvanB@gmail.com', 20000, 'CTTNHH ABC', 2),
(3, 'Nguyễn Thị C', 'Nam', '2003-11-25', 'Nguyễn Thị C', 'nguyenthiC@gmail.com', 30000, 'CTTNHH ABC', 3),
(4, 'Lương Tuấn D', 'Nam', '2003-11-25', NULL,'luongtuanD123@gmail.com', 40000, NULL, 4),
(5, 'Bùi Thị E', 'Nam', '2003-11-25', NULL,'buithiE123@gmail.com', 80000, NULL, 5),
(6, 'Vũ Văn F', 'Nam', '2003-11-25', NULL,'vuvanF@gmail.com', 50000, NULL, 6),
(7, 'Dương Thị G', 'None', '2003-11-25', NULL, NULL, NULL, NULL, 7),
(8, 'Nguyễn Văn H', 'None', '2003-11-25', NULL, NULL, NULL, NULL, 8),
(9, 'Trần Văn I', 'None', '2003-11-25', 'Trần Văn I', NULL, NULL, 'Cty một thành viên CDE', 9),
(10, 'Bùi Thị K', 'None', '2003-11-25', NULL, NULL, NULL, 'CTTNHH ABC', 10);

-- -------------------------------------------------------- Done

--
-- Table structure for table SO_DIEN_THOAI
--

CREATE TABLE SO_DIEN_THOAI (
    ma_khach_hang       int(30)         NOT NULL,
    so_dien_thoai       varchar(20)     NOT NULL
        CHECK (so_dien_thoai NOT LIKE '%[^0-9]%'),
    PRIMARY KEY (ma_khach_hang, so_dien_thoai),
    FOREIGN KEY (ma_khach_hang) REFERENCES KHACH_HANG(ma_khach_hang)
	    ON DELETE CASCADE	ON UPDATE CASCADE
);

--
-- Dumping data for table SO_DIEN_THOAI
--

INSERT INTO SO_DIEN_THOAI VALUES
(1, '0326547925'), (1, '013579631'), (1, '01253656123'), (1, '0569786236'), 
(2, '0326547925'), (2, '013579631'),
(3, '0137942689'),
(5, '0121248525'), (5, '055453565'),
(6, '0122358525'), (6, '055453565'),
(8, '0123568225'), (8, '115453565');

-- -------------------------------------------------------- Done

--
-- Table structure for table EMAIL
--

CREATE TABLE EMAIL (
    ma_khach_hang       int(30)         NOT NULL,
    email               varchar(100)    NOT NULL
        CHECK (email LIKE '%@%.%'),
    PRIMARY KEY (ma_khach_hang, email),
    FOREIGN KEY (ma_khach_hang) REFERENCES KHACH_HANG(ma_khach_hang)
	    ON DELETE CASCADE	ON UPDATE CASCADE
);

--
-- Dumping data for table EMAIL
--

INSERT INTO EMAIL VALUES
(1, 'tranvanA123@gmail.com'), (1, 'tranvanA567@gmail.com'), (1, 'tranvanA789@gmail.com'), (1, 'tranvanAabc@gmail.com'), 
(3, 'nguyenthiC12@gmail.com'), (3, 'nguyenthiC23@gmail.com'),
(4, 'tuanD@gmail.com'),
(6, 'vuvanF567@gmail.com'), (6, 'vuvanF123@gmail.com'),
(9, 'Itranvan12@hotmail.com'), (9, 'Itranvan12@gmail.com'),
(10, 'k301103@edu.vn'), (10, 'buithik@edu.vn');

-- -------------------------------------------------------- Done

--
-- Table structure for table DIA_CHI
--

CREATE TABLE DIA_CHI (
    ma_khach_hang       int(30)         NOT NULL,
    ma_dia_chi          int(10)         NOT NULL,
    tinh_TP             varchar(100)    NOT NULL,
    quan_huyen          varchar(100)    NOT NULL,
    xa_phuong           varchar(100)    NOT NULL,
    so_nha_ten_duong    varchar(200)    NOT NULL,
    mac_dinh            boolean         DEFAULT FALSE,
    PRIMARY KEY (ma_khach_hang, ma_dia_chi),
    FOREIGN KEY (ma_khach_hang) REFERENCES KHACH_HANG(ma_khach_hang)
        ON DELETE CASCADE   ON UPDATE CASCADE
);

--
-- Dumping data for table DIA_CHI
--

INSERT INTO DIA_CHI VALUES 
(1, 1, 'Hà Nội', 'Đống Đa', 'Ô Chợ Dừa', 'Số 123, Nguyễn Lương Bằng', TRUE),
(1, 2, 'Hà Nội', 'Đống Đa', 'Ô Chợ Dừa', 'Số 423, Nguyễn Lương Bằng', FALSE),
(1, 3, 'Thái Bình', 'Đông Hưng', 'Đông Các', 'Số 58, Lịch Động', FALSE),
(2, 1, 'Thái Bình', 'Đông Hưng', 'Đông Các', 'Số 37, Trần Quốc Toản', FALSE),
(2, 2, 'Tp. Hồ Chí Minh', 'Quận 1', 'Phương 7', '789, Bạch Đằng', TRUE),
(3, 1, 'Long An', 'Bình Thạnh', 'Ô Chợ Dừa', 'Số 123, Nguyễn Lương Bằng', TRUE),
(7, 1, 'Hà Tĩnh', 'Đống Đa', 'Ô Chợ Dừa', 'Số 423, Nguyễn Lương Bằng', FALSE),
(7, 2, 'Thái Bình', 'Đông Hưng', 'Đông Các', 'Số 58, Lịch Động', FALSE),
(7, 3, 'Trà Vinh', 'Thị xã Duyên Hải', 'Phương 1', 'Số 89, đường 5/7', TRUE),
(8, 1, 'Hà Nội', 'Đống Đa', 'Ô Quan Chưởng', 'Số 423, Nguyễn Lương Bằng', FALSE),
(9, 1, 'Hải Phòng', 'Thái Hòa', 'Đông Hòa', 'Số 58, đường 3/2', TRUE),
(10, 2, 'Đà Nẵng', 'Hải Châu', 'Thạch Thắng', '789, Bạch Đằng', TRUE);

INSERT INTO DIA_CHI (ma_khach_hang, ma_dia_chi, tinh_TP, quan_huyen, xa_phuong, so_nha_ten_duong) VALUES
(9, 2, 'Thái Bình', 'Đông Hưng', 'Đông Thái', '57, Hưng Hóa'),
(10, 1, 'Tp.Hồ Chí Minh', 'Quận 1', 'Bến Nghé', '456, Đồng Khởi');

-- -------------------------------------------------------- Done

--
-- Table structure for table `VAN_PHONG_PHAM`
--

CREATE TABLE VAN_PHONG_PHAM (
  ma_san_pham INT NOT NULL,
  chat_lieu VARCHAR(15) NOT NULL,
  PRIMARY KEY (ma_san_pham, chat_lieu)
);

--
-- Dumping data for table `VAN_PHONG_PHAM`
--

INSERT INTO `VAN_PHONG_PHAM` (`ma_san_pham`, `chat_lieu`) VALUES
(1, 'kim loại'),
(2, 'gỗ');

-- --------------------------------------------------------

--
-- Table structure for table `SERIES_SACH`
--

CREATE TABLE `SERIES_SACH` (
  `ma_series` INT NOT NULL,
  `chat_lieu` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ma_series`, `chat_lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SERIES_SACH`
--

INSERT INTO `SERIES_SACH` (`ma_series`, `chat_lieu`) VALUES
(1, 'kim loại'),
(2, 'gỗ');

-- --------------------------------------------------------

--
-- Table structure for table `SACH`
--

CREATE TABLE `SACH` (
  `ma_san_pham` INT NOT NULL,
  `chat_lieu` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ma_san_pham`, `chat_lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SERIES_SACH`
--

INSERT INTO `SACH` (`ma_san_pham`, `chat_lieu`) VALUES
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
  `ma_series` INT NOT NULL,
  PRIMARY KEY (`ma_san_pham`),
  FOREIGN KEY (`ma_san_pham`) REFERENCES `SACH`(`ma_san_pham`)
	ON DELETE CASCADE	ON UPDATE CASCADE,
  FOREIGN KEY (`ma_series`) REFERENCES `SERIES_SACH`(`ma_series`)
	ON DELETE CASCADE	ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MAU_SAC`
--

INSERT INTO `BAO_GOM` (`ma_san_pham`, `ma_series`) VALUES
(1, 2),
(2, 3);

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
