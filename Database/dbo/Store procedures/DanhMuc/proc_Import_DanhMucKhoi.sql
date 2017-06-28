CREATE PROCEDURE [dbo].[proc_Import_DanhMucKhoi]
	@AllowAdd bit ,
	@AllowUpdate bit,
	@MaKhoi nvarchar(1000) ,
	@TenKhoi nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaKhoi FROM DANHMUC_KHOI NOLOCK WHERE MaKhoi = @MaKhoi) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			update DANHMUC_KHOI set TenKhoi = @TenKhoi,Active = @Active where MaKhoi = @MaKhoi
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
			insert into DANHMUC_KHOI(MaKhoi,TenKhoi,Active) values(@MaKhoi,@TenKhoi,@Active)
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
