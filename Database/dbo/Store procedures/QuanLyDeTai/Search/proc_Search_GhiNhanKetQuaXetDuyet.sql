CREATE PROCEDURE [dbo].[proc_Search_GhiNhanKetQuaXetDuyet]
	@ketQuaXetDuyet int,
	@maDeTai nvarchar(1000),
	@tenDeTai nvarchar(1000)
AS
BEGIN
	SET NOCOUNT ON;

	IF @tenDeTai is not null
	begin
		if @ketQuaXetDuyet = 30
		begin
			select dt.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,cbth.MaCanBoThucHien,cbth.HoTen,TrangThaiDeTai,gnkq.GhiNhanKetQuaID
			from DANGKYDETAI dt 
			inner join freetexttable(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT on dt.DeTaiID = FTS_DKDT.[KEY]
			inner join XETDUYETDETAI_GHINHANKETQUA gnkq on gnkq.DeTaiID = dt.DeTaiID
			inner join DANHMUC_CANBOTHUCHIEN cbth on cbth.CanBoThucHienID = dt.ChuNhiemDeTaiID
			inner join XETDUYETDETAI_HOIDONGDAODUC hddd on hddd.DeTaiID = dt.DeTaiID
			AND (UPPER(LTRIM(RTRIM(dt.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL) 

		end

		if @ketQuaXetDuyet = 20
		begin
			select dt.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,cbth.MaCanBoThucHien,cbth.HoTen,TrangThaiDeTai,gnkq.GhiNhanKetQuaID
			from DANGKYDETAI dt 
			inner join freetexttable(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT on dt.DeTaiID = FTS_DKDT.[KEY]
			inner join XETDUYETDETAI_GHINHANKETQUA gnkq on gnkq.DeTaiID = dt.DeTaiID
			inner join DANHMUC_CANBOTHUCHIEN cbth on cbth.CanBoThucHienID = dt.ChuNhiemDeTaiID
			inner join XETDUYETDETAI_HOIDONGDAODUC hddd on hddd.DeTaiID = dt.DeTaiID
			AND (UPPER(LTRIM(RTRIM(dt.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)
			AND (hddd.CoChinhSuaBoSung = 0 OR hddd.CoChinhSuaBoSung IS NULL)
		end

		if @ketQuaXetDuyet = 10
		begin
			select dt.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,cbth.MaCanBoThucHien,cbth.HoTen,TrangThaiDeTai,gnkq.GhiNhanKetQuaID
			from DANGKYDETAI dt 
			inner join freetexttable(DANGKYDETAI,TenDeTai,@tenDeTai) as FTS_DKDT on dt.DeTaiID = FTS_DKDT.[KEY]
			inner join XETDUYETDETAI_GHINHANKETQUA gnkq on gnkq.DeTaiID = dt.DeTaiID
			inner join DANHMUC_CANBOTHUCHIEN cbth on cbth.CanBoThucHienID = dt.ChuNhiemDeTaiID
			inner join XETDUYETDETAI_HOIDONGDAODUC hddd on hddd.DeTaiID = dt.DeTaiID
			AND (UPPER(LTRIM(RTRIM(dt.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)
			AND (hddd.CoChinhSuaBoSung = 1 OR hddd.CoChinhSuaBoSung IS NULL)
		end
	end
	ELSE
	begin
		if @ketQuaXetDuyet = 30
			begin
			select dt.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,cbth.MaCanBoThucHien,cbth.HoTen,TrangThaiDeTai,gnkq.GhiNhanKetQuaID
			from DANGKYDETAI dt 
			inner join XETDUYETDETAI_GHINHANKETQUA gnkq on gnkq.DeTaiID = dt.DeTaiID
			inner join DANHMUC_CANBOTHUCHIEN cbth on cbth.CanBoThucHienID = dt.ChuNhiemDeTaiID
			inner join XETDUYETDETAI_HOIDONGDAODUC hddd on hddd.DeTaiID = dt.DeTaiID
			where
			(UPPER(LTRIM(RTRIM(dt.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL) 
		end

		if @ketQuaXetDuyet = 20
			begin
			select dt.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,cbth.MaCanBoThucHien,cbth.HoTen,TrangThaiDeTai,gnkq.GhiNhanKetQuaID
			from DANGKYDETAI dt 
			inner join XETDUYETDETAI_GHINHANKETQUA gnkq on gnkq.DeTaiID = dt.DeTaiID
			inner join DANHMUC_CANBOTHUCHIEN cbth on cbth.CanBoThucHienID = dt.ChuNhiemDeTaiID
			inner join XETDUYETDETAI_HOIDONGDAODUC hddd on hddd.DeTaiID = dt.DeTaiID
			where
			(UPPER(LTRIM(RTRIM(dt.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)
			AND (hddd.CoChinhSuaBoSung = 0 OR hddd.CoChinhSuaBoSung IS NULL)
		end

		if @ketQuaXetDuyet = 10
			begin
			select dt.DeTaiID,MaDeTai,TenDeTai,ThucHienTuNgay,ThucHienDenNgay,KinhPhiThucHien,CoQuanChuTri,cbth.MaCanBoThucHien,cbth.HoTen,TrangThaiDeTai,gnkq.GhiNhanKetQuaID
			from DANGKYDETAI dt 
			inner join XETDUYETDETAI_GHINHANKETQUA gnkq on gnkq.DeTaiID = dt.DeTaiID
			inner join DANHMUC_CANBOTHUCHIEN cbth on cbth.CanBoThucHienID = dt.ChuNhiemDeTaiID
			inner join XETDUYETDETAI_HOIDONGDAODUC hddd on hddd.DeTaiID = dt.DeTaiID
			where
			(UPPER(LTRIM(RTRIM(dt.MaDeTai))) LIKE '%'+UPPER(LTRIM(RTRIM(@maDeTai)))+'%' OR @maDeTai IS NULL)
			AND (hddd.CoChinhSuaBoSung = 1 OR hddd.CoChinhSuaBoSung IS NULL)
		end
	end
END
