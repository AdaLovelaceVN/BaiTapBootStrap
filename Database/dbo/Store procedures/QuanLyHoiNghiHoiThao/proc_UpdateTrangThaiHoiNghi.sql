CREATE PROCEDURE proc_UpdateTrangThaiHoiNghi
	@HoiNghiID INT
	,@TrangThaiHoiNghi INT
AS
	UPDATE HOINGHI_TOCHUCMODOT SET TrangThaiHoiNghi=@TrangThaiHoiNghi WHERE HoiNghiID=@HoiNghiID
GO