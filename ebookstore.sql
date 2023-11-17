CREATE TABLE `Donhang` (
`Ghichu` varchar(255),
`Nguoinhan` varchar(255) NOT NULL,
`Trangthai` varchar(255) NOT NULL,
`Madon` int(11) NOT NULL,
`Phivanchuyen` int(11) NOT NULL,
`Tongtien` int(11) NOT NULL,
`Thoigiangiaohangdukien` date NOT NULL,
`Ngaytaodon` datetime NOT NULL,
`Mavandon` varchar(255) NOT NULL,
`Madiachi` varchar(255) NOT NULL,
`Maphuongthucthanhtoan` int(11) NOT NULL,
`Madichvuvanchuyen` int(11) NOT NULL,
`Makhachhang` int(11) NOT NULL,
`Phuongthucvanchuyen` varchar(255) NOT NULL,
`Manguoidathang` int(11) NOT NULL,
PRIMARY KEY(`Madon`),
CONSTRAINT `fk_Khachhang_Donhang` FOREIGN KEY (`Makhachhang`) REFERENCES `Khachhang`(`Makhachhang`),
CONSTRAINT `fk_Diachi_Donhang` FOREIGN KEY (`Madiachi`) REFERENCES `Diachi`(`Madiachi`),
CONSTRAINT `fk_Diachia_Donhang` FOREIGN KEY (`Manguoidathang`) REFERENCES `Diachi`(`Makhachhang`),
CONSTRAINT `fk_Phuongthucthanhtoan_Donhang` FOREIGN KEY (`Maphuongthucthanhtoan`) REFERENCES `Phuongthucthanhtoan`(`Maphuongthuc`),
CONSTRAINT `fk_Nhacungcapdichvuvanchuyen_Donhang` FOREIGN KEY (`Madichvvuvanchuyen`) REFERENCES `Nhacungcapdichvuvanchuyen`(`Madichvu`)

);
INSERT INTO `Donhang`(`Ghichu`,`Nguoinhan`,`Trangthai`,`Madon`,`Phivanchuyen`,`Tongtien`,`Thoigiangiaohangdukien`,`Ngaytaodon`,`Mavandon`,`Madiachi`,`Maphuongthucthanhtoan`.`Madichvuvanchuyen`,`Makhachhang`,`Phuongthucvanchuyen`,`Manguoidathang`)
VALUES
(`Khongco`,`Nguyenvana`,`Choxacnhan`,1000011111,19,1400000,`2023-11-20`,`2023-11-17 14:12:08`,1100011233,`Hochiminh`,111111110,511111110,1,`Nhanh`,1),
(`NoteA`,`Nguyenvanb`,`Danggiao`,1000011112,17,1500000,`2023-11-19`,`2023-11-16 14:10:00`,1100011234,`Hanoi`,111111111,511111111,2,`Tietkiem`,2),
(`NoteB`,`Nguyenvanc`,`Dagiao`,1000011113,18,16000000,`2023-11-22`,`2023-11-11 11:12:08`,1100011235,`Bacgiang`,111111112,511111113,3,`Hoatoc`,3);

CREATE TABLE `Giohang` (
`Magiohang` int(11) NOT NULL,
`Sosanphamtronggio` int(11),
`Makhachhang` int(11) NOT NULL,
PRIMARY KEY(`Magiohang`),
CONSTRAINT `fk_Khachhang_Giohang` FOREIGN KEY (`Makhachhang`) REFERENCES `Khachhang`(`Makhachhang`)
);

INSERT INTO `Giohang`(`Magiohang`,`Sosanphamtronggio`,`Makhachhang`) 
VALUES
(1,1,1),
(2,2,2),
(3,3,3);

CREATE TABLE `Themgiohang` (
`Magiohang` int(11) NOT NULL,
`Masanpham` int(11) NOT NULL,
`Soluong` int(11),
`Tongtien` int(11) NOT NULL,
PRIMARY KEY(`Magiohang`,`Masanpham`),
CONSTRAINT `fk_Giohang_Themgiohang` FOREIGN KEY (`Magiohang`) REFERENCES `Giohang`(`Magiohang`),
CONSTRAINT `fk_Sanpham_Themgiohang` FOREIGN KEY (`Masanpham`) REFERENCES `Sanpham`(`Masanpham`)
);

INSERT INTO `Themgiohang`(`Magiohang`,`Masanpham`,`Soluong`,`Tongtien`)
VALUES
(1,10,1,1400000),
(2,11,3,1410000),
(3,9,5,15000000);

CREATE TABLE `Chua` (
`Madon` int(11) NOT NULL,
`Masanpham` int(11) NOT NULL,
`Soluong` int(11),
`Tongien` int(11) NOT NULL,
PRIMARY KEY(`Madon`,`Masanpham`),
CONSTRAINT `fk_Giohang_Chua` FOREIGN KEY(`Madon`) REFERENCES `Donhang`(`Madon`),
CONSTRAINT `fk_Sanpham_Chua` FOREIGN KEY(`Masanpham`) REFERENCES `Sanpham`(`Masanpham`)
);

INSERT INTO `Chua`(`Madon`,`Masanpham`,`Soluong`,`Tongtien`)
VALUES
(1000011111,10,1,14000000),
(1000011112,11,3,14100000),
(1000011113,22,5,15000000);

