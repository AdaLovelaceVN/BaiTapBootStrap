CREATE PROCEDURE [dbo].[proc_Import_DanhMucChucDanhKhoaHoc]
	@AllowAdd bit ,
	@AllowUpdate bit,
	@MaChucDanhKhoaHoc nvarchar(1000) ,
	@TenChucDanhKhoaHoc nvarchar(1000) ,
	@Active bit
as
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaChucDanhKhoaHoc FROM DANHMUC_CHUCDANHKHOAHOC NOLOCK WHERE MaChucDanhKhoaHoc = @MaChucDanhKhoaHoc) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			update DANHMUC_CHUCDANHKHOAHOC set TenChucDanhKhoaHoc = @TenChucDanhKhoaHoc,Active = @Active where MaChucDanhKhoaHoc = @MaChucDanhKhoaHoc
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
			insert into DANHMUC_CHUCDANHKHOAHOC(MaChucDanhKhoaHoc,TenChucDanhKhoaHoc,Active) values(@MaChucDanhKhoaHoc,@TenChucDanhKhoaHoc,@Active)
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