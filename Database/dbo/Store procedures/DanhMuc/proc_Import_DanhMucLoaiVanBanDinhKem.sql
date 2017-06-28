CREATE PROCEDURE [dbo].[proc_Import_DanhMucLoaiVanBanDinhKem]
	@AllowAdd bit ,
	@AllowUpdate bit,
	@MaVanBanDinhKem nvarchar(1000) ,
	@TenVanBanDinhKem nvarchar(1000) ,
	@LoaiQuyTrinh INT,
	@Form INT,
	@Active bit
AS
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaVanBanDinhKem FROM DANHMUC_LOAIVANBANDINHKEM NOLOCK WHERE MaVanBanDinhKem = @MaVanBanDinhKem) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
		update DANHMUC_LOAIVANBANDINHKEM set TenVanBanDinhKem = @TenVanBanDinhKem,Form = @Form,LoaiQuyTrinh = @LoaiQuyTrinh,Active = @Active where MaVanBanDinhKem = @MaVanBanDinhKem
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
			insert into DANHMUC_LOAIVANBANDINHKEM(MaVanBanDinhKem,TenVanBanDinhKem,LoaiQuyTrinh,Form,Active) values(@MaVanBanDinhKem,@TenVanBanDinhKem,@LoaiQuyTrinh,@Form,@Active)
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
