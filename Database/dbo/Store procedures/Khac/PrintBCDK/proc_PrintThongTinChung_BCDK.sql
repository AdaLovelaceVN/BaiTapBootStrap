----THONG TIN CHUNG BAO CAO DINH KY
CREATE PROC proc_PrintThongTinChung_BCDK
	@IDBaoCaoDK INT
AS
SELECT TOP 1
	A.*,B.TenDeTai,B.CNDT_HoTen,N'BÁO CÁO KỲ SỐ '+UPPER(A.KyBaoCao) AS pKyBaoCao
	,CONVERT(nvarchar(20),A.NgayBaoCao,103) pNgayBaoCao
	,CONVERT(nvarchar(20),b.ThucHienTuNgay,103) pThucHienTuNgay
	,CONVERT(nvarchar(20),b.ThucHienDenNgay,103) pThucHienDenNgay
	,B.MaSoDeTai,C.TenCapQuanLy,B.KinhPhi
 FROM
(SELECT * FROM BAOCAODINHKY NOLOCK) AS A
LEFT JOIN(SELECT * FROM DETAI NOLOCK) AS B ON B.DeTaiID=A.BCDK_DeTaiID
LEFT JOIN(SELECT DMCapQuanLyID,TenCapQuanLy FROM DM_CAPQUANLY NOLOCK) AS C ON C.DMCapQuanLyID=B.DMCapQuanLyID
GO
----------