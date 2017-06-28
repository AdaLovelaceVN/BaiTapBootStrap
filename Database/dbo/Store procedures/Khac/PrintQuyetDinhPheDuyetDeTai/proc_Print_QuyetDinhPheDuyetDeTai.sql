CREATE PROCEDURE [dbo].[proc_Print_QuyetDinhPheDuyetDeTai]
	@QuyetDinhID int

AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
	QDPD.*,
	DV.TenDonViBanHanh,
	CQL.TenCapQuanLy,
	DT.TenDeTai,
	DT.MaSoDeTai,
	DT.CNDT_HoTen,
	DT.ThucHienTuNgay,
	DT.ThucHienDenNgay,
	DT.KinhPhi
	FROM
	(SELECT QD.QuyetDinhPheDuyetID,QD.QDPD_DeTaiID,QD.SoQuyetDinh,QD.NgayQuyetDinh,QD.BienBanHop,QD.NguoiDeNghi,
	QD.TrichYeu,QD.GhiChu,QD.DonViBanHanhID
	FROM QUYETDINHPHEDUYET QD WHERE QD.QuyetDinhPheDuyetID = @QuyetDinhID) QDPD
	INNER JOIN DETAI DT ON DT.DeTaiID = QDPD.QDPD_DeTaiID
	INNER JOIN DM_CAPQUANLY CQL ON CQL.DMCapQuanLyID = DT.DMCapQuanLyID
	INNER JOIN DM_DONVIBANHANH  DV ON DV.DMDonViBanHanhID = QDPD.DonViBanHanhID
END