----Import danh muc DM_DONVIDO
CREATE PROC proc_ImportDM_DONVIDO
    @AllowAdd bit ,
	@AllowUpdate bit,
	@MaDonViDo nvarchar(1000) ,
	@TenDonViDo nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaDonViDo FROM DM_DONVIDO NOLOCK WHERE MaDonViDo = @MaDonViDo) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaDonViDo FROM DM_DONVIDO WHERE TenDonViDo=@TenDonViDo AND MaDonViDo<>@MaDonViDo)
			 BEGIN
				update DM_DONVIDO set MaDonViDo = @MaDonViDo,TenDonViDo = @TenDonViDo,Active = @Active where MaDonViDo = @MaDonViDo
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'TenDonViDo đã tồn tại'
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
		    IF NOT EXISTS (SELECT MaDonViDo FROM DM_DONVIDO WHERE TenDonViDo=@TenDonViDo )
			 BEGIN
					insert into DM_DONVIDO(MaDonViDo,TenDonViDo,Active) values(@MaDonViDo,@TenDonViDo,@Active)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'TenDonViDo đã tồn tại'
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