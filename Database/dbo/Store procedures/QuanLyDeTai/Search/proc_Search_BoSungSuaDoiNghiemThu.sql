CREATE PROCEDURE [dbo].[proc_Search_BoSungSuaDoiNghiemThu]
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
		SELECT DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai,NT.BoSungSuaDoiID
		FROM DANGKYDETAI DKDT 
		INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
		ON DKDT.DeTaiID = FTS_DKDT.[KEY]
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN NGHIEMTHU_BOSUNGSUADOI NT ON NT.DeTaiID = DKDT.DeTaiID
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
		SELECT DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai,NT.BoSungSuaDoiID
		FROM DANGKYDETAI DKDT 		
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN NGHIEMTHU_BOSUNGSUADOI NT ON NT.DeTaiID = DKDT.DeTaiID
		WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
		AND (DKDT.KinhPhiThucHien >= @kinhPhiNhoNhat OR @kinhPhiNhoNhat IS NULL)
		AND (DKDT.KinhPhiThucHien <= @kinhPhiLonNhat OR @kinhPhiLonNhat IS NULL)
		AND (CONVERT(DATE,DKDT.ThucHienTuNgay,105) >= CONVERT(DATE,@thucHienTuNgay,105) OR @thucHienTuNgay IS NULL )
		AND (CONVERT(DATE,DKDT.ThucHienDenNgay,105) <= CONVERT(DATE,@thucHienDenNgay,105) OR @thucHienDenNgay IS NULL  )
	END
END
