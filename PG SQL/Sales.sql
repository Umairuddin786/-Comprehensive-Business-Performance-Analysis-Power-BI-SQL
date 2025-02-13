-- Sales Performance Dashboard

-- KPI's

-- 1. Revenue
SELECT SUM(total_price) AS Revenue
FROM Orders;

-- 2. Profit
SELECT SUM(Profit) AS PROFIT
FROM financials;

-- 3. Units Sold
SELECT SUM(Quantity) AS Units_Sold
FROM Orders;

-- 4. Orders 
SELECT COUNT(DISTINCT Order_id) AS Orders
FROM Orders;

-- 5. AOV
SELECT 
	SUM(total_price) AS Total_Revenue,
    count(order_Id) AS Orders,
	sum(total_price) / count(order_id)
from orders


-- Visuals 

-- Categroy Revenue and Profit
SELECT 
      p.category,
      SUM(o.total_price) AS Revenue,
      SUM(f.Profit) AS Profit
FROM orders o
JOIN Products p ON o.product_id = p.product_id
JOIN financials f ON o.order_id = f.order_id
GROUP BY p.Category
ORDER BY Revenue DESC;

-- Sub-Category
SELECT 
	p.subcategory,
    SUM(o.total_price) AS Revenue,
    SUM(f.Profit) AS Profit
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Financials f ON o.order_id = f.order_id
GROUP BY p.Subcategory
ORDER BY revenue DESC;

-- TOP 5 Product by Revenue
SELECT 
      p.Product_name,
      SUM(o.total_price) AS Revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- Revenue by Payment
SELECT 
     payment_method,
     SUM(total_price) AS Revenue
FROM Orders
GROUP BY Payment_method
ORDER BY Revenue DESC;

-- Revenue by Order Status
SELECT 
    order_status,
    SUM(total_price) AS Revenue
FROM Orders
GROUP BY order_status
ORDER BY Revenue DESC;

-- Revnue by Month
SELECT
   d.MonthName,
   d.MonthNumber,
   SUM(o.total_price) AS Revenue
FROM Orders o
JOIN DateTable d ON o.order_date = d.date
GROUP BY 
     d.MonthName,
     d.MonthNumber
ORDER BY MonthNumber;

-- Profit by Month
SELECT
     d.MonthNumber,
     d.MonthName AS Month,
    SUM(f.Profit) AS Profit
FROM Orders o
JOIN DateTable d ON o.order_date = d.date
JOIN Financials f ON o.order_id = f.order_id
GROUP BY 
       MonthNumber,
       Month
ORDER BY MonthNumber;

-- Orders By Month
SELECT 
     d.MonthNumber,
     d.MonthName AS Month,
     COUNT(DISTINCT o.Order_id) AS Orders
FROM Orders o
JOIN DateTable d ON o.Order_date = d.DATE
GROUP BY 
        MonthNumber,
        Month
ORDER BY MonthNumber;