use QuanLyDeAn_DamVietTrong
/*Câu 1*/
begin
	declare @maphg nvarchar (20)
	declare @hotentp nvarchar(35)
	declare @sldd int
	declare @cursor cursor;
	set @cursor = cursor for
	select TENPHG, HONV + ' ' + TENLOT + ' ' + TENNV, Count(DDIEM_DA)
	from PHONGBAN pb inner join NHANVIEN nv on pb.TRPHG = nv.MANV
			join DEAN da on pb.MAPHG = da.PHONG
	group by TENPHG, HONV, TENLOT, TENNV
	open @cursor
	fetch next from @cursor into @maphg, @hotentp, @sldd
	while (@@FETCH_STATUS = 0)
	begin
		print concat(N'Tên phòng: ' + @maphg, N', Họ tên trưởng phòng: ' + @hotentp , N', Số lượng địa điểm: ' + @sldd)
		fetch next from @cursor into @maphg, @hotentp, @sldd
	end;
	close @cursor
	deallocate @cursor
end;

/*Câu 2*/
set xact_abort on
begin tran
	begin try
		update NHANVIEN
		set PHG = 'P2'
		where MANV = '666' and PHG = 'P1';
		update NHANVIEN
		set PHG = 'P2'
	commit
	end try
	begin catch 
		rollback
		declare @ErrorMessage Varchar(2000)
		select @ErrorMessage = ERROR_MESSAGE()
		raiserror(@ErrorMessage, 16, 1)
	end catch

/*Câu 3*/
go
create trigger KS
on PHANCONG
after insert, update
as
begin
	if(
	select count(SODA)
	where SODA > 3
	)
	begin
		rollback tran
	end
end;

/*Câu 4*/
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
/*Câu 5*/
go
CREATE FUNCTION cau5(@manv varchar(9)) returns nvarchar(35)
AS
BEGIN
	DECLARE @soluong int;
	DECLARE @hotentp nvarchar(35);
	SELECT @hotentp = nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV ,@soluong = MAX(pc.soda)
	from NHANVIEN nv
	join PHANCONG pc on nv.MANV = pc.MA_NVIEN
	join PHONGBAN pb on nv.MANV = pb.TRPHG
	where nv.manv = @manv
	group by HONV, TENLOT, TENNV
	RETURN @hotentp;
end;
go
print dbo.cau5('01');
