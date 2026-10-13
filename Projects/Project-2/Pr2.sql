-- Create Database
CREATE DATABASE CorporateDataAnalysis;

USE CorporateDataAnalysis;

-- =========================================
-- 1. CUSTOMERS TABLE
-- =========================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');

-- =========================================
-- 2. ORDERS TABLE
-- =========================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

-- =========================================
-- 3. EMPLOYEES TABLE
-- =========================================

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);

-- =========================================
-- QUERIES TO PERFORM
-- =========================================

-- 1. INNER JOIN: Orders and customer details
SELECT
    Orders.OrderID,
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

-- 2. LEFT JOIN: All customers and their orders
SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- 3. RIGHT JOIN: All orders and corresponding customers
SELECT
    Orders.OrderID,
    Orders.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.TotalAmount
FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

-- 4. FULL OUTER JOIN equivalent in MySQL
SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- 5. Customers who placed orders above the average order amount
SELECT *
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE TotalAmount > (
        SELECT AVG(TotalAmount)
        FROM Orders
    )
);

-- 6. Employees earning above the average salary
SELECT *
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

-- 7. Extract year and month from OrderDate
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

-- 8. Difference in days between order date and current date
SELECT
    OrderID,
    OrderDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;

-- 9. Format OrderDate as DD-MM-YYYY
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%m-%Y') AS FormattedDate
FROM Orders;

-- 10. Concatenate FirstName and LastName
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

-- 11. Replace John with Jonathan
SELECT
    CustomerID,
    FirstName,
    REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName
FROM Customers;

-- 12. FirstName uppercase and LastName lowercase
SELECT
    UPPER(FirstName) AS UpperFirstName,
    LOWER(LastName) AS LowerLastName
FROM Customers;

-- 13. Remove extra spaces from names
SELECT
    CustomerID,
    TRIM(FirstName) AS CleanFirstName,
    TRIM(LastName) AS CleanLastName
FROM Customers;

-- 14. Running total of TotalAmount for each order
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
    ) AS RunningTotal
FROM Orders;

-- 15. Rank orders based on TotalAmount
SELECT
    OrderID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;

-- 16. Apply discounts based on TotalAmount
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN TotalAmount * 0.90
        WHEN TotalAmount > 500 THEN TotalAmount * 0.95
        ELSE TotalAmount
    END AS DiscountedAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% Discount'
        WHEN TotalAmount > 500 THEN '5% Discount'
        ELSE 'No Discount'
    END AS DiscountType
FROM Orders;

-- 17. Categorize employee salaries as High, Medium, or Low
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary >= 55000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;