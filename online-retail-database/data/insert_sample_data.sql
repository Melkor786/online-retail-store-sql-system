-- Customers
INSERT INTO Customers (first_name, last_name, email, phone)
VALUES
('Abhimanyu', 'Yadav', 'abhimanyu@example.com', '9876543210'),
('Riya', 'Sharma', 'riya@example.com', '9876543211'),
('Rahul', 'Kumar', 'rahul@example.com', '9876543212');

-- Products
INSERT INTO Products (name, description, price, category, stock_quantity)
VALUES
('Laptop', 'Gaming Laptop', 1200.00, 'Electronics', 50),
('Smartphone', 'Android Phone', 800.00, 'Electronics', 100),
('Headphones', 'Noise Cancelling', 150.00, 'Electronics', 200);

-- Suppliers
INSERT INTO Suppliers (name, contact_email, phone)
VALUES
('TechSupply', 'contact@techsupply.com', '9123456780'),
('GadgetWorld', 'sales@gadgetworld.com', '9123456781');

-- Orders
INSERT INTO Orders (customer_id, order_date, status, total_amount)
VALUES
(1, '2026-01-05', 'Completed', 2000.00),
(2, '2026-01-06', 'Pending', 950.00);

-- Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 800.00),
(2, 3, 2, 150.00);
