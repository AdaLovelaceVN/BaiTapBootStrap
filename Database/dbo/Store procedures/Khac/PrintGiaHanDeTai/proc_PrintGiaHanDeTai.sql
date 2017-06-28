CREATE PROCEDURE [dbo].[proc_PrintGiaHanDeTai]
	@GiaHanDeTaiId INT
AS
   SELECT TOP 1 A.*,
   B.TenDeTai,B.CNDT_HoTen
	,CONVERT(nvarchar(20),A.GiaHanDenNgay,103) pNgayBaoCao
	,CONVERT(nvarchar(20),b.ThucHienTuNgay,103) pThucHienTuNgay
	,CONVERT(nvarchar(20),b.ThucHienDenNgay,103) pThucHienDenNgay
	,B.MaSoDeTai,C.TenCapQuanLy,B.KinhPhi 
	,CASE WHEN(A.DaDuyet=1) then N'Đã duyệt'ELSE N'Chưa duyệt' END pTinhTrang 
	,Cast(KinhPhi as nvarchar(50))+N' (VNĐ)' pKinhPhi
	,CONVERT(nvarchar(20),D.NgayQuyetDinh,103) NgayQuyetDinh
	,D.SoQuyetDinh
	,E.TenDonViBanHanh
  FROM(SELECT * FROM GIAHANTHUCHIENDETAI NOLOCK WHERE GiaHanThucHienDeTaiID=@GiaHanDeTaiId)AS A
  LEFT JOIN(SELECT * FROM DETAI NOLOCK) AS B ON B.DeTaiID=A.GHDT_DeTaiID
  LEFT JOIN(SELECT DMCapQuanLyID,TenCapQuanLy FROM DM_CAPQUANLY NOLOCK) AS C ON C.DMCapQuanLyID=B.DMCapQuanLyID
  LEFT JOIN(SELECT * FROM QUYETDINHPHEDUYET NOLOCK)AS D ON D.QDPD_DeTaiID=B.DeTaiID
  LEFT JOIN(SELECT * FROM DM_DONVIBANHANH NOLOCK)AS E ON E.DMDonViBanHanhID=D.DonViBanHanhID