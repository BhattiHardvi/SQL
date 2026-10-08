# 🍽️ Restaurant Management System – SQL

## 📌 Project Description

This project is a simple **Restaurant Management System** created using **MySQL**.

It demonstrates basic SQL database operations such as:

* Creating a database
* Creating tables
* Inserting records
* Retrieving records
* Updating records
* Deleting records
* Using Primary Keys and Foreign Keys
* Sorting records
* Aggregate functions
* Grouping records
* Filtering records
* Joining related tables through foreign keys

---

## 🛠️ Technologies Used

* **MySQL**
* **SQL**

---

## 🗄️ Database Name

```sql
restaurant
```

---

## 📊 Database Tables

The project contains **4 tables**:

### 1. Customer Table

Stores information about restaurant customers.

| Column     | Data Type    | Description        |
| ---------- | ------------ | ------------------ |
| customerid | INT          | Unique customer ID |
| name       | VARCHAR(100) | Customer name      |
| email      | VARCHAR(100) | Customer email     |
| address    | VARCHAR(100) | Customer address   |

**Primary Key:** `customerid`

---

### 2. Orders Table

Stores information about customer orders.

| Column       | Data Type | Description        |
| ------------ | --------- | ------------------ |
| orderid      | INT       | Unique order ID    |
| customerid   | INT       | ID of the customer |
| order_date   | DATE      | Date of order      |
| total_amount | INT       | Total order amount |

**Primary Key:** `orderid`

**Foreign Key:** `customerid` references `customer(customerid)`

---

### 3. Products Table

Stores information about restaurant products.

| Column       | Data Type    | Description       |
| ------------ | ------------ | ----------------- |
| product_id   | INT          | Unique product ID |
| product_name | VARCHAR(100) | Name of product   |
| price        | INT          | Product price     |
| stock        | INT          | Available stock   |

**Primary Key:** `product_id`

---

### 4. Order Detail Table

Stores the products included in each order.

| Column          | Data Type | Description            |
| --------------- | --------- | ---------------------- |
| order_detail_id | INT       | Unique order detail ID |
| orderid         | INT       | ID of the order        |
| product_id      | INT       | ID of the product      |
| quantity        | INT       | Quantity ordered       |
| sub_total       | INT       | Subtotal amount        |

**Primary Key:** `order_detail_id`

**Foreign Keys:**

* `orderid` references `orders(orderid)`
* `product_id` references `products(product_id)`

---

## 🔗 Database Relationship

The tables are related as follows:

```text
Customer
   |
   | customerid
   ↓
Orders
   |
   | orderid
   ↓
Order_Detail
   |
   | product_id
   ↓
Products
```

### Relationship Explanation

* One customer can place multiple orders.
* One order can contain multiple products.
* One product can appear in multiple order details.
* `order_detail` connects `orders` and `products`.

---

## ✨ SQL Operations Performed

### Customer Operations

The project performs:

* Insert customer records
* Display all customers
* Update customer address
* Delete a customer
* Search customer by name

Example:

```sql
SELECT * FROM customer
WHERE name = "Swati";
```

---

### Order Operations

The project performs:

* Insert orders
* Display all orders
* Find orders for a specific customer
* Update order amount
* Delete an order
* Find orders from the last 30 days
* Find highest order amount
* Find lowest order amount
* Calculate average order amount

Examples:

```sql
SELECT MAX(total_amount) AS highest_order
FROM orders;
```

```sql
SELECT MIN(total_amount) AS lowest_order
FROM orders;
```

```sql
SELECT AVG(total_amount) AS average_order
FROM orders;
```

---

### Product Operations

The project performs:

* Insert products
* Display products
* Sort products by price
* Update product price
* Delete out-of-stock products
* Find products within a price range
* Find the highest product price
* Find the lowest product price

Example:

```sql
SELECT * FROM products
ORDER BY price DESC;
```

---

### Order Detail Operations

The project performs:

* Insert order details
* Find details of a specific order
* Calculate total revenue
* Find top 3 most ordered products
* Count how many times each product has been sold

Example:

```sql
SELECT SUM(sub_total) AS total_revenue
FROM order_detail;
```

Top 3 products:

```sql
SELECT product_id,
       SUM(quantity) AS total_quantity
FROM order_detail
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 3;
```

---

## 📈 Aggregate Functions Used

The following SQL aggregate functions are used:

| Function  | Purpose                 |
| --------- | ----------------------- |
| `MAX()`   | Finds the highest value |
| `MIN()`   | Finds the lowest value  |
| `AVG()`   | Calculates average      |
| `SUM()`   | Calculates total        |
| `COUNT()` | Counts records          |

---

## 🔍 SQL Clauses Used

This project demonstrates:

* `CREATE DATABASE`
* `USE`
* `CREATE TABLE`
* `INSERT INTO`
* `SELECT`
* `WHERE`
* `UPDATE`
* `DELETE`
* `ORDER BY`
* `GROUP BY`
* `BETWEEN`
* `LIMIT`

---

## 🔐 Constraints Used

### Primary Key

Primary keys uniquely identify records.

Examples:

```sql
customerid INT PRIMARY KEY
```

```sql
orderid INT PRIMARY KEY
```

### Foreign Key

Foreign keys establish relationships between tables.

Example:

```sql
FOREIGN KEY (customerid)
REFERENCES customer(customerid)
```

---

## 🚀 How to Run the Project

### Step 1: Install MySQL

Install **MySQL Server** and a MySQL client such as MySQL Workbench.

### Step 2: Open MySQL Workbench

Open MySQL Workbench and connect to your MySQL server.

### Step 3: Create the Database

Run:

```sql
CREATE DATABASE restaurant;
USE restaurant;
```

### Step 4: Run the SQL Script

Copy and execute the complete SQL script provided in this project.

### Step 5: Check the Tables

Run:

```sql
SHOW TABLES;
```

You should see:

```text
customer
orders
products
order_detail
```

---

## 📁 Project Structure

```text
Restaurant-SQL-Project/
│
├── restaurant.sql
│
└── README.md
```

---

## 🎯 Learning Objectives

The main objectives of this project are:

1. Understand relational databases.
2. Learn how to create tables.
3. Understand primary and foreign keys.
4. Perform CRUD operations.
5. Use filtering and sorting.
6. Use aggregate functions.
7. Understand relationships between tables.
8. Perform basic data analysis using SQL.

---

## ⚠️ Important Note

The SQL script contains operations such as `DELETE`. Therefore, some records are removed during execution.

For example:

```sql
DELETE FROM customer
WHERE customerid = 105;
```

and:

```sql
DELETE FROM orders
WHERE orderid = 2;
```

Also, the product with `stock = 0` is deleted.

Therefore, execute the complete script in the given order because the tables have foreign-key relationships.

---

## 👩‍💻 Author

**Hardvi**

B.Tech Computer Science & Engineering

---

## ⭐ Conclusion

This Restaurant Management System is a beginner-friendly MySQL project that demonstrates fundamental SQL concepts using a realistic restaurant database.

It provides practical experience with **database creation, CRUD operations, relationships, constraints, filtering, sorting, grouping, and aggregate functions**.
