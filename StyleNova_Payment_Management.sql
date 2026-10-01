-- StyleNova – Payment Management
-- Week 5 DBMS

-- 1. CREATE PAYMENT TABLE

CREATE TABLE SN_Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Payment_Mode VARCHAR2(20) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Amount NUMBER(10,2) NOT NULL,
    Payment_Status VARCHAR2(20) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES SN_Orders(Order_ID)
);

-- 2. INSERT PAYMENT DETAILS

INSERT INTO SN_Payment
VALUES (501, 1001, 'UPI', SYSDATE, 1898.00, 'Successful');

INSERT INTO SN_Payment
VALUES (502, 1002, 'Card', SYSDATE, 1299.00, 'Successful');

INSERT INTO SN_Payment
VALUES (503, 1003, 'Cash', SYSDATE, 1499.00, 'Failed');

COMMIT;

-- 3. DISPLAY SUCCESSFUL PAYMENTS

SELECT *
FROM SN_Payment
WHERE Payment_Status = 'Successful';

-- 4. DISPLAY FAILED PAYMENTS

SELECT *
FROM SN_Payment
WHERE Payment_Status = 'Failed';

-- 5. MODIFY PAYMENT STATUS

UPDATE SN_Payment
SET Payment_Status = 'Successful'
WHERE Payment_ID = 503;

COMMIT;

-- 6. ANALYZE PAYMENT METHODS

SELECT Payment_Mode,
       SUM(Payment_Amount) AS Total_Amount_Collected
FROM SN_Payment
WHERE Payment_Status = 'Successful'
GROUP BY Payment_Mode
ORDER BY Payment_Mode;

-- 7. PAYMENT TRANSACTION REPORT

SELECT p.Payment_ID,
       p.Order_ID,
       o.Customer_ID,
       p.Payment_Mode,
       p.Payment_Date,
       p.Payment_Amount,
       p.Payment_Status
FROM SN_Payment p
JOIN SN_Orders o
ON p.Order_ID = o.Order_ID
ORDER BY p.Payment_ID;
