-- 1. DROP EXISTING TABLES IF THEY EXIST (IN CORRECT REVERSE DEPENDENCY ORDER)
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

-- 2. CREATE DIMENSION TABLES
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- 3. CREATE PRODUCTS TABLE (REFERENCES CATEGORIES)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT REFERENCES categories(category_id),
    price NUMERIC(10, 2),
    stock INT
);

-- 4. CREATE ORDERS FACT TABLE (REFERENCES CUSTOMERS)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10, 2),
    status VARCHAR(20)
);

-- 5. INSERT SAMPLE DATA INTO CATEGORIES
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Apparel'),
(3, 'Home & Kitchen'),
(4, 'Books');

-- 6. INSERT SAMPLE DATA INTO PRODUCTS
INSERT INTO products (product_id, product_name, category_id, price, stock) VALUES
(101, 'Wireless Mouse', 1, 25.00, 50),
(102, 'Mechanical Keyboard', 1, 85.00, 20),
(103, 'Cotton T-Shirt', 2, 15.00, 100),
(104, 'Running Shoes', 2, 120.00, 0),
(105, 'Coffee Maker', 3, 45.00, 15);

-- 7. INSERT SAMPLE DATA INTO CUSTOMERS
INSERT INTO customers (customer_id, first_name, last_name, email, city) VALUES
(1, 'Alice', 'Smith', 'alice@example.com', 'New York'),
(2, 'Bob', 'Jones', 'bob@example.com', 'Chicago'),
(3, 'Charlie', 'Brown', 'charlie@example.com', 'Boston'),
(4, 'Diana', 'Prince', 'diana@example.com', 'Seattle');

-- 8. INSERT SAMPLE DATA INTO ORDERS
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status) VALUES
(1001, 1, '2023-01-15', 150.00, 'Completed'),
(1002, 1, '2023-02-20', 200.00, 'Completed'),
(1003, 1, '2023-03-10', 300.00, 'Completed'),  -- Alice: 3 orders, $650 total
(1004, 2, '2023-01-18', 80.00,  'Completed'),
(1005, 2, '2023-02-25', 120.00, 'Completed'),  -- Bob: 2 orders, $200 total
(1006, 3, '2023-03-01', 450.00, 'Completed');  -- Charlie: 1 order, $450 total