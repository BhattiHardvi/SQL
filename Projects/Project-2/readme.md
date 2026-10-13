# Corporate Data Analysis Using SQL

## 📌 Project Overview

The **Corporate Data Analysis** project is designed to practice SQL queries for managing and analyzing corporate data. It uses MySQL to create databases, store customer and employee information, analyze orders, and perform different types of data operations.

This project demonstrates the use of SQL joins, subqueries, date functions, string functions, window functions, and conditional statements.

## 🎯 Objectives

- Create and manage a corporate database using MySQL.
- Store and retrieve customer, order, and employee information.
- Understand and implement different types of SQL joins.
- Use subqueries to analyze orders and employee salaries.
- Apply date and string functions to transform data.
- Calculate running totals and rank orders using window functions.
- Apply conditional logic using the `CASE` statement.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Tool:** MySQL Workbench / MySQL Command Line Client

## 🗄️ Database Name

`CorporateDataAnalysis`

## 📊 Database Tables

### 1. Customers

Stores customer information.

| Column Name | Data Type | Description |
|---|---|---|
| CustomerID | INT | Primary key |
| FirstName | VARCHAR(50) | Customer's first name |
| LastName | VARCHAR(50) | Customer's last name |
| Email | VARCHAR(100) | Customer's email address |
| RegistrationDate | DATE | Customer registration date |

### 2. Orders

Stores customer order details.

| Column Name | Data Type | Description |
|---|---|---|
| OrderID | INT | Primary key |
| CustomerID | INT | Foreign key referencing Customers |
| OrderDate | DATE | Date of the order |
| TotalAmount | DECIMAL(10,2) | Total order amount |

### 3. Employees

Stores employee information.

| Column Name | Data Type | Description |
|---|---|---|
| EmployeeID | INT | Primary key |
| FirstName | VARCHAR(50) | Employee's first name |
| LastName | VARCHAR(50) | Employee's last name |
| Department | VARCHAR(50) | Employee's department |
| HireDate | DATE | Employee hiring date |
| Salary | DECIMAL(10,2) | Employee salary |

## 🔍 SQL Concepts Covered

This project includes 17 SQL query examples.

### 1. Joins
- **INNER JOIN:** Retrieves orders with matching customer details.
- **LEFT JOIN:** Retrieves all customers and their corresponding orders.
- **RIGHT JOIN:** Retrieves all customers and matching order details.
- **FULL OUTER JOIN Equivalent:** Uses `LEFT JOIN`, `RIGHT JOIN`, and `UNION` to combine matching and unmatched records in MySQL.

### 2. Subqueries
- Find customers who placed orders above the average order amount.
- Find employees earning above the average salary.

### 3. Date Functions
- `YEAR()` — Extracts the year from an order date.
- `MONTH()` — Extracts the month from an order date.
- `DATEDIFF()` — Calculates the difference between two dates.
- `DATE_FORMAT()` — Formats dates as DD-MM-YYYY.

### 4. String Functions
- `CONCAT()` — Combines first and last names.
- `REPLACE()` — Replaces John with Jonathan.
- `UPPER()` — Converts first names to uppercase.
- `LOWER()` — Converts last names to lowercase.
- `TRIM()` — Removes leading and trailing spaces.

### 5. Window Functions
- `SUM() OVER()` — Calculates the running total of order amounts.
- `RANK() OVER()` — Ranks orders by total amount.

### 6. Conditional Statements
- `CASE` — Applies discounts based on order amounts.
- `CASE` — Categorizes employee salaries as High, Medium, or Low.

## 📁 Project Structure

```text
CorporateDataAnalysis/
│
├── CorporateDataAnalysis.sql
└── README.md
```

## ▶️ How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench.
3. Create a new SQL query tab.
4. Copy the SQL code into the query editor or open `CorporateDataAnalysis.sql`.
5. Execute the script to create the database, tables, and sample records.
6. Run the queries to view the results.
7. Explore the output of joins, subqueries, date functions, string functions, window functions, and conditional statements.

**Note:** The SQL script uses MySQL 8.0 or later because it includes window functions such as `RANK()` and `SUM() OVER()`.

## 📈 Sample Data

The project contains sample records for:

- **Customers:** John Doe and Jane Smith.
- **Orders:** Two sample orders with different order amounts.
- **Employees:** Mark Johnson from Sales and Susan Lee from HR.

The sample data is used to demonstrate SQL query execution and analysis.

## 💡 Key Learning Outcomes

- Understanding primary keys and foreign keys.
- Working with related tables using SQL joins.
- Writing nested queries and subqueries.
- Performing date and string manipulations.
- Using window functions for analytical queries.
- Applying business rules through conditional statements.
- Analyzing customer orders and employee salaries.

## 🚀 Future Improvements

- Add more customer, order, and employee records.
- Create additional reports using aggregate functions.
- Analyze department-wise employee salaries.
- Calculate total sales by customer.
- Build a dashboard for visualizing corporate data.

## 👩‍💻 Author

**Hardvi Bhatti**

B.Tech Computer Science and Engineering

## 📄 License

This project is created for educational and learning purposes.
