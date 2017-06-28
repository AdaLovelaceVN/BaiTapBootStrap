CREATE PROCEDURE [dbo].[proc_Search_XetDuyetDeTaiTheoQuyTrinh]
	@ngayXetDuyet date,
	@ngayChapThuan date,
	@phuongThucXetDuyet int
AS 
BEGIN
	SET NOCOUNT ON;

	SELECT HoiDongDaoDucID,DT.DeTaiID,MaDeTai,TenDeTai,CBTH.MaCanBoThucHien,CBTH.HoTen as ChuNhiemDeTai,NgayChapThuan,NgayXetDuyet,KetQuaXetDuyet,CoChinhSuaBoSung,TrangThaiDeTai,PhuongThucXetDuyet
	FROM (SELECT HoiDongDaoDucID,XETDUYETDETAI_YEUCAUXETDUYET.DeTaiID,NgayChapThuan,NgayXetDuyet,KetQuaXetDuyet,CoChinhSuaBoSung,XETDUYETDETAI_YEUCAUXETDUYET.PhuongThucXetDuyet
		  FROM XETDUYETDETAI_HOIDONGDAODUC, XETDUYETDETAI_YEUCAUXETDUYET
		  WHERE (@ngayXetDuyet = NgayXetDuyet OR @ngayXetDuyet IS NULL)
		  AND (@ngayChapThuan = NgayChapThuan OR @ngayChapThuan IS NULL)
		  AND (@phuongThucXetDuyet = XETDUYETDETAI_YEUCAUXETDUYET.PhuongThucXetDuyet OR @phuongThucXetDuyet IS NULL)
		  AND (XETDUYETDETAI_HOIDONGDAODUC.DeTaiID = XETDUYETDETAI_YEUCAUXETDUYET.DeTaiID)) HDDD
	LEFT JOIN DANGKYDETAI DT ON HDDD.DeTaiID = DT.DeTaiID
	LEFT JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DT.ChuNhiemDeTaiID		  
END
