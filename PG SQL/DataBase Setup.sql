-- DataBase Setup
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_age INT,
    customer_gender VARCHAR(10),
    customer_city VARCHAR(100),
    customer_state VARCHAR(100),
    customer_country VARCHAR(50),
    customer_income NUMERIC(10, 2),
    date_of_registration DATE,
    preferred_contact_method VARCHAR(20)
);
SELECT * FROM Customers;

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    category VARCHAR(50),
    subcategory VARCHAR(50),
    unit_price NUMERIC(10, 2),
    manufacturer VARCHAR(100),
    stock_quantity INT,
    launch_date DATE
);
SELECT * FROM Products

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    order_date DATE,
	shipment_date DATE,
    quantity INT,
    total_price INT,
	payment_method VARCHAR(100),
    order_status VARCHAR(200),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
SELECT * FROM Orders;

CREATE TABLE marketing (
    campaign_id VARCHAR(10) PRIMARY KEY,
	order_id VARCHAR(10),
    campaign_name VARCHAR(100),
	start_date DATE,
	end_date DATE,
	marketing_spend INT,
	reach INT,
    impressions INT,
    clicks INT,
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

-- Add the new column
ALTER TABLE Marketing ADD COLUMN MarketingChannel VARCHAR(255);

-- Update the MarketingChannel column based on the campaign names
UPDATE Marketing
SET MarketingChannel = CASE
    WHEN Campaign_Name = 'Radio Ads' THEN 'Radio'
    WHEN Campaign_Name = 'Email Campaign' THEN 'Email'
    WHEN Campaign_Name = 'Social Media' THEN 'Social Media Platforms'
    WHEN Campaign_Name = 'TV Commercial' THEN 'Television'
    WHEN Campaign_Name = 'Google Ads' THEN 'Google Search & Display'
    ELSE NULL
END;

SELECT * FROM Marketing;

CREATE TABLE financials (
    financial_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10),
    cogs INT,
	operational_expenses INT,
    other_expenses INT ,
    total_revenue INT,
	profit INT,
    financial_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
SELECT * FROM financials;

SELECT DISTINCT campaign_name
FROM Marketing;

