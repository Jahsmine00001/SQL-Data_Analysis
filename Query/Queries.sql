/*
=============================================================
Create Database 
=============================================================
Script Purpose:
    This script creates a new database named 'retail_sales_db' after checking if it already exists 
    If the database already exists, it is dropped and recreated, to ensure a clean setup. 
	Additionally the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.
    

WARNING:
    Running this script will drop the entire 'retail_sales_db' database if it exists, 
    permanently deleting all data within it. Proceed with caution and ensure you 
    have proper backups before executing this script.
*/
CREATE DATABASE retail_sales_db;
USE retail_sales_db;


/*
===================================================================================
DDL Script: Create retail sales table
===================================================================================
Script Purpose: 
	This script create tables in the retail_sales_db, dropping existing tables 
	if they aleready exist.
	Run this script to re-define the DDL structure of the retail_sales Tables
====================================================================================
*/
IF OBJECT_ID ('retail_sales', 'U') IS NOT NULL
	DROP TABLE retail_sales;
GO
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantiy INT,
    price_per_unit INT,
    cogs DECIMAL(10,2),
    total_sale INT
);

SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
   
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantity > 4  
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022;
  
SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT category, AVG(age) AS avg_customer_age
FROM retail_sales
GROUP BY category
HAVING category = 'Beauty';

SELECT *
FROM retail_sales
WHERE total_sale > 1000;

SELECT gender, category, COUNT(transactions_id) AS total_number_of_transactions
FROM retail_sales
GROUP BY gender, category
ORDER BY gender;

SELECT YEAR(sale_date) AS year,
       MONTH(sale_date) AS month,
       AVG(total_sale) AS avg_monthly_sale
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month,avg_monthly_sale DESC;

SELECT customer_id, SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

SELECT 
    CASE 
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(transactions_id) AS total_orders
FROM retail_sales
GROUP BY shift;
