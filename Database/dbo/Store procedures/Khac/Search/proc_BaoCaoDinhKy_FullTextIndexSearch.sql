CREATE PROCEDURE [dbo].[proc_BaoCaoDinhKy_FullTextIndexSearch]
	@BaoCaoTuNgay datetime,
	@BaoCaoDenNgay datetime,
	@Ky int,
	@TenDeTai nvarchar(1000),
	@ChuNhiemDeTai nvarchar(1000),
	@UserId int
AS
BEGIN
	
	IF @TenDeTai IS NOT NULL
	BEGIN
		SELECT BaoCaoDinhKyID,NgayBaoCao,KyBaoCao,TenDeTai,CNDT_HoTen AS ChuNhiemDeTai,ThucHienTuNgay,ThucHienDenNgay,BCDK_DeTaiID
		FROM DETAI DT INNER JOIN FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT ON DT.DeTaiID = FTS_DT.[KEY]
		INNER JOIN BAOCAODINHKY BC ON BC.BCDK_DeTaiID = DT.DeTaiID
		--WHERE FREETEXT(TenDeTai,@TenDeTai)
		AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
		AND (CONVERT(DATE,BC.NgayBaoCao,105) >= CONVERT(DATE,@BaoCaoTuNgay,105) OR @BaoCaoTuNgay IS NULL)
		AND (CONVERT(DATE,BC.NgayBaoCao,105) <= CONVERT(DATE,@BaoCaoDenNgay,105) OR @BaoCaoDenNgay IS NULL)
		AND (KyBaoCao = @Ky OR @Ky IS NULL)
		AND (DT.UserId = @UserId OR @UserId IS NULL)
	END
	ELSE
	BEGIN
		
		SELECT BaoCaoDinhKyID,NgayBaoCao,KyBaoCao,TenDeTai,CNDT_HoTen AS ChuNhiemDeTai,ThucHienTuNgay,ThucHienDenNgay,BCDK_DeTaiID
		FROM BAOCAODINHKY BC INNER JOIN DETAI DT
		ON DT.DeTaiID = BC.BCDK_DeTaiID
		WHERE 
		(UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%'+UPPER(LTRIM(RTRIM(@ChuNhiemDeTai)))+'%' OR @ChuNhiemDeTai IS NULL)
		AND (CONVERT(DATE,BC.NgayBaoCao,105) >= CONVERT(DATE,@BaoCaoTuNgay,105) OR @BaoCaoTuNgay IS NULL)
		AND (CONVERT(DATE,BC.NgayBaoCao,105) <= CONVERT(DATE,@BaoCaoDenNgay,105) OR @BaoCaoDenNgay IS NULL)
		AND (KyBaoCao = @Ky OR @Ky IS NULL)
		AND (DT.UserId = @UserId OR @UserId IS NULL)
	END

END