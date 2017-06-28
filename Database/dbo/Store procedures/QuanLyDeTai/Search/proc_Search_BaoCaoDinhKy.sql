﻿CREATE PROCEDURE [dbo].[proc_Search_BaoCaoDinhKy]
	@tenDeTai nvarchar(1000),
	@maDeTai nvarchar(1000),
	@chuNhiemDeTai int,
	@coQuanChuTri nvarchar(1000),
	@ngayBaoCao date,
	@kyBaoCao int
AS
BEGIN
	SET NOCOUNT ON;

	IF @tenDeTai IS NOT NULL
	BEGIN
		SELECT DISTINCT(BCDK.BaoCaoDinhKyID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
		FROM DANGKYDETAI DKDT 
		INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
		ON DKDT.DeTaiID = FTS_DKDT.[KEY]
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN THUCHIENDETAI_BAOCAODINHKY BCDK ON BCDK.DeTaiID = DKDT.DeTaiID
		--LEFT JOIN : TRƯỜNG HỢP KHÔNG CÓ CHI TIET VAN LAY DUOC DU LIEU
		LEFT JOIN THUCHIENDETAI_BAOCAODINHKY_CHITIET CT ON CT.BaoCaoDinhKyID = BCDK.BaoCaoDinhKyID
		AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
		AND (CT.NgayBaoCao = @ngayBaoCao OR @ngayBaoCao IS NULL)
		AND (CT.KyBaoCao = @kyBaoCao OR @kyBaoCao IS NULL)

	END
	ELSE
	BEGIN
		SELECT DISTINCT(BCDK.BaoCaoDinhKyID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
		FROM DANGKYDETAI DKDT 		
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN THUCHIENDETAI_BAOCAODINHKY BCDK ON BCDK.DeTaiID = DKDT.DeTaiID
		LEFT JOIN THUCHIENDETAI_BAOCAODINHKY_CHITIET CT ON CT.BaoCaoDinhKyID = BCDK.BaoCaoDinhKyID
		WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
		AND (CT.NgayBaoCao = @ngayBaoCao OR @ngayBaoCao IS NULL)
		AND (CT.KyBaoCao = @kyBaoCao OR @kyBaoCao IS NULL)
	END
END
