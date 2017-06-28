-------Hoạt động của các tổ chức phối hợp tham gia thực hiện đề tài
CREATE PROC dbo.fpt_spDeTai_HoatDongPhoiHop
	@DetaiId INT
AS
SELECT ROW_NUMBER() OVER(ORDER BY HoatDongPhoiHopID) STT,* FROM DETAI_HOATDONGPHOIHOP NOLOCK WHERE DeTaiID=@DetaiId ORDER BY HoatDongPhoiHopID
go