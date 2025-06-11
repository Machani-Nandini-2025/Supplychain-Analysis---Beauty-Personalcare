# 📦 Supply Chain Analysis – Beauty & Personal Care

### 📑 Table of Contents
- [📘 Project Overview](#project-overview)  
- [📊 Data Sources](#data-sources)  
- [🧰 Tools Used](#tools-used)  
- [🧹 Data Cleaning & Preparation](#data-cleaning--preparation)  
- [🔎 Exploratory Data Analysis](#exploratory-data-analysis)  
- [💻 SQL Queries & Data Analysis](#sql-queries--data-analysis)  
- [📈 Dashboards](#dashboards)  
- [🧠 Results & Insights](#results--insights)  
- [✅ Recommendations](#recommendations)  
- [💼 Project Files](#project-files)  
- [🔗 Let’s Connect!](#lets-connect)

---

### 📘 Project Overview

This project analyzes supply chain performance in the Beauty & Personal Care industry using real-world operational data. The project focused on optimizing supplier performance, reducing lead times, and improving inventory visibility.

The objective is to:

* Evaluate **supplier performance**
* Identify **inventory gaps**
* Reduce **lead times**
* Improve **inventory visibility**

---

### 📊 Data Sources

The primary dataset used for this analysis is supply_chain_data.csv, which contains detailed information about inventory, orders, suppliers, and logistics within the Beauty & Personal Care industry.

### 🧰 Tools Used

* **Excel** – Data cleaning and initial inspection
* **MySQL** – Querying and data analysis
* **Power BI** – Dashboard development and visualization

---

### 🧹 Data Cleaning & Preparation

Key steps in the cleaning process:

* Loaded and inspected data
* Handled missing/null values
* Corrected data types and formatting issues

---

### 🔎 Exploratory Data Analysis

Insights generated:

* **Top Products & Inventory Gaps** – Identified bestsellers and low-stock items
* **Supplier Performance** – Analyzed delivery delays and fulfillment rates
* **Sales Trends** – Tracked monthly profit trends and discount impacts

---

### Data Analysis

Include some interesting code/feature worked with


### 💻 SQL Queries & Data Analysis

Some highlight queries used in the analysis:

### 🔹 Top 5 Revenue-Generating Suppliers

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

### 🔹 Overall Revenue, Cost, Inventory Metrics

```sql
SELECT 
    ROUND(SUM(Price * quantities), 2) AS Total_Revenue,
    ROUND(SUM(Costs), 2) AS Total_Cost,
    SUM(Quantities) AS Total_Product_Sold,
    COUNT(DISTINCT SKU) AS Order_Quantity,
    SUM(Stocklevels) AS Stock_Level
FROM Supply_Chain;
```

### 🔹 Revenue by Customer Demographics

```sql
SELECT 
    Customer_demographics,
    ROUND(SUM(Price * Quantities), 2) AS Total_Revenue
FROM Supply_Chain
GROUP BY Customer_demographics;
```

### 🔹 Avg. Defect Rate by Product Type

```sql
SELECT 
    Product_Type,
    ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate_Percent
FROM Supply_Chain
GROUP BY Product_Type;
```

### 🔹 Average Profit Margin by Product Type
```sql
SELECT 
    Product_Type,
    ROUND(AVG((Price - Costs) / NULLIF(Costs, 0)) * 100, 2) AS Avg_Profit_Margin_Percent
FROM Supply_Chain
GROUP BY Product_Type;
```

### 🔹 Product Sales Summary
```sql
SELECT 
    SKU,
    Product_Type,
    ROUND(SUM(Price), 2) AS Total_Price,
    SUM(Quantities) AS Total_Products_Sold
FROM Supply_Chain
GROUP BY SKU, Product_Type;
```

### 🔹 Lead Time by SKU
```sql

SELECT 
    SKU,
    SUM(Lead_Time) AS Total_Lead_Time,
    SUM(Manufacturing_Lead_Time) AS Total_Mfg_Lead_Time
FROM Supply_Chain
GROUP BY SKU;
```

### 🔹 Supplier Profitability & Quality
```sql
SELECT 
    Supplier_Name,
    ROUND(SUM(Price - Costs), 2) AS Total_Profit,
    ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate
FROM Supply_Chain
GROUP BY Supplier_Name;
```

### 🔹 Transportation Mode Cost Breakdown
```sql
SELECT 
    Transportation_modes,
    ROUND(SUM(Costs), 2) AS Total_Cost
FROM Supply_Chain
GROUP BY Transportation_modes;
```

### 🔹 Transportation Mode vs. Defect Rate
```sql
SELECT 
    Transportation_Modes,
    ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate_Percent
FROM Supply_Chain
GROUP BY Transportation_Modes;
```

### 🔹 Supplier Manufacturing vs. Shipping Costs
```sql
SELECT 
    Supplier_Name,
    ROUND(SUM(Manufacturing_Costs), 2) AS Total_Manufacturing_Cost,
    ROUND(SUM(Shipping_Costs), 2) AS Total_Shipping_Cost
FROM Supply_Chain
GROUP BY Supplier_Name;
```

---

### 📈 Dashboards (Power BI)

* **📦 Supply Chain Overview**

![Supplychain - Overview](https://github.com/user-attachments/assets/d95c0cd4-a4dd-4bc0-8aab-cb91b3001636)

* **🧴 Product Performance**

![Supplychain - Product](https://github.com/user-attachments/assets/74883b7f-fdb9-464d-98d0-5267037cf21c)

* **🚚 Supplier & Logistics Analysis**

![Supplychain - Supplier](https://github.com/user-attachments/assets/c7a7237e-e20a-4144-8eea-a85078a229ae)

---

### 🧠 Results & Insights

* ✅ High overall **profit margin** observed with strong revenue.
* 💄 **Cosmetics** had the **highest defect rates**.
* ✈️ **Air transport** showed the **highest costs and defect rates**.
* 🔢 Some SKUs were significantly **overstocked**, while others were understocked.

---

### 📌 Recommendations

1. **Reduce Air Transport**
   → To cut costs and minimize damage rates

2. **Stricter Quality Control**
   → Especially for **cosmetics** and **haircare** products

3. **Inventory Optimization**
   → Eliminate low-performing overstocked SKUs
   → Prioritize replenishment of fast-moving items

---





