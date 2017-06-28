----Import danh muc cap quan ly
CREATE PROC proc_ImportDM_CapQuanLy
    @AllowAdd bit ,
	@AllowUpdate bit,
	@MaCapQuanLy nvarchar(1000) ,
	@TenCapQuanLy nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaCapQuanLy FROM DM_CAPQUANLY NOLOCK WHERE MaCapQuanLy = @MaCapQuanLy) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaCapQuanLy FROM DM_CAPQUANLY WHERE TenCapQuanLy=@TenCapQuanLy AND MaCapQuanLy<>@MaCapQuanLy)
			 BEGIN
				update DM_CAPQUANLY set MaCapQuanLy = @MaCapQuanLy,TenCapQuanLy = @TenCapQuanLy,Active = @Active where MaCapQuanLy = @MaCapQuanLy
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'Tên đã tồn tại'
				select @ResultString
				return
			END
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
		    IF NOT EXISTS (SELECT MaCapQuanLy FROM DM_CAPQUANLY WHERE TenCapQuanLy=@TenCapQuanLy )
			 BEGIN
					insert into DM_CAPQUANLY(MaCapQuanLy,TenCapQuanLy,Active) values(@MaCapQuanLy,@TenCapQuanLy,@Active)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'Tên đã tồn tại'
				select @ResultString
				return
		END
		END
		ELSE
		BEGIN
			set @ResultString=N'Không được thêm mới'
			select @ResultString
			return
		END
	END
	
END