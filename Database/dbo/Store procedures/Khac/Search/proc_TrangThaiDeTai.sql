create procedure proc_TrangThaiDeTai
	@id int
as
begin
	--PhieuDanhGiaKetQuaDeTai 12
	--BangNhanXetKetQuaNghienCuuDeTai 11
	--HoiDongNghiemThu 10
	--BaoCaoKetQua 9
	--GiaHanDeTai 8
	--BaoCaoDinhKy 7
	--HopDongKhoaHocCongNghe 6
	--QuyetDinhPheDuyetDeTai 5
	--DiemDanhGia 4
	--BangKiemLuaChonQuyTrinh 3
	--HoiDongNghienCuu 2
	--ThongTinDeTai 1
	set nocount on;
	declare @code int = 0;
	set @code = [dbo].[check_status] (@id)
	declare @status nvarchar(100);
	set @status = (
		case
		when @code = 1 then N'Thông tin đề tài'
		when @code = 2 then N'Hội đồng nghiên cứu'
		when @code = 3 then N'Bảng kiểm lựa chọn quy trình'
		when @code = 4 then N'Điểm đánh giá'
		when @code = 5 then N'Quyết định phê duyệt đề tài'
		--when @code = 6 then N'Hợp đồng khoa học công nghệ'
		--when @code = 7 then N'Báo cáo định kỳ'
		--when @code = 8 then N'Gia hạn đề tài'		
		when @code = 9 then N'Báo cáo kết quả'
		when @code = 10 then N'Hội đồng nghiệm thu'
		when @code = 11 then N'Bảng nhận xét kết quả nghiên cứu'
		when @code = 12 then N'Phiếu đánh giá kết quả nghiên cứu'
	end)
	select @status as TrangThaiDeTai
end