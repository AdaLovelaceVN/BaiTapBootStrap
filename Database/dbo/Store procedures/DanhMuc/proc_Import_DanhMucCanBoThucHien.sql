CREATE PROCEDURE [dbo].[proc_Import_DanhMucCanBoThucHien]
	@AllowAdd bit,
	@AllowUpdate bit,
	@MaCanBoThucHien nvarchar(1000),
	@HoTen nvarchar(1000),
	@DiaChiCoQuan nvarchar(1000),
	@DiaChiNhaRieng nvarchar(1000),
	@DienThoai nvarchar(1000),
	@Email nvarchar(1000),
	@Fax nvarchar(1000),
	@HocHamHocViID int,
	@ChucDanhKhoaHocID int,
	@ChucVuID int,
	@KhoaPhongID int	
AS
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaCanBoThucHien FROM DANHMUC_CANBOTHUCHIEN NOLOCK WHERE MaCanBoThucHien = @MaCanBoThucHien) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
				update DANHMUC_CANBOTHUCHIEN 
				set 
					HoTen = @HoTen,
					DiaChiCoQuan = @DiaChiCoQuan,
					DiaChiNhaRieng = @DiaChiNhaRieng,
					DienThoai = @DienThoai,
					Email = @Email,
					Fax = @Fax,
					HocHamHocViID = @HocHamHocViID,
					ChucDanhKhoaHocID = @ChucDanhKhoaHocID,
					ChucVuID = @ChucVuID,
					KhoaPhongID = @KhoaPhongID 
					where MaCanBoThucHien = @MaCanBoThucHien

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
				insert into DANHMUC_CANBOTHUCHIEN(MaCanBoThucHien,HoTen,DiaChiCoQuan,DiaChiNhaRieng,DienThoai,Email,Fax,HocHamHocViID,ChucDanhKhoaHocID,ChucVuID,KhoaPhongID) values(@MaCanBoThucHien,@HoTen,@DiaChiCoQuan,@DiaChiNhaRieng,@DienThoai,@Email,@Fax,@HocHamHocViID,@ChucDanhKhoaHocID,@ChucVuID,@KhoaPhongID)
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
