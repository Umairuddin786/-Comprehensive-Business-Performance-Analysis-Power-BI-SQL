-- Financial Health

-- KPI's

-- 1.Revenue
SELECT SUM(Total_Revenue) AS Revenue
FROM financials;

-- 2.Profit
SELECT SUM(profit) AS Profit
FROM Financials;

-- 3.Gross Profit
SELECT SUM(total_Revenue) - SUM(COGS) AS Gross_Profit
FROM Financials;

-- 4.Net Profit
SELECT SUM(Profit) AS Net_Profit
FROM Financials;

-- 5.COGS
SELECT SUM(cogs) AS COGS
FROM Financials;

-- 6.Taxes
SELECT SUM(taxes_paid) AS Taxes
FROM Financials;

-- 7.Discount
SELECT SUM(discount_given) AS Discount
FROM Financials;

-- Visulas

-- Revenue Trend Overtime
SELECT
     d.MonthNumber,
     d.MonthName AS Month,
    SUM(f.total_revenue) AS Revenue
FROM Orders o
JOIN DateTable d ON o.order_date = d.date
JOIN Financials f ON o.order_id = f.order_id
GROUP BY 
       MonthNumber,
       Month
ORDER BY MonthNumber;

-- Profit Trend Overtime
SELECT 
     d.monthnumber,
     d.monthname AS Month,
     SUM(f.Profit) AS Profit
FROM Orders o
JOIN DateTable d ON o.order_date = d.date
JOIN Financials f ON o.order_id = f.order_id
GROUP BY 
      MonthNumber,
      Month
ORDER BY MonthNumber;

-- Discount Given 
SELECT 
     d.monthnumber,
     d.monthname AS Month,
     SUM(discount_given) AS Discount
FROM Orders o
JOIN DateTable d ON o.order_date = d.date
JOIN Financials f ON o.order_id = f.order_id
GROUP BY 
       MonthNumber,
       MonthName
ORDER BY MonthNumber;

-- Category by Revenue
SELECT
	  p.Category,
      SUM(total_revenue) AS Revenue
FROM Orders o
JOIN Financials f ON o.order_id  = f.order_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY Category
ORDER BY Revenue DESC;

-- Top 10 Sub-Category
SELECT
      p.subcategory,
      ROUND(SUM(total_revenue),2) AS Revenue
FROM Orders o 
JOIN Financials f ON o.order_id  = f.order_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY subcategory
ORDER BY Revenue DESC
LIMIT 10;

-- Top 5 Products
SELECT 
      p.product_name AS Product,
      SUM(total_revenue) AS Revenue
FROM Orders o
JOIN Financials f ON o.order_id = f.order_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY Product
ORDER BY Revenue DESC
LIMIT 5;

-- COGS vs Revenue
SELECT 
      p.Category,
      SUM(cogs) AS COGS,
      SUM(total_revenue) AS Revenue
FROM Orders o
JOIN Financials f ON o.order_id = f.order_id
JOIN Products p ON  o.product_id = p.product_id
GROUP BY Category
ORDER BY Revenue DESC;

-- Cost % Of Revenue
