Create database QuanLyDeAn_DamVietTrong
use QuanLyDeAn_DamVietTrong

CREATE TABLE NHANVIEN
	(
	 MANV		varchar(9) PRIMARY KEY
	 ,HONV		nvarchar(15)
	 ,TENLOT	nvarchar(30)
	 ,TENNV		nvarchar(30)
	 ,NGSINH	smalldatetime
	 ,DCHI		nvarchar(150)
	 ,PHAI		nvarchar(3)
	 ,LUONG		numeric(18,0)
	 ,MA_NQL	varchar(9)
	 ,PHG		varchar(2)
	 );

CREATE TABLE DEAN
(
	MADA	varchar(2)	PRIMARY KEY
	,TENDA	nvarchar(50)
	,DDIEM_DA	nvarchar(20)
	,PHONG	varchar(2)
	);

CREATE TABLE PHONGBAN
(
	MAPHG	varchar(2)	PRIMARY KEY
	,TENPHG	nvarchar(20)
	,TRPHG	varchar(9)
	,NG_NHANCHUC	smalldatetime
	,FOREIGN KEY (TRPHG) REFERENCES NHANVIEN(MANV)
	);

CREATE TABLE DIADIEM_PHG
(
	MAPHG	varchar(2)
	,DIADIEM	nvarchar(20)
	,PRIMARY KEY(MAPHG, DIADIEM)
	,FOREIGN KEY (MAPHG) REFERENCES PHONGBAN(MAPHG)
	);

CREATE TABLE THANNHAN
(
	MA_NVIEN	varchar(9)
	,TENTN		nvarchar(20)
	,NGSINH		smalldatetime
	,PHAI		nvarchar(3)
	,QUANHE		nvarchar(25)
	,PRIMARY KEY(MA_NVIEN, TENTN)
	,FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN(MANV)
	);

CREATE TABLE PHANCONG
(
	MA_NVIEN	varchar(9)
	,SODA		varchar(2)
	,THOIGIAN	numeric(18,0)
	,PRIMARY KEY(MA_NVIEN, SODA)
	,FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN(MANV)
	,FOREIGN KEY (SODA) REFERENCES DEAN(MADA)
	);

ALTER TABLE NHANVIEN
	ADD FOREIGN KEY(MA_NQL) REFERENCES NHANVIEN(MANV);

ALTER TABLE NHANVIEN
	ADD FOREIGN KEY(PHG) REFERENCES PHONGBAN(MAPHG);

INSERT INTO DEAN(MADA,TENDA,DDIEM_DA,PHONG)
VALUES('A1',N'Xây chung cư',N'Nha Trang','P1'),
('A2',N'Thiết kế chung cư',N'Nha Trang','P2'),
('A3',N'Thu mua vật liệu xây',N'Nha Trang','P3'),
('A4',N'Quảng cáo chung cư',N'Hồ Chí Minh','P4'),
('A5',N'Sản xuất vật liệu xây',N'Hồ Chí Minh','P5'),
('A6',N'Tuyển bảo an xây dựng',N'Hà Nội','P6'),
('A7',N'Tuyển nhân công xây dựng',N'Hà Nội','P7'),
('A8',N'Tuyển nhân công đọc',N'Hà Nội','P8'),
('A9',N'Tuyển nhân công đào móng',N'Hà Nội','P9'),
('B1',N'Tuyển nhân công trộn',N'Hà Nội','PA'),
('B2',N'Tuyển nhân công hàn',N'Hà Nội','PB'),
('B3',N'Tuyển nhân công sơn',N'Hà Nội','PC'),
('B4',N'Tuyển nhân công đắp',N'Hà Nội','PD'),
('B5',N'Tuyển nhân công động',N'Hà Nội','PE'),
('B6',N'Khảo sát',N'Hà Nội','PF'),
('B7',N'Thuyết phục',N'Hà Nội','PG'),
('B8',N'Tuyển nhân viên căntin',N'Hà Nội','PH'),
('B9',N'Coca',N'Hà Nội','PI'),
('C1',N'Pepsi',N'Hà Nội','PK'),
('C2',N'Mirinda',N'Hà Nội','PL');

INSERT INTO NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,DCHI,PHAI,LUONG,MA_NQL)
VALUES('01',N'Phùng',N'Nhất',N'Bình','1980-07-25',N'Nha Trang','Nam','500000000','01'),
('02',N'Đỗ',N'Lương',N'Tài','2001-05-10',N'Nha Trang','Nam','100000000','01'),
('03',N'Đan',N'Bảo',N'Trúc','2000-11-13',N'Nha Trang',N'Nữ','50000000','01'),
('04',N'Mục',N'Tuấn',N'Châu','2002-07-21',N'Phú Yên','Nam','100000000','01'),
('05',N'Tuấn',N'Thăng',N'Long','2000-03-15',N'Phú Yên','Nam','50000000','01'),
('06',N'Châu',N'Giáng',N'Tiên','2000-04-17',N'Phú Yên',N'Nữ','50000000','01'),
('07',N'Điêu',N'Kiều',N'Diễm','1990-01-11',N'Nha Trang',N'Nữ','100000000','01'),
('08',N'Ninh',N'Tùng',N'Anh','2000-04-22',N'Nha Trang','Nam','50000000','01'),
('09',N'Ung',N'Yên',N'Bình','1995-11-25',N'Nha Trang','Nam','50000000','01'),
('10',N'Ấu',N'Minh',N'Dân','1982-07-01',N'Hồ Chí Minh','Nam','500000000','10'),
('11',N'Lương',N'Hoàng',N'Anh','1980-03-11',N'Hồ Chí Minh',N'Nữ','100000000','10'),
('12',N'Phan',N'Nguyệt',N'Ánh','2000-01-12',N'Hồ Chí Minh',N'Nữ','80000000','10'),
('13',N'Lê',N'Hữu',N'Đạt','2003-11-25',N'Hồ Chí Minh','Nam','100000000','10'),
('14',N'Võ',N'Huy',N'Hùng','1995-11-11',N'Hồ Chí Minh','Nam','80000000','10'),
('15',N'Mai',N'Hoàng',N'Khương','1990-03-22',N'Hồ Chí Minh','Nam','80000000','10'),
('16',N'Cao',N'Hoài',N'Nam','1992-01-11',N'Hà Nội','Nam','500000000','16'),
('17',N'Trần',N'Thanh',N'Thân','2000-10-11',N'Hà Nội',N'Nữ','100000000','16'),
('18',N'Bùi',N'Hữu',N'Thắng','2001-05-22',N'Hà Nội','Nam','20000000','16'),
('19',N'Nguyễn',N'Nhất',N'Tâm','1998-11-24',N'Hà Nội','Nam','100000000','16'),
('20',N'Huỳnh',N'Tấn',N'Đạt','1999-03-02',N'Hà Nội','Nam','20000000','16'),
('21',N'Nguyễn',N'Hoàng',N'Việt','2003-02-15',N'Hà Nội','Nam','20000000','16');

INSERT INTO PHANCONG(MA_NVIEN,SODA,THOIGIAN)
VALUES('01','A1','2160'),
('02','A1','2160'),
('03','A1','2160'),
('04','A2','50'),
('05','A2','50'),
('06','A2','50'),
('07','A3','1000'),
('08','A3','1000'),
('09','A3','1000'),
('10','A4','1900'),
('11','A4','1900'),
('12','A4','1900'),
('13','A5','2200'),
('14','A5','2200'),
('15','A5','2200'),
('16','A6','168'),
('17','A6','168'),
('18','A6','168'),
('19','A7','100'),
('20','A7','100'),
('21','A7','10');

INSERT INTO THANNHAN(MA_NVIEN,TENTN,NGSINH,PHAI,QUANHE)
VALUES('01',N'Linh','1980-03-22','Nam','Ba'),
('01',N'Hoàn','1981-05-17',N'Nữ',N'Mẹ'),
('02',N'Yến','1972-02-11',N'Nữ',N'Mẹ'),
('03',N'Phú','1975-05-22',N'Nam',N'Ba'),
('04',N'Tùng','1980-09-12','Nam','Ba'),
('04',N'Hương','1977-08-10',N'Nữ','Mẹ'),
('05',N'Minh','1990-02-20',N'Nam','Ba'),
('06',N'Hoa','2003-09-03',N'Nữ',N'Em gái'),
('07',N'Hiếu','2001-06-15',N'Nam',N'Anh trai'),
('08',N'Huy','2003-06-12',N'Nam',N'Em trai'),
('09',N'Như','2000-12-25',N'Nữ',N'Em gái'),
('10',N'Mỹ','1972-09-07',N'Nữ',N'Mẹ'),
('11',N'My','1990-04-03',N'Nữ',N'Chị gái'),
('12',N'Hùng','1969-11-05',N'Nam',N'Ba'),
('13',N'Nguyễn','1974-09-11',N'Nam',N'Ba'),
('14',N'Bảo','1977-06-15',N'Nữ',N'Mẹ'),
('15',N'Hải','1982-09-22',N'Nam',N'Ba'),
('16',N'Hoan','1971-10-14',N'Nữ',N'Mẹ'),
('17',N'Nga','1970-06-01',N'Nữ',N'Mẹ'),
('18',N'Quốc','1968-04-03',N'Nam',N'Ba'),
('19',N'Trường','1970-12-11',N'Nam',N'Ba'),
('20',N'Thảo','1979-01-15',N'Nữ',N'Mẹ'),
('21',N'Tâm','1975-05-11',N'Nữ',N'Mẹ');

INSERT INTO PHONGBAN(MAPHG, TENPHG, TRPHG, NG_NHANCHUC)
VALUES('P1',N'Xây dựng','02','2020-04-15'),
('P2',N'Thiết kế','04','2020-03-25'),
('P3',N'Thu mua vật liệu','07','2020-11-23'),
('P4',N'Tuyên truyền','11','2022-06-23'),
('P5',N'Sản xuất','13','2022-06-23'),
('P6',N'Bảo an','17','2019-10-11'),
('P7',N'Nhân sự','19','2019-11-23'),
('P8',N'Phòng 8','19','2019-11-23'),
('P9',N'Phòng 9','19','2019-11-23'),
('PA',N'Phòng 10','19','2019-11-23'),
('PB',N'Phòng 11','19','2019-11-23'),
('PC',N'Phòng 12','19','2019-11-23'),
('PD',N'Phòng 13','19','2019-11-23'),
('PE',N'Phòng 14','19','2019-11-23'),
('PF',N'Phòng 15','19','2019-11-23'),
('PG',N'Phòng 16','19','2019-11-23'),
('PH',N'Phòng 17','19','2019-11-23'),
('PI',N'Phòng 18','19','2019-11-23'),
('PK',N'Phòng 19','19','2019-11-23'),
('PL',N'Phòng 20','19','2019-11-23');

INSERT INTO DIADIEM_PHG(MAPHG,DIADIEM)
VALUES('P1',N'Nha Trang'),
('P2',N'Phú Yên'),
('P3',N'Nha Trang'),
('P4',N'Hồ Chí Minh'),
('P5',N'Hồ Chí Minh'),
('P6',N'Hà Nội'),
('P7',N'Hà Nội'),
('P8',N'CS1, Hà Nội'),
('P9',N'CS1, Hà Nội'),
('PA',N'CS2, Hà Nội'),
('PB',N'CS2, Hà Nội'),
('PC',N'CS2, Hà Nội'),
('PD',N'CS2, Hà Nội'),
('PE',N'CS2, Hà Nội'),
('PF',N'CS2, Hà Nội'),
('PG',N'CS2, Hà Nội'),
('PH',N'CS2, Hà Nội'),
('PI',N'CS2, Hà Nội'),
('PK',N'CS2, Hà Nội'),
('PL',N'CS2, Hà Nội');

update NHANVIEN
set PHG = 'P7'
where MANV = '21';

select * from NHANVIEN
select * from DEAN
select * from PHONGBAN
select * from DIADIEM_PHG
select * from THANNHAN
select * from PHANCONG
begin 
	declare @max int;
	select @max = MAX(LUONG)
	from NHANVIEN
	select *
	from NHANVIEN
	where LUONG = @max
end;

go
CREATE PROCEDURE cau4(@maphg varchar(2), @tenphg nvarchar(20) output, @sl int output)
AS
BEGIN
	SELECT @tenphg = TENPHG, @sl = count(nql.PHG)
	from NHANVIEN nv
	join PHONGBAN pb on nv.PHG = pb.MAPHG
	join NHANVIEN nql on nv.MA_NQL = nql.MANV
	where pb.MAPHG = @maphg 
	group by TENPHG;
end;

begin
	declare @tp nvarchar(20)
	declare @slg int
	exec dbo.cau4 'P1',@tp output, @slg output
	print @tp + ', ' + convert(varchar, @slg);
end;

go
CREATE FUNCTION cau5(@manv varchar(9)) returns nvarchar(35)
AS
BEGIN
	DECLARE @soluong int;
	DECLARE @hotentp nvarchar(35);
	DECLARE @sl int;
	SELECT COUNT(pc1.SODA)
	from PHANCONG pc1 , PHANCONG pc2
	where pc1.MA_NVIEN = pc2.MA_NVIEN and 
	SELECT @hotentp = nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ,@soluong = MAX(pc.SODA)
	from NHANVIEN nv
	join PHANCONG pc on nv.MANV = pc.MA_NVIEN
	join PHONGBAN pb on nv.MANV = pb.TRPHG
	where nv.manv = @manv
	group by HONV, TENLOT, TENNV 
	RETURN @hotentp;
end;
drop function cau5
print dbo.cau5('01');