CREATE TABLE `Phuongthucthanhtoan` (
 `Maphuongthuc` int(11) NOT NULL,
 `Ten` varchar(255) NOT NULL,
 PRIMARY KEY(`Maphuongthuc`)
);

CREATE TABLE `Nhacungcapdichvuvanchuyen` (
 `Madichvu` int(11) NOT NULL,
 `Ten` varchar(255) NOT NULL,
 PRIMARY KEY(`Madichvu`)
);

CREATE TABLE `Tinhthanh` (
 `Madichvu` int(11) NOT NULL,
 `Tinhthanh` varchar(255) NOT NULL,
 PRIMARY KEY(`Madichvu`,`Tinhthanh`)
);

CREATE TABLE `Phuongthucvanchuyen` (
 `Madichvu` int(11) NOT NULL,
 `Phuongthucvanchuyen` varchar(255) NOT NULL,
 PRIMARY KEY(`Madichvu`,`Phuongthucvanchuyen`)
);

CREATE TABLE `Seriessach` (
  `Maseries` int(11) NOT NULL,
  `Ten` varchar(255) NOT NULL,
  `Soluongtuasach` int(11),
  PRIMARY KEY(`Maseries`)
);

CREATE TABLE `Sach` (
 `Masanpham` int(11) NOT NULL,
 `Nhaxuatban` varchar(255) NOT NULL,
 `Tacgia` varchar(255) NOT NULL,
 `Bia` varchar(255) NOT NULL,
 PRIMARY KEY(`Masanpham`)
);