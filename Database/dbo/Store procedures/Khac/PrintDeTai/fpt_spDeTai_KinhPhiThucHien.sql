---Kinh phí thực hiện đề tài phân theo các khoản chi
CREATE PROC dbo.fpt_spDeTai_KinhPhiThucHien
	@DetaiId INT
AS
SELECT ROW_NUMBER() OVER(ORDER BY KinhPhiThucHienID) STT,* FROM DETAI_KINHPHITHUCHIEN NOLOCK WHERE DeTaiID=@DetaiId ORDER BY KinhPhiThucHienID
go