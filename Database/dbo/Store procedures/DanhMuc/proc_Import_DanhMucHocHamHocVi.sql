CREATE PROCEDURE [dbo].[proc_Import_DanhMucHocHamHocVi]
	@AllowAdd bit ,
	@AllowUpdate bit,
	@MaHocHamHocVi nvarchar(1000) ,
	@TenHocHamHocVi nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaHocHamHocVi FROM DANHMUC_HOCHAMHOCVI NOLOCK WHERE MaHocHamHocVi = @MaHocHamHocVi) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			update DANHMUC_HOCHAMHOCVI set TenHocHamHocVi = @TenHocHamHocVi,Active = @Active where MaHocHamHocVi = @MaHocHamHocVi
					set @ResultString='UpdateOK'
					select @ResultString
					return			
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
			insert into DANHMUC_HOCHAMHOCVI(MaHocHamHocVi,TenHocHamHocVi,Active) values(@MaHocHamHocVi,@TenHocHamHocVi,@Active)
			set @ResultString='AddOK'
			select @ResultString
			return		
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
