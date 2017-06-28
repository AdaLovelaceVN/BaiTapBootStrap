CREATE PROCEDURE [dbo].[proc_Import_DanhMucTinhTrangDeTai]
	@AllowAdd bit ,
	@AllowUpdate bit,
	@MaTinhTrangDeTai nvarchar(1000) ,
	@TenTinhTrangDeTai nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaTinhTrangDeTai FROM DANHMUC_TINHTRANGDETAI NOLOCK WHERE MaTinhTrangDeTai = @MaTinhTrangDeTai) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			update DANHMUC_TINHTRANGDETAI set TenTinhTrangDeTai = @TenTinhTrangDeTai,Active = @Active where MaTinhTrangDeTai = @MaTinhTrangDeTai
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
			insert into DANHMUC_TINHTRANGDETAI(MaTinhTrangDeTai,TenTinhTrangDeTai,Active) values(@MaTinhTrangDeTai,@TenTinhTrangDeTai,@Active)
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
