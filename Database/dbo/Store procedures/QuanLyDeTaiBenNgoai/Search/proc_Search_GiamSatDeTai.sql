CREATE PROCEDURE [dbo].[proc_Search_GiamSatDeTai]
	@maDeTai nvarchar(1000),
	@tenDeTai nvarchar(1000),
	@ngayThucHienGS date,
	@chuNhiemDeTai nvarchar(1000)
AS
BEGIN
	SET NOCOUNT ON;

	IF (@tenDeTai IS NOT NULL)
	BEGIN 
		SELECT  distinct(GT.GiamSatKiemTraID), MaDeTai, TenDeTai, TrangThaiDeTaiBenNgoai
								, GT.DeTaiBenNgoaiID, GT.NgayThucHienGS,  ChuNhiemDeTai
		FROM FREETEXTTABLE(DETAIBENNGOAI_NHANYEUCAU,TenDeTai,@tenDeTai) as FTS_DKDT
		INNER JOIN DETAIBENNGOAI_NHANYEUCAU NYC ON NYC.DeTaiBenNgoaiID = FTS_DKDT.[KEY]
		INNER JOIN DETAIBENNGOAI_GIAMSATKIEMTRA GT ON GT.DeTaiBenNgoaiID = NYC.DeTaiBenNgoaiID
		AND (UPPER(LTRIM(RTRIM(NYC.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  
		AND (UPPER(LTRIM(RTRIM(NYC.ChuNhiemDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@chuNhiemDeTai)))+'%' OR @chuNhiemDeTai IS NULL)  
		AND (GT.NgayThucHienGS = @ngayThucHienGS OR @ngayThucHienGS IS NULL)
	END
	ELSE
	BEGIN
		SELECT  distinct(GT.GiamSatKiemTraID), MaDeTai, TenDeTai, TrangThaiDeTaiBenNgoai
								, GT.DeTaiBenNgoaiID, GT.NgayThucHienGS,  ChuNhiemDeTai
		FROM DETAIBENNGOAI_NHANYEUCAU NYC
		INNER JOIN DETAIBENNGOAI_GIAMSATKIEMTRA GT ON GT.DeTaiBenNgoaiID = NYC.DeTaiBenNgoaiID
		WHERE (UPPER(LTRIM(RTRIM(NYC.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  
		AND (UPPER(LTRIM(RTRIM(NYC.ChuNhiemDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@chuNhiemDeTai)))+'%' OR @chuNhiemDeTai IS NULL)  
		AND (GT.NgayThucHienGS = @ngayThucHienGS OR @ngayThucHienGS IS NULL)
	END
END
