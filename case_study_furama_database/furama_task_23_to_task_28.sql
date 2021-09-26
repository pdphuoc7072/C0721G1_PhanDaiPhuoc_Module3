USE furama_database;

/*
Task 23: Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với Id Khách hàng được truyền vào 
như là 1 tham số của Sp_1
*/

DELIMITER //

CREATE PROCEDURE sp_1 (IN id_kh INT)

BEGIN

DELETE FROM khach_hang
WHERE id_khach_hang = id_kh;

END //

DELIMITER ;

CALL sp_1 (12);

/*
Task 24: Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra 
tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
*/
DELIMITER //

CREATE PROCEDURE sp_2 (INOUT id_hd INT, IN id_nv INT, IN id_kh INT, IN id_dv INT, IN nlhd DATE, IN nkt DATE, IN tdc INT)

BEGIN

SET id_hd = id_hd + 1; 
INSERT INTO hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
VALUES 
(id_nv, id_kh, id_dv, nlhd, nkt, tdc);
END //

DELIMITER ;

SET @id_hd = (
SELECT MAX(id_hop_dong)
FROM hop_dong);

CALL sp_2 (@id_hd, 3, 9, 9, '2020-01-01', '2020-01-10', 4000000);

CALL sp_2 (@id_hd, 4, 10, 10, '2020-02-02', '2020-02-12', 3500000);

CALL sp_2 (@id_hd, 5, 8, 8, '2020-02-10', '2020-02-15', 3700000);

/*
Task 25: Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng 
HopDong ra giao diện console của database
*/
CREATE TABLE dem_so_hop_dong_sau_khi_xoa (
    tong_hop_dong_con_lai INT
);

INSERT INTO dem_so_hop_dong_sau_khi_xoa (tong_hop_dong_con_lai)
SELECT COUNT(id_hop_dong)
FROM hop_dong;

DELIMITER $$
CREATE TRIGGER tr_1 AFTER DELETE ON hop_dong FOR EACH ROW
BEGIN

UPDATE dem_so_hop_dong_sau_khi_xoa
SET tong_hop_dong_con_lai = tong_hop_dong_con_lai - 1;

END $$

DELIMITER ;


SET SQL_SAFE_UPDATES = 0;
DELETE FROM hop_dong 
WHERE id_hop_dong = 14;
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM dem_so_hop_dong_sau_khi_xoa;

/*
Task 26: Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, 
nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console 
của database
*/

/*
Task 27: Tạo user function thực hiện yêu cầu sau:
a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.
b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng 
mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, 
không xét trên toàn bộ các lần làm hợp đồng). Mã của Khách hàng được truyền vào như là 1 tham số của function này.
*/

/*
Task 28: Tạo Store procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 
để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu) và xóa những HopDong sử dụng dịch vụ liên quan 
(tức là phải xóa những bản ghi trong bảng HopDong) và những bản liên quan khác.
*/