CREATE DATABASE `user_management`;

USE `user_management`;

CREATE TABLE users (
    id INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL,
    country VARCHAR(120)
);
INSERT INTO users (`name`, email, country)
VALUES
('Minh', 'minh@codegym.vn', 'VietNam'),
('Kante','kante@che.uk','Kenia'),
('Kishida', 'kishida12345678@gmail.com', 'Japan'),
('Tom', 'tom12345@gmail.com', 'England'),
('Phuoc', 'phuoc123@codegym.vn', 'VietNam'),
('Lin', 'lincn123@gmail.com', 'China');