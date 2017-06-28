CREATE PROCEDURE [dbo].[proc_Import_DanhMucNguonKinhPhi]
	@AllowAdd bit ,
	@AllowUpdate bit,
	@MaNguonKinhPhi nvarchar(1000) ,
	@TenNguonKinhPhi nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaNguonKinhPhi FROM DANHMUC_NGUONKINHPHI NOLOCK WHERE MaNguonKinhPhi = @MaNguonKinhPhi) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
		update DANHMUC_NGUONKINHPHI set TenNguonKinhPhi = @TenNguonKinhPhi,Active = @Active where MaNguonKinhPhi = @MaNguonKinhPhi
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
			insert into DANHMUC_NGUONKINHPHI(MaNguonKinhPhi,TenNguonKinhPhi,Active) values(@MaNguonKinhPhi,@TenNguonKinhPhi,@Active)
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