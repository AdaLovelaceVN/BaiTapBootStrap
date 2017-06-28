CREATE PROCEDURE [dbo].[proc_Search_BaoCaoHoanTat]
	@tenDeTai nvarchar(1000),
	@maDeTai nvarchar(1000),
	@ngayHoanTatLaySoLieu date,
	@chuNhiemDeTai nvarchar(1000)
AS
BEGIN
	SET NOCOUNT ON;

	IF (@tenDeTai IS NOT NULL)
	BEGIN 
		SELECT MaDeTai, TenDeTai, TrangThaiDeTaiBenNgoai, ThoiGianLaySoLieu, ChuNhiemDeTai, GT.DeTaiBenNgoaiID, GT.BaoCaoHoanTatID
		FROM FREETEXTTABLE(DETAIBENNGOAI_NHANYEUCAU,TenDeTai,@tenDeTai) as FTS_DKDT
		INNER JOIN DETAIBENNGOAI_NHANYEUCAU NYC ON NYC.DeTaiBenNgoaiID = FTS_DKDT.[KEY]
		INNER JOIN DETAIBENNGOAI_BAOCAOHOANTAT GT ON GT.DeTaiBenNgoaiID = NYC.DeTaiBenNgoaiID
		AND (UPPER(LTRIM(RTRIM(NYC.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(NYC.ChuNhiemDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@chuNhiemDeTai)))+'%' OR @chuNhiemDeTai IS NULL)  	
		AND (ThoiGianLaySoLieu = @ngayHoanTatLaySoLieu OR @ngayHoanTatLaySoLieu IS NULL)
	END
	ELSE
	BEGIN
		SELECT MaDeTai, TenDeTai, TrangThaiDeTaiBenNgoai, ThoiGianLaySoLieu, ChuNhiemDeTai, GT.DeTaiBenNgoaiID, GT.BaoCaoHoanTatID
		FROM DETAIBENNGOAI_NHANYEUCAU NYC
		INNER JOIN DETAIBENNGOAI_BAOCAOHOANTAT GT ON GT.DeTaiBenNgoaiID = NYC.DeTaiBenNgoaiID
		WHERE (UPPER(LTRIM(RTRIM(NYC.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  
		AND (UPPER(LTRIM(RTRIM(NYC.ChuNhiemDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@chuNhiemDeTai)))+'%' OR @chuNhiemDeTai IS NULL)  	
		AND (ThoiGianLaySoLieu = @ngayHoanTatLaySoLieu OR @ngayHoanTatLaySoLieu IS NULL)
	END
END
