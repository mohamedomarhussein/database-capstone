INSERT INTO customers (email, password_hash, full_name) VALUES
('alice@example.com', 'hashed1', 'Alice Doe'),
('bob@example.com',   'hashed2', 'Bob Smith');

INSERT INTO categories (name, parent_id) VALUES
('Electronics', NULL),
('Computers', 1),
('Laptops', 2),
('Clothing', NULL),
('Shirts', 4);

INSERT INTO products (merchant_id, sku, name, price, category_id, attributes) VALUES
(1, 'LAP-001', 'UltraBook 14', 1299.99, 3, '{"cpu":"i7","ram_gb":16,"screen_in":14}'),
(1, 'SHI-001', 'Cotton T-Shirt', 19.99, 5, '{"size":"M","color":"blue","material":"cotton"}');

INSERT INTO orders (merchant_id, customer_id, status, total) VALUES
(1, 1, 'paid', 1319.98);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1299.99),
(1, 2, 1, 19.99);

INSERT INTO payments (order_id, amount, method) VALUES
(1, 1319.98, 'card');