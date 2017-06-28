CREATE PROCEDURE [dbo].[proc_HoiDongNghiemThu_FullTextIndexSearch]
	@SoQuyetDinh NVARCHAR(1000),
	@QuyetDinhTuNgay datetime,
	@QuyetDinhDenNgay datetime,
	@HoTen nvarchar(1000),
	@UserId int
AS
BEGIN
	SET NOCOUNT ON;

	IF @HoTen IS NOT NULL
		BEGIN 
			
			SELECT DISTINCT(HD.HoiDongNghiemThuID),HD.NgayQuyetDinh,HD.SoQuyetDinh,HD.TrichYeu,HD.GhiChu,HD.DMDonViBanHanhID,HD.HDNT_DeTaiID
			FROM DANHSACHHOIDONG DSHD INNER JOIN FREETEXTTABLE(DANHSACHHOIDONG,HoTen,@HoTen) AS FTS_DS
			ON DSHD.DanhSachHoiDongID = FTS_DS.[KEY]
			RIGHT JOIN HOIDONGNGHIEMTHU HD ON HD.HoiDongNghiemThuID = DSHD.HoiDongNghiemThuID
			INNER JOIN DETAI DT ON DT.DeTaiID = HD.HDNT_DeTaiID
			--WHERE FREETEXT(HoTen,@HoTen)
			AND (CONVERT(DATE,NgayQuyetDinh,105) >= CONVERT(DATE,@QuyetDinhTuNgay,105)  OR @QuyetDinhTuNgay IS NULL) 
			AND (CONVERT(DATE,NgayQuyetDinh,105) <= CONVERT(DATE,@QuyetDinhDenNgay,105)  OR @QuyetDinhDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(SoQuyetDinh))) LIKE '%' +UPPER(LTRIM(RTRIM(@SoQuyetDinh)))+ '%' OR @SoQuyetDinh IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		END
	ELSE
		BEGIN
			SELECT DISTINCT(HD.HoiDongNghiemThuID),HD.NgayQuyetDinh,HD.SoQuyetDinh,HD.TrichYeu,HD.GhiChu,HD.DMDonViBanHanhID,HD.HDNT_DeTaiID
			FROM HOIDONGNGHIEMTHU HD 		
			LEFT JOIN DANHSACHHOIDONG AS DSHD
			ON HD.HoiDongNghiemThuID = DSHD.HoiDongNghiemThuID
			INNER JOIN DETAI DT ON DT.DeTaiID = HD.HDNT_DeTaiID
			WHERE 
			(CONVERT(DATE,NgayQuyetDinh,105) >= CONVERT(DATE,@QuyetDinhTuNgay,105)  OR @QuyetDinhTuNgay IS NULL) 
			AND (CONVERT(DATE,NgayQuyetDinh,105) <= CONVERT(DATE,@QuyetDinhDenNgay,105)  OR @QuyetDinhDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(SoQuyetDinh))) LIKE '%' +UPPER(LTRIM(RTRIM(@SoQuyetDinh)))+ '%' OR @SoQuyetDinh IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		END	
END
