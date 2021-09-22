USE student_management;

CREATE TABLE class (
	id INT PRIMARY KEY,
    `name` VARCHAR(255)
);

CREATE TABLE teacher (
	id INT PRIMARY KEY,
    `name` VARCHAR(255),
    age INT,
    country VARCHAR(255)
);