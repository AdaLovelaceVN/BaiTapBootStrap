CREATE PROCEDURE [dbo].[proc_Print_HoiDongNghienCuu_DanhSachHoiDong]
	@HoiDongID int
AS 
BEGIN
	SET NOCOUNT ON;

	SELECT DS.HoTen,DS.DonVi,DS.NhiemVu
	FROM DANHSACHHOIDONGNGHIENCUU DS
	WHERE DS.HoiDongNghienCuuID = @HoiDongID
END
