CREATE PROCEDURE [dbo].[proc_Import_DanhMucThanhVienHoiDongNhiemKy]
	@AllowAdd bit,
	@AllowUpdate bit,
	@MaThanhVien nvarchar(1000),
	@TenThanhVien nvarchar(1000),
	@ThongTinLienLac nvarchar(1000),
	@ChucVuID int,
	@NoiCongTac nvarchar(1000),
	@NhiemVuTrongHD nvarchar(1000),
	@Active bit
	
AS
BEGIN
declare @ResultString nvarchar(1000)
	IF EXISTS (SELECT MaThanhVien FROM DANHMUC_HOIDONG_NHIEMKY_THANHVIEN NOLOCK WHERE MaThanhVien = @MaThanhVien) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
				update DANHMUC_HOIDONG_NHIEMKY_THANHVIEN 
				set 
					TenThanhVien = @TenThanhVien,
					ThongTinLienLac = @ThongTinLienLac,
					ChucVuID = @ChucVuID,
					NoiCongTac = @NoiCongTac,
					NhiemVuTrongHD = @NhiemVuTrongHD,
					Active = @Active 
					where MaThanhVien = @MaThanhVien

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
				insert into DANHMUC_HOIDONG_NHIEMKY_THANHVIEN(MaThanhVien,TenThanhVien,ThongTinLienLac,ChucVuID,NoiCongTac,NhiemVuTrongHD,Active) values(@MaThanhVien,@TenThanhVien,@ThongTinLienLac,@ChucVuID,@NoiCongTac,@NhiemVuTrongHD,@Active)
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
