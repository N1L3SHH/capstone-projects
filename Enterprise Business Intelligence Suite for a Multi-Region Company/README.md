# Executive Business Intelligence Dashboard | AdventureWorks

## 📌 Project Objective
Designed and developed an interactive Power BI dashboard to analyze $109.8M in total revenue and track gross margin profitability across global sales territories. The goal was to provide business stakeholders with a frictionless, high-level executive summary of revenue trends, while enabling deep-dive capabilities into SKU-level performance across multiple sales channels.

## 🗄️ Architecture & Data Model Documentation
**Schema Design:** Constellation Schema (Multi-Fact)
**Central Fact Tables:** `FactInternetSales` & `FactResellerSales` ($109.8M Combined Revenue Base)
**Dimension Tables:** `DimDate`, `DimProduct`, `DimGeography`, `DimCustomer`, `DimEmployee`

**Relationship Mapping:**
* `DimDate` [DateKey] -> (1:Many) -> `FactInternetSales` & `FactResellerSales` [OrderDateKey]
* `DimProduct` [ProductKey] -> (1:Many) -> `FactInternetSales` & `FactResellerSales` [ProductKey]
* `DimGeography` [GeographyKey] -> (1:Many) -> `FactInternetSales` & `FactResellerSales` [GeographyKey]
* `DimCustomer` [CustomerKey] -> (1:Many) -> `FactInternetSales` [CustomerKey]
* `DimEmployee` [EmployeeKey] -> (1:Many) -> `FactResellerSales` [EmployeeKey]

## 🧹 Data Cleaning & Power Query
* Imported the raw tables from the AdventureWorks relational database.
* The main fix was in the `DimGeography` table. I had to filter out several orphaned "NA" territory records. If left in, these empty rows would have broken the gross margin aggregations and caused cross-filtering errors.
* Formatted all cost and pricing columns to fixed decimals before loading them into the DAX engine to ensure accurate calculations.
* Created a dedicated `KeyMeasures` table to organize all DAX calculations cleanly.

## 📊 DAX & Business Logic
* **Core Metrics:** Authored baseline measures for `Total Sales`, `Total Profit`, and `Margin %` to track overall financial performance across both Internet and Reseller channels.
* **Time Intelligence:** Developed advanced time-intelligence measures, specifically `Sales YTD` and `Sales YoY Growth`.
* **Conditional Formatting:** Implemented business-logic formatting on the `Sales YoY Growth` KPI, automatically turning the metric green or red based on a strict 250% corporate growth benchmark.

## 🖥️ User Interface & Advanced Functionality
* **Custom Tooltips:** Engineered a hidden report page tooltip that dynamically displays a clustered bar chart of the Top 3 products whenever a user hovers over the main visual.
* **Drill-Through Navigation:** Built a dedicated 'Category Detail' page. Stakeholders can right-click any product category in the main matrix to drill down and instantly view granular performance (sales, profit, and margin) for underlying items.
* **Bookmark-Driven Navigation:** Configured a dynamic "Reset Filters" button using Power BI bookmarks, allowing users to instantly clear all slicer selections and snap back to the default organizational view with a single click.

## 🚀 Setup & Usage
1. Download the `enterprise_bi_suite.pbix` file from this repository.
2. Open the file using Power BI Desktop.
3. The dashboard opens on the default executive view. Use the Year and Country slicers to interact with the data, and click the circular "Reset" button in the top right to clear all filters.
