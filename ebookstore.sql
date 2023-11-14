CREATE TABLE `Donhang` (
`Ghichu` varchar(255),
`Nguoinhan` varchar(255) NOT NULL,
`Trangthai` varchar(255) NOT NULL,
`Madon` int(11) NOT NULL,
`Phivanchuyen` int(11) NOT NULL,
`Tongtien` int(11) NOT NULL,
`Thoigiangiaohangdukien` varchar(255) NOT NULL,
`Ngaytaodon` varchar(255) NOT NULL,
`Mavandon` varchar(255) NOT NULL,
`Madiachi` int(11) NOT NULL,
`Manguoidathang` int(11) NOT NULL,
`Maphuongthcthanhtoan` int(11) NOT NULL,
`Madichvuvanchuyen` int(11) NOT NULL,
`Makhachhang` int(11) NOT NULL,
`Mhuongthucvanchyen` varchar(255) NOT NULL,
PRIMARY KEY(`Madon`)
);

CREATE TABLE `Giohang` (
`Magiohang` int(11) NOT NULL,
`Sosanphamtronggio` int(11),
`Makhachhang` int(11) NOT NULL,
PRIMARY KEY(`Magiohang`)
);

CREATE TABLE `Themgiohang` (
`Magiohang` int(11) NOT NULL,
`Masanpham` int(11) NOT NULL,
`Soluong` int(11),
`Tongtien` int(11) NOT NULL,
PRIMARY KEY(`Magiohang`,`Masanpham`)
);

CREATE TABLE `Chua` (
`Madon` int(11) NOT NULL,
`Masanpham` int(11) NOT NULL,
`Soluong` int(11),
`Tongien` int(11) NOT NULL,
PRIMARY KEY(`Madon`,`Masanpham`)
);


