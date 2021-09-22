CREATE DATABASE quan_ly_ban_hang;

USE quan_ly_ban_hang;

CREATE TABLE customer (
customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
customer_age INT
);

CREATE TABLE `order` (
order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATE,
order_total_price INT NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

CREATE TABLE product (
product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
product_price INT NOT NULL
);

CREATE TABLE order_detail (
order_id INT NOT NULL,
product_id INT NOT NULL,
order_quantity INT NOT NULL,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES `order` (order_id),
FOREIGN KEY (product_id) REFERENCES product (product_id)
);