-- DBMS WEEK 8
-- Project: EcoCart - Sustainable Products E-Commerce Order Management System
-- Topic: Database Relationship Analysis Using JOINS
-- These queries follow the examples in the supplied PDF.
-- Run them after creating and inserting data into Customer, Orders,
-- Order_Details, Product, and Payment tables.

-- 2.1 Customer and Orders (INNER JOIN)
SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID;

-- 2.2 Orders and Payment (INNER JOIN)
SELECT
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    p.Payment_Mode,
    p.Payment_Amount,
    p.Payment_Status
FROM Orders o
INNER JOIN Payment p
    ON o.Order_ID = p.Order_ID;

-- 2.3 Product and Order_Details (INNER JOIN)
SELECT
    p.Product_ID,
    p.Product_Name,
    od.Order_ID,
    od.Quantity,
    od.Unit_Price,
    od.Subtotal
FROM Product p
INNER JOIN Order_Details od
    ON p.Product_ID = od.Product_ID;

-- 3.1 Display All Customers and Their Orders (LEFT JOIN)
SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount
FROM Customer c
LEFT JOIN Orders o
    ON c.Customer_ID = o.Customer_ID;

-- 4.1 Display All Orders and Customer Details (RIGHT JOIN)
SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount
FROM Customer c
RIGHT JOIN Orders o
    ON c.Customer_ID = o.Customer_ID;

-- 5. Complete Order Details
SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    p.Product_ID,
    p.Product_Name,
    od.Quantity,
    od.Unit_Price,
    od.Subtotal,
    py.Payment_Mode,
    py.Payment_Amount,
    py.Payment_Status
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
INNER JOIN Product p
    ON od.Product_ID = p.Product_ID
INNER JOIN Payment py
    ON o.Order_ID = py.Order_ID
ORDER BY o.Order_Date DESC;

-- 6. Customer Purchase History
SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    p.Product_Name,
    od.Quantity,
    od.Subtotal
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
INNER JOIN Product p
    ON od.Product_ID = p.Product_ID
ORDER BY c.Customer_ID, o.Order_Date;

-- 7. Customer Purchase History with Payment
SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    p.Product_Name,
    od.Quantity,
    od.Subtotal,
    py.Payment_Mode,
    py.Payment_Status
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
INNER JOIN Product p
    ON od.Product_ID = p.Product_ID
INNER JOIN Payment py
    ON o.Order_ID = py.Order_ID
ORDER BY c.Customer_ID;

-- 8. Multi-Table Business Report
SELECT
    c.Customer_Name,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders,
    SUM(od.Subtotal) AS Total_Purchase,
    SUM(od.Quantity) AS Total_Products
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
GROUP BY c.Customer_Name
ORDER BY Total_Purchase DESC;

-- 9. Payment Transaction Report
SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    py.Payment_Mode,
    py.Payment_Amount,
    py.Payment_Status
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Payment py
    ON o.Order_ID = py.Order_ID
ORDER BY o.Order_Date DESC;
