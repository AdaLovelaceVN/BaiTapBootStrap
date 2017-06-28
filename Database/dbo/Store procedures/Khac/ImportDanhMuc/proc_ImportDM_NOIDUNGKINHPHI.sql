----Import danh muc DM_NOIDUNGKINHPHI
CREATE PROC proc_ImportDM_NOIDUNGKINHPHI
    @AllowAdd bit ,
	@AllowUpdate bit,
	@MaNoiDungKinhPhi nvarchar(1000) ,
	@TenNoiDungKinhPhi nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaNoiDungKinhPhi FROM DM_NOIDUNGKINHPHI NOLOCK WHERE MaNoiDungKinhPhi = @MaNoiDungKinhPhi) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaNoiDungKinhPhi FROM DM_NOIDUNGKINHPHI WHERE TenNoiDungKinhPhi=@TenNoiDungKinhPhi AND MaNoiDungKinhPhi<>@MaNoiDungKinhPhi)
			 BEGIN
				update DM_NOIDUNGKINHPHI set MaNoiDungKinhPhi = @MaNoiDungKinhPhi,TenNoiDungKinhPhi = @TenNoiDungKinhPhi,Active = @Active where MaNoiDungKinhPhi = @MaNoiDungKinhPhi
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'TenNoiDungKinhPhi đã tồn tại'
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
		    IF NOT EXISTS (SELECT MaNoiDungKinhPhi FROM DM_NOIDUNGKINHPHI WHERE TenNoiDungKinhPhi=@TenNoiDungKinhPhi)
			 BEGIN
					insert into DM_NOIDUNGKINHPHI(MaNoiDungKinhPhi,TenNoiDungKinhPhi,Active) values(@MaNoiDungKinhPhi,@TenNoiDungKinhPhi,@Active)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'TenNoiDungKinhPhi đã tồn tại'
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