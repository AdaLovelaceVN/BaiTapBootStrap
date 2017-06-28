----Import danh muc DM_DIEUKIEN
CREATE PROC proc_ImportDM_DIEUKIEN
    @AllowAdd bit ,
	@AllowUpdate bit,
	@MaDieuKien nvarchar(1000) ,
	@TenDieuKien nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaDieuKien FROM DM_DIEUKIEN NOLOCK WHERE MaDieuKien = @MaDieuKien) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaDieuKien FROM DM_DIEUKIEN WHERE TenDieuKien=@TenDieuKien AND MaDieuKien<>@MaDieuKien)
			 BEGIN
				update DM_DIEUKIEN set MaDieuKien = @MaDieuKien,TenDieuKien = @TenDieuKien,Active = @Active where MaDieuKien = @MaDieuKien
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'TenDieuKien đã tồn tại'
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
		    IF NOT EXISTS (SELECT MaDieuKien FROM DM_DIEUKIEN WHERE TenDieuKien=@TenDieuKien )
			 BEGIN
					insert into DM_DIEUKIEN(MaDieuKien,TenDieuKien,Active) values(@MaDieuKien,@TenDieuKien,@Active)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'TenDieuKien đã tồn tại'
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