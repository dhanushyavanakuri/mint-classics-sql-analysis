USE mintclassics;


-- 1. Total number of products
SELECT 
COUNT(*) AS total_products
FROM products;


-- 2. Total revenue generated
SELECT 
SUM(quantityOrdered * priceEach) AS total_revenue
FROM orderdetails;


-- 3. Top selling products
SELECT 
p.productName,
SUM(od.quantityOrdered) AS units_sold
FROM products p
JOIN orderdetails od
ON p.productCode = od.productCode
GROUP BY p.productName
ORDER BY units_sold DESC
LIMIT 10;


-- 4. Top customers by spending
SELECT
c.customerName,
SUM(p.amount) AS total_spent
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerName
ORDER BY total_spent DESC
LIMIT 10;


-- 5. Low stock products
SELECT
productName,
quantityInStock
FROM products
ORDER BY quantityInStock ASC
LIMIT 10;