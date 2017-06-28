﻿CREATE PROCEDURE [dbo].[proc_Search_NghiemThuCapCoSo]
	@tenDeTai nvarchar(1000),
	@maDeTai nvarchar(1000),
	@chuNhiemDeTai int,
	@coQuanChuTri nvarchar(1000),
	@ngayBaoVe date,
	@ketQuaNghiemThu int
AS
BEGIN
	SET NOCOUNT ON;

	IF @ketQuaNghiemThu IS NULL
		SET @ketQuaNghiemThu = 30

	IF @tenDeTai IS NOT NULL
	BEGIN		
		IF @ketQuaNghiemThu = 30
			SELECT NT.NghiemThuDeTaiCapCoSoID,DKDT.DeTaiID,MaDeTai,TenDeTai,MaCanBoThucHien,HoTen,TrangThaiDeTai,NgayBaoVeBaoCaoNghiemThu,KetQuaDeTai,KetQuaNghiemThuCapCoSo,CoChinhSuaBoSung
			FROM DANGKYDETAI DKDT 
			INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
			ON DKDT.DeTaiID = FTS_DKDT.[KEY]
			INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
			INNER JOIN NGHIEMTHU_NGHIEMTHUDETAICAPCOSO NT ON NT.DeTaiID = DKDT.DeTaiID
			AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
			AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
			AND (NT.NgayBaoVeBaoCaoNghiemThu = @ngayBaoVe OR @ngayBaoVe IS NULL)
		IF @ketQuaNghiemThu = 20
			SELECT NT.NghiemThuDeTaiCapCoSoID,DKDT.DeTaiID,MaDeTai,TenDeTai,MaCanBoThucHien,HoTen,TrangThaiDeTai,NgayBaoVeBaoCaoNghiemThu,KetQuaDeTai,KetQuaNghiemThuCapCoSo,CoChinhSuaBoSung
			FROM DANGKYDETAI DKDT 
			INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
			ON DKDT.DeTaiID = FTS_DKDT.[KEY]
			INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
			INNER JOIN NGHIEMTHU_NGHIEMTHUDETAICAPCOSO NT ON NT.DeTaiID = DKDT.DeTaiID
			AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
			AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
			AND (NT.NgayBaoVeBaoCaoNghiemThu = @ngayBaoVe OR @ngayBaoVe IS NULL)
			AND (NT.KetQuaNghiemThuCapCoSo = 0)
		IF @ketQuaNghiemThu = 10
			SELECT NT.NghiemThuDeTaiCapCoSoID,DKDT.DeTaiID,MaDeTai,TenDeTai,MaCanBoThucHien,HoTen,TrangThaiDeTai,NgayBaoVeBaoCaoNghiemThu,KetQuaDeTai,KetQuaNghiemThuCapCoSo,CoChinhSuaBoSung
			FROM DANGKYDETAI DKDT 
			INNER JOIN FREETEXTTABLE(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT
			ON DKDT.DeTaiID = FTS_DKDT.[KEY]
			INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
			INNER JOIN NGHIEMTHU_NGHIEMTHUDETAICAPCOSO NT ON NT.DeTaiID = DKDT.DeTaiID
			AND (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
			AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
			AND (NT.NgayBaoVeBaoCaoNghiemThu = @ngayBaoVe OR @ngayBaoVe IS NULL)
			AND (NT.KetQuaNghiemThuCapCoSo = 1)
	END
	ELSE
	BEGIN		
		IF @ketQuaNghiemThu = 30
			SELECT NT.NghiemThuDeTaiCapCoSoID,DKDT.DeTaiID,MaDeTai,TenDeTai,MaCanBoThucHien,HoTen,TrangThaiDeTai,NgayBaoVeBaoCaoNghiemThu,KetQuaDeTai,KetQuaNghiemThuCapCoSo,CoChinhSuaBoSung
			FROM DANGKYDETAI DKDT 			
			INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
			INNER JOIN NGHIEMTHU_NGHIEMTHUDETAICAPCOSO NT ON NT.DeTaiID = DKDT.DeTaiID
			WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
			AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
			AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
			AND (NT.NgayBaoVeBaoCaoNghiemThu = @ngayBaoVe OR @ngayBaoVe IS NULL)
		IF @ketQuaNghiemThu = 20
			SELECT NT.NghiemThuDeTaiCapCoSoID,DKDT.DeTaiID,MaDeTai,TenDeTai,MaCanBoThucHien,HoTen,TrangThaiDeTai,NgayBaoVeBaoCaoNghiemThu,KetQuaDeTai,KetQuaNghiemThuCapCoSo,CoChinhSuaBoSung
				FROM DANGKYDETAI DKDT 			
				INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
				INNER JOIN NGHIEMTHU_NGHIEMTHUDETAICAPCOSO NT ON NT.DeTaiID = DKDT.DeTaiID
				WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
				AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
				AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
				AND (NT.NgayBaoVeBaoCaoNghiemThu = @ngayBaoVe OR @ngayBaoVe IS NULL)
				AND (NT.KetQuaNghiemThuCapCoSo = 0)
		IF @ketQuaNghiemThu = 10
			SELECT NT.NghiemThuDeTaiCapCoSoID,DKDT.DeTaiID,MaDeTai,TenDeTai,MaCanBoThucHien,HoTen,TrangThaiDeTai,NgayBaoVeBaoCaoNghiemThu,KetQuaDeTai,KetQuaNghiemThuCapCoSo,CoChinhSuaBoSung
				FROM DANGKYDETAI DKDT 			
				INNER JOIN DANHMUC_CANBOTHUCHIEN CBTH ON CBTH.CanBoThucHienID = DKDT.ChuNhiemDeTaiID
				INNER JOIN NGHIEMTHU_NGHIEMTHUDETAICAPCOSO NT ON NT.DeTaiID = DKDT.DeTaiID
				WHERE (CBTH.CanBoThucHienID = @chuNhiemDeTai OR @chuNhiemDeTai IS NULL)
				AND (UPPER(LTRIM(RTRIM(DKDT.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)  	
				AND (UPPER(LTRIM(RTRIM(DKDT.CoQuanChuTri))) LIKE '%' +UPPER(LTRIM(RTRIM(@coQuanChuTri)))+ '%' OR @coQuanChuTri IS NULL)
				AND (NT.NgayBaoVeBaoCaoNghiemThu = @ngayBaoVe OR @ngayBaoVe IS NULL)
				AND (NT.KetQuaNghiemThuCapCoSo = 1)
	END

END