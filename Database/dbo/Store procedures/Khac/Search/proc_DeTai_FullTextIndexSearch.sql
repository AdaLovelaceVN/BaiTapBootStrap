CREATE PROCEDURE [dbo].[proc_DeTai_FullTextIndexSearch]
	@TenDeTai nvarchar(1000),
	@MaSoDeTai nvarchar(1000),
	@CNDT_HoTen nvarchar(1000),
	@CQCTDT_TenToChucKHCN nvarchar(1000),
	@ThucHienTuNgay datetime,
	@ThucHienDenNgay datetime,
	@KinhPhiNhoNhat money,
	@KinhPhiLonNhat money,
	@UserId int
AS
BEGIN

SET NOCOUNT ON;
IF @TenDeTai IS NOT NULL
	BEGIN
	SELECT DT.*
	FROM DETAI DT 
		INNER JOIN
		FREETEXTTABLE(DETAI,TenDeTai,@TenDeTai) AS FTS_DT
		ON DT.DeTaiID = FTS_DT.[KEY]
		AND (UPPER(LTRIM(RTRIM(DT.MaSoDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@MaSoDeTai)))+'%' OR @MaSoDeTai IS NULL)  
		AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%' + UPPER(LTRIM(RTRIM(@CNDT_HoTen))) + '%' OR @CNDT_HoTen IS NULL)
		AND (UPPER(LTRIM(RTRIM(DT.CQCTDT_TenToChucKHCN))) LIKE '%' +UPPER(LTRIM(RTRIM(@CQCTDT_TenToChucKHCN)))+ '%' OR @CQCTDT_TenToChucKHCN IS NULL)
		AND (DT.KinhPhi >= @KinhPhiNhoNhat OR @KinhPhiNhoNhat IS NULL)
		AND (DT.KinhPhi <= @KinhPhiLonNhat OR @KinhPhiLonNhat IS NULL)
		AND (CONVERT(DATE,DT.ThucHienTuNgay,105) >= CONVERT(DATE,@ThucHienTuNgay,105) OR @ThucHienTuNgay IS NULL )
		AND (CONVERT(DATE,DT.ThucHienDenNgay,105) <= CONVERT(DATE,@ThucHienDenNgay,105) OR @ThucHienDenNgay IS NULL  )
		AND (DT.UserId = @UserId OR  @UserId IS NULL)
	END
ELSE
	BEGIN
	SELECT DT.*
	FROM DETAI DT 
	WHERE 	
		(UPPER(LTRIM(RTRIM(DT.MaSoDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@MaSoDeTai)))+'%' OR @MaSoDeTai IS NULL)  
		AND (UPPER(LTRIM(RTRIM(DT.CNDT_HoTen))) LIKE '%' + UPPER(LTRIM(RTRIM(@CNDT_HoTen))) + '%' OR @CNDT_HoTen IS NULL)
		AND (UPPER(LTRIM(RTRIM(DT.CQCTDT_TenToChucKHCN))) LIKE '%' +UPPER(LTRIM(RTRIM(@CQCTDT_TenToChucKHCN)))+ '%' OR @CQCTDT_TenToChucKHCN IS NULL)
		AND (DT.KinhPhi >= @KinhPhiNhoNhat OR @KinhPhiNhoNhat IS NULL)
		AND (DT.KinhPhi <= @KinhPhiLonNhat OR @KinhPhiLonNhat IS NULL)
		AND (CONVERT(DATE,DT.ThucHienTuNgay,105) >= CONVERT(DATE,@ThucHienTuNgay,105) OR @ThucHienTuNgay IS NULL)
		AND (CONVERT(DATE,DT.ThucHienDenNgay,105) <= CONVERT(DATE,@ThucHienDenNgay,105) OR @ThucHienDenNgay IS NULL )
		AND (DT.UserId = @UserId OR @UserId IS NULL)
	END
END
GO
