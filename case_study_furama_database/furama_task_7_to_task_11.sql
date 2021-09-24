USE furama_database;

/*
Task 7: Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ 
đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng trong năm 2019.
*/

SELECT DISTINCT
    dv.id_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id_loai_dich_vu
        JOIN
    hop_dong hd ON hd.id_dich_vu = dv.id_dich_vu
WHERE
    dv.id_dich_vu IN (SELECT 
            dv.id_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.id_dich_vu = dv.id_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2018)
        AND dv.id_dich_vu NOT IN (SELECT 
            dv.id_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON hd.id_dich_vu = dv.id_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2019);

/*
Task 8: Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoTenKhachHang không trùng nhau. 
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
*/
-- Cách 1: Sử dụng DISTINCT
SELECT DISTINCT
    ho_ten
FROM
    khach_hang;

-- Cách 2: Sử dụng UNION
SELECT 
    ho_ten
FROM
    khach_hang 
UNION SELECT 
    ho_ten
FROM
    khach_hang;

-- Cách 3: Sử dụng GROUP BY
SELECT 
    ho_ten
FROM
    khach_hang
GROUP BY ho_ten;

/*
Task 9: Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì 
sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
*/
SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS thang,
    SUM(dv.chi_phi_thue + dvdk.gia * dvdk.don_vi) AS doanh_thu,
    COUNT(hd.id_khach_hang) AS so_luong_khach_hang
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.id_dich_vu = dv.id_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hd.id_hop_dong = hdct.id_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2019
GROUP BY MONTH(hd.ngay_lam_hop_dong)
ORDER BY MONTH(hd.ngay_lam_hop_dong);

/*
Task 10: Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
(được tính dựa trên việc count các IDHopDongChiTiet).
*/
SELECT 
    hd.id_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    COUNT(hdct.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        JOIN
    hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
GROUP BY hdct.id_hop_dong
ORDER BY hd.id_hop_dong;

/*
Task 11: Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và 
có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
*/
SELECT 
    dvdk.id_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    dvdk.gia,
    dvdk.don_vi
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.id_hop_dong = hdct.id_hop_dong
        JOIN
    khach_hang kh ON kh.id_khach_hang = hd.id_khach_hang
        JOIN
    loai_khach lk ON lk.id_loai_khach = kh.id_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
        AND (kh.dia_chi = 'Vinh'
        OR kh.dia_chi = 'Quảng Ngãi');