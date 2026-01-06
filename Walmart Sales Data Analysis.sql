/* =========================================
   Walmart Sales Data Analysis - MySQL
   ========================================= */

-- 1. Create Database
CREATE DATABASE Walmart_Sales;
USE Walmart_Sales;

-- 2. Create Table
CREATE TABLE sales (
    invoice_id VARCHAR(30),
    branch CHAR(1),
    city VARCHAR(20),
    customer_type VARCHAR(20),
    gender VARCHAR(10),
    product_line VARCHAR(50),
    unit_price DECIMAL(10,2),
    quantity INT,
    tax_5_percent DECIMAL(10,2),
    total DECIMAL(10,2),
    date DATE,
    time TIME,
    payment VARCHAR(20),
    cogs DECIMAL(10,2),
    gross_margin_percentage DECIMAL(5,2),
    gross_income DECIMAL(10,2),
    rating DECIMAL(3,1)
);

-- Load dataset

LOAD DATA INFILE '"C:\Users\yamin\Downloads\Walmart Sales Data.csv"'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 3. Data Cleaning

-- Check NULL values
SELECT *
FROM sales
WHERE invoice_id IS NULL OR total IS NULL;

-- Remove duplicate invoices
DELETE s1
FROM sales s1
JOIN sales s2
ON s1.invoice_id = s2.invoice_id
AND s1.invoice_id > s2.invoice_id;

-- Trim text columns
UPDATE sales
SET
    city = TRIM(city),
    product_line = TRIM(product_line),
    payment = TRIM(payment),
    customer_type = TRIM(customer_type);

-- Remove invalid numeric values
DELETE FROM sales
WHERE quantity <= 0 OR unit_price <= 0 OR total <= 0;

-- Add derived columns
ALTER TABLE sales
ADD COLUMN day_name VARCHAR(10),
ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET
    day_name = DAYNAME(date),
    month_name = MONTHNAME(date);

-- =========================================
-- CUSTOMER ANALYSIS
-- =========================================

-- Customer type distribution
SELECT customer_type, COUNT(*) AS total_customers
FROM sales
GROUP BY customer_type;

-- Revenue by customer type
SELECT customer_type, SUM(total) AS revenue
FROM sales
GROUP BY customer_type;

-- Gender-wise sales
SELECT gender, SUM(total) AS revenue
FROM sales
GROUP BY gender;

-- Average spend per customer type
SELECT customer_type, AVG(total) AS avg_spending
FROM sales
GROUP BY customer_type;

-- =========================================
-- PRODUCT ANALYSIS
-- =========================================

-- Units sold by product line
SELECT product_line, SUM(quantity) AS units_sold
FROM sales
GROUP BY product_line
ORDER BY units_sold DESC;

-- Revenue by product line
SELECT product_line, SUM(total) AS revenue
FROM sales
GROUP BY product_line
ORDER BY revenue DESC;

-- Profit by product line
SELECT product_line, SUM(gross_income) AS profit
FROM sales
GROUP BY product_line
ORDER BY profit DESC;

-- Low-performing products (below avg revenue)
SELECT product_line, SUM(total) AS revenue
FROM sales
GROUP BY product_line
HAVING SUM(total) < (
    SELECT AVG(product_revenue)
    FROM (
        SELECT product_line, SUM(total) AS product_revenue
        FROM sales
        GROUP BY product_line
    ) t
)
ORDER BY revenue ASC;

-- =========================================
-- SALES ANALYSIS
-- =========================================

-- Total revenue & quantity sold
SELECT
    SUM(total) AS total_revenue,
    SUM(quantity) AS total_units_sold
FROM sales;

-- Branch-wise revenue
SELECT branch, SUM(total) AS revenue
FROM sales
GROUP BY branch
ORDER BY revenue DESC;

-- City-wise revenue
SELECT city, SUM(total) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue DESC;

-- Monthly sales trend
SELECT month_name, SUM(total) AS monthly_sales
FROM sales
GROUP BY month_name
ORDER BY monthly_sales DESC;

-- Peak sales hours
SELECT HOUR(time) AS hour, SUM(total) AS revenue
FROM sales
GROUP BY hour
ORDER BY revenue DESC;

-- Payment method usage
SELECT payment, COUNT(*) AS transactions
FROM sales
GROUP BY payment
ORDER BY transactions DESC;

-- =========================================
-- END OF PROJECT
-- =========================================




