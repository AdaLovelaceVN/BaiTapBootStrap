CREATE PROCEDURE [dbo].[proc_Search_DeNghiGiaHan]
	@tenDeTai nvarchar(1000),
	@maDeTai nvarchar(1000),
	@chuNhiemDeTai int,
	@coQuanChuTri nvarchar(1000),
	@ngayDeNghi date,
	@ketQuaDeNghiGiaHan int
AS
BEGIN
	SET NOCOUNT ON;

	IF @ketQuaDeNghiGiaHan IS NULL
		SET @ketQuaDeNghiGiaHan = 30

	IF @tenDeTai IS NOT NULL
	BEGIN		
		IF @ketQuaDeNghiGiaHan = 30
			SELECT DISTINCT(GH.DeNghiGiaHanID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
			FROM DANGKYDETAI DKDT 
			INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
			ON DKDT.DeTaiID = FTS_DKDT.[KEY]
			INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
			INNER JOIN THUCHIENDETAI_DENGHIGIAHAN GH ON GH.DeTaiID = DKDT.DeTaiID
			--LEFT JOIN : TRƯỜNG HỢP KHÔNG CÓ CHI TIET VAN LAY DUOC DU LIEU
			LEFT JOIN THUCHIENDETAI_DENGHIGIAHAN_CHITIET CT ON CT.DeNghiGiaHanID = GH.DeNghiGiaHanID
			AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
			AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
			AND (CT.NgayDeNghiGiaHan = @ngayDeNghi OR @ngayDeNghi IS NULL)
		IF @ketQuaDeNghiGiaHan = 20
			SELECT DISTINCT(GH.DeNghiGiaHanID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
			FROM DANGKYDETAI DKDT 
			INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
			ON DKDT.DeTaiID = FTS_DKDT.[KEY]
			INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
			INNER JOIN THUCHIENDETAI_DENGHIGIAHAN GH ON GH.DeTaiID = DKDT.DeTaiID
			LEFT JOIN THUCHIENDETAI_DENGHIGIAHAN_CHITIET CT ON CT.DeNghiGiaHanID = GH.DeNghiGiaHanID
			AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
			AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
			AND (CT.NgayDeNghiGiaHan = @ngayDeNghi OR @ngayDeNghi IS NULL)
			AND (CT.KetQuaDeNghiGiaHan = 0)
		IF @ketQuaDeNghiGiaHan = 10
			SELECT DISTINCT(GH.DeNghiGiaHanID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
			FROM DANGKYDETAI DKDT 
			INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
			ON DKDT.DeTaiID = FTS_DKDT.[KEY]
			INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
			INNER JOIN THUCHIENDETAI_DENGHIGIAHAN GH ON GH.DeTaiID = DKDT.DeTaiID
			LEFT JOIN THUCHIENDETAI_DENGHIGIAHAN_CHITIET CT ON CT.DeNghiGiaHanID = GH.DeNghiGiaHanID
			AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
			AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
			AND (CT.NgayDeNghiGiaHan = @ngayDeNghi OR @ngayDeNghi IS NULL)
			AND (CT.KetQuaDeNghiGiaHan = 1)
	END
	ELSE
	BEGIN		
		IF @ketQuaDeNghiGiaHan = 30
			SELECT DISTINCT(GH.DeNghiGiaHanID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
			FROM DANGKYDETAI DKDT 			
			INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
			INNER JOIN THUCHIENDETAI_DENGHIGIAHAN GH ON GH.DeTaiID = DKDT.DeTaiID
			LEFT JOIN THUCHIENDETAI_DENGHIGIAHAN_CHITIET CT ON CT.DeNghiGiaHanID = GH.DeNghiGiaHanID
			WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
			AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
			AND (CT.NgayDeNghiGiaHan = @ngayDeNghi OR @ngayDeNghi IS NULL)
		IF @ketQuaDeNghiGiaHan = 20
			SELECT DISTINCT(GH.DeNghiGiaHanID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
				FROM DANGKYDETAI DKDT 			
				INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
				INNER JOIN THUCHIENDETAI_DENGHIGIAHAN GH ON GH.DeTaiID = DKDT.DeTaiID
				LEFT JOIN THUCHIENDETAI_DENGHIGIAHAN_CHITIET CT ON CT.DeNghiGiaHanID = GH.DeNghiGiaHanID
				WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
				AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
				AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
				AND (CT.NgayDeNghiGiaHan = @ngayDeNghi OR @ngayDeNghi IS NULL)
				AND (ct.KetQuaDeNghiGiaHan = 0)
		IF @ketQuaDeNghiGiaHan = 10
			SELECT DISTINCT(GH.DeNghiGiaHanID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
				FROM DANGKYDETAI DKDT 			
				INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
				INNER JOIN THUCHIENDETAI_DENGHIGIAHAN GH ON GH.DeTaiID = DKDT.DeTaiID
				LEFT JOIN THUCHIENDETAI_DENGHIGIAHAN_CHITIET CT ON CT.DeNghiGiaHanID = GH.DeNghiGiaHanID
				WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
				AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
				AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
				AND (CT.NgayDeNghiGiaHan = @ngayDeNghi OR @ngayDeNghi IS NULL)
				AND (ct.KetQuaDeNghiGiaHan = 1)
	END
END
