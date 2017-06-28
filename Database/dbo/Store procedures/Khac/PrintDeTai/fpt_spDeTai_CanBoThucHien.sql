---Đội ngũ cán bộ thực hiện đề tài
CREATE PROC dbo.fpt_spDeTai_CanBoThucHien
	@DetaiId INT
AS
SELECT ROW_NUMBER() OVER(ORDER BY CanBoThucHienID) STT,* FROM DETAI_CANBOTHUCHIEN NOLOCK WHERE DeTaiID=@DetaiId ORDER BY CanBoThucHienID
go