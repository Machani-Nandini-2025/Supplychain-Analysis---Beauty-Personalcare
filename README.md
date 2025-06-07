# Supply chain Analysis - Beauty & Personalcare

## Table of Contents

- [Project Overview](#project-overview)
- [Data sources](#data-sources)
- [Dashboard](#data-sources)
- [Recomendations](#recomendations)
### Project Overview

This project analyzes supply chain performance in the Beauty & Personal Care industry using real-world operational data. The project focused on optimizing supplier performance, reducing lead times, and improving inventory visibility.

### Data sources

The primary dataset used for this analysis is supply_chain_data.csv, which contains detailed information about inventory, orders, suppliers, and logistics within the Beauty & Personal Care industry.

### Tools

- Excel    - Data Cleaning
- My SQL   - Data Analysis
- Power BI - Creating reports

### Data Cleaning/Preparation

In the intial data preparation phase, i performed the following tasks:
1. Data loading and inspection.
2. Handling missing values.
3. Data cleaning and formatting.

### Exploratory Data Analysis

- Top Products & Inventory Gaps – Analyzed bestsellers and stock issues
- Supplier Performance – Tracked delivery delays and fulfillment rates
- Sales Trends – Uncovered monthly profit patterns and discount impacts

### Dashboards
![Supplychain - Overview](https://github.com/user-attachments/assets/d95c0cd4-a4dd-4bc0-8aab-cb91b3001636)
![Supplychain - Product](https://github.com/user-attachments/assets/74883b7f-fdb9-464d-98d0-5267037cf21c)
![Supplychain - Supplier](https://github.com/user-attachments/assets/86e30688-6867-4b9c-bd0f-7af7a1438da0)


### Data Analysis

Include some interesting code/feature worked with

```sql
SELECT *
FROM (
    SELECT 
        Suppliername,
        SUM(Revenuegenerated) AS Total_Revenue,
        RANK() OVER (ORDER BY SUM(Revenuegenerated) DESC) AS Supplier_Rank
    FROM supply_chain
    GROUP BY Suppliername
) AS ranked_suppliers
WHERE Supplier_Rank <= 5;
```
```sql
SELECT 
    ROUND(SUM(Price * quantities), 2) AS Total_Revenue,
    ROUND(SUM(Costs), 2) AS Total_Cost,
    SUM(Quantities) AS Total_Product_Sold,
    COUNT(DISTINCT SKU) AS Order_Quantity,
    SUM(Stocklevels) AS Stock_Level
FROM Supply_Chain;
```
```sql
SELECT 
    Customer_demographics,
    ROUND(SUM(Price * Quantities), 2) AS Total_Revenue
FROM Supply_Chain
GROUP BY Customer_demographics;
```
```sql
SELECT 
    Product_Type,
    ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate_Percent
FROM Supply_Chain
GROUP BY Product_Type;
```
```sql
SELECT 
    Product_Type,
    ROUND(AVG((Price - Costs) / NULLIF(Costs, 0)) * 100, 2) AS Avg_Profit_Margin_Percent
FROM Supply_Chain
GROUP BY Product_Type;
```
```sql
SELECT 
    SKU,
    Product_Type,
    round(sum(Price),2) AS Total_Price,
    SUM(Quantities) AS Total_Products_Sold
FROM Supply_Chain
GROUP BY SKU, Product_Type;
```
```sql
SELECT 
    SKU,
    SUM(Lead_Time) AS Total_Lead_Time,
    SUM(Manufacturing_Lead_Time) AS Total_Mfg_Lead_Time
FROM Supply_Chain
GROUP BY SKU;
```
```sql
SELECT 
    Supplier_Name,
    ROUND(SUM(Price - Costs), 2) AS Total_Profit,
    ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate
FROM Supply_Chain
GROUP BY Supplier_Name;
```
```sql
SELECT 
    Transportation_modes,
    ROUND(SUM(Costs), 2) AS Total_Cost
FROM Supply_Chain
GROUP BY Transportation_modes;
```
```sql
SELECT 
    Transportation_Modes,
    ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate_Percent
FROM Supply_Chain
GROUP BY Transportation_Modes;
```
```sql
SELECT 
    Supplier_Name,
    round(SUM(Manufacturing_Costs),2) AS Total_Manufacturing_Cost,
    round(SUM(Shipping_Costs),2) AS Total_Shipping_Cost
FROM Supply_Chain
GROUP BY Supplier_Name;
```

### Results/Findings

- High overall profit margin with strong revenue generation.
- Cosmetics have the highest defect rates among all product types.
- Air transport is costly and has the highest defect rate, suggesting inefficiencies.

### Recomendations

Based on the analysis we recommend the following action:
- Reduce reliance on air transport to lower cost and defect rates.
- Implement stricter quality control for cosmetics and haircare product.
- Optimize inventory by reducing overstocked low performing SKUs and boosting high demand items.


