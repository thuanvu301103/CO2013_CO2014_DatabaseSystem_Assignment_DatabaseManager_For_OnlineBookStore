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
(3, 'Nguyễn Thị C', 'Nam', '2005-9-25', 'Nguyễn Thị C', 'nguyenthiC@gmail.com', 30000, 'CTTNHH ABC', 3),
(4, 'Lương Tuấn D', 'Nam', '2012-12-30', NULL,'luongtuanD123@gmail.com', 40000, NULL, 4),
(5, 'Bùi Thị E', 'Nam', '2003-10-12', NULL,'buithiE123@gmail.com', 80000, NULL, 5),
(6, 'Vũ Văn F', 'Nam', '2003-1-15', NULL,'vuvanF@gmail.com', 50000, NULL, 6),
(7, 'Dương Thị G', 'None', '2008-1-3', NULL, NULL, NULL, NULL, 7),
(8, 'Nguyễn Văn H', 'None', '2012-2-20', NULL, NULL, NULL, NULL, 8),
(9, 'Trần Văn I', 'None', '2019-5-6', 'Trần Văn I', NULL, NULL, 'Cty một thành viên CDE', 9),
(10, 'Bùi Thị K', 'None', '2016-10-25', NULL, NULL, NULL, 'CTTNHH ABC', 10);

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
-- Table structure for table PHUONG_THUC_THANH_TOAN
--

CREATE TABLE PHUONG_THUC_THANH_TOAN (
    ma_phuong_thuc          int(10)         NOT NULL,
    ten                     varchar(100)    UNIQUE  NOT NULL,
    PRIMARY KEY(ma_phuong_thuc)
);

--
-- Dumping data for table PHUONG_THUC_THANH_TOAN
--

INSERT INTO PHUONG_THUC_THANH_TOAN VALUES
(100,'Thể ghi nợ quốc tế'),
(101,'Ví điện tử MOMO'),
(102,'Ví điện tử Zalopay'),
(103,'Ví điện tử Viettelpay'),
(104,'Chuyển khoản ngân hàng OCB'),
(105,'Chuyển khoản ngân hàng VCB'),
(106,'Chuyển khoản ngân hàng Agribank'),
(107,'Chuyển khoản ngân hàng MBbank'),
(108,'Thanh toán khi nhận hàng');

-- -------------------------------------------------------- Done

--
-- Table structure for table NHA_CUNG_CAP_DICH_VU_VAN_CHUYEN
--

CREATE TABLE NHA_CUNG_CAP_DICH_VU_VAN_CHUYEN (
    ma_dich_vu          int(10)         NOT NULL,
    ten                 varchar(100)    UNIQUE  NOT NULL,
    PRIMARY KEY(ma_dich_vu)
);

--
-- Dumping data for table NHA_CUNG_CAP_DICH_VU_VAN_CHUYEN
--

INSERT INTO NHA_CUNG_CAP_DICH_VU_VAN_CHUYEN VALUES
(200,'Viettelpost'),    (201,'Shoppee'),
(202,'Lazada'),         (203,'Ninja Van'),
(204,'Tiki'),           (205,'Bee');

-- -------------------------------------------------------- Done

--
-- Table structure for table TINH_THANH
--

CREATE TABLE TINH_THANH (
    ma_dich_vu          int(10)         NOT NULL,
    tinh_thanh          varchar(100)    NOT NULL,
    PRIMARY KEY(ma_dich_vu, tinh_thanh),
    FOREIGN KEY(ma_dich_vu) REFERENCES NHA_CUNG_CAP_DICH_VU_VAN_CHUYEN(ma_dich_vu)
        ON DELETE CASCADE   ON UPDATE CASCADE
);

--
-- Dumping data for table TINH_THANH
--

INSERT INTO TINH_THANH VALUES
(200,'Tp.Hồ Chí Minh'), (200,'Hà Nội'),   (200, 'Huế'),         (200, 'Đà Nẵng'),   (200,'Long An'),
(201,'Tp.Hồ Chí Minh'), (201,'Hà Nội'),   (201, 'Huế'),         (201, 'Trà Vinh'),  (201,'Vĩnh Long'),
(201,'Cần Thơ'),        (201,'Bến Tre'),
(202,'Tp.Hồ Chí Minh'), (202,'Hà Nội'),   (202, 'Thái Bình'),   (202,'Hải Phòng'),  (202,'Hà Tĩnh'),
(202,'Thanh Hóa'),
(203,'Tp.Hồ Chí Minh'), (203,'Hà Nội'),   (203, 'Huế'),         (203, 'Đà Nẵng'),   (203,'Long An'),
(204,'Tp.Hồ Chí Minh'), (204,'Kon Tum'),  (204, 'Huế'),         (204, 'Đà Nẵng'),   (204,'Long An'),
(205,'Tp.Hồ Chí Minh'), (205,'Hà Nội'),   (205, 'Bình Dương'),         (205, 'Trà Vinh'),  (205,'Đồng Nai'),
(205,'Nghệ An'),        (205,'Bến Tre');

-- -------------------------------------------------------- Done

--
-- Table structure for table PHUONG_THUC_VAN_CHUYEN
--

CREATE TABLE PHUONG_THUC_VAN_CHUYEN (
    ma_dich_vu              int(10)         NOT NULL,
    phuong_thuc_van_chuyen  varchar(100)    NOT NULL,
    PRIMARY KEY(ma_dich_vu, phuong_thuc_van_chuyen),
    FOREIGN KEY(ma_dich_vu) REFERENCES NHA_CUNG_CAP_DICH_VU_VAN_CHUYEN(ma_dich_vu)
        ON DELETE CASCADE   ON UPDATE CASCADE
);

--
-- Dumping data for table PHUONG_THUC_VAN_CHUYEN
--

INSERT INTO PHUONG_THUC_VAN_CHUYEN VALUES
(200,'Nhanh'),  (200,'Hỏa tốc'),    (200,'Tiết kiệm'),
(201,'Nhanh'),  (201,'Hỏa tốc'),    (201,'Tiết kiệm'),
(202,'Nhanh'),  (202,'Tiết kiệm'),
(203,'Nhanh'),  (203,'Hỏa tốc'),    (203,'Tiết kiệm'),
(204,'Nhanh'),  (204,'Hỏa tốc'),    (204,'Tiết kiệm'),
(205,'Nhanh'),  (205,'Tiết kiệm');

-- -------------------------------------------------------- Done

--
-- Table structure for table DON_HANG
--

---
--- Need trigger to check meeting condition when delete
---

CREATE TABLE DON_HANG (
    ma_don                      int(30)         NOT NULL,
    ma_khach_hang               int(30)         NOT NULL,
    ngay_tao_don                date            NOT NULL,
    nguoi_nhan                  varchar(100)    NOT NULL,
    ghi_chu                     varchar(255),
    trang_thai                  varchar(100)    NOT NULL    DEFAULT 'Đang xử lí'
        CHECK (trang_thai IN ('Đang xử lí', 'Chờ xác nhận', 'Chờ thanh toán', 'Đã giao', 'Bị hủy')),
    ma_dia_chi                  int(10)         NOT NULL,
    ma_nguoi_dat_hang           int(30)         NOT NULL
        CHECK (ma_nguoi_dat_hang = ma_khach_hang),
    ma_phuong_thuc_thanh_toan   int(10)         NOT NULL,
    ma_dich_vu_van_chuyen       int(10)         NOT NULL,
    phuong_thuc_van_chuyen      varchar(100)    NOT NULL,
    ma_van_don                  varchar(30)     NOT NULL,
    phi_van_chuyen              int(10)         NOT NULL,
    tong_tien                   int(20)         NOT NULL
        CHECK (tong_tien % 1000 = 0),
    thoi_gian_giao_hang_du_kien date            NOT NULL
        CHECK (thoi_gian_giao_hang_du_kien > ngay_tao_don),
    
    PRIMARY KEY (ma_don),
    FOREIGN KEY (ma_khach_hang)                 REFERENCES KHACH_HANG(ma_khach_hang)
        ON DELETE CASCADE   ON UPDATE CASCADE,
    FOREIGN KEY (ma_nguoi_dat_hang, ma_dia_chi) REFERENCES DIA_CHI(ma_khach_hang, ma_dia_chi)
        ON DELETE CASCADE   ON UPDATE CASCADE,
    FOREIGN KEY (ma_phuong_thuc_thanh_toan)     REFERENCES PHUONG_THUC_THANH_TOAN(ma_phuong_thuc)
        ON DELETE CASCADE   ON UPDATE CASCADE,
    FOREIGN KEY (ma_dich_vu_van_chuyen)         REFERENCES NHA_CUNG_CAP_DICH_VU_VAN_CHUYEN(ma_dich_vu)
        ON DELETE CASCADE   ON UPDATE CASCADE
);

--
-- Dumping data for table DON_HANG
--

INSERT INTO DON_HANG VALUES
(1, 1, '2023-11-19', 'Nguyễn Văn A', NULL, 'Đang xử lí', 3, 1, 100, 201 , 'Nhanh', '10268AGJS5', 30000, 150000, '2023-11-20'),
(2, 1, '2023-11-20', 'Trần Thị D', 'Hàng dễ vỡ, xin nhẹ tay.', 'Đang xử lí', 2, 1, 101, 203, 'Nhanh','GJSG532hkg4', 50000, 120000, '2023-11-21'),
(3, 2, '2023-6-2', 'Bùi Văn C', NULL, 'Chờ thanh toán', 1, 2, 101, 203, 'Nhanh', '125wfjGJF5', 20000, 200000, '2023-11-27'),
(4, 3, '2023-7-30', 'Lương Tuấn D', NULL, 'Bị hủy', 1, 3, 103, 205, 'Tiết kiệm', 'fjsf52DVDJ', 30000, 300000, '2023-11-26'),
(5, 3, '2022-6-23', 'Bùi Thị E', NULL, 'Bị hủy', 1, 3, 103, 202, 'Tiết kiệm', 'sdghs528wt', 20000, 200000,'2022-12-31'),
(6, 3, '2023-10-23', 'Trần Tuấn T', 'Bỏ hàng vào thùng thư.', 'Đã giao', 1, 3, 104, 203, 'Hỏa tốc','12wvcfHKGS', 10000, 30000, '2023-11-28'),
(7, 7, '2023-2-1', 'Dương Thị G', 'Hàng dễ vỡ, xin nhẹ tay.', 'Đã giao', 1, 7, 108, 202, 'Nhanh', '1234d5bwgf', 5000, 100000, '2023-11-26'),
(8, 7, '2023-5-19', 'Nguyễn Văn H', 'Hàng dễ vỡ, xin nhẹ tay.', 'Đã giao', 1, 7, 107, 201, 'Nhanh', 'scvhwk5wh6', 10000, 150000, '2023-11-24'),
(9, 8, '2023-8-2', 'Dương Thị G', 'Giao hàng trong khoảng 14h30-17h00.', 'Bị hủy', 1,8, 105, 203, 'Hỏa tốc','sd12hwJSXV', 15000, 120000, '2023-11-25'),
(10, 9, '2023-7-10', 'Trần Văn I', NULL, 'Đã giao', 2, 9, 106, 204, 'Hỏa tốc', 'dd2dDwgH55', 30000, 500000, '2023-11-30'),
(11, 10, '2023-4-5', 'Bùi Thị K', NULL, 'Đã giao', 1, 10, 102, 205, 'Nhanh', 'vdwhd5d555', 40000, 250000, '2023-12-30'),
(12, 10, '2022-4-6', 'Nguyễn Văn A', NULL, 'Đã giao', 1, 10, 102, 200, 'Tiết kiệm', '123587sgss', 50000, 160000, '2022-12-30');

-- -------------------------------------------------------- Done

--
-- Table structure for table DANH_MUC
--

CREATE TABLE DANH_MUC (
    ma_danh_muc         int(10)         NOT NULL,
	ten                 varchar(20)     NOT NULL,
    phan_loai           varchar(30)     NOT NULL
        CHECK (phan_loai IN ('Sách', 'Văn phòng phẩm')), 
    ma_danh_muc_cha     int(10),
    PRIMARY KEY (ma_danh_muc),
    FOREIGN KEY (ma_danh_muc_cha) REFERENCES DANH_MUC(ma_danh_muc)
        ON DELETE SET NULL   ON UPDATE CASCADE
);

--
-- Dumping data for table DANH_MUC
--

INSERT INTO DANH_MUC VALUES
(1000, 'Sách tham khảo', 'Sách', NULL),
(1001, 'Tâm lí - kĩ năng sống', 'Sách', NULL),
(1002, 'Sách tiếu nhi', 'Sách', NULL),
(1003, 'Manga - Comic', 'Sách', 1002),
(1004, 'Vừa học - vừa chơi', 'Sách', 1002),
(1005, 'Sách cho tuổi mới lớn', 'Sách', 1001),
(1006, 'Tâm lí', 'Sách', 1001),
(2000, 'Bút - viết', 'Văn phòng phẩm', NULL),
(2001, 'Dụng cụ giấy', 'Văn phòng phẩm', NULL),
(2002, 'Sản phẩm điện tử', 'Văn phòng phẩm', NULL),
(2003, 'Bút bi', 'Văn phòng phẩm', 2000),
(2004, 'Giấy sơn dầu', 'Văn phòng phẩm', 2001),
(2005, 'Giấy ôli', 'Văn phòng phẩm', 2001),
(2006, 'Máy tính cầm tay', 'Văn phòng phẩm', 2002);

-- -------------------------------------------------------- Done

--
-- Table structure for table SAN_PHAM
--

---
--- Need trigger to calculate gia_ban
---
CREATE TABLE SAN_PHAM (
    ma_san_pham             int(10)         NOT NULL,
    ten                     VARCHAR(100)    NOT NULL,
	phan_loai               VARCHAR(30)     NOT NULL
        CHECK (phan_loai IN ('Sách', 'Văn phòng phẩm')),
    mo_ta                   VARCHAR(255)    DEFAULT NULL,
    gia_goc                 int(10)         NOT NULL,
    phan_tram_chiet_khau    int(3)
        CHECK (phan_tram_chiet_khau >= 0 AND phan_tram_chiet_khau <= 70 AND phan_tram_chiet_khau % 5 = 0),
    gia_ban                 int(10)         NOT NULL,
    kich_thuoc              varchar(100)    DEFAULT NULL,
    so_luong_ton_kho        int(10)         NOT NULL
        CHECK (so_luong_ton_kho >= 0),
    ma_danh_muc             int(10),
    
	PRIMARY KEY (ma_san_pham),
    FOREIGN KEY (ma_danh_muc) REFERENCES DANH_MUC(ma_danh_muc)
        ON DELETE SET NULL  ON UPDATE CASCADE
);

--
-- Dumping data for table SAN_PHAM
--

INSERT INTO SAN_PHAM VALUES
(10000, 'Cổ tích thiếu nhi 1', 'Sách', 'Truyện cổ tích hay dành cho thiếu nhi', 15000, 0, 15000, '30cm x 30cm', 98, 1004),
(10001, 'Cổ tích thiếu nhi 2', 'Sách', 'Truyện cổ tích hay dành cho thiếu nhi', 15000, 0, 15000, '30cm x 30cm', 50, 1004),
(10002, 'Jujutsu Kaisen - Chapter 1', 'Sách', 'Manga Thầy cúng đại chiến', 50000, 10, 45000, NULL, 120, 1003),
(10003, 'Jujutsu Kaisen - Chapter 2', 'Sách', 'Manga Thầy cúng đại chiến', 50000, 10, 45000, NULL, 50, 1003),
(10004, 'Cẩm nang tuổi dậy thì', 'Sách', NULL, 100000, 40, 60000, NULL, 200, 1005),
(10005, 'Cấu trúc dữ liệu và giải thuật', 'Sách', 'Sách tham khảo Cấu trúc dữ liệu và giải thuật cho người mới', 150000, 10, 135000, NULL, 20, 1000),
(10006, 'Kiến trúc máy tính', 'Sách', NULL, 100000, 0, 100000, NULL, 20, 1000),
(10007, 'Sinh học đại cương', 'Sách', NULL, 120000, 50, 60000, NULL, 50, 1000),
(10008, 'Máy tính cầm tay CASIO fx-500', 'Văn phòng phẩm', 'Máy tính câm tay đời mới nhất', 350000, 0, 350000, '15cm x 7cm', 200, 2006),
(10009, 'Máy tính cầm tay VINACAL fx-350', 'Văn phòng phẩm', 'Máy tính câm tay đời mới nhất', 340000, 0, 340000, '15cm x 7.5cm', 150, 2006),
(10010, 'Sổ lò xo bìa cứng Peguin', 'Văn phòng phẩm', 'Sổ lò xo bìa cúng Peguin, kẻ ngang - 120 trang', 128000, 0, 128000, '30cm x 25cm', 68, 2005),
(10011, 'Giấy Note 4 màu', 'Văn phòng phẩm', NULL, 10000, 10, 9000, '10cm x 10cm', 68, 2005),
(10012, 'Bút bi bấm mực đỏ - hộp 30 cây', 'Văn phòng phẩm', NULL, 50000, 10, 45000, NULL, 68, 2000),
(10013, 'Bút bi bấm mực xanh - hộp 30 cây', 'Văn phòng phẩm', NULL, 50000, 10, 45000, NULL, 68, 2000),
(10014, 'Bút bi bấm ba màu', 'Văn phòng phẩm', NULL, 10000, 0, 10000, NULL, 60, 2000),
(10015, 'Viết chì 10B', 'Văn phòng phẩm', 'Bú chì 10B chuyên dùng hội họa', 10000, 0, 10000, NULL, 20, 2000);

-- -------------------------------------------------------- Done

--
-- Table structure for table THEM_GIO_HANG
--

CREATE TABLE THEM_GIO_HANG (
    ma_gio_hang         int(30)     NOT NULL,
    ma_san_pham         int(10)     NOT NULL,
    so_luong            int(3)      DEFAULT NULL
        CHECK (so_luong > 0),
    tong_tien           int(10)     NOT NULL,
    PRIMARY KEY(ma_gio_hang , ma_san_pham),
    FOREIGN KEY (ma_gio_hang) REFERENCES GIO_HANG(ma_gio_hang)
        ON DELETE CASCADE   ON UPDATE CASCADE,
    FOREIGN KEY (ma_san_pham) REFERENCES SAN_PHAM(ma_san_pham)
        ON UPDATE CASCADE
);

INSERT INTO THEM_GIO_HANG VALUES
(1, 10015, 1, 140000),
(1, 10002, 2, 100000),
(1, 10004, 1, 145000),
(2, 10007, 3, 200000),
(3, 10002, 1, 50000),
(3, 10005, 1, 70000),
(9, 10007, 1, 1400000),
(9, 10006, 2, 250000),
(9, 10003, 3, 50000),
(10, 10015, 1, 140000),
(10, 10014, 1, 150000);

-- -------------------------------------------------------- Done

--
-- Table structure for table CHI_TIET_DON_HANG
--

CREATE TABLE CHI_TIET_DON_HANG (
    ma_don          int(30)     NOT NULL,
    ma_san_pham     int(10)     NOT NULL,
    so_luong        int(3)      NOT NULL
        CHECK (so_luong > 0),
    tong_tien       int(10)     NOT NULL,
    PRIMARY KEY(ma_don, ma_san_pham),
    FOREIGN KEY(ma_don) REFERENCES DON_HANG(ma_don)
        ON DELETE CASCADE   ON UPDATE CASCADE,
    FOREIGN KEY(ma_san_pham) REFERENCES SAN_PHAM(ma_san_pham)
        ON UPDATE CASCADE
);

--
-- Dumping data for table CHI_TIET_DON_HANG
--

INSERT INTO CHI_TIET_DON_HANG VALUES
(1, 10000, 1, 15000),
(2, 10005, 3, 141000),
(3, 10015, 15, 150000),
(4, 10011, 1, 16000),
(5, 10009, 3, 120000),
(6, 10003, 2, 50000),
(7, 10007, 3, 650000),
(8, 10008, 1, 15000),
(9, 10005, 1, 15000),
(10, 10005, 2, 100000),
(12, 10008, 3, 141000);

-- -------------------------------------------------------- Done

--
-- Table structure for table `VAN_PHONG_PHAM`
--

CREATE TABLE VAN_PHONG_PHAM (
    ma_san_pham         int(10)         NOT NULL,
    thuong_hieu         varchar(20)     NOT NULL,
    xuat_xu             varchar(20)     NOT NULL,
    do_tuoi_su_dung     varchar(10)     NOT NULL,
    PRIMARY KEY (ma_san_pham),
    FOREIGN KEY (ma_san_pham) REFERENCES SAN_PHAM(ma_san_pham)
        ON DELETE CASCADE   ON UPDATE CASCADE
);

--
-- Dumping data for table `VAN_PHONG_PHAM`
--

INSERT INTO VAN_PHONG_PHAM VALUES 
(10008, 'CASIO', 'Việt Nam', '10+'),
(10009, 'VINACAL', 'Việt Nam', '10+'),
(10010, 'PEGUIN', 'Hàn Quốc', '5+'),
(10011, 'Thiên Long', 'Việt Nam', '5+'),
(10012, 'Thiên Long', 'Việt Nam', '10+'),
(10013, 'Thiên Long', 'Việt Nam', '10+'),
(10014, 'Thiên Long', 'Việt Nam', '10+'),
(10015, 'Thiên Long', 'Việt Nam', '12+');

-- --------------------------------------------------------

--
-- Table structure for table `CHAT_LIEU`
--

CREATE TABLE CHAT_LIEU (
    ma_san_pham         int(10)       NOT NULL,
    chat_lieu           VARCHAR(15)     NOT NULL,
    PRIMARY KEY (ma_san_pham, chat_lieu),
    FOREIGN KEY (ma_san_pham) REFERENCES VAN_PHONG_PHAM(ma_san_pham)
	    ON DELETE CASCADE	ON UPDATE CASCADE
);

--
-- Dumping data for table `CHAT_LIEU`
--

INSERT INTO CHAT_LIEU VALUES
(10008, 'Nhựa'),
(10009, 'Nhựa'),
(10010, 'Giấy'),    (10010, 'Kim loại'),
(10011, 'Giấy'),
(10012, 'Nhựa'),    (10012, 'Kim loại'),
(10013, 'Nhựa'),    (10013, 'Kim loại'),
(10014, 'Nhựa'),    (10014, 'Kim loại'),
(10015, 'Gỗ'),      (10015, 'Than chì');

-- --------------------------------------------------------

--
-- Table structure for table `MAU_SAC`
--

CREATE TABLE MAU_SAC (
    ma_san_pham         INT(10)         NOT NULL,
    mau_sac             VARCHAR(15)     NOT NULL,
    PRIMARY KEY (ma_san_pham, mau_sac),
    FOREIGN KEY (ma_san_pham) REFERENCES VAN_PHONG_PHAM(ma_san_pham)
	    ON DELETE CASCADE	ON UPDATE CASCADE
);

--
-- Dumping data for table `MAU_SAC`
--

INSERT INTO MAU_SAC VALUES
(10008, 'Trắng'),   (10008, 'Xanh'),    (10008, 'Đen'),
(10009, 'Trắng'),   (10009, 'Xanh'),    (10009, 'Đen'),
(10010, 'Trắng'),   (10010, 'Vàng'),
(10011, 'Trắng'),   (10011, 'Xanh'),    (10011, 'Hồng'),    (10011, 'Lục'),
(10012, 'Trắng'),   (10012, 'Xanh'),
(10013, 'Trắng'),   (10013, 'Đỏ'),
(10014, 'Trắng'),   (10014, 'Đỏ'),      (10014, 'Xanh'),    (10014, 'Đen'),
(10015, 'Cam'),     (10015, 'Xám');

-- --------------------------------------------------------


--
-- Table structure for table `SERIES_SACH`
--

CREATE TABLE SERIES_SACH (
    ma_series           INT(10)         NOT NULL,
    ten                 VARCHAR(100)    NOT NULL,
    so_luong_tua_sach   INT(3)          DEFAULT NULL,
    PRIMARY KEY (ma_series)
);

--
-- Dumping data for table `SERIES_SACH`
--

INSERT INTO SERIES_SACH VALUES
(1, 'Jujutsu Kaisen', 128),    
(2, 'Bách khoa toàn thư', NULL),
(3, 'Đại cương', NULL),    
(4, 'Tìm hiểu bản thân', 5);

-- --------------------------------------------------------

--
-- Table structure for table `SACH`
--

CREATE TABLE SACH (
    ma_san_pham         int(10)         NOT NULL,
    nha_xuat_ban        varchar(255)    NOT NULL,
    tac_gia             varchar(255)    NOT NULL,
    bia                 varchar(10)     NOT NULL
        CHECK (bia IN ('Cứng', 'Mềm')),
    PRIMARY KEY(ma_san_pham),
    FOREIGN KEY(ma_san_pham) REFERENCES SAN_PHAM(ma_san_pham)
        ON DELETE CASCADE   ON UPDATE CASCADE
);

--
-- Dumping data for table `SERIES_SACH`
--

INSERT INTO SACH VALUES
(10000, 'NXB Thiếu nhi', 'Nguyễn Nhật A', 'Cứng'),
(10001, 'NXB Thiếu nhi', 'Nguyễn Nhật A', 'Cứng'),
(10002, 'NXB Kim Đồng', 'Gege Akumata', 'Mềm'),
(10003, 'NXB Kim Đồng', 'Gege Akumata', 'Mềm'),
(10004, 'NXB TRi Thức', 'Vũ Van T', 'Mềm'),
(10005, 'NXB ĐHQG tp.Hồ Chí Minh ', 'Nguyễn Anh T', 'Mềm'),
(10006, 'NXB ĐHQG tp.Hồ Chí Minh ', 'Trần Văn K', 'Mềm'),
(10007, 'NXB ĐHQG tp.Hồ Chí Minh ', 'Châu Thị M', 'Mềm');


-- --------------------------------------------------------

--
-- Table structure for table `BAO_GOM`
--

CREATE TABLE BAO_GOM (
  ma_san_pham INT NOT NULL,
  ma_series INT DEFAULT NULL,
  PRIMARY KEY (ma_san_pham),
  FOREIGN KEY (ma_san_pham) REFERENCES SACH(ma_san_pham)
	ON DELETE CASCADE	ON UPDATE CASCADE,
  FOREIGN KEY (ma_series) REFERENCES SERIES_SACH(ma_series)
	ON DELETE CASCADE	ON UPDATE CASCADE
);

--
-- Dumping data for table BAO_GOM
--

INSERT INTO BAO_GOM VALUES
(10000, NULL),
(10001, NULL),
(10002, 1),
(10003, 1),
(10004, 4),
(10005, 3),
(10006, 3),
(10007, 3);

-- --------------------------------------------------------

--
-- Table structure for table VOUCHER_GIAM_GIA
--

CREATE TABLE VOUCHER_GIAM_GIA (
    ma_giam_gia                 varchar(30)     NOT NULL,
    phan_tram_chiet_khau        int(3)          NOT NULL
        CHECK (phan_tram_chiet_khau >= 0 AND phan_tram_chiet_khau <= 70 AND phan_tram_chiet_khau%5 = 0),
	noi_dung                    VARCHAR(100),
    thoi_han_ap_dung            DATE,
    gia_tri_don_hang_toi_thieu  int(10)
        CHECK (gia_tri_don_hang_toi_thieu > 0),    
    PRIMARY KEY(ma_giam_gia)
);

--
-- Dumping data for table VOUCHER_GIAM_GIA
--

INSERT INTO VOUCHER_GIAM_GIA VALUES
('111', 10, 'Giảm 10% giá trị đơn hàng', '2023-11-01', 10000),
('112', 15, 'Giảm 15% giá trị đơn hàng nhân dịp 20-11', '2023-11-15', 10000),
('113', 20, 'Giảm 20% giá trị đơn hàng nhân dịp 20-11', '2023-11-12', 70000),
('114', 25, 'Giảm 25% giá trị đơn hàng nhân dịp 20-11', '2023-10-12', 80000),
('115', 30, 'Giảm 30% giá trị đơn hàng chào đón khách hàng mới', '2023-6-1', 90000),
('116', 35, 'Giảm 35% giá trị đơn hàng', '2023-3-23', 100000),
('117', 40, 'Giảm 40% giá trị đơn hàng', '2023-10-9', 120000),
('118', 45, 'Giảm 45% giá trị đơn hàng chào đón khách hàng mới', '2023-3-20', 170000),
('119', 50, 'Giảm 50% giá trị đơn hàng chào đón khách hàng mới', '2023-11-01', 200000),
('120', 55, 'Giảm 55% giá trị đơn hàng', '2023-11-01', 200000);

-- --------------------------------------------------------

--
-- Table structure for table AP_DUNG
--

CREATE TABLE AP_DUNG (
	ma_don          int(30)         NOT NULL,
    ma_giam_gia     varchar(30)     NOT NULL,
    PRIMARY KEY(ma_don),
    FOREIGN KEY (ma_don) REFERENCES DON_HANG(ma_don)
        ON DELETE CASCADE   ON UPDATE CASCADE,
    FOREIGN KEY (ma_giam_gia) REFERENCES VOUCHER_GIAM_GIA(ma_giam_gia)
        ON UPDATE CASCADE
);

--
-- Dumping data for table AP_DUNG
--

INSERT INTO AP_DUNG VALUES 
(1, '111'), (2, '114'), (3, '115'), (4, '120'),
(5, '111'), (6, '114'), (7, '115'), (8, '120'),
(9, '112'), (10, '114'), (11, '116'), (12, '117');

-- --------------------------------------------------------

--
-- Table structure for table SO_HUU
--

CREATE TABLE SO_HUU (
	ma_khach_hang       int(10)         NOT NULL,
    ma_giam_gia         varchar(30)     NOT NULL,
    PRIMARY KEY(ma_khach_hang, ma_giam_gia),
    FOREIGN KEY (ma_khach_hang) REFERENCES KHACH_HANG(ma_khach_hang)
        ON DELETE CASCADE   ON UPDATE CASCADE,
    FOREIGN KEY (ma_giam_gia) REFERENCES VOUCHER_GIAM_GIA(ma_giam_gia)
        ON UPDATE CASCADE
);

--
-- Dumping data for table SO_HUU
--

INSERT INTO SO_HUU VALUES 
(1, '111'), (1, '114'), (1, '115'), (1, '120'),
(2, '111'), (2, '114'),
(5, '115'), (1, '116'), (1, '117'),
(8, '111'), (8, '114'), (8, '115'), (8, '120'),
(9, '112'), (9, '114'), (9, '116'), (9, '117');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrow`
--
--ALTER TABLE `borrow`
--  ADD KEY `student_id` (`student_id`),
--  ADD KEY `document_id` (`document_id`);

--
-- Indexes for table `documents`
--
--ALTER TABLE `documents`
--  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `members`
--
--ALTER TABLE `members`
--  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `requestborrow`
--
--ALTER TABLE `requestborrow`
--  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
--ALTER TABLE `documents`
--  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `requestborrow`
--
--ALTER TABLE `requestborrow`
--  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
--ALTER TABLE `borrow`
--  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `members` (`student_id`),
--  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `documents` (`document_id`);
--COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
