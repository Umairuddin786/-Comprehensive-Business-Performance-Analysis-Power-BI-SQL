# -Comprehensive-Business-Performance-Analysis-Power-BI-SQL
🚀 Comprehensive Business Performance Analysis is a data-driven project that evaluates key business metrics such as sales trends, profitability, customer segmentation, and operational efficiency.

## 🛠️ Tools Used
- **Power BI** → Data visualization  
- **PostgreSQL (PG SQL)** → Data cleaning & analysis  
- **Excel** → Data preprocessing  

## 🎯 Key Objectives
✔ **Analyze sales trends**  
✔ **Identify top & low-performing products**  
✔ **Understand customer behavior**  
✔ **Measure discounts' impact on profit**  
✔ **Evaluate regional sales performance**  

## 🔍 Key Insights
📈 **Sales Trends:** Peak sales occur during festive seasons.  
👥 **Customer Segmentation:** High-value customers bring 70% of revenue.  
📊 **Profitability:** Some products have low profit due to heavy discounts.  
🌍 **Regional Performance:** Region A has the highest sales.  
💲 **Discount Impact:** High discounts increase sales but reduce profit.  

## 💡 Power BI Dashboard
(![Screenshot 2025-02-09 145326](https://github.com/user-attachments/assets/034f239d-2be1-44b4-9014-bf2064532b66)
)  

## 🛠️ SQL Queries Used
- **Sales Performance**
```sql
SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;
