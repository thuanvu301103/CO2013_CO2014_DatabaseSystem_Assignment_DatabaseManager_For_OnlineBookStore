CREATE TABLE `Sanpham` (
	`Phanloai` VARCHAR(255) NOT NULL,
    `Giagoc` int(11) NOT NULL,
    `Phantramchietkhau` int(11) NOT NULL,
    `Madichvu` int(11),
    `Ten` VARCHAR(255) NOT NULL,
    `Mota` VARCHAR(255) NOT NULL,
    `Kichthuoc` int(11),
    `Soluongtonkho` int(11) NOT NULL,
    `Giaban` int(11) NOT NULL,
    `Masanpham` int(11) NOT NULL,
	PRIMARY KEY(`Masanpham`),
    CONSTRAINT `fk_Danhmuc_Sanpham` FOREIGN KEY (`Madanhmuc`) REFERENCES `Danhmuc`(`Madanhmuc`)
);
INSERT INTO `Sanpham` (`Phanloai`, `Giagoc`, `Phantramchietkhau`, `Madichvu`, `Ten`, `Mota`, `Kichthuoc`, `Soluongtonkho`, `Giaban`, `Masanpham`)
VALUES
('Category A', 10000, 10, 511111110, 'Product A', 'Description A', 10, 100, 9000, 1),
('Category B', 20000, 20, 511111111, 'Product B', 'Description B', 20, 200, 16000, 2),
('Category C', 30000, 30, 511111112, 'Product C', 'Description C', 30, 300, 21000, 3),
('Category A', 40000, 40, 511111113, 'Product D', 'Description D', 40, 400, 26000, 4),
('Category B', 50000, 50, 511111114, 'Product E', 'Description E', 50, 500, 31000, 5),
('Category C', 60000, 60, 511111115, 'Product F', 'Description F', 60, 600, 36000, 6),
('Category A', 70000, 70, 511111116, 'Product G', 'Description G', 70, 700, 41000, 7),
('Category B', 80000, 80, 511111117, 'Product H', 'Description H', 80, 800, 46000, 8),
('Category C', 90000, 90, 511111118, 'Product J', 'Description J', 90, 900, 51000, 9),
('Category A', 100000, 100, 511111119, 'Product K', 'Description K', 100, 1000, 56000, 10),
('Category B', 110000, 110, 5111111110, 'Product L', 'Description L', 110, 1100, 61000, 11),
('Category C', 120000, 120, 5111111111, 'Product M', 'Description M', 120, 1200, 66000, 12),
('Category A', 130000, 130, 5111111112, 'Product N', 'Description N', 130, 1300, 71000, 13),
('Category B', 140000, 140, 5111111113, 'Product O', 'Description O', 140, 1400, 76000, 14),
('Category C', 150000, 150, 5111111114, 'Product P', 'Description P', 150, 1500, 81000, 15);

CREATE TABLE `Danhmuc` (
	`Ten` VARCHAR(255) NOT NULL,
    `Phanloai` VARCHAR(255) NOT NULL,
    `Madanhmuc` int(11) NOT NULL,
    PRIMARY KEY(`Madanhmuc`)
);
INSERT INTO `Danhmuc` (`Ten`, `Phanloai`, `Madanhmuc`)
VALUES
('Sachkhoahoc', 'Category A', 1),
('TruyentranhNhatBan', 'Category A', 2),
('Vanphongpham', 'Category B', 3),
('Sachlichsu', 'Category A', 4),
('TruyentranhHanQuoc', 'Category A', 5),
('Butbi', 'Category B', 6),
('Sachvanhoa', 'Category A', 7),
('Truyenhai', 'Category A', 8),
('Gomtay', 'Category B', 9),
('Sachngonngu', 'Category C', 10),
('Truyenthieunhi', 'Category A', 11),
('Thuocke', 'Category B', 12),
('Sachnghethuat', 'Category C', 13),
('Giaotrinh', 'Category C', 14),
('Butchi', 'Category B', 15);

CREATE TABLE `Vouchergiamgia` (
	`Noidung` VARCHAR(255),
    `Phantramchietkhau` int(11) NOT NULL,
    `Thoihanapdung` DATE,
    `Giatridonhangtoithieu` int(11),
    `Magiamgia` int(11) NOT NULL,
    PRIMARY KEY(`Magiamgia`)
);
INSERT INTO `Vouchergiamgia` (`Noidung`, `Phantramchietkhau`, `Thoihanapdung`, `Giatridonhangtoithieu`, `Magiamgia`)
VALUES
('Giam10k', 10, 2023-11-01, 100, 11111111),
('Giam15k', 15, 2023-11-02, 150, 11111112),
('Giam20k', 20, 2023-11-03, 200, 11111113),
('Giam25k', 25, 2023-11-04, 250, 11111114),
('Giam30k', 30, 2023-11-05, 300, 11111115),
('Giam35k', 35, 2023-11-06, 350, 11111116),
('Giam40k', 40, 2023-11-07, 400, 11111117),
('Giam45k', 45, 2023-11-08, 450, 11111118),
('Giam50k', 50, 2023-11-09, 500, 11111119),
('Giam55k', 55, 2023-11-10, 550, 11111120),
('Giam60k', 60, 2023-11-11, 600, 11111121),
('Giam65k', 65, 2023-11-12, 650, 11111122),
('Giam70k', 70, 2023-11-13, 700, 11111123),
('Giam75k', 75, 2023-11-14, 750, 11111124),
('Giam80k', 80, 2023-11-15, 800, 11111125);

CREATE TABLE `Sohuu` (
	`Makhachhang` int(11) NOT NULL,
    `Magiamgia` int(11) NOT NULL,
    PRIMARY KEY(`Makhachhang`, `Magiamgia`),
    CONSTRAINT `fk_Khachhang_Sohuu` FOREIGN KEY (`Makhachhang`) REFERENCES `Khachhang`(`Makhachhang`),
    CONSTRAINT `fk_Vouchergiamgia_Sohuu` FOREIGN KEY (`Magiamgia`) REFERENCES `Vouchergiamgia`(`Magiamgia`)
);
INSERT INTO `Sohuu` (`Makhachhang`, `Magiamgia`)
VALUES 
(511111110, 11111111),
(511111111, 11111112),
(511111112, 11111113),
(511111113, 11111114),
(511111114, 11111115),
(511111115, 11111116),
(511111116, 11111117),
(511111117, 11111118),
(511111118, 11111119),
(511111119, 11111120),
(5111111110, 11111121),
(5111111111, 11111122),
(5111111112, 11111123),
(5111111113, 11111124),
(5111111114, 11111125);

CREATE TABLE `Apdung` (
	`Madon` int(11) NOT NULL,
    `Magiamgia` int(11) NOT NULL,
    PRIMARY KEY(`Madon`,`Magiamgia`),
    CONSTRAINT `fk_Vouchergiamgia_Apdung` FOREIGN KEY (`Magiamgia`) REFERENCES `Vouchergiamgia`(`Magiamgia`)
);
INSERT INTO `Apdung` (`Madon`, `Magiamgia`)
VALUES 
(1000011111, 11111111),
(1000011112, 11111112),
(1000011113, 11111113),
(1000011114, 11111114),
(1000011115, 11111115),
(1000011116, 11111116),
(1000011117, 11111117),
(1000011118, 11111118),
(1000011119, 11111119),
(1000011120, 11111120),
(1000011121, 11111121),
(1000011122, 11111122),
(1000011123, 11111123),
(1000011124, 11111124),
(1000011124, 11111125);