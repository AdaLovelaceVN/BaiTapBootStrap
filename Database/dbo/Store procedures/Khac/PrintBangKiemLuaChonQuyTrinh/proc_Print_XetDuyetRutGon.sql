CREATE PROCEDURE [dbo].[proc_Print_XetDuyetRutGon]
	@XDRGID int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
	XDRG.XDRG_SoBangKiem,XDRG.XDRG_NghienCuuSinh_NgayKhai,DK.TenDieuKien,
	XDRG.XDRG_YKienNguoiHuongDan_Ngay,DK1.TenDieuKien,
	XDRG.XDRG_YKienTruongKhoa_Ngay,DK2.TenDieuKien,
	XDRG.XDRG_YKienChuTichHoiDong_Ngay,DK3.TenDieuKien,
	XDRG.XDRG_YKienNhanXet,XDRG.XDRG_DeTaiID,
	DT.TenDeTai,DT.MaSoDeTai,DT.CNDT_HoTen,CQL.TenCapQuanLy,DT.ThucHienTuNgay,DT.ThucHienDenNgay,DT.KinhPhi
	FROM
	(SELECT XD.XDRG_SoBangKiem,XD.XDRG_NghienCuuSinh_NgayKhai,XD.XDRG_NghienCuuSinh_DMDieuKienID,
	XD.XDRG_YKienNguoiHuongDan_Ngay,XD.XDRG_YKienNguoiHuongDan_DMDieuKienID,
	XD.XDRG_YKienTruongKhoa_Ngay,XD.XDRG_YKienTruongKhoa_DMDieuKienID,
	XD.XDRG_YKienChuTichHoiDong_Ngay,XD.XDRG_YKienChuTichHoiDong_DMDieuKienID,
	XD.XDRG_YKienNhanXet,XD.XDRG_DeTaiID
	FROM XETDUYETRUTGON XD WHERE XD.XDRG_XetDuyetRutGonID = @XDRGID) XDRG
	INNER JOIN DETAI DT ON DT.DeTaiID = XDRG.XDRG_DeTaiID
	INNER JOIN DM_CAPQUANLY CQL ON CQL.DMCapQuanLyID = DT.DMCapQuanLyID
	INNER JOIN DM_DIEUKIEN DK ON DK.DMDieuKienID = XDRG.XDRG_NghienCuuSinh_DMDieuKienID
	INNER JOIN DM_DIEUKIEN DK1 ON DK1.DMDieuKienID = XDRG.XDRG_YKienNguoiHuongDan_DMDieuKienID
	INNER JOIN DM_DIEUKIEN DK2 ON DK2.DMDieuKienID = XDRG.XDRG_YKienTruongKhoa_DMDieuKienID
	INNER JOIN DM_DIEUKIEN DK3 ON DK3.DMDieuKienID = XDRG.XDRG_YKienChuTichHoiDong_DMDieuKienID
END