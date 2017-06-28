----Import danh muc DM_TINHKHOAHOC
CREATE PROC proc_ImportDM_TINHKHOAHOC
    @AllowAdd bit ,
	@AllowUpdate bit,
	@MaTinhKhoaHoc nvarchar(1000) ,
	@TenTinhKhoaHoc nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaTinhKhoaHoc FROM DM_TINHKHOAHOC NOLOCK WHERE MaTinhKhoaHoc = @MaTinhKhoaHoc) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaTinhKhoaHoc FROM DM_TINHKHOAHOC WHERE TenTinhKhoaHoc=@TenTinhKhoaHoc AND MaTinhKhoaHoc<>@MaTinhKhoaHoc)
			 BEGIN
				update DM_TINHKHOAHOC set MaTinhKhoaHoc = @MaTinhKhoaHoc,TenTinhKhoaHoc = @TenTinhKhoaHoc,Active = @Active where MaTinhKhoaHoc = @MaTinhKhoaHoc
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'TenTinhKhoaHoc đã tồn tại'
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
		    IF NOT EXISTS (SELECT MaTinhKhoaHoc FROM DM_TINHKHOAHOC WHERE TenTinhKhoaHoc=@TenTinhKhoaHoc )
			 BEGIN
					insert into DM_TINHKHOAHOC(MaTinhKhoaHoc,TenTinhKhoaHoc,Active) values(@MaTinhKhoaHoc,@TenTinhKhoaHoc,@Active)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'TenTinhKhoaHoc đã tồn tại'
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