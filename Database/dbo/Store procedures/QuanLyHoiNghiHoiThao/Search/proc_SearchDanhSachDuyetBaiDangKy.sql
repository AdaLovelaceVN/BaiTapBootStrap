CREATE PROCEDURE [dbo].[proc_SearchDanhSachDuyetBaiDangKy]
	@HoiNghiID NVARCHAR(50)
	,@KetQuaDuyetBai NVARCHAR(50)
	,@NgayNhan NVARCHAR(50)
AS
	declare @str nvarchar(max), @strHoiNghiID NVARCHAR(1000)='',@strKetQuaDuyetBai NVARCHAR(1000)='',@strNgayNhan NVARCHAR(1000)=''
	IF(@HoiNghiID!='')
	BEGIN
		SET @strHoiNghiID=' AND HoiNghiID='+@HoiNghiID
	END
	IF(@KetQuaDuyetBai!='')
	BEGIN
		SET @strKetQuaDuyetBai=' AND Duyet='+@KetQuaDuyetBai 
	END
	IF(@NgayNhan!='')
	BEGIN
		SET @strNgayNhan=' AND CONVERT(date,NgayNhan,103) LIKE CONVERT(date,'''+ @NgayNhan +''',103) '
	END

	SET @str= ' SELECT A.*,B.MaHoiNGhi,B.TenHoiNghi,B.ThoiGianTu,B.ThoiGianDen,B.TrangThaiHoiNghi FROM(SELECT * FROM HOINGHI_DUYEBAIDANGKY NOLOCK WHERE 1=1 '+ @strHoiNghiID+@strKetQuaDuyetBai+@strNgayNhan+' ) AS A '
	SET @str+=' INNER JOIN(SELECT * FROM HOINGHI_TOCHUCMODOT NOLOCK) AS B ON B.HoiNghiID=A.HoiNghiID ORDER BY NgayNhan DESC '
	exec(@str)
