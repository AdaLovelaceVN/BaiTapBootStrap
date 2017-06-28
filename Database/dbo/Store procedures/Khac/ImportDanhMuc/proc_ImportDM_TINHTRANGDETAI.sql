---Import danh muc DM_TINHTRANGDETAI
CREATE PROC proc_ImportDM_TINHTRANGDETAI
    @AllowAdd bit ,
	@AllowUpdate bit,
	@MaTinhTrangDeTai nvarchar(1000) ,
	@TenTinhTrangDeTai nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaTinhTrangDeTai FROM DM_TINHTRANGDETAI NOLOCK WHERE MaTinhTrangDeTai = @MaTinhTrangDeTai) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaTinhTrangDeTai FROM DM_TINHTRANGDETAI WHERE TenTinhTrangDeTai=@TenTinhTrangDeTai AND MaTinhTrangDeTai<>@MaTinhTrangDeTai)
			 BEGIN
				update DM_TINHTRANGDETAI set MaTinhTrangDeTai = @MaTinhTrangDeTai,TenTinhTrangDeTai = @TenTinhTrangDeTai,Active = @Active where MaTinhTrangDeTai = @MaTinhTrangDeTai
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'TenTinhTrangDeTai đã tồn tại'
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
		    IF NOT EXISTS (SELECT MaTinhTrangDeTai FROM DM_TINHTRANGDETAI WHERE TenTinhTrangDeTai=@TenTinhTrangDeTai )
			 BEGIN
					insert into DM_TINHTRANGDETAI(MaTinhTrangDeTai,TenTinhTrangDeTai,Active) values(@MaTinhTrangDeTai,@TenTinhTrangDeTai,@Active)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'TenTinhTrangDeTai đã tồn tại'
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