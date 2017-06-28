------------Tiến độ thực hiện
CREATE PROC dbo.fpt_spDetai_TienDoThucHien
	@DetaiId INT
AS
	SELECT  ROW_NUMBER() OVER(ORDER BY TienDoThucHienID) STT,*,CONVERT(nvarchar(50),ThoiGian,103) pThoiGian
	 FROM DETAI_TIENDOTHUCHIEN NOLOCK WHERE DeTaiID=@DetaiId ORDER BY TienDoThucHienID
