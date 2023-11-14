CREATE TABLE `Sanpham` (
	`Phanloai` VARCHAR(255) NOT NULL,
    `Giagoc` int(11) NOT NULL,
    `Phantramchietkhau` int(11) NOT NULL,
    `Madichvu` int(11) NOT NULL,
    `Ten` VARCHAR(255) NOT NULL,
    `Mota` VARCHAR(255) NOT NULL,
    `Kichthuoc` int(11) NOT NULL,
    `Soluongtonkho` int(11) NOT NULL,
    `Giaban` int(11) NOT NULL,
    `Masanpham` int(11) NOT NULL,
	PRIMARY KEY(`Masanpham`)
);
CREATE TABLE `Danhmuc` (
	`Ten` VARCHAR(255) NOT NULL,
    `Phanloai` VARCHAR(255) NOT NULL,
    `Madanhmuc` int(11) NOT NULL,
    `Madanhmuccha` int(11),
    PRIMARY KEY(`Madanhmuc`)
);
CREATE TABLE `Vouchergiamgia` (
	`Noidung` VARCHAR(255),
    `Phantramchietkhau` int(11) NOT NULL,
    `Thoihanapdung` int(11),
    `Giatridonhangtoithieu` int(11),
    `Magiamgia` int(11) NOT NULL,
    PRIMARY KEY(`Magiamgia`)
);
CREATE TABLE `Sohuu` (
	`Makhachhang` int(11) NOT NULL,
    `Magiamgia` int(11) NOT NULL,
    PRIMARY KEY(`Makhachhang`,`Magiamgia`)
);
CREATE TABLE `Apdung` (
	`Madon` int(11) NOT NULL,
    `Magiamgia` int(11) NOT NULL,
    PRIMARY KEY(`Madon`,`Magiamgia`)
);