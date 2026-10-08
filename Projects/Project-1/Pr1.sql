-- CREATE DATABASE
CREATE DATABASE restaurant;

USE restaurant;


-- =====================================================
-- CUSTOMER TABLE
-- =====================================================

CREATE TABLE customer(
    customerid INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(100)
);

-- INSERT 5 SAMPLE RECORDS
INSERT INTO customer (customerid, name, email, address)
VALUES
(101, "Hardvi", "hardvi@gmail.com", "Rajkot"),
(102, "Swati", "swati@gmail.com", "Surat"),
(103, "Hardik", "hardik@gmail.com", "Ahmedabad"),
(104, "Hirvita", "hirvita@gmail.com", "Mumbai"),
(105, "Naimisha", "naimisha@gmail.com", "Rajkot");

-- RETRIEVE ALL RECORDS
SELECT * FROM customer;

-- UPDATE ADDRESS
UPDATE customer
SET address = "Delhi"
WHERE customerid = 101;

SELECT * FROM customer;

-- DELETE RECORD USING CUSTOMER_ID
DELETE FROM customer
WHERE customerid = 105;

SELECT * FROM customer;

-- RETRIEVE RECORD WHERE NAME IS SWATI
SELECT * FROM customer
WHERE name = "Swati";


-- =====================================================
-- ORDERS TABLE
-- =====================================================

CREATE TABLE orders(
    orderid INT PRIMARY KEY,
    customerid INT,
    order_date DATE,
    total_amount INT,
    FOREIGN KEY (customerid) REFERENCES customer(customerid)
);

-- INSERT 5 SAMPLE RECORDS
INSERT INTO orders (orderid, customerid, order_date, total_amount)
VALUES
(1, 101, "2026-09-29", 2500),
(2, 102, "2026-08-22", 1000),
(3, 103, "2026-10-07", 400),
(4, 104, "2026-09-01", 500),
(5, 101, "2026-08-15", 1500);

SELECT * FROM orders;

-- RETRIEVE ALL ORDERS FOR SPECIFIC CUSTOMER
SELECT * FROM orders
WHERE customerid = 101;

-- UPDATE ORDER TOTAL AMOUNT
UPDATE orders
SET total_amount = 1440
WHERE orderid = 3;

SELECT * FROM orders;

-- DELETE ORDER BY ORDERID
DELETE FROM orders
WHERE orderid = 2;

SELECT * FROM orders;

-- RETRIEVE ORDERS PLACED IN LAST 30 DAYS
SELECT * FROM orders
WHERE order_date >= "2026-09-07";

-- HIGHEST ORDER AMOUNT
SELECT MAX(total_amount) AS highest_order
FROM orders;

-- LOWEST ORDER AMOUNT
SELECT MIN(total_amount) AS lowest_order
FROM orders;

-- AVERAGE ORDER AMOUNT
SELECT AVG(total_amount) AS average_order
FROM orders;


-- =====================================================
-- PRODUCTS TABLE
-- =====================================================

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price INT,
    stock INT
);

-- INSERT 5 SAMPLE RECORDS
INSERT INTO products(product_id, product_name, price, stock)
VALUES
(101, "Coffee", 500, 10),
(102, "Sandwich", 550, 7),
(103, "Noodles", 1000, 0),
(104, "Pizza", 300, 20),
(105, "Burger", 900, 6);

SELECT * FROM products;

-- RETRIEVE ALL PRODUCTS SORTED BY PRICE DESCENDING
SELECT * FROM products
ORDER BY price DESC;

-- UPDATE PRICE OF PRODUCT
UPDATE products
SET price = 450
WHERE product_name = "Tea";

SELECT * FROM products;

-- DELETE PRODUCT IF IT IS OUT OF STOCK
DELETE FROM products
WHERE stock = 0;

SELECT * FROM products;

-- RETRIEVE PRODUCT PRICE BETWEEN 500 AND 2000
SELECT * FROM products
WHERE price BETWEEN 500 AND 2000;

-- RETRIEVE EXPENSIVE PRODUCT
SELECT MAX(price) AS highest_price
FROM products;

-- RETRIEVE CHEAPEST PRODUCT
SELECT MIN(price) AS lowest_price
FROM products;


-- =====================================================
-- ORDER DETAIL TABLE
-- =====================================================

CREATE TABLE order_detail(
    order_detail_id INT PRIMARY KEY,
    orderid INT,
    product_id INT,
    quantity INT,
    sub_total INT,
    FOREIGN KEY (orderid) REFERENCES orders(orderid),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- INSERT 5 SAMPLE RECORDS
INSERT INTO order_detail
(order_detail_id, orderid, product_id, quantity, sub_total)
VALUES
(1, 5, 104, 2, 600),
(2, 1, 101, 3, 1500),
(3, 3, 102, 2, 1100),
(4, 4, 105, 1, 900),
(5, 5, 102, 1, 550);

SELECT * FROM order_detail;

-- RETRIEVE ALL ORDERS FOR SPECIFIC ORDER
SELECT * FROM order_detail
WHERE orderid = 5;

-- RETRIEVE TOTAL REVENUE GENERATED FROM ALL ORDERS
SELECT SUM(sub_total) AS total_revenue
FROM order_detail;

-- RETRIEVE TOP 3 MOST ORDERED PRODUCTS
SELECT product_id,
       SUM(quantity) AS total_quantity
FROM order_detail
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 3;

-- COUNT HOW MANY TIMES EACH PRODUCT HAS BEEN SOLD
SELECT product_id,
       COUNT(product_id) AS total_sold
FROM order_detail
GROUP BY product_id;