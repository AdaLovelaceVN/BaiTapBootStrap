CREATE PROCEDURE [dbo].[proc_Search_GiayGioiThieu]
	@tenDeTai nvarchar(1000),
	@maDeTai nvarchar(1000),
	@thoiGianLaySoLieuTu date,
	@thoiGianLaySoLieuDen date,
	@dmKhoaPhongID int
AS
BEGIN
	SET NOCOUNT ON;

	IF (@tenDeTai IS NOT NULL)
	BEGIN 
		SELECT TenKhoaPhong, MaDeTai, TenDeTai, TrangThaiDeTaiBenNgoai, ThoiGianLaySoLieu_Tu, ThoiGianLaySoLieu_Den, LamGiayGioiThieuID, GT.DeTaiBenNgoaiID, GT.DMKhoaPhongID
		FROM FREETEXTTABLE(DETAIBENNGOAI_NHANYEUCAU,TenDeTai,@tenDeTai) as FTS_DKDT
		INNER JOIN DETAIBENNGOAI_NHANYEUCAU NYC ON NYC.DeTaiBenNgoaiID = FTS_DKDT.[KEY]
		INNER JOIN DETAIBENNGOAI_LAMGIAYGIOITHIEU GT ON GT.DeTaiBenNgoaiID = NYC.DeTaiBenNgoaiID
		INNER JOIN DANHMUC_KHOAPHONG KO ON GT.DMKhoaPhongID = KO.DMKhoaPhongID  
		AND (UPPER(LTRIM(RTRIM(NYC.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (ThoiGianLaySoLieu_Tu = @thoiGianLaySoLieuTu OR @thoiGianLaySoLieuTu IS NULL)
		AND (ThoiGianLaySoLieu_Den = @thoiGianLaySoLieuDen OR @thoiGianLaySoLieuDen IS NULL)
		AND (GT.DMKhoaPhongID = @dmKhoaPhongID OR @dmKhoaPhongID IS NULL)
	END
	ELSE
	BEGIN
		SELECT TenKhoaPhong, MaDeTai, TenDeTai, TrangThaiDeTaiBenNgoai, ThoiGianLaySoLieu_Tu, ThoiGianLaySoLieu_Den, LamGiayGioiThieuID, GT.DMKhoaPhongID, GT.DeTaiBenNgoaiID
		FROM DETAIBENNGOAI_NHANYEUCAU NYC
		INNER JOIN DETAIBENNGOAI_LAMGIAYGIOITHIEU GT ON GT.DeTaiBenNgoaiID = NYC.DeTaiBenNgoaiID
		INNER JOIN DANHMUC_KHOAPHONG KO ON GT.DMKhoaPhongID = KO.DMKhoaPhongID  
		WHERE (UPPER(LTRIM(RTRIM(NYC.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (ThoiGianLaySoLieu_Tu = @thoiGianLaySoLieuTu OR @thoiGianLaySoLieuTu IS NULL)
		AND (ThoiGianLaySoLieu_Den = @thoiGianLaySoLieuDen OR @thoiGianLaySoLieuDen IS NULL)
		AND (GT.DMKhoaPhongID = @dmKhoaPhongID OR @dmKhoaPhongID IS NULL)
	END
END
