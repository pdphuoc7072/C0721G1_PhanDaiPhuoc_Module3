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

DELIMITER $$
CREATE PROCEDURE get_user_by_id (IN user_id INT)
BEGIN
SELECT users.name, users.email, users.country
FROM users
WHERE users.id = user_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_user(IN user_name varchar(50), IN user_email varchar(50), IN user_country varchar(50))
BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

END$$
DELIMITER ;

CREATE TABLE permission (
    id INT(11) PRIMARY KEY,
    `name` VARCHAR(50)
);

CREATE TABLE user_permission (
    permission_id INT(11),
    user_id INT(11)
);

INSERT INTO permission
VALUES
(1, 'add'),
(2, 'edit'),
(3, 'delete'),
(4, 'view');

DELIMITER $$
CREATE PROCEDURE get_all_user ()
BEGIN
SELECT *
FROM users;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_user (IN name_user VARCHAR(12), IN email_user VARCHAR(120), country_user VARCHAR(120), IN id_user INT)
BEGIN
UPDATE users
SET `name` = name_user, email = email_user, country = country_user
WHERE id = id_user;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_user (IN id_user INT)
BEGIN
DELETE FROM users
WHERE id = id_user;
END $$
DELIMITER ;

