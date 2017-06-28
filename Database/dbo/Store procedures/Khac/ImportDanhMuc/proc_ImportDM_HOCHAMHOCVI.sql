----Import danh muc DM_HOCHAMHOCVI
CREATE PROC proc_ImportDM_HOCHAMHOCVI
    @AllowAdd bit ,
	@AllowUpdate bit,
	@MaHocHamHocVi nvarchar(1000) ,
	@TenHocHamHocVi nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaHocHamHocVi FROM DM_HOCHAMHOCVI NOLOCK WHERE MaHocHamHocVi = @MaHocHamHocVi) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaHocHamHocVi FROM DM_HOCHAMHOCVI WHERE TenHocHamHocVi=@TenHocHamHocVi AND MaHocHamHocVi<>@MaHocHamHocVi)
			 BEGIN
				update DM_HOCHAMHOCVI set MaHocHamHocVi = @MaHocHamHocVi,TenHocHamHocVi = @TenHocHamHocVi,Active = @Active where MaHocHamHocVi = @MaHocHamHocVi
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'TenHocHamHocVi đã tồn tại'
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
		    IF NOT EXISTS (SELECT MaHocHamHocVi FROM DM_HOCHAMHOCVI WHERE TenHocHamHocVi=@TenHocHamHocVi)
			 BEGIN
					insert into DM_HOCHAMHOCVI(MaHocHamHocVi,TenHocHamHocVi,Active) values(@MaHocHamHocVi,@TenHocHamHocVi,@Active)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'TenHocHamHocVi đã tồn tại'
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