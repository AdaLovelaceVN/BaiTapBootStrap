﻿
CREATE PROC proc_ThongTinHoiDong
	@HoiDongID INT
AS
SELECT DISTINCT A.*,B.TenLoaiHoSo,C.TenKhoaPhong,CONVERT(NVARCHAR(50),A.ThoiGianDangKy,103) NgayDangKy FROM
(
	SELECT * FROM HOIDONG_YEUCAU_XETDUYET nolock WHERE HoiDongID=@HoiDongID)A
	INNER JOIN(SELECT * FROM DANHMUC_LOAIHOSO NOLOCK)AS B ON B.DMLoaiHoSoID=A.DMLoaiHoSoID
	INNER JOIN(SELECT * FROM DANHMUC_KHOAPHONG NOLOCK) AS C ON C.DMKhoaPhongID=A.DMKhoaPhongID
