USE quan_ly_sinh_vien;

/*
Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
*/
SELECT 
    subject_id,
    subject_name,
    `status`,
    MAX(credit) AS max_credit
FROM
    `subject`;

/*
Hiển thị các thông tin môn học có điểm thi lớn nhất.
*/
SELECT 
    s.subject_id,
    s.subject_name,
    s.credit,
    s.`status`,
    MAX(m.mark) AS max_mark
FROM
    `subject` s
        JOIN
    mark m ON s.subject_id = m.subject_id
GROUP BY m.subject_id
HAVING MAX(m.mark) >= ALL (SELECT 
        MAX(m.mark)
    FROM
        mark m
    GROUP BY m.subject_id);

/*
Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
*/
SELECT 
    s.student_id,
    s.student_name,
    s.address,
    s.phone,
    s.`status`,
    s.class_id,
    AVG(m.mark) AS avg_mark
FROM
    student s
        JOIN
    mark m ON m.student_id = s.student_id
GROUP BY m.student_id
ORDER BY AVG(m.mark) DESC;