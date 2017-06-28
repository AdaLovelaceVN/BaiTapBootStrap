----Import danh muc DM_KETQUADUKIEN
CREATE PROC proc_ImportDM_KETQUADUKIEN
   @AllowAdd bit ,
	@AllowUpdate bit,
	@MaKetQuaDuKien nvarchar(1000) ,
	@TenKetQuaDuKien nvarchar(1000) ,
	@Active bit,
	@Loai NVARCHAR(4)
as
BEGIN
	declare @ResultString nvarchar(1000)
	IF(ISNUMERIC(@Loai + '.0e0')=0 OR (ISNUMERIC(@Loai + '.0e0')=1 AND CAST(@Loai AS INT)>3))
	BEGIN
		set @ResultString=N'Loai phải là số nguyên từ 1 đến 3'
		select @ResultString
		return
	END
	
	--------------
	IF EXISTS (SELECT MaKetQuaDuKien FROM DM_KETQUADUKIEN NOLOCK WHERE MaKetQuaDuKien = @MaKetQuaDuKien) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaKetQuaDuKien FROM DM_KETQUADUKIEN WHERE TenKetQuaDuKien=@TenKetQuaDuKien AND MaKetQuaDuKien<>@MaKetQuaDuKien)
			 BEGIN
				update DM_KETQUADUKIEN set MaKetQuaDuKien = @MaKetQuaDuKien,TenKetQuaDuKien = @TenKetQuaDuKien,Active = @Active,Loai=@Loai where MaKetQuaDuKien = @MaKetQuaDuKien
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'TenKetQuaDuKien đã tồn tại'
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
		    IF NOT EXISTS (SELECT MaKetQuaDuKien FROM DM_KETQUADUKIEN WHERE TenKetQuaDuKien=@TenKetQuaDuKien)
			 BEGIN
					insert into DM_KETQUADUKIEN(MaKetQuaDuKien,TenKetQuaDuKien,Active,Loai) values(@MaKetQuaDuKien,@TenKetQuaDuKien,@Active,@Loai)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'TenKetQuaDuKien đã tồn tại'
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
