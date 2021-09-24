USE furama_database;

/*
Task 17: Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng 
đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
*/
UPDATE khach_hang 
SET 
    id_loai_khach = 1
WHERE
    id_khach_hang IN (SELECT 
            kh.id_khach_hang,
                kh.ho_ten,
                lk.ten_loai_khach,
                SUM(dv.chi_phi_thue + dvdk.gia * dvdk.don_vi) AS tong_tien
        FROM
            khach_hang kh
                JOIN
            loai_khach lk ON kh.id_loai_khach = lk.id_loai_khach
                JOIN
            hop_dong hd ON kh.id_khach_hang = hd.id_khach_hang
                JOIN
            dich_vu dv ON hd.id_dich_vu = dv.id_dich_vu
                JOIN
            hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
                JOIN
            dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
        WHERE
            lk.ten_loai_khach = 'Platinium'
                AND YEAR(hd.ngay_lam_hop_dong) = 2019
        GROUP BY hd.id_khach_hang
        HAVING SUM(dv.chi_phi_thue + dvdk.gia * dvdk.don_vi) > 10000000);