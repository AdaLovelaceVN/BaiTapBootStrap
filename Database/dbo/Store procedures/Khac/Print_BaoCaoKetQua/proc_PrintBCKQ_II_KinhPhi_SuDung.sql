----------II-
--Tình hình cấp và sử dụng kinh phí từ nguồn SNKH
CREATE PROC dbo.proc_PrintBCKQ_II_KinhPhi_SuDung
	@BCKQID INT
AS
SELECT 
	A.*
	,CONVERT(nvarchar(20),b.KeHoach_ThoiGian,103) KeHoach_ThoiGian
	, b.KeHoach_KinhPhi
	,CONVERT(nvarchar(20),b.ThucTe_ThoiGian,103) ThucTe_ThoiGian
	,b.ThucTe_KinhPhi
	,B.GhiChu
FROM
(SELECT * FROM KINHPHI NOLOCK WHERE BaoCaoKetQuaID=@BCKQID)AS A
LEFT JOIN(SELECT * FROM TINHHINHCAP NOLOCK) AS B ON B.KinhPhiID=A.KinhPhiID
GO