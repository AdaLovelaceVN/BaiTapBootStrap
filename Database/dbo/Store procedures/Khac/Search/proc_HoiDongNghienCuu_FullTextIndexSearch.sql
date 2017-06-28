CREATE PROCEDURE [dbo].[proc_HoiDongNghienCuu_FullTextIndexSearch]
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
			
			SELECT DISTINCT(HD.HoiDongNghienCuuID),HD.NgayQuyetDinh,HD.SoQuyetDinh,HD.TrichYeu,HD.GhiChu,HD.DMDonViBanHanhID,HD.HDNC_DeTaiID
			FROM DANHSACHHOIDONGNGHIENCUU DSHDNC INNER JOIN FREETEXTTABLE(DANHSACHHOIDONGNGHIENCUU,HoTen,@HoTen) AS FTS_DS
			ON DSHDNC.DanhSachHoiDongNghienCuuID = FTS_DS.[KEY]
			RIGHT JOIN HOIDONGNGHIENCUU HD ON HD.HoiDongNghienCuuID = DSHDNC.HoiDongNghienCuuID
			INNER JOIN DETAI DT ON DT.DeTaiID = HD.HDNC_DeTaiID
			--WHERE FREETEXT(HoTen,@HoTen)
			AND (CONVERT(DATE,NgayQuyetDinh,105) >= CONVERT(DATE,@QuyetDinhTuNgay,105)  OR @QuyetDinhTuNgay IS NULL) 
			AND (CONVERT(DATE,NgayQuyetDinh,105) <= CONVERT(DATE,@QuyetDinhDenNgay,105)  OR @QuyetDinhDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(SoQuyetDinh))) LIKE '%' +UPPER(LTRIM(RTRIM(@SoQuyetDinh)))+ '%' OR @SoQuyetDinh IS NULL)
			AND (@UserId = DT.UserId OR @UserId IS NULL)
		END
	ELSE
		BEGIN
			SELECT DISTINCT(HD.HoiDongNghienCuuID),HD.NgayQuyetDinh,HD.SoQuyetDinh,HD.TrichYeu,HD.GhiChu,HD.DMDonViBanHanhID,HD.HDNC_DeTaiID
			FROM HOIDONGNGHIENCUU HD 				
			LEFT JOIN DANHSACHHOIDONGNGHIENCUU AS DSHDNC
			ON HD.HoiDongNghienCuuID = DSHDNC.HoiDongNghienCuuID
			INNER JOIN DETAI DT 
			ON DT.DeTaiID = HD.HDNC_DeTaiID
			WHERE 
			(CONVERT(DATE,NgayQuyetDinh,105) >= CONVERT(DATE,@QuyetDinhTuNgay,105)  OR @QuyetDinhTuNgay IS NULL) 
			AND (CONVERT(DATE,NgayQuyetDinh,105) <= CONVERT(DATE,@QuyetDinhDenNgay,105)  OR @QuyetDinhDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(SoQuyetDinh))) LIKE '%' +UPPER(LTRIM(RTRIM(@SoQuyetDinh)))+ '%' OR @SoQuyetDinh IS NULL)
			AND (@UserId = DT.UserId OR @UserId IS NULL)
		END	
END
