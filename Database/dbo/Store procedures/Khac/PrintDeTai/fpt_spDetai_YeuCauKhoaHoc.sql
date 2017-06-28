---Yêu cầu khoa học đối với sản phẩm tạo ra (dạng kết quả II, III)
CREATE PROC dbo.fpt_spDetai_YeuCauKhoaHoc
	@DetaiId INT
AS
SELECT ROW_NUMBER() OVER(ORDER BY YeuCauKhoaHocID) STT,* FROM DETAI_YEUCAUKHOAHOC NOLOCK WHERE DeTaiID=@DetaiId ORDER BY YeuCauKhoaHocID
GO