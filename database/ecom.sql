-- ===============================
-- CREATE DATABASE
-- ===============================

DROP DATABASE IF EXISTS ecommerce_db;

CREATE DATABASE ecommerce_db;

USE ecommerce_db;


-- ===============================
-- TABLE: PRODUCTS
-- ===============================

CREATE TABLE products (

id INT AUTO_INCREMENT PRIMARY KEY,

name VARCHAR(255) NOT NULL,

price DECIMAL(10,2) NOT NULL,

description TEXT,

stock INT DEFAULT 0,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);


-- ===============================
-- TABLE: USERS
-- ===============================

CREATE TABLE users (

id INT AUTO_INCREMENT PRIMARY KEY,

name VARCHAR(100) NOT NULL,

email VARCHAR(150) UNIQUE NOT NULL,

password VARCHAR(255) NOT NULL,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);


-- ===============================
-- TABLE: ORDERS
-- ===============================

CREATE TABLE orders (

order_id INT AUTO_INCREMENT PRIMARY KEY,

user_id INT,

product_id INT,

quantity INT,

total DECIMAL(10,2),

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (user_id) REFERENCES users(id),

FOREIGN KEY (product_id) REFERENCES products(id)

);


-- ===============================
-- INSERT SAMPLE PRODUCTS
-- ===============================

INSERT INTO products (name, price, description, stock)
VALUES
('Gaming Laptop',15000000,'Laptop gaming high performance',10),
('Mechanical Keyboard',1200000,'Keyboard mechanical RGB',25),
('Wireless Mouse',300000,'Mouse wireless ergonomic',40),
('Laptop Cleaning Service',150000,'Professional laptop cleaning service',20);


-- ===============================
-- INSERT SAMPLE USERS
-- ===============================

INSERT INTO users (name,email,password)
VALUES
('John Doe','john@example.com','123456'),
('Jane Smith','jane@example.com','123456');


-- ===============================
-- INSERT SAMPLE ORDERS
-- ===============================

INSERT INTO orders (user_id,product_id,quantity,total)
VALUES
(1,1,1,15000000),
(2,2,2,2400000);


-- ===============================
-- CRUD QUERY
-- ===============================


-- CREATE PRODUCT

INSERT INTO products (name,price,description,stock)
VALUES ('Webcam HD',500000,'HD webcam for streaming',15);


-- READ ALL PRODUCTS

SELECT * FROM products;


-- READ PRODUCT BY ID

SELECT * FROM products
WHERE id = 1;


-- UPDATE PRODUCT PRICE

UPDATE products
SET price = 14000000
WHERE id = 1;


-- UPDATE PRODUCT STOCK

UPDATE products
SET stock = 50
WHERE id = 3;


-- DELETE PRODUCT

DELETE FROM products
WHERE id = 4;


-- ===============================
-- JOIN QUERY
-- ===============================

SELECT
orders.order_id,
users.name AS user_name,
products.name AS product_name,
orders.quantity,
orders.total
FROM orders
JOIN users ON orders.user_id = users.id
JOIN products ON orders.product_id = products.id;