# Cafe Management Database

## 📌 Project Overview

This project is a **Cafe Management Database** created using **MySQL**.

The database stores and manages information about:

* Customers
* Orders
* Products
* Order Details

It demonstrates basic SQL operations such as **CREATE, INSERT, SELECT, UPDATE, DELETE, WHERE, ORDER BY, GROUP BY, aggregate functions, foreign keys, and joins/relationships**.

---

## 🗄️ Database Name

```sql
cafes
```

To create and use the database:

```sql
CREATE DATABASE cafes;
USE cafes;
```

---

## 📊 Database Tables

The project contains four main tables:

### 1. Customer Table

Stores information about cafe customers.

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

| Column       | Data Type   | Description                   |
| ------------ | ----------- | ----------------------------- |
| orderid      | INT         | Unique order ID               |
| customerid   | INT         | Customer who placed the order |
| order_date   | VARCHAR(20) | Date of the order             |
| total_amount | INT         | Total order amount            |

**Primary Key:** `orderid`

**Foreign Key:** `customerid` references `customer(customerid)`

---

### 3. Products Table

Stores information about cafe products.

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
| orderid         | INT       | Related order ID       |
| product_id      | INT       | Related product ID     |
| quantity        | INT       | Quantity ordered       |
| sub_total       | INT       | Subtotal amount        |

**Primary Key:** `order_detail_id`

**Foreign Keys:**

* `orderid` references `orders(orderid)`
* `product_id` references `products(product_id)`

---

## 🔗 Table Relationships

The database has the following relationships:

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

### Relationships

* One customer can place multiple orders.
* One order can contain multiple products.
* One product can appear in multiple orders.
* `order_detail` connects orders and products.

---

## 🛠️ SQL Operations Performed

### Customer Operations

The project performs:

* Insert customer records
* Retrieve all customers
* Update customer address
* Delete customer
* Search customer by name

Example:

```sql
SELECT * FROM customer
WHERE name = "Alice";
```

---

### Order Operations

The project performs:

* Insert orders
* Retrieve orders
* Retrieve orders for a specific customer
* Update order amount
* Delete an order
* Find orders from the last 30 days
* Find highest order amount
* Find lowest order amount
* Find average order amount

Aggregate functions used:

```sql
MAX()
MIN()
AVG()
```

---

### Product Operations

The project performs:

* Insert products
* Display all products
* Sort products by price
* Update product price
* Delete products that are out of stock
* Find products within a price range
* Find the most expensive product
* Find the cheapest product

Example:

```sql
SELECT *
FROM products
WHERE price BETWEEN 500 AND 2000;
```

---

### Order Detail Operations

The project performs:

* Insert order details
* Retrieve details for a specific order
* Calculate total revenue
* Find the top 3 most ordered products
* Count how many times products were sold

Example:

```sql
SELECT product_id, SUM(quantity) AS total_quantity
FROM order_detail
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 3;
```

---

## 📈 Aggregate Functions Used

The following SQL aggregate functions are used:

| Function  | Purpose             |
| --------- | ------------------- |
| `MAX()`   | Finds maximum value |
| `MIN()`   | Finds minimum value |
| `AVG()`   | Calculates average  |
| `SUM()`   | Calculates total    |
| `COUNT()` | Counts records      |

---

## 🔍 Important SQL Clauses Used

| SQL Clause | Purpose                   |
| ---------- | ------------------------- |
| `WHERE`    | Filters records           |
| `ORDER BY` | Sorts records             |
| `GROUP BY` | Groups records            |
| `BETWEEN`  | Searches within a range   |
| `LIMIT`    | Limits number of results  |
| `DESC`     | Sorts in descending order |

---

## 🔑 Constraints Used

### Primary Key

A primary key uniquely identifies each record.

Examples:

```sql
customerid INT PRIMARY KEY
```

```sql
orderid INT PRIMARY KEY
```

### Foreign Key

A foreign key creates a relationship between tables.

Example:

```sql
FOREIGN KEY (customerid)
REFERENCES customer(customerid)
```

---

## 💻 Technologies Used

* **MySQL**
* **SQL**
* MySQL Workbench / MySQL Command Line

---

## ▶️ How to Run the Project

### Step 1: Open MySQL

Open **MySQL Workbench** or another MySQL client.

### Step 2: Create the Database

Run:

```sql
CREATE DATABASE cafes;
```

### Step 3: Select the Database

```sql
USE cafes;
```

### Step 4: Create Tables

Run the table creation queries in this order:

```text
1. customer
2. orders
3. products
4. order_detail
```

### Step 5: Insert Records

Run the INSERT queries for each table.

### Step 6: Execute Queries

Run the SELECT, UPDATE, DELETE, aggregate, sorting, grouping, and filtering queries.

---

## 🎯 Project Objective

The main objective of this project is to understand how SQL can be used to manage cafe-related data.

It provides practice with:

* Database creation
* Table creation
* Data insertion
* Data retrieval
* Data updating
* Data deletion
* Primary keys
* Foreign keys
* Data filtering
* Sorting
* Grouping
* Aggregate functions
* Relationships between tables

---

## 👩‍💻 Author

**Hardvi Bhatti**

**Course:** B.Tech Computer Science and Engineering

**Project:** Cafe Management Database
