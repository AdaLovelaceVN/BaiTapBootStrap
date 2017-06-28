CREATE PROCEDURE [dbo].[proc_Search_NhanYeuCauLaySoLieu]
	@tenDeTai nvarchar(1000),
	@maDeTai nvarchar(1000),
	@chuNhiemDeTai nvarchar(1000),
	@thucHienTuNgay date,
	@thucHienDenNgay date,
	@loaiDeTai int,
	@ngayHopHoiDDDNCYSH date
AS
BEGIN
	SET NOCOUNT ON;

	IF @tenDeTai IS NOT NULL
	BEGIN
		SELECT DKDT.DeTaiBenNgoaiID,MaDeTai,TenDeTai,ThoiGianThucHien_Tu,ThoiGianThucHien_Den, TrangThaiDeTaiBenNgoai, LoaiDeTai, ChuNhiemDeTai, NgayHopHĐĐĐNCYSH
		FROM DETAIBENNGOAI_NHANYEUCAU DKDT 
		INNER JOIN FREETEXTTABLE(DETAIBENNGOAI_NHANYEUCAU,TenDeTai,@tenDeTai) as FTS_DKDT
		ON DKDT.DeTaiBenNgoaiID = FTS_DKDT.[KEY]
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(DKDT.ChuNhiemDeTai))) LIKE '%' +UPPER(LTRIM(RTRIM(@chuNhiemDeTai)))+ '%' OR @chuNhiemDeTai IS NULL)
		AND (DKDT.LoaiDeTai = @loaiDeTai OR @loaiDeTai IS NULL)
		AND (CONVERT(DATE,DKDT.ThoiGianThucHien_Tu,105) >= CONVERT(DATE,@thucHienTuNgay,105) OR @thucHienTuNgay IS NULL )
		AND (CONVERT(DATE,DKDT.ThoiGianThucHien_Den,105) <= CONVERT(DATE,@thucHienDenNgay,105) OR @thucHienDenNgay IS NULL  )
		AND (DKDT.NgayHopHĐĐĐNCYSH = @ngayHopHoiDDDNCYSH OR @ngayHopHoiDDDNCYSH IS NULL  )
	END
	ELSE
	BEGIN
		SELECT DKDT.DeTaiBenNgoaiID,MaDeTai,TenDeTai,ThoiGianThucHien_Tu,ThoiGianThucHien_Den, TrangThaiDeTaiBenNgoai, LoaiDeTai, ChuNhiemDeTai, NgayHopHĐĐĐNCYSH
		FROM DETAIBENNGOAI_NHANYEUCAU DKDT 		
		WHERE (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(DKDT.ChuNhiemDeTai))) LIKE '%' +UPPER(LTRIM(RTRIM(@chuNhiemDeTai)))+ '%' OR @chuNhiemDeTai IS NULL)
		AND (DKDT.LoaiDeTai = @loaiDeTai OR @loaiDeTai IS NULL)
		AND (CONVERT(DATE,DKDT.ThoiGianThucHien_Tu,105) >= CONVERT(DATE,@thucHienTuNgay,105) OR @thucHienTuNgay IS NULL )
		AND (CONVERT(DATE,DKDT.ThoiGianThucHien_Den,105) <= CONVERT(DATE,@thucHienDenNgay,105) OR @thucHienDenNgay IS NULL  )
		AND (DKDT.NgayHopHĐĐĐNCYSH = @ngayHopHoiDDDNCYSH OR @ngayHopHoiDDDNCYSH IS NULL  )
	END
END