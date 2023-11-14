CREATE TABLE `Khachhang` (
`Makhachhang` int(11) NOT NULL,
`Hoten` varchar(255) NOT NULL,
`Gioitinh` varchar(255) NOT NULL,
`Ngaysinh` int(11) NOT NULL,
`Tennguoimua` varchar(255),
`Emailnhanhoadon` varchar(255) NOT NULL,
`Masothue` int(11) ,
`Tencongty` varchar(255),
`Magiohang` int(11),
PRIMARY KEY(`Makhachhang`)
);

CREATE TABLE `Sodienthoai` (
`Makhachhang` int(11) ,
`Sodienthoai` int(11) ,
PRIMARY KEY(`Makhachhang`,`Sodienthoai`)
);

CREATE TABLE `Email` (
`Makhachhang` int(11) ,
`Email` varchar(255) ,
PRIMARY KEY(`Makhachhang`,`Email`)
);

CREATE TABLE `Vanphongpham` (
`Masanpham` int(11) ,
`Thuonghieu` varchar(255) NOT NULL,
`Xuatxu` varchar(255) NOT NULL,
`Dotuoisudung` int(11) NOT NULL,
PRIMARY KEY(`Masanpham`)
);

CREATE TABLE `Diachi` (
`Makhachhang` int(11) NOT NULL,
`Madiachi` int(11) NOT NULL,
`Tinh_TP` varchar(255) NOT NULL,
`Quan_huyen` varchar(255) NOT NULL,
`Xa_phuong` varchar(255) NOT NULL,
`Sonha` int(11) NOT NULL,
`Tenduong` int(11) NOT NULL,
`Macdinh` boolean ,
PRIMARY KEY(`Makhachhang`,`Madiachi`)
);