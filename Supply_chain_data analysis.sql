use pizza_sales;
select * from supply_chain;
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

	SELECT 
		ROUND(SUM(Price * quantities), 2) AS Total_Revenue,
		ROUND(SUM(Costs), 2) AS Total_Cost,
		SUM(Quantities) AS Total_Product_Sold,
		COUNT(DISTINCT SKU) AS Order_Quantity,
		SUM(Stocklevels) AS Stock_Level
	FROM Supply_Chain;

	SELECT 
		Customer_demographics,
		ROUND(SUM(Price * Quantities), 2) AS Total_Revenue
	FROM Supply_Chain
	GROUP BY Customer_demographics;

	SELECT 
		Product_Type,
		ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate_Percent
	FROM Supply_Chain
	GROUP BY Product_Type;

	SELECT 
		Product_Type,
		ROUND(AVG((Price - Costs) / NULLIF(Costs, 0)) * 100, 2) AS Avg_Profit_Margin_Percent
	FROM Supply_Chain
	GROUP BY Product_Type;

	SELECT 
		SKU,
		Product_Type,
		round(sum(Price),2) AS Total_Price,
		SUM(Quantities) AS Total_Products_Sold
	FROM Supply_Chain
	GROUP BY SKU, Product_Type;

	SELECT 
		SKU,
		SUM(Lead_Time) AS Total_Lead_Time,
		SUM(Manufacturing_Lead_Time) AS Total_Mfg_Lead_Time
	FROM Supply_Chain
	GROUP BY SKU;

	SELECT 
		Supplier_Name,
		ROUND(SUM(Price - Costs), 2) AS Total_Profit,
		ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate
	FROM Supply_Chain
	GROUP BY Supplier_Name;

	SELECT 
		Transportation_modes,
		ROUND(SUM(Costs), 2) AS Total_Cost
	FROM Supply_Chain
	GROUP BY Transportation_modes;


	SELECT 
		Transportation_Modes,
		ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate_Percent
	FROM Supply_Chain
	GROUP BY Transportation_Modes;

	SELECT 
		Supplier_Name,
		round(SUM(Manufacturing_Costs),2) AS Total_Manufacturing_Cost,
		round(SUM(Shipping_Costs),2) AS Total_Shipping_Cost
	FROM Supply_Chain
	GROUP BY Supplier_Name;










