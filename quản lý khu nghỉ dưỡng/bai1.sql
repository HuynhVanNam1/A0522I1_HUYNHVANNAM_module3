create database QuanLyKhuNghiDuong;
use  QuanLyKhuNghiDuong;

create table ViTri(
	MaViTri int not null primary key,
    TenViTri varchar(45)
);

create table TrinhDo(
	MaTrinhDo int not null primary key,
    TenTrinhDo varchar(45)
);

create table BoPhan(
	MaBoPhan int not null primary key,
    TenBoPhan varchar(45)
);

create table NhanVien(
	MaNhanVien int not null primary key,
    HoTen varchar(45),
    NgaySinh date,
    So_cmnd varchar(45),
    luong double,
    SoDienThoai varchar(45),
    Email varchar(45),
    DiaChi varchar(45),
    MaViTri int ,
    MaTrinhDo int ,
    MaBoPhan int,
    foreign key (MaViTri) references ViTri(MaViTri),
    foreign key (MaTrinhDo) references TrinhDo(MaTrinhDo),
    foreign key(MaBoPhan) references BoPhan(MaBoPhan)
);

create table LoaiKhach(
	MaLoaiKhach int not null primary key,
    TenLoaiKhach varchar(45)
);

create table KieuThue(
	MaKieuThue int not null primary key,
    TenKieuThue varchar(45)
);

create table LoaiDichVu(
	MaLoaiDichVu int not null primary key,
    TenloaiDichVu varchar(45)
);

create table DichVu(
	MaDichVu int not null primary key,
    TenDichVu varchar(45),
    DienTich int,
    ChiPhiThue double,
    SoNguoiToiDa int,
    MaKieuThue int,
    foreign key (MaKieuThue) references KieuThue(MaKieuThue),
    MaLoaiDichVu int,
    foreign key(MaLoaiDichVu) references LoaiDichVu(MaLoaiDichVu),
    TieuChuanPhong varchar(45),
    MoTaTienNghiKhac varchar(45),
    DienTichHoBoi double,
    SoTang int
);

create table KhachHang(
	MaKhachHang int not null primary key,
    MaLoaiKhach int ,
    foreign key(MaLoaiKhach) references LoaiKhach(MaLoaiKhach),
    HoTen varchar(45),
    NgaySinh date,
    GioiTinh bit(1),
    So_cmnd varchar(45),
    SoDienThoai varchar(45),
    Email varchar(45),
    DiaChi varchar(45)
);

create table DichVuDikem(
	MaDichVuDiKem int not null primary key,
    TenDichVuDiKem varchar(45),
    Gia double,
    DonVi varchar(45),
    TrangThai varchar(45)
);

create table HopDong(
	MaHopDong int not null primary key,
    NgayLamHopDong datetime,
    NgayKetThuc datetime,
    TienDatCoc double,
    MaNhanVien int,
    foreign key(MaNhanVien) references NhanVien(MaNhanVien),
    MaKhachHang int,
	foreign key(MaKhachHang) references KhachHang(MaKhachHang),
    MaDichVu int ,
    foreign key(MaDichVu) references DichVu(MaDichVu)
);

create table HopDongChiTiet(
	MaHopDongChiTiet int not null primary key,
    MaHopDong int,
    foreign key(MaHopDong) references HopDong(MaHopDong),
    MaDichVuDiKem int,
    foreign key (MaDichVuDiKem) references DichVuDikem(MaDichVuDiKem),
    SoLuong int
);

-- Vị Trí --
INSERT INTO vitri(mavitri, tenvitri)
VALUES 	(1, 'Giám đốc'), 
		(2, 'Quản Lý'),
		(3, 'Giám Sát'),
		(4, 'Chuyên Viên'),
		(5, 'Phục Vụ'),
		(6, 'Lễ Tân');
        
-- Trình Độ --
INSERT INTO trinhdo(matrinhdo, tentrinhdo)
VALUES 	(1,'Trung Cấp'),
		(2,'Cao Đẳng'),
        (3,'Đại Học'),
        (4,'Sau Đại Học');
        
-- Bộ Phận --        
INSERT INTO bophan(mabophan, tenbophan)
VALUES 	(1,'Sale-Marketing'),
		(2,'Hành Chính'),
		(3,'Phục Vụ'),
		(4,'Quản Lý');
-- Nhân Viên --        
INSERT INTO nhanvien(manhanvien,hoten,ngaysinh,so_cmnd,luong,sodienthoai,email,diachi,mavitri,matrinhdo,mabo_phan)
VALUES  (1, 'Nguyễn Ngọc Trung Bảo', '2003-6-25', '206493602', 1000, '0389056171', 'baokx2k3@gmail.com', 'Thăng Bình', 1, 4, 4 ),
		(2, 'Nguyễn Ngọc Huy Bảo', '2003-6-25', '206493603', 800, '0329002453', 'hbkx22kx3@gmail.com', 'Thăng Bình', 3, 2, 1 ),
        (3, 'Huỳnh Văn Nam', '2003-3-10', '206493154', 1000, '0321724124', 'namhuynh@gmail.com', 'Thăng Bình', 2, 1, 4 ),
        (4, 'Phạm Nguyễn Trường Tín', '2003-5-12', '206412171', 900, '0312388242', 'tinpham@gmail.com', 'Núi Thành', 4, 1, 2 ),
		(5, 'Võ Nguyễn Phát', '2003-6-19', '206492131', 1100, '0312324912', 'phatvo@gmail.com', 'Nông Sơn', 1, 3, 4 ),
		(6, 'Dương Tấn Tài', '2003-2-12', '206437123', 500, '0342417234', 'taiduong@gmail.com', 'Duy Xuyên', 6, 1, 1 ),
		(7, 'Trần Công Nhật', '2003-11-8', '206812337', 650, '0981234412', 'nhattran@gmail.com', 'Phú Ninh', 5, 2, 3 ),
		(8, 'Nguyễn Đức Việt', '2003-4-12', '206781231', 480, '0931231284', 'vietnguyen@gmail.com', 'Thăng Bình', 6, 1, 4 ),
		(9, 'Ngô Ngọc Huy', '2003-9-11', '206152351', 700, '09137127312', 'huyngo@gmail.com', 'Núi Thành', 3, 1, 4 ),
		(10, 'Kiều Nhật Tân', '2003-10-12', '206812312', 800, '0313192412', 'tankieu@gmail.com', 'Thăng Bình', 4, 2, 4 ),
		(11, 'Phạm Thị Thuý Hằng', '2003-5-24', '206123144', 800, '0283183211', 'hangpham@gmail.com', 'Thăng Bình', 5, 2, 3);
        
-- Loại Khách --
INSERT INTO loaikhach(maloaikhach,tenloaikhach)
VALUES  (1,'Diamond'),
		(2,'Platinium'),
		(3,'Gold'),
		(4,'Silver'),
		(5,'Member');
        select*from loaikhach;
-- Khách Hàng --        
INSERT INTO khachhang(makhachhang,hoten,ngaysinh,gioitinh,so_cmnd,sodienthoai,email,diachi,maloaikhach)
VALUES 	 (1,'Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
         (2,'Trần Cao Vân','1990-4-12',1,'488641231','031238123','vancao2702@gmail.com','K67/47 Hà Huy Tập, Đà Nẵng',2),
         (3,'Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
		 (4,'Nguyễn Văn Chí','1990-5-11',1,'4886712393','09123712321','chinguyen123@gmail.com','Nguyễn Văn Cừ, Hà Nội',1),
         (5,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
         (6,'Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
         (7,'Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
         (8,'Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
         (9,'Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1);
select*from khachhang;
-- Hợp Đồng --          
INSERT INTO hopdong(mahopdong,ngaylamhopdong,ngayketthuc,tiendatcoc,manhanvien,makhachhang,madichvu)
VALUES  (1,'2020-12-08','2020-12-08',0,3,1,3),
		(2,'2020-07-14','2020-07-21',200000,7,3,1),
		(3,'2021-03-15','2021-03-17',50000,3,4,2),
		(4,'2021-01-14','2021-01-18',100000,7,5,5),
		(5,'2021-07-14','2021-07-15',0,7,2,6),
		(6,'2021-06-01','2021-06-03',0,7,7,6),
		(7,'2021-09-02','2021-09-05',100000,7,4,4),
		(8,'2021-06-17','2021-06-18',150000,3,4,1),
		(9,'2020-11-19','2020-11-19',0,3,4,3),
		(10,'2021-04-12','2021-04-14',0,10,3,5),
		(11,'2021-04-25','2021-04-25',0,2,2,1),
		(12,'2021-05-25','2021-05-27',0,7,8,1);
select*from hopdong;
-- Hợp Đồng Chi Tiết --        
INSERT INTO hopdongchitiet(mahopdongchitiet,soluong,mahopdong,madichvudikem)
VALUES  (1,5,2,4),
		(2,8,2,5),
		(3,15,2,6),
		(4,1,3,1),
		(5,11,3,2),
		(6,1,1,3),
		(7,2,1,2),
		(8,2,12,2);
select*from hopdongchitiet;
-- Dịch Vụ Đi Kèm --        
INSERT INTO dichvudikem(madichvudikem,tendichvudikem,gia,donvi,trangthai)
VALUES  (1,'Karaoke',10000,'giờ','tiện nghi, hiện tại'),
		(2,'Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
		(3,'Thuê xe đạp',20000,'chiếc','tốt'),
		(4,'Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
		(5,'Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
		(6,'Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');
select*from dichvudikem;

-- Loại Dịch Vụ --        
INSERT INTO loaidichvu(maloaidichvu, tenloaidichvu)
VALUES  (1,'Villa'),
		(2,'House'),
		(3,'Room');
select*from loaidichvu;
-- Kiểu Thuê --        
INSERT INTO kieuthue(makieuthue,tenkieuthue)
VALUES (1,'year'),
	   (2,'month'),
	   (3,'day'),
	   (4,'hour');
select * from kieuthue;
-- Dịch Vụ --       
INSERT INTO dichvu(madichvu,tendichvu,dientich,chiphithue,songuoitoida,tieuchuanphong,motatiennghikhac,dientichhoboi,sotang,makieuthue,maloaidichvu)
VALUES  (1,'Villa Beach Front',25000,10000000,10,'vip','Có hồ bơi',500,4,3,1),
		(2,'House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',NULL,3,2,2),
		(3,'Room Twin 01',5000,1000000,2,'normal','Có tivi',NULL,NULL,4,3),
		(4,'Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,3,1),
		(5,'House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',NULL,2,3,2),
		(6,'Room Twin 02',3000,900000,2,'normal','Có tivi',NULL,NULL,4,3);
        select*from dichvu;
-- 2 Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select*from nhanvien where hoten like 'H%'  or hoTen like 'T%' or hoten like 'K%'
limit 15;
 -- 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
 select*from khachhang  where (timestampdiff(year,ngaysinh,curdate()) between 18 and 50)  and diachi like '% Đà Nẵng' or diachi like '% Quảng Trị';
       
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select makhachhang , hoten , count(hoten) as solanthue 
from khachhang kh
join loaikhach lk on kh.maloaikhach = lk.maLoaikhach
				where lk.tenloaikhach = 'Diamond'
group by hoten;


-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
	

select kh.makhachhang, kh.hoten, kh.tenloaikhach, hd.mahopdong, dv.tendichvu, hd.ngaylamhopdong, hd.ngayketthuc;
select*from khachhang;
-- 6 	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
-- chưa  từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.madichvu, dv.tendichvu, dv.dientich, dv.chiphithue, ldv.tenloaidichvu from dichvu dv
join loaidichvu ldv on dv.maloaidichvu = ldv.maloaidichvu
join hopdong hd on dv.madichvu = hd.madichvu
where not exists (
select*from hopdong hd
  where hd.madichvu = dv.madichvu and (hd.ngaylamhopdong between '2021-01-01' and '2021-03-31')
)
group by madichvu;

-- 7	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ 
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng 
-- chưa từng được khách hàng đặt phòng trong năm 2021.

select dv.madichvu, dv.tendichvu, dv.dientich, dv.chiphithue, ldv.tenloaidichvu from dichvu dv
join loaidichvu ldv on dv.maloaidichvu = ldv.maloaidichvu
join hopdong hd on dv.madichvu = hd.madichvu
where not exists (
select*from hopdong hd
  where hd.madichvu = dv.madichvu and (hd.ngaylamhopdong between '2021-01-01' and '2022-12-31')
)
group by madichvu;

-- Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
select hoten from khachhang
group by hoten;
 SELECT hoten from khachhang
 union
 SELECT hoten from khachhang;
 SELECT  distinct hoten from khachhang;
 
 -- Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi
-- tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select  month(ngaylamhopdong) as 'tháng' , count(date(ngaylamhopdong)) as 'số lần đặt'  from hopdong
where year(ngaylamhopdong) = '2021'
group by month(ngaylamhopdong)
order by month(ngaylamhopdong) ;
 
 -- Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng 
 -- bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong,
 -- ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.mahopdong, hd.ngaylamhopdong, hd.ngayketthuc, hd.tiendatcoc, sum(hdct.soluong) from hopdong hd
left join hopdongchitiet hdct on hdct.mahopdong = hd.mahopdong
group by  hd.mahopdong;

 
-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.madichvudikem, dvdk.tendichvudikem from dichvudikem dvdk
join hopdongchitiet hdct on dvdk.madichvudikem = hdct.madichvudikem 
join hopdong hd on hdct.mahopdong = hd.mahopdong 
join khachhang kh on hd.makhachhang = kh.makhachhang
join loaikhach lk on kh.maloaikhach = lk.maloaikhach
where lk.tenloaikhach = 'Diamond' and (kh.diachi like '%Vinh' or kh.diachi like '%Quảng Ngãi')
;
   
-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã 
-- đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).


select dvdk.madichvudikem, dvdk.tendichvudikem , sum(hdct.soluong) as soluongdichvudikem
from dichvudikem dvdk
join hopdongchitiet hdct on  dvdk.madichvudikem = hdct.madichvudikem
group by madichvudikem
having soluongdichvudikem = 15
;

-- 14.  Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem)
select hd.mahopdong, ldv.tenloaidichvu, dvdk.tendichvudikem, count(tendichvudikem) as solansudung from hopdong hd
join dichvu dv on hd.madichvu = dv.madichvu
join loaidichvu ldv on dv.maloaidichvu = ldv.maloaidichvu
join hopdongchitiet hdct on hd.mahopdong = hdct.mahopdong
join dichvudikem dvdk on hdct.madichvudikem = dvdk.madichvudikem
group by tendichvudikem
having solansudung = 1
order by  hd.mahopdong 
;
-- 15.  Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT manhanvien, hoten, tentrinhdo, tenbophan, sodienthoai, diachi, count(hd.manhanvien) tongsohopdong FROM nhanvien
JOIN trinhdo    USING (matrinhdo)
JOIN bophan     USING (mabophan)
JOIN hopdong hd USING (manhanvien)
WHERE YEAR(ngaylamhopdong) BETWEEN 2020 AND 2021
GROUP BY hd.manhanvien
HAVING tongsohopdong <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
DELETE FROM nhanvien
WHERE NOT EXISTS (
		SELECT * FROM hopdong
		WHERE nhanvien.manhanvien = hopdong.manhanvien AND YEAR(hopdong.ngaylamhopdong) BETWEEN 2019 AND 2021
        );
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- After set CASCADE
DELETE FROM khachhang kh
WHERE NOT EXISTS (
        SELECT 1 FROM hopdong
        WHERE kh.makhachhang = makhachhang AND YEAR(ngaylamhopdong) >= 2021
    );
          