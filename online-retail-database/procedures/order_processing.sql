DELIMITER //
CREATE PROCEDURE ProcessOrder(
    IN p_customer_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE p_price DECIMAL(10,2);
    DECLARE new_order_id INT;

    -- Get product price
    SELECT price INTO p_price FROM Products WHERE product_id = p_product_id;

    -- Insert order
    INSERT INTO Orders(customer_id, order_date, status, total_amount)
    VALUES (p_customer_id, CURRENT_DATE, 'Pending', p_price * p_quantity);
    SET new_order_id = LAST_INSERT_ID();

    -- Insert order item
    INSERT INTO Order_Items(order_id, product_id, quantity, price)
    VALUES (new_order_id, p_product_id, p_quantity, p_price);

    -- Update inventory
    UPDATE Products SET stock_quantity = stock_quantity - p_quantity
    WHERE product_id = p_product_id;
END //
DELIMITER ;
