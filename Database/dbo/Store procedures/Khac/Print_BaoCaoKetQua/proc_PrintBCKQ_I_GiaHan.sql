-------------I
--Gia Han thời gian
CREATE PROC dbo.proc_PrintBCKQ_I_GiaHan
	@BCKQID INT
AS
SELECT
    Lan
	, CONVERT(nvarchar(20),TuNgay,103) TuNgay
	, CONVERT(nvarchar(20),DenNgay,103) DenNgay 
	FROM GIAHAN NOLOCK WHERE BaoCaoKetQuaID=@BCKQID
ORDER BY Lan ASC