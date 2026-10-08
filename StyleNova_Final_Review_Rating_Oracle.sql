-- StyleNova - Review and Rating Management
-- FINAL ORACLE SQL
-- Customer and Product tables must already exist.

CREATE TABLE StyleNova_Review (
    Review_ID NUMBER(10) PRIMARY KEY,
    Customer_ID NUMBER(10) NOT NULL,
    Product_ID NUMBER(10) NOT NULL,
    Review_Text VARCHAR2(500) NOT NULL,
    Review_Date DATE NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE StyleNova_Rating (
    Rating_ID NUMBER(10) PRIMARY KEY,
    Customer_ID NUMBER(10) NOT NULL,
    Product_ID NUMBER(10) NOT NULL,
    Rating NUMBER(1) NOT NULL,
    Rating_Date DATE NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    CHECK (Rating BETWEEN 1 AND 5)
);

INSERT INTO StyleNova_Review
(Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
VALUES
(1, 101, 101, 'Good quality and comfortable dress.', DATE '2026-09-20');

INSERT INTO StyleNova_Review
(Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
VALUES
(2, 102, 102, 'Beautiful design and good fitting.', DATE '2026-09-21');

INSERT INTO StyleNova_Review
(Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
VALUES
(3, 103, 103, 'The material is soft and comfortable.', DATE '2026-09-22');

INSERT INTO StyleNova_Review
(Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
VALUES
(4, 104, 104, 'Nice colour and stylish design.', DATE '2026-09-23');

INSERT INTO StyleNova_Review
(Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
VALUES
(5, 105, 105, 'Product quality is good for the price.', DATE '2026-09-24');

COMMIT;

INSERT INTO StyleNova_Rating
(Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
VALUES
(1, 101, 101, 5, DATE '2026-09-20');

INSERT INTO StyleNova_Rating
(Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
VALUES
(2, 102, 102, 4, DATE '2026-09-21');

INSERT INTO StyleNova_Rating
(Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
VALUES
(3, 103, 103, 5, DATE '2026-09-22');

INSERT INTO StyleNova_Rating
(Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
VALUES
(4, 104, 104, 4, DATE '2026-09-23');

INSERT INTO StyleNova_Rating
(Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
VALUES
(5, 105, 105, 5, DATE '2026-09-24');

COMMIT;

SELECT
    R.Review_ID,
    R.Customer_ID,
    R.Product_ID,
    P.Product_Name,
    R.Review_Text,
    R.Review_Date
FROM StyleNova_Review R
JOIN Product P
    ON R.Product_ID = P.Product_ID
ORDER BY R.Review_Date;

SELECT
    Product_ID,
    AVG(Rating) AS Average_Rating
FROM StyleNova_Rating
GROUP BY Product_ID
ORDER BY Average_Rating DESC;

SELECT
    Product_ID,
    AVG(Rating) AS Average_Rating
FROM StyleNova_Rating
GROUP BY Product_ID
HAVING AVG(Rating) >= 4
ORDER BY Average_Rating DESC;

SELECT
    P.Product_ID,
    P.Product_Name,
    AVG(R.Rating) AS Average_Rating
FROM Product P
JOIN StyleNova_Rating R
    ON P.Product_ID = R.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY Average_Rating DESC;

SELECT * FROM StyleNova_Review;

SELECT * FROM StyleNova_Rating;

SELECT COUNT(*) AS Review_Count
FROM StyleNova_Review;

SELECT COUNT(*) AS Rating_Count
FROM StyleNova_Rating;

COMMIT;
