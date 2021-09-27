USE furama_database;

/*
Task 12: Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
(được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 
nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
*/
SELECT 
    hd.id_hop_dong,
    dv.id_dich_vu,
    hd.ngay_lam_hop_dong,
    nv.ho_ten_nhan_vien,
    kh.ho_ten,
    kh.so_dien_thoai,
    COUNT(hdct.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
FROM
    dich_vu dv
        JOIN
    hop_dong hd ON dv.id_dich_vu = hd.id_dich_vu
        JOIN
    khach_hang kh ON hd.id_khach_hang = kh.id_khach_hang
        JOIN
    nhan_vien nv ON nv.id_nhan_vien = hd.id_nhan_vien
        JOIN
    hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
WHERE
    dv.id_dich_vu IN (SELECT 
            dv.id_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON dv.id_dich_vu = hd.id_dich_vu
        WHERE
            (QUARTER(hd.ngay_lam_hop_dong) = 4)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2019))
        AND dv.id_dich_vu NOT IN (SELECT 
            dv.id_dich_vu
        FROM
            dich_vu dv
                JOIN
            hop_dong hd ON dv.id_dich_vu = hd.id_dich_vu
        WHERE
            (QUARTER(hd.ngay_lam_hop_dong) = 1
                OR QUARTER(hd.ngay_lam_hop_dong) = 2)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2019))
GROUP BY hdct.id_hop_dong
HAVING YEAR(hd.ngay_lam_hop_dong) = 2019;


/*
Task 13: Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
(Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
*/

SELECT 
    hdct.id_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
FROM
    hop_dong_chi_tiet hdct
        JOIN
    dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
GROUP BY hdct.id_dich_vu_di_kem
HAVING COUNT(hdct.id_dich_vu_di_kem) >= ALL (SELECT 
        COUNT(hdct.id_dich_vu_di_kem)
    FROM
        hop_dong_chi_tiet hdct
    GROUP BY hdct.id_dich_vu_di_kem);
    
/*
Task 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
*/
SELECT 
    hd.id_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.id_dich_vu_di_kem) AS so_lan_su_dung
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.id_dich_vu = dv.id_dich_vu
        JOIN
    loai_dich_vu ldv ON ldv.id_loai_dich_vu = dv.id_loai_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
GROUP BY dvdk.id_dich_vu_di_kem
HAVING COUNT(hdct.id_dich_vu_di_kem) = 1;

/*
Task 15: Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
*/
SELECT 
    nv.id_nhan_vien,
    nv.ho_ten_nhan_vien,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    COUNT(hd.id_hop_dong) AS so_luong_lap_hop_dong
FROM
    nhan_vien nv
        JOIN
    hop_dong hd ON nv.id_nhan_vien = hd.id_nhan_vien
        JOIN
    trinh_do td ON nv.id_trinh_do = td.id_trinh_do
        JOIN
    bo_phan bp ON nv.id_bo_phan = bp.id_bo_phan
WHERE
    YEAR(hd.ngay_lam_hop_dong) BETWEEN 2018 AND 2019
GROUP BY nv.id_nhan_vien
HAVING COUNT(hd.id_hop_dong) <= 3;

/*
Task 16: Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
*/
SET SQL_SAFE_UPDATES=0;
DELETE FROM nhan_vien 
WHERE
    id_nhan_vien NOT IN (SELECT 
        id_nhan_vien
    FROM
        (SELECT 
            nv.id_nhan_vien
        FROM
            nhan_vien nv
        JOIN hop_dong hd ON nv.id_nhan_vien = hd.id_nhan_vien
        
        WHERE
            YEAR(hd.ngay_lam_hop_dong) BETWEEN 2017 AND 2019
        GROUP BY nv.id_nhan_vien
        HAVING COUNT(hd.id_hop_dong) > 0) AS t);
SET SQL_SAFE_UPDATES=1;

SELECT * FROM nhan_vien;