CREATE DATABASE student_management;

USE student_management;

CREATE TABLE student (
	id INT PRIMARY KEY,
    `name` VARCHAR(255),
    age INT,
    country VARCHAR(255)
);