use QuanLyDeAn_DamVietTrong
begin
	declare @manv varchar(9)
	declare @hoten nvarchar(35)
	declare @tphong nvarchar(20)
	declare @nv cursor;
	set @nv = cursor for
	select MANV, HONV + ' ' + TENLOT + ' '+ TENNV as N'Họ tên NV', TENPHG
	from NHANVIEN nv join PHONGBAN pb on nv.PHG = pb.MAPHG
	open @nv
	fetch next from @nv into @manv, @hoten, @tphong
	while (@@FETCH_STATUS = 0)
	begin
		print concat(N'Mã nhân viên: ' + @manv, N', Họ tên: ' + @hoten , N', Tên phòng: ' + @tphong)
		fetch next from @nv into @manv, @hoten, @tphong
	end;
	close @nv
	deallocate @nv
end;

go
set xact_abort on
begin tran
	begin try
	insert into NHANVIEN
	values ('NV11', N'Nguyễn', N'Trần Nhật', N'Anh', 
	'1995-08-07', N'02 Nguyễn Đình Chiểu Nha Trang', N'Nữ', '60000000',
	'NV10', '03')
	insert into THANNHAN
	values ('NV11', N'Nguyễn Trần Nhật Bản', '1990-07-03', N'Nữ', N'Chị gái')
	commit
	end try
	begin catch 
		rollback
		declare @ErrorMessage Varchar(2000)
		select @ErrorMessage = ERROR_MESSAGE()
		raiserror(@ErrorMessage, 16, 1)
	end catch

go
alter trigger KSLuong
on NHANVIEN
after insert
as
begin
	update NHANVIEN
	set LUONG = 50000000
	where LUONG > 50000000 AND MANV IN (SELECT MANV FROM inserted)
end;

go
update NHANVIEN
set LUONG = 70000000
where MANV = '08'

select * from NHANVIEN
insert into NHANVIEN(MANV, LUONG)
values ('11', 60000000)

delete from NHANVIEN
where MANV = '11'
