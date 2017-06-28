CREATE PROCEDURE [dbo].[proc_UpdateTrangThaiHoiDong]
	@HoiDongID INT
	,@TrangThaiHD INT
AS
	UPDATE HOIDONG_YEUCAU_XETDUYET SET TrangThaiHD=@TrangThaiHD WHERE HoiDongID=@HoiDongID