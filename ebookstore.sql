CREATE TABLE
    `Khachhang` (
        `Makhachhang` int(11) NOT NULL,
        `Hoten` varchar(255) NOT NULL,
        `Gioitinh` varchar(255) NOT NULL,
        `Ngaysinh` int(11) NOT NULL,
        `Tennguoimua` varchar(255),
        `Emailnhanhoadon` varchar(255) NOT NULL,
        `Masothue` int(11),
        `Tencongty` varchar(255),
        `Magiohang` int(11),
        PRIMARY KEY (`Makhachhang`)
    );

INSERT INTO `Khachhang` (`Makhachhang`, `Hoten`, `Gioitinh`, `Ngaysinh`, `Tennguoimua`, `Emailnhanhoadon`, `Masothue`, `Tencongty`, `Magiohang`)
VALUES 
(1, 'Nguyen Van A', 'Nam', 19900101, 'Nguyen Van A', 'nva@gmail.com', 123456, 'Cong ty ABC', 1),
(2, 'Tran Thi B', 'Nu', 19900202, 'Tran Thi B', 'ttb@gmail.com', 234567, 'Cong ty XYZ', 2),
(3, 'Le Van C', 'Nam', 19900303, 'Le Van C', 'lvc@gmail.com', 345678, 'Cong ty DEF', 3);

CREATE TABLE
    `Sodienthoai` (
        `Makhachhang` int(11),
        `Sodienthoai` bigint(11),
        PRIMARY KEY (`Sodienthoai`),
        FOREIGN KEY (`Makhachhang`) REFERENCES `Khachhang` (`Makhachhang`)
    );

INSERT INTO `Sodienthoai` (`Makhachhang`, `Sodienthoai`)
VALUES 
(1, 1234567890),
(2, 2345678901),
(3, 3456789012);

CREATE TABLE
    `Email` (
        `Makhachhang` int(11),
        `Email` varchar(255),
        PRIMARY KEY (`Email`),
        FOREIGN KEY (`Makhachhang`) REFERENCES `Khachhang` (`Makhachhang`)
    );

INSERT INTO `Email` (`Makhachhang`, `Email`)
VALUES 
(1, 'nguyenvana@example.com'),
(2, 'tranb@example.com'),
(3, 'levanc@example.com');


CREATE TABLE 
    `Sanpham` (
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

INSERT INTO `Sanpham` (`Phanloai`, `Giagoc`, `Phantramchietkhau`, `Madichvu`, `Ten`, `Mota`, `Kichthuoc`, `Soluongtonkho`, `Giaban`, `Masanpham`)
VALUES 
('Category A', 10000, 10, 1, 'Product A', 'Description A', 10, 100, 9000, 1),
('Category B', 20000, 20, 2, 'Product B', 'Description B', 20, 200, 16000, 2),
('Category C', 30000, 30, 3, 'Product C', 'Description C', 30, 300, 21000, 3);

CREATE TABLE
    `Vanphongpham` (
        `Masanpham` int(11),
        `Thuonghieu` varchar(255) NOT NULL,
        `Xuatxu` varchar(255) NOT NULL,
        `Dotuoisudung` int(11) NOT NULL,
        PRIMARY KEY (`Masanpham`),
        FOREIGN KEY (`Masanpham`) REFERENCES `Sanpham` (`Masanpham`)
    );

INSERT INTO `Vanphongpham` (`Masanpham`, `Thuonghieu`, `Xuatxu`, `Dotuoisudung`)
VALUES 
(1, 'Brand A', 'Vietnam', 18),
(2, 'Brand B', 'USA', 12),
(3, 'Brand C', 'China', 6);


CREATE TABLE
    `Diachi` (
        `Makhachhang` int(11) NOT NULL,
        `Madiachi` int(11) NOT NULL,
        `Tinh_TP` varchar(255) NOT NULL,
        `Quan_huyen` varchar(255) NOT NULL,
        `Xa_phuong` varchar(255) NOT NULL,
        `Sonha` int(11) NOT NULL,
        `Tenduong` int(11) NOT NULL,
        `Macdinh` boolean,
        PRIMARY KEY (`Madiachi`),
        FOREIGN KEY (`Makhachhang`) REFERENCES `Khachhang` (`Makhachhang`)
    );

INSERT INTO `Diachi` (`Makhachhang`, `Madiachi`, `Tinh_TP`, `Quan_huyen`, `Xa_phuong`, `Sonha`, `Tenduong`, `Macdinh`)
VALUES 
(1, 1, 'Hanoi', 'Dong Da', 'O Cho Dua', 123, 'Nguyen Luong Bang', true),
(2, 2, 'Ho Chi Minh City', 'District 1', 'Ben Nghe', 456, 'Dong Khoi', true),
(3, 3, 'Da Nang', 'Hai Chau', 'Thach Thang', 789, 'Bach Dang', true);