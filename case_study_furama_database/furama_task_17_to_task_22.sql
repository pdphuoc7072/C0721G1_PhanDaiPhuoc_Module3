USE furama_database;

/*
Task 17: Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng 
đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE khach_hang 
SET 
    id_loai_khach = 1
WHERE
    id_khach_hang IN (SELECT 
            id_khach_hang
        FROM
            (SELECT 
                kh.id_khach_hang
            FROM
                khach_hang kh
            JOIN loai_khach lk ON kh.id_loai_khach = lk.id_loai_khach
            JOIN hop_dong hd ON kh.id_khach_hang = hd.id_khach_hang
            JOIN dich_vu dv ON hd.id_dich_vu = dv.id_dich_vu
            JOIN hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
            JOIN dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
            WHERE
                (lk.ten_loai_khach = 'Platinium')
                    AND (YEAR(hd.ngay_lam_hop_dong) = 2019)
            GROUP BY hd.id_khach_hang
            HAVING SUM(dv.chi_phi_thue + dvdk.gia * dvdk.don_vi) > 10000000) AS t);
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM khach_hang;

/*
Task 18: Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).
*/
SET SQL_SAFE_UPDATES = 0;
DELETE FROM khach_hang 
WHERE
    id_khach_hang IN (SELECT 
        id_khach_hang
    FROM (
        SELECT 
        kh.id_khach_hang
    FROM
        khach_hang kh
            JOIN
        hop_dong hd ON hd.id_khach_hang = kh.id_khach_hang
    
    WHERE
        YEAR(hd.ngay_lam_hop_dong) < 2016) AS t);
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM khach_hang;
        
/*
Task 19: Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE dich_vu_di_kem
SET 
    gia = gia * 2
WHERE
    id_dich_vu_di_kem IN (SELECT 
            id_dich_vu_di_kem
        FROM (
            SELECT 
            dvdk.id_dich_vu_di_kem
        FROM
            dich_vu_di_kem dvdk
                JOIN
            hop_dong_chi_tiet hdct ON hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
                JOIN
            hop_dong hd ON hd.id_hop_dong = hdct.id_hop_dong
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2019
        GROUP BY dvdk.id_dich_vu_di_kem
        HAVING COUNT(hdct.id_dich_vu_di_kem) > 10) AS t);
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM dich_vu_di_kem;

        
/*
Task 20: Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
*/
CREATE VIEW nv_kh_views AS
SELECT id_nhan_vien AS id, ho_ten_nhan_vien AS ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM nhan_vien
UNION
SELECT id_khach_hang AS id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM khach_hang;

SELECT * FROM nv_kh_views;

DROP VIEW nv_kh_views;

/*
Task 21: Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ 
là “Hải Châu” và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ với ngày lập hợp đồng là “12/12/2019”
*/
CREATE VIEW v_nhanvien AS
SELECT nv.id_nhan_vien, nv.ho_ten_nhan_vien, nv.ngay_sinh, nv.so_dien_thoai, nv.email, nv.dia_chi
FROM nhan_vien nv
JOIN hop_dong hd ON hd.id_nhan_vien = nv.id_nhan_vien
WHERE nv.dia_chi = 'Hải Châu' AND hd.ngay_lam_hop_dong = '2019-12-12';

SELECT * FROM v_nhanvien;

DROP VIEW v_nhanvien;

/*
Task 22: Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên 
được nhìn thấy bởi khung nhìn này.
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE v_nhanvien
SET dia_chi = 'Liên Chiểu';
SET SQL_SAFE_UPDATES = 1;