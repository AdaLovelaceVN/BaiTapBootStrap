----------II-
--Tình hình cấp và sử dụng kinh phí từ nguồn SNKH
CREATE PROC dbo.proc_PrintBCKQ_II_KinhPhi_KhoanChi
	@BCKQID INT
AS
SELECT 
	B.*
FROM
(SELECT * FROM KINHPHI NOLOCK where BaoCaoKetQuaID=@BCKQID )AS A
LEFT JOIN(SELECT * FROM KETQUASUDUNG NOLOCK) AS B ON B.KinhPhiID=A.KinhPhiID
GO