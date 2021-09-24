USE quan_ly_ban_hang;

INSERT INTO customer (customer_name, customer_age)
VALUES
('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

INSERT INTO `order` (customer_id, order_date)
VALUES
(1, '2006-03-21'),
(2, '2006-03-23'),
(1, '2006-03-16');

INSERT INTO product (product_name, product_price)
VALUES
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

INSERT INTO order_detail
VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

SELECT 
    order_id, order_date, order_total_price
FROM
    `order`;
    
SELECT 
    c.customer_name,
    o.order_date,
    p.product_name,
    od.order_quantity
FROM
    customer c
        JOIN
    `order` o ON c.customer_id = o.customer_id
        JOIN
    order_detail od ON o.order_id = od.order_id
        JOIN
    product p ON p.product_id = od.product_id
ORDER BY c.customer_name;

SELECT 
    c.customer_id, c.customer_name, c.customer_age
FROM
    customer c
WHERE
    c.customer_id NOT IN (SELECT 
            customer_id
        FROM
            `order`);
            
SELECT 
    o.order_id,
    o.order_date,
    SUM(p.product_price * od.order_quantity) AS order_total_price
FROM
    `order` o
        JOIN
    order_detail od ON o.order_id = od.order_id
        JOIN
    product p ON p.product_id = od.product_id
GROUP BY od.order_id;

