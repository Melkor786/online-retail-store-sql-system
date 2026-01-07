-- Rank customers by spending
SELECT
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rank
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id;

-- Running total of sales
SELECT
    order_date,
    SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM Orders;
