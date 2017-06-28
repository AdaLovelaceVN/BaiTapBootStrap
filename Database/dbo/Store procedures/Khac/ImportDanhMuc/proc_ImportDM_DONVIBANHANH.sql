----Import danh muc DM_DONVIBANHANH
CREATE PROC proc_ImportDM_DONVIBANHANH
    @AllowAdd bit ,
	@AllowUpdate bit,
	@MaDonViBanHanh nvarchar(1000) ,
	@TenDonViBanHanh nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaDonViBanHanh FROM DM_DONVIBANHANH NOLOCK WHERE MaDonViBanHanh = @MaDonViBanHanh) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			 IF NOT EXISTS (SELECT MaDonViBanHanh FROM DM_DONVIBANHANH WHERE TenDonViBanHanh=@TenDonViBanHanh AND MaDonViBanHanh<>@MaDonViBanHanh)
			 BEGIN
				update DM_DONVIBANHANH set MaDonViBanHanh = @MaDonViBanHanh,TenDonViBanHanh = @TenDonViBanHanh,Active = @Active where MaDonViBanHanh = @MaDonViBanHanh
						set @ResultString='UpdateOK'
						select @ResultString
						return
			END
			ELSE
			BEGIN
				set @ResultString=N'TenDonViBanHanh đã tồn tại'
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
		    IF NOT EXISTS (SELECT MaDonViBanHanh FROM DM_DONVIBANHANH WHERE TenDonViBanHanh=@TenDonViBanHanh )
			 BEGIN
					insert into DM_DONVIBANHANH(MaDonViBanHanh,TenDonViBanHanh,Active) values(@MaDonViBanHanh,@TenDonViBanHanh,@Active)
					set @ResultString='AddOK'
					select @ResultString
					return
			END
		ELSE
		BEGIN
				set @ResultString=N'TenDonViBanHanh đã tồn tại'
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