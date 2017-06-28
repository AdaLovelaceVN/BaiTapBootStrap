---IV--tinh hinh to chuc hoi thao
CREATE PROC dbo.proc_PrintBCDK_IV_ToChucHoiThao
	@BCKQID INT
AS
SELECT 
*,CONVERT(nvarchar(20),ThoiGian,103) pThoiGian
 FROM TOCHUCHOITHAO NOLOCK WHERE BaoCaoKetQuaID=@BCKQID
GO