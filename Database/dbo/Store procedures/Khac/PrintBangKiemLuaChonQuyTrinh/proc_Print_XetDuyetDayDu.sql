CREATE PROCEDURE [dbo].[proc_Print_XetDuyetDayDu]
	@XDDDID int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
	XDDD.XDDD_SoBangKiem,XDDD.XDDD_YKienHuongDan_NgayGhi,XDDD.XDDD_YKienTruongKhoa_NgayGhi,
	XDDD.XDDD_YKienHuongDan_NhanXet,XDDD.XDDD_YKienTruongKhoa_NhanXet,
	XDDD.XDDD_YKienTruongKhoa_DMTinhKhoaHocID,
	XDDD.XDDD_NhanXet,XDDD.XDDD_DeTaiID,
	XemXetTinhKhoaHoc = CASE 
	WHEN XDDD.XDDD_XemXetTinhKhoaHoc = 1 THEN N'Có'
	WHEN XDDD.XDDD_XemXetTinhKhoaHoc = 0 THEN N'Không' END,
	DT.TenDeTai,DT.MaSoDeTai,DT.CNDT_HoTen,CQL.TenCapQuanLy,DT.ThucHienTuNgay,DT.ThucHienDenNgay,DT.KinhPhi,TKH.TenTinhKhoaHoc
	FROM
	(SELECT XD.XDDD_SoBangKiem,XD.XDDD_YKienHuongDan_NgayGhi,XD.XDDD_YKienTruongKhoa_NgayGhi,
	XD.XDDD_YKienHuongDan_NhanXet,XD.XDDD_YKienTruongKhoa_NhanXet,
	XD.XDDD_YKienTruongKhoa_DMTinhKhoaHocID,XD.XDDD_XemXetTinhKhoaHoc,
	XD.XDDD_NhanXet,XD.XDDD_DeTaiID
	FROM XETDUYETDAYDU XD WHERE XD.XDDD_XetDuyetDayDuID = @XDDDID) XDDD
	INNER JOIN DETAI DT ON DT.DeTaiID = XDDD.XDDD_DeTaiID
	INNER JOIN DM_CAPQUANLY CQL ON CQL.DMCapQuanLyID = DT.DMCapQuanLyID
	INNER JOIN DM_TINHKHOAHOC TKH ON TKH.DMTinhKhoaHocID = XDDD.XDDD_YKienTruongKhoa_DMTinhKhoaHocID
END

