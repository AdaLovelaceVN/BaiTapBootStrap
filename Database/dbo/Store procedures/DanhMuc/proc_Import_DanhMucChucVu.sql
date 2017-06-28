CREATE PROCEDURE [dbo].[proc_Import_DanhMucChucVu]
	@AllowAdd bit ,
	@AllowUpdate bit,
	@MaChucVu nvarchar(1000) ,
	@TenChucVu nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaChucVu FROM DANHMUC_CHUCVU NOLOCK WHERE MaChucVu = @MaChucVu) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN

			update DANHMUC_CHUCVU set TenChucVu = @TenChucVu,Active = @Active where MaChucVu = @MaChucVu
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
			insert into DANHMUC_CHUCVU(MaChucVu,TenChucVu,Active) values(@MaChucVu,@TenChucVu,@Active)
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
