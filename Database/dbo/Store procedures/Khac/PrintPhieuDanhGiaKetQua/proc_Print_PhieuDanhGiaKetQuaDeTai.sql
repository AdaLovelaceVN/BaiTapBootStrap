CREATE PROCEDURE [dbo].[proc_Print_PhieuDanhGiaKetQuaDeTai]
	@ID int
	--ID:KetQuaDeTaiID
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		DG.KetQuaDeTaiID,
		DG.HoTenChuyenGia,
		DG.NgayNhanHoSo,
		DG.PDG_DeTaiID,DG.YKienDanhGia,
		XepLoai = 
		CASE 
			WHEN DG.XepLoai = 1 THEN N'Xuất sắc'
			WHEN DG.XepLoai = 2 THEN N'Khá'
			WHEN DG.XepLoai = 3 THEN N'Trung bình'
			WHEN DG.XepLoai = 4 THEN N'Không đạt'
		END,
		CQL.TenCapQuanLy,
		DT.TenDeTai,DT.MaSoDeTai,DT.CNDT_HoTen,DT.ThucHienTuNgay,DT.ThucHienDenNgay,DT.KinhPhi
	FROM 
	(SELECT KetQuaDeTaiID,HoTenChuyenGia,NgayNhanHoSo,XepLoai,YKienDanhGia,PDG_DeTaiID
	FROM KETQUADETAI
	WHERE KetQuaDeTaiID = @ID) DG 
	INNER JOIN DETAI DT ON DT.DeTaiID  = DG.PDG_DeTaiID
	INNER JOIN DM_CAPQUANLY CQL ON CQL.DMCapQuanLyID = DT.DMCapQuanLyID
END
