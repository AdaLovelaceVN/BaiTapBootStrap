-----------Bao cao ket qua thục hiện
--I, Thông tin chung
CREATE PROC dbo.proc_PrintBCKQ_ThongTinChung
	@BCKQID INT
AS
SELECT top 1
	A.*
	,CONVERT(nvarchar(20),a.NgayKy,103) pNgayKy
	,CONVERT(nvarchar(20),a.NgayBatDauHopDong,103) pNgayBatDauHopDong
	,CONVERT(nvarchar(20),a.NgayKetThucHopDong,103) pNgayKetThucHopDong
	,CONVERT(nvarchar(20),a.NgayBatDauThucHien,103) pNgayBatDauThucHien
	,CONVERT(nvarchar(20),a.NgayKetThucThucHien,103) pNgayKetThucThucHien
	,b.TenDeTai,b.CNDT_HoTen,b.MaSoDeTai,c.TenCapQuanLy
	,CONVERT(nvarchar(20),b.ThucHienTuNgay,103) pThucHienTuNgay
	,CONVERT(nvarchar(20),b.ThucHienDenNgay,103) pThucHienDenNgay
	,KinhPhi  pKinhPhi
	,d.HieuQuaKHCN,d.HieuQuaKTXH
	--,E.TongKinhPhiThucHien
	--,E.KinhPhiHoTroSNKH
	--,E.KinhPhiTuNguonKhac
	--,E.TyLeKinhPhiThuHoi
FROM
	(SELECT * FROM BAOCAOKETQUA NOLOCK WHERE BaoCaoKetQuaID=@BCKQID)AS A
LEFT JOIN
	(SELECT * FROM DETAI NOLOCK) AS B ON B.DeTaiID=A.BCKQ_DeTaiID
LEFT JOIN
    (SELECT DMCapQuanLyID,TenCapQuanLy FROM DM_CAPQUANLY NOLOCK) AS C ON C.DMCapQuanLyID=B.DMCapQuanLyID
LEFT JOIN
    (SELECT * FROM HIEUQUADETAI NOLOCK) AS D ON D.BaoCaoKetQuaID=A.BaoCaoKetQuaID
--KINH PHI
--LEFT JOIN(SELECT * FROM KINHPHI NOLOCK) AS E ON E.BaoCaoKetQuaID=A.BaoCaoKetQuaID
GO
