CREATE DATABASE student_management_fix;

USE student_management_fix;

CREATE TABLE account_james (
	`account` VARCHAR(50) PRIMARY KEY,
    `password` VARCHAR(50)
);

CREATE TABLE type_of_class (
	id INT PRIMARY KEY,
    `name` VARCHAR(10)
);

CREATE TABLE class (
	id INT AUTO_INCREMENT,
    `name` VARCHAR(7),
    type_of_class_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (type_of_class_id) REFERENCES type_of_class (id) on update cascade on delete cascade
);

CREATE TABLE student (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(50),
    account_james_account VARCHAR(50),
    class_id INT,
    FOREIGN KEY (account_james_account)
		REFERENCES account_james (`account`) on update cascade on delete cascade,
	CONSTRAINT fk_student_class FOREIGN KEY (class_id)
		REFERENCES class (id) on update cascade on delete cascade
);

CREATE TABLE instructor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE instructor_teach_class (
	class_id INT,
    instructor_id INT,
    PRIMARY KEY (class_id, instructor_id),
    FOREIGN KEY (class_id)
		REFERENCES class (id) on update cascade on delete cascade,
	FOREIGN KEY (instructor_id)
		REFERENCES instructor (id) on update cascade on delete cascade
);

INSERT INTO type_of_class
VALUES
(1, 'Full time'),
(2, 'Half time');

INSERT INTO account_james
VALUES
('tien.nguyen', '12345678'),
('nhat.dong', '12345678'),
('trang.ho', '12345678'),
('mai.doan', '12345678'),
('long.duong', '12345678');

INSERT INTO class (`name`, type_of_class_id)
VALUES 
('C0421G1', 1),
('C0920G1', 1),
('A1020I1', 2),
('A0421I1', 2);

INSERT INTO student (`name`, date_of_birth, account_james_account, email, class_id)
VALUES
('Tiến', '2000-07-14', 'tien.nguyen', 'tien@gmail.com', 1),
('Nhật', '2002-05-03', 'nhat.dong', 'nhat@gmail.com',  1),
('Trang', '2001-04-03', 'trang.ho', 'trang@gmail.com', 2),
('Mai', '2001-08-04', 'mai.doan', 'mai@gmail.com', 3),
('Nhật', '2002-05-03', 'nhat.dong', 'nhat@gmail.com',  3),
('Trang', '2001-04-03', 'trang.ho', 'trang@gmail.com', 3),
('Mai', '2001-08-04', 'mai.doan', 'mai@gmail.com', 3),
('Long', '2002-01-25', 'long.duong', 'long@gmail.com', null);

INSERT INTO instructor
VALUES
(1, 'Tiến', '2000-07-14'),
(2, 'Trung', '2002-05-03'),
(3, 'Hải', '2003-11-03'),
(4, 'Chánh', '1998-07-09');

INSERT INTO instructor_teach_class
VALUES
(1, 1),
(1, 2),
(2, 1);

-- CAu 1:
DELETE FROM class
WHERE
    id = 2;
    
SELECT * FROM class;

-- caU 2:
SET SQL_SAFE_UPDATES=0;
UPDATE instructor_teach_class
SET 
    instructor_id = 4
WHERE
    NOT EXISTS ( SELECT 
           *
        FROM (
        SELECT 
           ins.id
        FROM
            type_of_class toc
                INNER JOIN
            class cl ON toc.id = cl.id
                INNER JOIN
            instructor_teach_class itc ON itc.class_id = cl.id
                INNER JOIN
            instructor ins ON itc.instructor_id = ins.id
        WHERE
            toc.`name` = 'Full time')AS t);
SET SQL_SAFE_UPDATES=1;