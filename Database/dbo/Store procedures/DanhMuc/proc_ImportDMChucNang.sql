CREATE PROCEDURE [dbo].[proc_ImportDMChucNang]
  @AllowAdd bit ,
  @AllowUpdate bit,
  @MaChucNang NVARCHAR(100),
  @LienKet NVARCHAR(50),
  @NhomChucNang NVARCHAR(20),
  @MoTa NVARCHAR(100)
AS 
--(ThongKe = 2,GiamDinh = 3,BaoCao = 4,DanhMuc = 5,QuanTri = 6,TienIch = 7)
BEGIN
	declare @ResultString nvarchar(1000)
	IF(@NhomChucNang not in('2','4','5','6','7'))
	BEGIN
		set @ResultString=N'NhomChucNang không đúng quy định số'
		select @ResultString
		return
	END
	IF EXISTS (SELECT FunctionCode FROM [Function] NOLOCK WHERE FunctionCode = @MaChucNang) 
	BEGIN
		IF (@AllowUpdate = 1)
		BEGIN
			update [Function] 
			set FunctionLink = @LienKet, FunctionGroup = @NhomChucNang, [Description] = @MoTa, [Operator] = 0  
			where FunctionCode = @MaChucNang
			set @ResultString = 'UpdateOK'
			select @ResultString
			return
		END
		ELSE
		BEGIN
			set @ResultString = N'Không được cập nhật'
			select @ResultString
			return
		END
	END
	ELSE
	BEGIN
		if (@AllowAdd = 1)
		BEGIN
			insert into [Function](FunctionCode, FunctionLink, FunctionGroup, [Description], [Operator]) values(@MaChucNang, @LienKet, @NhomChucNang, @MoTa, 0)
			set @ResultString = 'AddOK'
			select @ResultString
			return
		END
		ELSE
		BEGIN
			set @ResultString = N'Không được thêm mới'
			select @ResultString
			return
		END
	END
	
END
GO
