USE furama_database;

/*
Task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
và có tối đa 15 ký tự.
*/
SELECT 
    *
FROM
    nhan_vien
WHERE
    (SUBSTR(ho_ten_nhan_vien, - 7) LIKE '% T%'
        OR SUBSTR(ho_ten_nhan_vien, - 7) LIKE '% H%'
        OR SUBSTR(ho_ten_nhan_vien, - 7) LIKE '% K%')
        AND CHAR_LENGTH(ho_ten_nhan_vien) <= 15;
        
/*
Task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
*/

SELECT 
    *
FROM
    khach_hang
WHERE
    (TIMESTAMPDIFF(YEAR,
        ngay_sinh,
        CURDATE()) BETWEEN 18 AND 50)
        AND (dia_chi = 'Đà Nẵng'
        OR dia_chi = 'Quảng Trị');
        
/*
Task4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần 
đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
*/
SELECT 
    kh.ho_ten,
    lk.ten_loai_khach,
    COUNT(hd.id_dich_vu) AS so_lan_dat_phong
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.id_loai_khach = lk.id_loai_khach
        JOIN
    hop_dong hd ON kh.id_khach_hang = hd.id_khach_hang
        JOIN
    dich_vu dv ON dv.id_dich_vu = hd.id_dich_vu
WHERE
    lk.ten_loai_khach = 'Diamond'
GROUP BY kh.id_khach_hang
ORDER BY so_lan_dat_phong;

/*
Task5: Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
(Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
*/
SELECT 
    kh.id_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.id_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    SUM(dv.chi_phi_thue + dvdk.gia * dvdk.don_vi) AS tong_tien
FROM
    khach_hang kh
        LEFT JOIN
    hop_dong hd ON kh.id_khach_hang = hd.id_khach_hang
        LEFT JOIN
    dich_vu dv ON dv.id_dich_vu = hd.id_dich_vu
        LEFT JOIN
    loai_khach lk ON lk.id_loai_khach = kh.id_loai_khach
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
    GROUP BY kh.id_khach_hang;

/*
Task6: Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được 
Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
*/

SELECT DISTINCT
    dv.id_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id_loai_dich_vu
        JOIN
    hop_dong hd ON hd.id_dich_vu = dv.id_dich_vu
WHERE
    dv.id_dich_vu NOT IN (SELECT
            dv.id_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.id_dich_vu = dv.id_dich_vu
        WHERE
            (QUARTER(hd.ngay_lam_hop_dong) = 1)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2019));