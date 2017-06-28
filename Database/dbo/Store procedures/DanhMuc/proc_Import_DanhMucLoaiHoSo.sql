CREATE PROCEDURE [dbo].[proc_Import_DanhMucLoaiHoSo]
	@AllowAdd bit ,
	@AllowUpdate bit,
	@MaLoaiHoSo nvarchar(1000) ,
	@TenLoaiHoSo nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaLoaiHoSo FROM DANHMUC_LOAIHOSO NOLOCK WHERE MaLoaiHoSo = @MaLoaiHoSo) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN			
		update DANHMUC_LOAIHOSO set TenLoaiHoSo = @TenLoaiHoSo,Active = @Active where MaLoaiHoSo = @MaLoaiHoSo
				set @ResultString='UpdateOK'
				select @ResultString
				return			
		END
		ELSE
		BEGIN
				set @ResultString=N'Không được cập nhật'
				select @ResultString
				return
		END
	END
	ELSE
	BEGIN
		if (@AllowAdd = 1)
		BEGIN
			insert into DANHMUC_LOAIHOSO(MaLoaiHoSo,TenLoaiHoSo,Active) values(@MaLoaiHoSo,@TenLoaiHoSo,@Active)
			set @ResultString='AddOK'
			select @ResultString
			return			
		END
		ELSE
		BEGIN
			set @ResultString=N'Không được thêm mới'
			select @ResultString
			return
		END
	END
	
END

GO

