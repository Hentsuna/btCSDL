use QuanLyDeAn_DamVietTrong
/*Câu 1*/
begin 
	declare @manv varchar (5)
	declare @hoten nvarchar(35)
	declare @htnql nvarchar(35)
	declare @nv cursor;
	set @nv = cursor for
	select nv.MANV, nv.HONV + ' ' + nv.TENLOT + ' '+ nv.TENNV , nql.HONV + ' ' + nql.TENLOT + ' ' + nql.TENNV 
	from NHANVIEN nv join NHANVIEN nql on nv.MA_NQL = nql.MANV
	open @nv
	fetch next from @nv into @manv, @hoten, @htnql
	while (@@FETCH_STATUS = 0)
	begin
		print concat(N'Mã nhân viên: ' + @manv, N', Họ tên nhân viên: ' + @hoten , N', Họ tên người quản lý: ' + @htnql)
		fetch next from @nv into @manv, @hoten, @htnql
	end;
	close @nv
	deallocate @nv
end;

/*Câu 2*/
set xact_abort on
begin tran
	begin try
	insert into DEAN(MADA,TENDA,DDIEM_DA,PHONG)
	values('A4', N'Kiểm nghiệm', N'Hồ Chí Minh', 'P4')
	insert into NHANVIEN(MANV,HONV,TENLOT,TENNV,NGSINH,DCHI,PHAI,LUONG,MA_NQL,PHG)
	values ('11', N'Nguyễn', N'Hoài', N'Nguyễn', '2002-07-08', N'Hồ Chí Minh', N'Nam', '70000000', '08', 'P4')
	commit
	end try
	begin catch 
		rollback
		declare @ErrorMessage Varchar(2000)
		select @ErrorMessage = ERROR_MESSAGE()
		raiserror(@ErrorMessage, 16, 1)
	end catch

	select * from NHANVIEN
/*Câu 3*/
go
create trigger KSThoiGian
on DEAN
after update
as
begin
	update PHANCONG
	set THOIGIAN = 100
	where THOIGIAN > 100
	begin
		rollback tran
	end
end;

select * from PHANCONG
/*Câu 4*/
go
create procedure Cau4 (@manv varchar(9))
as
begin
	select HONV + ' ' + TENLOT + ' ' + TENNV as N'Họ tên nhân viên', TENPHG, Count(SODA) as N'Số lượng đề án'
	from NHANVIEN nv join PHONGBAN pb on nv.PHG = pb.MAPHG join PHANCONG pc on nv.MANV = pc.MA_NVIEN
	where @manv = MANV
	group by HONV + ' ' + TENLOT + ' ' + TENNV, TENPHG
end
drop procedure Cau4
exec Cau4 @manv = '01'

/*Câu 5*/
go
create procedure Cau5 (@maphg varchar(9))
as
begin
	select TENPHG, Count(MANV)
	from NHANVIEN nv join PHONGBAN pb on nv.PHG = pb.MAPHG join PHANCONG pc on nv.MANV = pc.MA_NVIEN
	where @maphg = MAPHG and nv.MANV not in ( select MA_NVIEN from PHANCONG)
	group by TENPHG
end
drop procedure Cau5
exec Cau5 @maphg = 'P1'