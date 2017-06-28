CREATE PROCEDURE [dbo].[proc_DiemDanhGia_FullTextIndexSearch]
	@TenDeTai nvarchar(1000),
	@ChuNhiemDeTai nvarchar(1000),
	@SoPhieu nvarchar(1000),
	@DanhGiaTuNgay date,
	@DanhGiaDenNgay date,
	@UserId int
AS
BEGIN
	SET NOCOUNT ON;

	IF @TenDeTai IS NOT NULL
		SELECT 
			DDG.DiemDanhGiaID,
			DDG.SoPhieu,
			DT.TenDeTai,
			DT.CNDT_HoTen AS ChuNhiemDeTai,
			DDG.NgayDanhGia,
			DT.ThucHienTuNgay,
			DT.ThucHienDenNgay
		FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
		INNER JOIN  DIEMDANHGIA DDG ON DDG.DDG_DeTaiID = DT.DeTaiID
		--WHERE FREETEXT(TenDeTai,@TenDeTai)
		AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%' +UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+ '%' OR @ChuNhiemDeTai IS NULL)
		AND (CONVERT(DATE,DDG.NgayDanhGia,105) >= CONVERT(DATE,@DanhGiaTuNgay,105) OR @DanhGiaTuNgay IS NULL)
		AND (CONVERT(DATE,DDG.NgayDanhGia,105) <= CONVERT(DATE,@DanhGiaDenNgay,105) OR @DanhGiaDenNgay IS NULL)
		AND (UPPER(LTRIM(RTRIM(DDG.SoPhieu))) LIKE '%' +UPPER(LTRIM(RTRIM(@SoPhieu))) + '%' OR @SoPhieu IS NULL)
		AND (DT.UserId = @UserId OR @UserId IS NULL)
	ELSE
		SELECT 
				DDG.DiemDanhGiaID,
				DDG.SoPhieu,
				DT.TenDeTai,
				DT.CNDT_HoTen AS ChuNhiemDeTai,
				DDG.NgayDanhGia,
				DT.ThucHienTuNgay,
				DT.ThucHienDenNgay
			FROM DIEMDANHGIA DDG
			INNER JOIN DETAI DT ON DDG.DDG_DeTaiID = DT.DeTaiID
			WHERE 
			(UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%' +UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+ '%' OR @ChuNhiemDeTai IS NULL)
			AND (CONVERT(DATE,DDG.NgayDanhGia,105) >= CONVERT(DATE,@DanhGiaTuNgay,105) OR @DanhGiaTuNgay IS NULL)
			AND (CONVERT(DATE,DDG.NgayDanhGia,105) <= CONVERT(DATE,@DanhGiaDenNgay,105) OR @DanhGiaDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(DDG.SoPhieu))) LIKE '%' +UPPER(LTRIM(RTRIM(@SoPhieu))) + '%' OR @SoPhieu IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
END
