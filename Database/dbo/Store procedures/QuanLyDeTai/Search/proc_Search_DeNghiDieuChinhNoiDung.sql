CREATE PROCEDURE [dbo].[proc_Search_DeNghiDieuChinhNoiDung]
	@tenDeTai nvarchar(1000),
	@maDeTai nvarchar(1000),
	@chuNhiemDeTai int,
	@coQuanChuTri nvarchar(1000),
	@ngayDeNghi date,
	@loaiDieuChinh int
AS
BEGIN
	SET NOCOUNT ON;

	IF @tenDeTai IS NOT NULL
	BEGIN
		SELECT DISTINCT(DC.DeNghiDieuChinhNoiDungID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
		FROM DANGKYDETAI DKDT 
		INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
		ON DKDT.DeTaiID = FTS_DKDT.[KEY]
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN THUCHIENDETAI_DENGHIDIEUCHINHNOIDUNG DC ON DC.DeTaiID = DKDT.DeTaiID
		--LEFT JOIN : TRƯỜNG HỢP KHÔNG CÓ CHI TIET VAN LAY DUOC DU LIEU
		LEFT JOIN THUCHIENDETAI_DENGHIDIEUCHINHNOIDUNG_CHITIET CT ON CT.DeNghiDieuChinhNoiDungID = DC.DeNghiDieuChinhNoiDungID
		AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
		AND (CT.NgayDeNghi = @ngayDeNghi OR @ngayDeNghi IS NULL)
		AND (CT.LoaiDieuChinh = @loaiDieuChinh OR @loaiDieuChinh IS NULL)

	END
	ELSE
	BEGIN
		SELECT DISTINCT(DC.DeNghiDieuChinhNoiDungID),DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,MaCanBoThucHien,HoTen,TrangThaiDeTai
		FROM DANGKYDETAI DKDT 		
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN THUCHIENDETAI_DENGHIDIEUCHINHNOIDUNG DC ON DC.DeTaiID = DKDT.DeTaiID
		LEFT JOIN THUCHIENDETAI_DENGHIDIEUCHINHNOIDUNG_CHITIET CT ON CT.DeNghiDieuChinhNoiDungID = DC.DeNghiDieuChinhNoiDungID
		WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
		AND (CT.NgayDeNghi = @ngayDeNghi OR @ngayDeNghi IS NULL)
		AND (CT.LoaiDieuChinh = @loaiDieuChinh OR @loaiDieuChinh IS NULL)
	END
END
