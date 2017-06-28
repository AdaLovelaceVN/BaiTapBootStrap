CREATE PROCEDURE [dbo].[proc_Search_XetDuyetYeuCauLaySoLieu]
	@ngayChapThuan date,
	@phuongThucXetDuyet nvarchar(1000),
	@ngayXetDuyet date,
	@tenDeTai nvarchar(1000), 
	@maDeTai nvarchar(1000),
	@chuNhiemDeTai nvarchar(1000)
AS
BEGIN
	SET NOCOUNT ON;

	IF (@tenDeTai IS NOT NULL)
	BEGIN 
		SELECT XD.XetDuyetHDDDID,NgayChapThuan,PhuongThucXetDuyet, NgayXetDuyet, XD.DeTaiBenNgoaiID ,TenDeTai ,MaDeTai , TrangThaiDeTaiBenNgoai , ChuNhiemDeTai
		FROM FREETEXTTABLE(DETAIBENNGOAI_NHANYEUCAU,TenDeTai,@tenDeTai) as FTS_DKDT
		INNER JOIN DETAIBENNGOAI_NHANYEUCAU NYC ON NYC.DeTaiBenNgoaiID = FTS_DKDT.[KEY]
		INNER JOIN DETAIBENNGOAI_XETDUYET_HDDAODUC XD ON XD.DeTaiBenNgoaiID = NYC.DeTaiBenNgoaiID
		AND (UPPER(LTRIM(RTRIM(NYC.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(NYC.ChuNhiemDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@chuNhiemDeTai)))+'%' OR @chuNhiemDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(XD.PhuongThucXetDuyet))) LIKE '%'+UPPER(LTRIM(RTRIM(@phuongThucXetDuyet)))+'%' OR @phuongThucXetDuyet IS NULL)  
		AND (NgayXetDuyet = @ngayXetDuyet OR @ngayXetDuyet IS NULL)
		AND (NgayChapThuan = @ngayChapThuan OR @ngayChapThuan IS NULL)
	END
	ELSE
	BEGIN
		SELECT XD.XetDuyetHDDDID,NgayChapThuan,PhuongThucXetDuyet, NgayXetDuyet, XD.DeTaiBenNgoaiID ,TenDeTai ,MaDeTai , TrangThaiDeTaiBenNgoai , ChuNhiemDeTai
		FROM DETAIBENNGOAI_NHANYEUCAU NYC 
		INNER JOIN DETAIBENNGOAI_XETDUYET_HDDAODUC XD ON XD.DeTaiBenNgoaiID = NYC.DeTaiBenNgoaiID
		AND (UPPER(LTRIM(RTRIM(NYC.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(NYC.ChuNhiemDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@chuNhiemDeTai)))+'%' OR @chuNhiemDeTai IS NULL)  	
		AND (UPPER(LTRIM(RTRIM(XD.PhuongThucXetDuyet))) LIKE '%'+UPPER(LTRIM(RTRIM(@phuongThucXetDuyet)))+'%' OR @phuongThucXetDuyet IS NULL)  
		AND (NgayXetDuyet = @ngayXetDuyet OR @ngayXetDuyet IS NULL)
		AND (NgayChapThuan = @ngayChapThuan OR @ngayChapThuan IS NULL)
	END
END
