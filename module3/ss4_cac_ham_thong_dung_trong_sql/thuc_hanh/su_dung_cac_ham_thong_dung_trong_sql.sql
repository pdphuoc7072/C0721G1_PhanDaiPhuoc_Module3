USE quan_ly_sinh_vien;

SELECT 
    address, COUNT(student_id) AS so_luong_sinh_vien
FROM
    student
GROUP BY address;

SELECT 
    s.student_id, s.student_name, AVG(m.mark)
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
GROUP BY s.student_id , s.student_name;

SELECT 
    s.student_id, s.student_name, AVG(m.mark)
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
GROUP BY s.student_id , s.student_name
HAVING AVG(m.mark) > 15;

SELECT 
    s.student_id, s.student_name, AVG(m.mark)
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
GROUP BY s.student_id , s.student_name
HAVING AVG(m.mark) >= ALL (SELECT 
        AVG(mark)
    FROM
        mark
    GROUP BY mark.student_id);