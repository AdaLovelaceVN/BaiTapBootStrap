CREATE PROCEDURE [dbo].[proc_Search_TiepNhanYeuCauXetDuyetDeTai]
	@loaiHoiDong int,
	@phuongThucXetDuyet int,
	@thoiGianXetDuyet date
AS
BEGIN
	SET NOCOUNT ON;
	SELECT YCXD.YeuCauXetDuyetID,ThoiGianXetDuyet,PhuongThucXetDuyet,YCXD.DeTaiID,LoaiHoiDong,TenDeTai,MaDeTai,TrangThaiDeTai
	FROM (SELECT *
		FROM XETDUYETDETAI_YEUCAUXETDUYET
		WHERE (LoaiHoiDong = @loaiHoiDong OR @loaiHoiDong IS NULL)
		AND (PhuongThucXetDuyet = @phuongThucXetDuyet OR @phuongThucXetDuyet IS NULL)
		AND (ThoiGianXetDuyet = @thoiGianXetDuyet OR @thoiGianXetDuyet IS NULL)) YCXD
	INNER JOIN DANGKYDETAI DT ON DT.DeTaiID = YCXD.DeTaiID
END
