CREATE PROCEDURE [dbo].[proc_GiaHanThucHienDeTai_FullTextIndexSearch]
	 @GiaHanTuNgay datetime,
	 @GiaHanDenNgay datetime,
	 @TrangThai int,
	 @TenDeTai nvarchar(1000),
	 @ChuNhiemDeTai nvarchar(1000),
	 @UserId int
AS 
BEGIN

	SET NOCOUNT ON;

	IF @TrangThai  = 0 OR @TrangThai IS NULL
	BEGIN
		IF @TenDeTai IS NOT NULL		
			SELECT GiaHanThucHienDeTaiID,GHDT_DeTaiID,GiaHanDenNgay AS NgayGiaHan,LyDo,DaDuyet as TrangThai,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,ThucHienTuNgay,ThucHienDenNgay
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
			INNER JOIN GIAHANTHUCHIENDETAI GHDT ON GHDT.GHDT_DeTaiID = DT.DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (CONVERT(DATE,GHDT.GiaHanDenNgay,105) >= CONVERT(DATE,@GiaHanTuNgay,105) OR @GiaHanTuNgay IS NULL)
			AND (CONVERT(DATE,GHDT.GiaHanDenNgay,105) <= CONVERT(DATE,@GiaHanDenNgay,105) OR @GiaHanDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE
			SELECT GiaHanThucHienDeTaiID,GHDT_DeTaiID,GiaHanDenNgay AS NgayGiaHan,LyDo,DaDuyet as TrangThai,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,ThucHienTuNgay,ThucHienDenNgay
			FROM GIAHANTHUCHIENDETAI GHDT INNER JOIN DETAI DT
			ON DT.DeTaiID = GHDT.GHDT_DeTaiID
			WHERE 
			(CONVERT(DATE,GHDT.GiaHanDenNgay,105) >= CONVERT(DATE,@GiaHanTuNgay,105) OR @GiaHanTuNgay IS NULL)
			AND (CONVERT(DATE,GHDT.GiaHanDenNgay,105) <= CONVERT(DATE,@GiaHanDenNgay,105) OR @GiaHanDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END	

	--=============================================================================

	IF @TrangThai  = 1
	BEGIN
		IF @TenDeTai IS NOT NULL		
			SELECT GiaHanThucHienDeTaiID,GHDT_DeTaiID,GiaHanDenNgay AS NgayGiaHan,LyDo,DaDuyet as TrangThai,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,ThucHienTuNgay,ThucHienDenNgay
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
			INNER JOIN GIAHANTHUCHIENDETAI GHDT ON GHDT.GHDT_DeTaiID = DT.DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (CONVERT(DATE,GHDT.GiaHanDenNgay,105) >= CONVERT(DATE,@GiaHanTuNgay,105) OR @GiaHanTuNgay IS NULL)
			AND (CONVERT(DATE,GHDT.GiaHanDenNgay,105) <= CONVERT(DATE,@GiaHanDenNgay,105) OR @GiaHanDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (GHDT.DaDuyet = 0)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE
			SELECT GiaHanThucHienDeTaiID,GHDT_DeTaiID,GiaHanDenNgay AS NgayGiaHan,LyDo,DaDuyet as TrangThai,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,ThucHienTuNgay,ThucHienDenNgay
			FROM GIAHANTHUCHIENDETAI GHDT INNER JOIN DETAI DT
			ON DT.DeTaiID = GHDT.GHDT_DeTaiID
			WHERE 
			(CONVERT(DATE,GHDT.GiaHanDenNgay,105) >= CONVERT(DATE,@GiaHanTuNgay,105) OR @GiaHanTuNgay IS NULL)
			AND (CONVERT(DATE,GHDT.GiaHanDenNgay,105) <= CONVERT(DATE,@GiaHanDenNgay,105) OR @GiaHanDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (GHDT.DaDuyet = 0)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END	

	--=============================================================================

	IF @TrangThai  = 2
	BEGIN
		IF @TenDeTai IS NOT NULL		
			SELECT GiaHanThucHienDeTaiID,GHDT_DeTaiID,GiaHanDenNgay AS NgayGiaHan,LyDo,DaDuyet as TrangThai,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,ThucHienTuNgay,ThucHienDenNgay
			FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
			INNER JOIN GIAHANTHUCHIENDETAI GHDT ON GHDT.GHDT_DeTaiID = DT.DeTaiID
			--WHERE FREETEXT(TenDeTai,@TenDeTai)
			AND (CONVERT(DATE,GHDT.GiaHanDenNgay,105) >= CONVERT(DATE,@GiaHanTuNgay,105) OR @GiaHanTuNgay IS NULL)
			AND (CONVERT(DATE,GHDT.GiaHanDenNgay,105) <= CONVERT(DATE,@GiaHanDenNgay,105) OR @GiaHanDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (GHDT.DaDuyet = 1)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
		ELSE
			SELECT GiaHanThucHienDeTaiID,GHDT_DeTaiID,GiaHanDenNgay AS NgayGiaHan,LyDo,DaDuyet as TrangThai,DT.TenDeTai,DT.CNDT_HoTen AS ChuNhiemDeTai,ThucHienTuNgay,ThucHienDenNgay
			FROM GIAHANTHUCHIENDETAI GHDT INNER JOIN DETAI DT
			ON DT.DeTaiID = GHDT.GHDT_DeTaiID
			WHERE 
			(CONVERT(DATE,GHDT.GiaHanDenNgay,105) >= CONVERT(DATE,@GiaHanTuNgay,105) OR @GiaHanTuNgay IS NULL)
			AND (CONVERT(DATE,GHDT.GiaHanDenNgay,105) <= CONVERT(DATE,@GiaHanDenNgay,105) OR @GiaHanDenNgay IS NULL)
			AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
			AND (GHDT.DaDuyet = 1)
			AND (DT.UserId = @UserId OR @UserId IS NULL)
	END	

END