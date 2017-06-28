﻿CREATE PROCEDURE [dbo].[proc_Search_BaoCaoHoiNghiDangTapChi]
	@tenDeTai nvarchar(1000),
	@maDeTai nvarchar(1000),
	@chuNhiemDeTai int,
	@coQuanChuTri nvarchar(1000),
	@thucHienTuNgay date,
	@thucHienDenNgay date,
	@kinhPhiNhoNhat money,
	@kinhPhiLonNhat money
AS
BEGIN
	SET NOCOUNT ON;

	IF @tenDeTai IS NOT NULL
	BEGIN
		SELECT DISTINCT(HNHT.ToChucHoiNghiHoiThaoID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
		FROM DANGKYDETAI DKDT 
		INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
		ON DKDT.DeTaiID = FTS_DKDT.[KEY]
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN THUCHIENDETAI_TOCHUCHOINGHIHOITHAO HNHT ON HNHT.DeTaiID = DKDT.DeTaiID
		LEFT JOIN THUCHIENDETAI_TOCHUCHOINGHIHOITHAO_CHITIET CT ON CT.ToChucHoiNghiHoiThaoID = HNHT.ToChucHoiNghiHoiThaoID
		AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
		AND (DKDT.KinhPhiThucHien >= @kinhPhiNhoNhat OR @kinhPhiNhoNhat IS NULL)
		AND (DKDT.KinhPhiThucHien <= @kinhPhiLonNhat OR @kinhPhiLonNhat IS NULL)
		AND (CONVERT(DATE,DKDT.ThucHienTuNgay,105) >= CONVERT(DATE,@thucHienTuNgay,105) OR @thucHienTuNgay IS NULL )
		AND (CONVERT(DATE,DKDT.ThucHienDenNgay,105) <= CONVERT(DATE,@thucHienDenNgay,105) OR @thucHienDenNgay IS NULL  )
	END
	ELSE
	BEGIN
		SELECT DISTINCT(HNHT.ToChucHoiNghiHoiThaoID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
		FROM DANGKYDETAI DKDT 		
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN THUCHIENDETAI_TOCHUCHOINGHIHOITHAO HNHT ON HNHT.DeTaiID = DKDT.DeTaiID
		LEFT JOIN THUCHIENDETAI_TOCHUCHOINGHIHOITHAO_CHITIET CT ON CT.ToChucHoiNghiHoiThaoID = HNHT.ToChucHoiNghiHoiThaoID
		WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
		AND (DKDT.KinhPhiThucHien >= @kinhPhiNhoNhat OR @kinhPhiNhoNhat IS NULL)
		AND (DKDT.KinhPhiThucHien <= @kinhPhiLonNhat OR @kinhPhiLonNhat IS NULL)
		AND (CONVERT(DATE,DKDT.ThucHienTuNgay,105) >= CONVERT(DATE,@thucHienTuNgay,105) OR @thucHienTuNgay IS NULL )
		AND (CONVERT(DATE,DKDT.ThucHienDenNgay,105) <= CONVERT(DATE,@thucHienDenNgay,105) OR @thucHienDenNgay IS NULL  )
	END
END