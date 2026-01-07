-- Total sales per month
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_sales
FROM Orders
GROUP BY month
ORDER BY month;

-- Top-selling products
SELECT
    p.name,
    SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 5;

-- Revenue per customer
SELECT
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;
