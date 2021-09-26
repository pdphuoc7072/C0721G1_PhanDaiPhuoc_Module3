CREATE DATABASE demo_view_index_and_store_procedure;

USE demo_view_index_and_store_procedure;

/*
Tạo bảng products
*/
CREATE TABLE products (
id INT AUTO_INCREMENT PRIMARY KEY,
product_code VARCHAR(255) NOT NULL,
product_name VARCHAR(255) NOT NULL,
product_price INT NOT NULL,
product_amount INT NOT NULL,
product_description VARCHAR(255) NOT NULL,
product_status VARCHAR(255) NOT NULL
);

/*
Thêm dữ liệu cho bảng products
*/
INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES
('IP001', 'Iphone 12', 1500, 100, 'Mới', 'Còn hàng'),
('IP002', 'Iphone 11', 1400, 50, 'Mới', 'Còn hàng'),
('IP003', 'Iphone 10', 1000, 30, 'Mới', 'Còn hàng'),
('IP004', 'Iphone 12 Pro', 1600, 200, 'Mới', 'Còn hàng'),
('IP005', 'Iphone 12 Pro Max', 1700, 150, 'Mới', 'Còn hàng'),
('IP006', 'Iphone 11 Pro', 1300, 70, 'Mới', 'Còn hàng'),
('IP007', 'Iphone 11 Pro Max', 1450, 80, 'Mới', 'Còn hàng'),
('IP008', 'Iphone 10 Pro', 1100, 60, 'Mới', 'Còn hàng'),
('IP009', 'Iphone 10 Pro Max', 1200, 50, 'Mới', 'Còn hàng'),
('IP010', 'Iphone 13', 1800, 300, 'Mới', 'Còn hàng'),
('IP011', 'Iphone 13 Pro', 1850, 250, 'Mới', 'Còn hàng'),
('IP012', 'Iphone 13 Pro Max', 1950, 350, 'Mới', 'Còn hàng');

/*
Tạo Unique Index trên bảng products (sử dụng cột product_code để tạo chỉ mục)
*/
CREATE UNIQUE INDEX index_of_product_code ON products (product_code);

/*
Tạo Composite Index trên bảng products (sử dụng 2 cột product_name và product_price)
*/
ALTER TABLE products ADD INDEX index_of_product_name_and_product_price (product_name, product_price);

/*
Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
*/
EXPLAIN SELECT * FROM products WHERE product_code = 'IP008';

EXPLAIN SELECT * FROM products WHERE product_name = 'Iphone 11 Pro Max' AND product_price = 1450;

/*
Xóa index
*/
ALTER TABLE products DROP INDEX index_of_product_code;

ALTER TABLE products DROP INDEX index_of_product_name_and_product_price;

/*
Tạo view lấy về các thông tin: product_code, product_name, product_price, product_status từ bảng products.
*/
CREATE VIEW view_products AS
    SELECT 
        product_code, product_name, product_price, product_status
    FROM
        products;

SELECT * FROM view_products;

/*
Tiến hành sửa đổi view
*/
CREATE OR REPLACE VIEW view_products AS
    SELECT 
        product_code,
        product_name,
        product_price,
        product_amount,
        product_status
    FROM
        products
    WHERE
        product_price >= 1500;

SELECT * FROM view_products;

/*
Tiến hành xoá view
*/
DROP VIEW view_products;

/*
Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng products
*/
DELIMITER //

CREATE PROCEDURE find_all_products ()

BEGIN

SELECT * FROM products;

END //

DELIMITER ;

CALL find_all_products ();

/*
Tạo store procedure thêm một sản phẩm mới
*/
DELIMITER //

DROP PROCEDURE IF EXISTS `find_all_products` //

CREATE PROCEDURE find_all_products ()

BEGIN

INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES 
('IP013', 'Iphone 9 Pro Max', 950, 15, 'Mới', 'Còn hàng');

END //

DELIMITER ;

CALL find_all_products ();

/*
Tạo store procedure sửa thông tin sản phẩm theo id
*/
DELIMITER //

DROP PROCEDURE IF EXISTS `find_all_products` //

CREATE PROCEDURE find_all_products ()

BEGIN

UPDATE products
SET product_price = 1380
WHERE id = 2;

END //

DELIMITER ;

CALL find_all_products ();

/*
Tạo store procedure xoá sản phẩm theo id
*/
DELIMITER //

DROP PROCEDURE IF EXISTS `find_all_products` //

CREATE PROCEDURE find_all_products ()

BEGIN

DELETE FROM products
WHERE id = 3;

END //

DELIMITER ;

CALL find_all_products ();
