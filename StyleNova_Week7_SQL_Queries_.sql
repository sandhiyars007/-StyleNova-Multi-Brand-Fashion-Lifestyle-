-- 1. Retrieve All Product Records
SELECT *
FROM Product;

-- 2. Retrieve Selected Product Information
SELECT Product_ID, Product_Name, Category_ID, Price, Stock
FROM Product;

-- 3. Products priced above 1000
SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price > 1000;

-- 4. Products priced between 500 and 1500
SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price BETWEEN 500 AND 1500
ORDER BY Price;

-- 5. Search Products in Women Category
SELECT p.Product_ID, p.Product_Name, c.Category_Name, p.Price
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID
WHERE c.Category_Name = 'Women';

-- 6. Available Products
SELECT Product_ID, Product_Name, Stock
FROM Product
WHERE Stock > 0
ORDER BY Product_Name;

-- 7. Unavailable Products
SELECT Product_ID, Product_Name, Stock
FROM Product
WHERE Stock = 0;

-- 8. Display Unique Category IDs
SELECT DISTINCT Category_ID
FROM Product
ORDER BY Category_ID;

-- 9. Sort Products by Price
SELECT Product_ID, Product_Name, Price
FROM Product
ORDER BY Price ASC;
