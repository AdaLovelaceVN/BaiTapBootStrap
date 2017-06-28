CREATE PROCEDURE [dbo].[fpt_spPrint_DeTai_I]
		@DetaiId INT
AS
---I
SELECT top 1 A.*,UPPER(N'THUYẾT MINH ĐỀ TÀI: '+A.TenDeTai) u_TenDeTai
 ,B.TenCapQuanLy,C.TenChucDanhKhoaHoc,D.TenHocHamHocVi,CONVERT(nvarchar(50),ThucHienTuNgay,103) pThucHienTuNgay
,CONVERT(nvarchar(50),ThucHienDenNgay,103) pThucHienDenNgay
,a1.*,a2.*,a3.*,a4.*,a5.*
,Case 
	when((KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)=0) then '0%'
	else Cast(Round(KinhPhi_K1/(KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)*100,2) as Varchar(20))+'%'
end TyLe_K1
,Case when((KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)=0) then '0%' 
      else Cast(Round(KinhPhi_K2/(KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)*100,2)as Varchar(20))+'%'
 end TyLe_K2
,Case when((KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)=0) then '0%' else Cast(Round(KinhPhi_K3/(KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)*100,2)as Varchar(20))+'%' end TyLe_K3
,Case when((KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)=0) then '0%' else Cast(Round(KinhPhi_K4/(KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)*100,2) as Varchar(20))+'%'end TyLe_K4
,Case when((KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)=0) then '0%' else Cast(Round(KinhPhi_K5/(KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5)*100,2)as Varchar(20))+'%' end TyLe_K5
,NguonNSNN_K1+NguonNSNN_K2+NguonNSNN_K3+NguonNSNN_K4+NguonNSNN_K5 TongNguonNSNN
,NguonTuCo_K1+NguonTuCo_K2+NguonTuCo_K3+NguonTuCo_K4+NguonTuCo_K5 TongNguonTuCo
,NguonKhac_K1+NguonKhac_K2+NguonKhac_K3+NguonKhac_K4+NguonKhac_K5 TongNguonKhac
,KinhPhi_K1+KinhPhi_K2+KinhPhi_K3+KinhPhi_K4+KinhPhi_K5 TongKinhPhi
,AB.TenTinhTrangDeTai
 FROM
(SELECT * FROM DETAI NOLOCK WHERE DeTaiID=@DetaiId) AS A
LEFT JOIN(SELECT * FROM DM_CAPQUANLY NOLOCK)AS B ON B.DMCapQuanLyID=A.DMCapQuanLyID
LEFT JOIN(SELECT * FROM DM_CHUCDANHKHOAHOC NOLOCK)AS C ON C.DMChucDanhKhoaHocID=A.CNDT_DMChucDanhKhoaHocID
LEFT JOIN(SELECT * FROM DM_HOCHAMHOCVI NOLOCK) AS D ON D.DMHocHamHocViID=A.CNDT_DMHocHamHocViID
left join(select * from DM_TINHTRANGDETAI nolock) as AB on AB.DMTinhTrangDeTaiId=A.DMTinhTrangDeTaiId

--
left join(
 select sum(Isnull(KinhPhi,0)) KinhPhi_K1,sum(Isnull(NguonNSNN,0))  NguonNSNN_K1,sum(Isnull(NguonTuCo,0))  NguonTuCo_K1,sum(Isnull(NguonKhac,0))  NguonKhac_K1,DeTaiID DeTaiID_K1
 from DETAI_CHITIETKINHPHI nolock where DeTaiID=@DetaiId and Loai=1 
 group by DeTaiID
 ) as a1 on a1.DeTaiID_K1=A.DeTaiID
 --
left join(
 select sum(Isnull(ThanhTien,0)) KinhPhi_K2,sum(Isnull(NguonNSNN,0))  NguonNSNN_K2,sum(Isnull(NguonTuCo,0))  NguonTuCo_K2,sum(Isnull(NguonKhac,0))  NguonKhac_K2,DeTaiID DeTaiID_K2
 from DETAI_CHITIETKINHPHI nolock where DeTaiID=@DetaiId and Loai=2 
 group by DeTaiID
 ) as a2 on a2.DeTaiID_K2=A.DeTaiID
 --
 left join(
 select sum(Isnull(ThanhTien,0)) KinhPhi_K3,sum(Isnull(NguonNSNN,0))  NguonNSNN_K3,sum(Isnull(NguonTuCo,0))  NguonTuCo_K3,sum(Isnull(NguonKhac,0))  NguonKhac_K3,DeTaiID DeTaiID_K3
 from DETAI_CHITIETKINHPHI nolock where DeTaiID=@DetaiId and Loai=3 
 group by DeTaiID
 ) as a3 on a3.DeTaiID_K3=A.DeTaiID
 --
 left join(
 select sum(Isnull(KinhPhi,0)) KinhPhi_K4,sum(Isnull(NguonNSNN,0))  NguonNSNN_K4,sum(Isnull(NguonTuCo,0))  NguonTuCo_K4,sum(Isnull(NguonKhac,0))  NguonKhac_K4,DeTaiID DeTaiID_K4
 from DETAI_CHITIETKINHPHI nolock where DeTaiID=@DetaiId and Loai=4 
 group by DeTaiID
 ) as a4 on a4.DeTaiID_K4=A.DeTaiID
 --
 left join(
 select sum(Isnull(KinhPhi,0)) KinhPhi_K5,sum(Isnull(NguonNSNN,0))  NguonNSNN_K5,sum(Isnull(NguonTuCo,0))  NguonTuCo_K5,sum(Isnull(NguonKhac,0))  NguonKhac_K5,DeTaiID DeTaiID_K5
 from DETAI_CHITIETKINHPHI nolock where DeTaiID=@DetaiId and Loai=5 
 group by DeTaiID
 ) as a5 on a5.DeTaiID_K5=A.DeTaiID
