CREATE PROC proc_SearchHoiDongNhiemKybyID
	@ID int
	
AS
	SELECT A.ThanhVienNhiemKyID,MaThanhVien
	       ,TenThanhVien,ThongTinLienLac,ChucVuID 
		   ,'' TenChucVu,NoiCongTac,NhiemVuTrongHD,HDNhiemKyID
	 FROM(SELECT * FROM HOIDONG_NHIEMKY_CHITIET NOLOCK WHERE HDNhiemKyID=@ID) AS A
	INNER JOIN(SELECT * FROM DANHMUC_HOIDONG_NHIEMKY_THANHVIEN NOLOCK)AS B ON B.ThanhVienNhiemKyID=A.ThanhVienNhiemKyID