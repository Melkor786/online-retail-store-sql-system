-- ---------------------------
-- 1. Total number of orders per customer
-- ---------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC;

-- ---------------------------
-- 2. Total amount spent per customer
-- ---------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- ---------------------------
-- 3. Average order value per customer
-- ---------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COALESCE(AVG(o.total_amount), 0) AS avg_order_value
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY avg_order_value DESC;

-- ---------------------------
-- 4. Repeat customers (customers with more than 1 order)
-- ---------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;

-- ---------------------------
-- 5. Most recent order date per customer
-- ---------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    MAX(o.order_date) AS last_order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY last_order_date DESC;

-- ---------------------------
-- 6. Customer purchase trends by category
-- ---------------------------
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.category,
    SUM(oi.quantity) AS total_quantity
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, p.category
ORDER BY c.customer_id, total_quantity DESC;
