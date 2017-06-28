CREATE PROC proc_DanhSachLoaiHoiDongNhiemKy
AS
SELECT HDNhiemKyID,MaHoiDong
	,CONVERT(nvarchar,NgayThanhLap,103) NgayThanhLap
	,LoaiHoiDong
	,CONVERT(nvarchar,NhiemKy_Tu,103) NhiemKy_Tu
	,CONVERT(nvarchar,NhiemKy_Den,103) NhiemKy_Den
	,CASE WHEN(LoaiHoiDong=10) THEN N'Hội đồng Đạo đức nghiên cứu Y sinh học'
	WHEN(LoaiHoiDong=20) THEN N'Hội đồng khoa học kỹ thuật'
	WHEN(LoaiHoiDong=30) THEN N'Hội đồng chuyên môn'
	END LoaiHoiDong_text
 FROM HOIDONG_NHIEMKY ORDER BY LoaiHoiDong,NgayThanhLap