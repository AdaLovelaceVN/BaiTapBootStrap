CREATE PROCEDURE [dbo].[proc_Search_DeNghiNghiemThuCapQuanLy]
	@tenDeTai nvarchar(1000),
	@maDeTai nvarchar(1000),
	@chuNhiemDeTai int,
	@ngayDeNghi date
AS
BEGIN
	SET NOCOUNT ON;

	IF @tenDeTai IS NOT NULL
	BEGIN
		SELECT DN.DeNghiNghiemThuCapQuanLyID,DN.NgayDeNghi,DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,MaCanBoThucHien,HoTen,TrangThaiDeTai
		FROM DANGKYDETAI DKDT 
		INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
		ON DKDT.DeTaiID = FTS_DKDT.[KEY]
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN NGHIEMTHU_DENGHICAPQUANLY DN ON DN.DeTaiID = DKDT.DeTaiID		
		AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (DN.NgayDeNghi = @ngayDeNghi OR @ngayDeNghi IS NULL)

	END
	ELSE
	BEGIN
		SELECT DN.DeNghiNghiemThuCapQuanLyID,DN.NgayDeNghi,DKDT.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,MaCanBoThucHien,HoTen,TrangThaiDeTai
		FROM DANGKYDETAI DKDT 		
		INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
		INNER JOIN NGHIEMTHU_DENGHICAPQUANLY DN ON DN.DeTaiID = DKDT.DeTaiID	
		WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
		AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
		AND (DN.NgayDeNghi = @ngayDeNghi OR @ngayDeNghi IS NULL)
	END

END