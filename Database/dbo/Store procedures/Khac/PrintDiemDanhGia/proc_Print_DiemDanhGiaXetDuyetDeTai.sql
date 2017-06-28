CREATE PROCEDURE [dbo].[proc_Print_DiemDanhGiaXetDuyetDeTai]
	@DiemDanhGiaID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		D.DiemDanhGiaID,
		D.DDG_DeTaiID,
		D.NgayDanhGia,
		D.SoPhieu,
		KienNghi = 
		CASE 
			WHEN D.KienNghiThucHien = 1 THEN N'Đề nghị thực hiện'
			WHEN D.KienNghiThucHien = 2 THEN N'Đề nghị thực hiện với điều chỉnh'
			WHEN D.KienNghiThucHien = 3 THEN N'Không thực hiện'
		END,
		D.NhanXet,
		D.DeNghiVoiDieuChinh,
		Khoan = 
		CASE
			WHEN D.LoaiKhoan = 1 THEN N'Khoán đến sản phẩm cuối cùng'
			WHEN D.LoaiKhoan = 2 THEN N'Khoán từng phần'
			WHEN D.LoaiKhoan != 1 OR d.LoaiKhoan != 2 THEN N''
		END,
		DT.TenDeTai,DT.MaSoDeTai,DT.CNDT_HoTen,DM.TenCapQuanLy,DT.ThucHienTuNgay,DT.ThucHienDenNgay,DT.KinhPhi
	FROM
	(SELECT DDG.DiemDanhGiaID,DDG.DDG_DeTaiID,DDG.NgayDanhGia,DDG.SoPhieu,DDG.KienNghiThucHien,DDG.NhanXet,DDG.DeNghiVoiDieuChinh,DDG.LoaiKhoan
	FROM DIEMDANHGIA DDG WHERE DDG.DiemDanhGiaID = @DiemDanhGiaID) D INNER JOIN DETAI DT ON DT.DeTaiID = D.DDG_DeTaiID
	INNER JOIN DM_CAPQUANLY DM ON DM.DMCapQuanLyID = DT.DMCapQuanLyID
END
