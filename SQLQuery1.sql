create table PhongBan(
	maphong int primary key,
	tenphong nvarchar(40),
);

create table Nhanvien(
	manhanvien int primary key,
	tennhanvien nvarchar(40),
	ngaysinh datetime,
	luong int,
	hinhanh nvarchar(max),
	maphong int foreign key references PhongBan(maphong),
);

