----Import danh muc DM_TINHTRANGHOPTACQUOCTE
CREATE PROC proc_ImportDDM_TINHTRANGHOPTACQUOCTE
    @AllowAdd bit ,
	@AllowUpdate bit,
	@MaTinhTrangHopTacQuocTe nvarchar(1000) ,
	@TenTinhTrangHopTacQuocTe nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaTinhTrangHopTacQuocTe FROM DM_TINHTRANGHOPTACQUOCTE NOLOCK WHERE MaTinhTrangHopTacQuocTe = @MaTinhTrangHopTacQuocTe) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaTinhTrangHopTacQuocTe FROM DM_TINHTRANGHOPTACQUOCTE WHERE TenTinhTrangHopTacQuocTe=@TenTinhTrangHopTacQuocTe AND MaTinhTrangHopTacQuocTe<>@MaTinhTrangHopTacQuocTe)
			 BEGIN
				update DM_TINHTRANGHOPTACQUOCTE set MaTinhTrangHopTacQuocTe = @MaTinhTrangHopTacQuocTe,TenTinhTrangHopTacQuocTe = @TenTinhTrangHopTacQuocTe,Active = @Active where MaTinhTrangHopTacQuocTe = @MaTinhTrangHopTacQuocTe
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'TenTinhTrangHopTacQuocTe đã tồn tại'
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
		    IF NOT EXISTS (SELECT MaTinhTrangHopTacQuocTe FROM DM_TINHTRANGHOPTACQUOCTE WHERE TenTinhTrangHopTacQuocTe=@TenTinhTrangHopTacQuocTe)
			 BEGIN
					insert into DM_TINHTRANGHOPTACQUOCTE(MaTinhTrangHopTacQuocTe,TenTinhTrangHopTacQuocTe,Active) values(@MaTinhTrangHopTacQuocTe,@TenTinhTrangHopTacQuocTe,@Active)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'TenTinhTrangHopTacQuocTe đã tồn tại'
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

GO