--------------Yêu cầu kỹ thuật, chỉ tiêu chất lượng đối với sản phẩm tạo ra (dạng kết quả I)
CREATE PROC dbo.fpt_spDetai_YeuCauKyThuat
	@DetaiId INT
AS
SELECT ROW_NUMBER() OVER(ORDER BY YeuCauKyThuatId) STT,* FROM DETAI_YEUCAUKYTHUAT NOLOCK WHERE DeTaiID=@DetaiId ORDER BY YeuCauKyThuatID
GO