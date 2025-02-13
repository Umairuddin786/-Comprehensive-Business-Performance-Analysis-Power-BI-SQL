-- Customers Demographics

-- KPI's

-- 1. Customers
SELECT COUNT(DISTINCT Customer_id) AS Customers
FROM Customers;

-- Male
SELECT COUNT (DISTINCT Customer_id) AS Male_Customers
FROM Customers
WHERE customer_gender = 'Male';

-- Female
SELECT COUNT(DISTINCT Customer_id) AS Female_Customers
FROM Customers
WHERE customer_gender = 'Female'

-- 2. Income
SELECT AVG(Customer_Income) AS Income
FROM Customers;

-- Male Income
SELECT SUM(Customer_Income) AS Male_Income
FROM Customers
WHERE Customer_gender = 'Male';

-- Female_Income
SELECT SUM(Customer_Income) AS Female_Income
FROM Customers
WHERE Customer_gender = 'Female';

-- 3. Customer Retention Rate








-- 4. Age
SELECT AVG(Customer_Age) AS Age
FROM Customers;

-- Male
SELECT AVG(Customer_Age) AS Male_Age
FROM Customers
WHERE Customer_gender = 'Male';

-- Female
SELECT AVG(Customer_Age) AS Female_Age
FROM Customers
WHERE Customer_gender = 'Female';

-- 5. CSS
SELECT AVG(Customer_Satisfaction)
FROM Customers;

-- Charts

-- Age
WITH AgeGroups AS (
	SELECT
	     Customer_id,
	     Customer_Age,
	     Customer_gender,
	CASE
	  WHEN customer_Age >=18 AND customer_Age <= 34 THEN 'Young Adult'
	  WHEN Customer_age >= 35 AND customer_age <= 54 THEN 'Adult'
	  WHEN customer_age >= 55 AND customer_age <= 74 THEN 'Senior'
	  ELSE 'Unknown'
	END AS AgeGroup
	FROM Customers
	)

SELECT 
	 AgeGroup,
	 customer_Gender,
	 Count(DISTINCT Customer_id) AS Customers
FROM AgeGroups
GROUP BY AgeGroup, Customer_Gender
ORDER BY Customers DESC;
   

)

-- Income
WITH IncomeGroups AS
(
	SELECT 
	    Customer_id,
	    Customer_Income,
	    Customer_Gender,
	CASE 
	WHEN Customer_Income >=25081 AND Customer_Income <=50000 THEN 'Low'  
	WHEN Customer_Income >50000 AND Customer_Income <= 100000 THEN 'Medium'
	ELSE 'High'
	END AS IncomeGroup
FROM Customers
	
	     
)
SELECT 
     IncomeGroup,
     customer_Gender,
     COUNT(Distinct Customer_id) AS Customers
FROM IncomeGroups
GROUP BY incomegroup, customer_Gender
ORDER BY Customers;

-- Education
SELECT 
       CustomerEducation,
       customer_gender,
       COUNT(Customer_id) AS Customers
FROM Customers
GROUP BY CustomerEducation, customer_gender
ORDER BY customers DESC;

-- Customer Type
SELECT 
      CustomerCategory,
      customer_gender,
      COUNT(DISTINCT Customer_id) AS Customers
FROM customers
GROUP BY customerCategory, Customer_gender
ORDER BY Customers DESC;

-- Country
SE


