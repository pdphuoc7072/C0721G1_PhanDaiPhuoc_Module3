USE quan_ly_sinh_vien;

SELECT 
    *
FROM
    student
WHERE
    student_name LIKE 'h%';
    
SELECT 
    *
FROM
    class
WHERE
    MONTH(start_date) = 12;

SELECT 
    *
FROM
    `subject`
WHERE
    credit BETWEEN 3 AND 5;

SET SQL_SAFE_UPDATES = 0;

UPDATE student 
SET 
    class_id = 2
WHERE
    student_name = 'Hung';

SELECT * FROM student;

SELECT 
    s.student_name, sub.subject_name, m.mark
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
        JOIN
    `subject` sub ON m.subject_id = sub.subject_id
ORDER BY m.mark DESC;