CREATE PROCEDURE [dbo].[proc_Import_DanhMucKhoaPhong]
	@AllowAdd bit ,
	@AllowUpdate bit,
	@MaKhoaPhong nvarchar(1000) ,
	@TenKhoaPhong nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaKhoaPhong FROM DANHMUC_KHOAPHONG NOLOCK WHERE MaKhoaPhong = @MaKhoaPhong) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			update DANHMUC_KHOAPHONG set TenKhoaPhong = @TenKhoaPhong,Active = @Active where MaKhoaPhong = @MaKhoaPhong
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
			insert into DANHMUC_KHOAPHONG(MaKhoaPhong,TenKhoaPhong,Active) values(@MaKhoaPhong,@TenKhoaPhong,@Active)
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
