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
 PRIMARY KEY(`Madichvu`,`Tinhthanh`),
 CONSTRAINT `fk_Tinhthanh` FOREIGN KEY(`Madichvu`) REFERENCES Nhacungcapdichvuvanchuyen(`Madichvu`)
);

CREATE TABLE `Phuongthucvanchuyen` (
 `Madichvu` int(11) NOT NULL,
 `Phuongthucvanchuyen` varchar(255) NOT NULL,
 PRIMARY KEY(`Madichvu`,`Phuongthucvanchuyen`),
 CONSTRAINT `fk_Phuongthucvanchuyen` FOREIGN KEY(`Madichvu`) REFERENCES Nhacungcapdichvuvanchuyen(`Madichvu`)
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
 PRIMARY KEY(`Masanpham`),
 CONSTRAINT `fk_Sach` FOREIGN KEY(`Masanpham`) REFERENCES Sanpham(`Masanpham`)
);

INSERT INTO `Phuongthucthanhtoan`(`Maphuongthuc`,`Ten`) VALUES
(111111110,'Theghino'),
(111111111,'Vidientu'),
(111111112,'Vidientu'),
(111111113,'Vidientu'),
(111111114,'Chuyenkhoannganhang'),
(111111115,'COD'),
(111111116,'Chuyenkhoannganhang'),
(111111117,'Theghino'),
(111111118,'Chuyenkhoannganhang'),
(111111119,'COD'),
(1111111110,'COD'),
(1111111111,'Chuyenkhoannganhang'),
(1111111112,'Vidientu'),
(1111111113,'Theghino'),
(1111111114,'Chuyenkhoannganhang')

;

INSERT INTO `Nhacungcapdichvuvanchuyen`(`Madichvu`,`Ten`) VALUES
(511111110,'Giaohangtietkiem'),
(511111111,'Buudien'),
(511111112,'Giaohangnhanh'),
(511111113,'Viettelpost'),
(511111114,'Ninja Van'),
(511111115,'Viettelpost'),
(511111116,'Giaohangtietkiem'),
(511111117,'Buudien'),
(511111118,'Giaohangnhanh'),
(511111119,'Giaohangnhanh'),
(5111111110,'Viettelpost'),
(5111111111,'Viettelpost'),
(511111112,'Giaohangtietkiem'),
(511111113,'Ninja Van'),
(511111114,'Giaohangnhanh')
 ;

INSERT INTO `Tinhthanh`(`Madichvu`,`Tinhthanh`) VALUES
(511111110,'TPHCM'),
(511111111,'Longan'),
(511111112,'Hanoi'),
(511111113,'Binhduong'),
(511111114,'Dongnai'),
(511111115,'Tayninh'),
(511111116,'Lamdong'),
(511111117,'QuangNgai'),
(511111118,'Thanhhoa'),
(511111119,'TPHCM'),
(5111111110,'Dongnai'),
(5111111111,'Tayninh'),
(5111111112,'Binhduong'),
(5111111113,'Longan'),
(5111111114,'Quangngai'),

();



INSERT INTO `Phuongthucvanchuyen`(`Maphuongthuc`,`Phuongthucvanchuyen`) VALUES
(111111110,'Nhanh'),
(111111111,'Hoatoc'),
(111111112,'Tietkiem'),
(111111113,'Nhanh'),
(111111114,'Hoatoc'),
(111111115,'Tietkiem'),
(111111116,'Nhanh'),
(111111117,'Hoatoc'),
(111111118,'Tietkiem'),
(111111119,'Nhanh'),
(1111111110,'Hoatoc'),
(1111111111,'Tietkiem'),
(1111111112,'Nhanh'),
(1111111113,'Hoatoc'),
(1111111114,'Tietkiem')
;


INSERT INTO `Seriessach`(`Maseries`,`Ten`,`Soluongtuasach`) VALUES
(11,'Kinh te',233),
(12,'Tamly',290),
(13,'Congnghethongtin',140),
(14,'Tongiao',180)

;

INSERT INTO `Sach`(`Masanpham`,`Nhaxuatban`,`Tacgia`,`Bia`) VALUES
(111,'Nhaxuatbantre','Nguyennhatanh','Biacung'),
(112,'Nhaxuatbanthegioi','Ketoanviahe','Biamem'),
(113,'Nhaxuatbanlaodong','Philytri','Biacung')
;



