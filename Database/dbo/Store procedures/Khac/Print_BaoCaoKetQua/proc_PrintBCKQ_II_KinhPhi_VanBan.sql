----------II-
--Các văn bản hành chính trong quá trình thực hiện đề tài/ dự án
CREATE PROC dbo.proc_PrintBCKQ_II_KinhPhi_VanBan
	@BCKQID INT
AS
SELECT 
	B.*
FROM
(SELECT * FROM KINHPHI NOLOCK where BaoCaoKetQuaID=@BCKQID )AS A
LEFT JOIN(SELECT * FROM VANBAN NOLOCK) AS B ON B.KinhPhiID=A.KinhPhiID
GO