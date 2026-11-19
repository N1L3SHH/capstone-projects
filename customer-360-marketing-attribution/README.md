# E-Commerce Marketing Analytics Pipeline

## 📌 Project Overview
An end-to-end data engineering and analytics pipeline designed to evaluate customer acquisition and marketing channel performance. This project transforms raw e-commerce data into an enterprise-grade interactive dashboard, utilizing a modern data stack to handle data modeling, cloud warehousing, and frontend visualization.

![Dashboard Screenshot](link_to_your_powerbi_screenshot_here.png)
*(View the full PDF export in the repository files)*

## 🛠 Architecture & Tech Stack
* **Data Warehouse:** Google BigQuery
* **Data Transformation:** dbt (data build tool)
* **Business Intelligence:** Power BI (DirectQuery mode)
* **Languages:** SQL, DAX

## 🗄️ Data Modeling (Star Schema)
Transformed raw operational data into a clean, query-optimized Star Schema using dbt to support low-latency DirectQuery performance in Power BI.
* `dim_customers`: Cleansed dimensional table containing unique user identifiers, geolocation, and exact acquisition dates.
* `agg_marketing_channels`: Aggregated fact table calculating total sessions, engagement clicks, and acquired customers per traffic source.

### dbt Pipeline Lineage (DAG)
![dbt Lineage Graph](link_to_your_dbt_lineage_screenshot_here.png)

## 📊 Dashboard & Key Metrics
The frontend Power BI report features a custom JSON theme and a high Data-Ink ratio optimized for executive stakeholder consumption:
* **KPI Control Bar:** Dynamic tracking of Total Acquired Customers (132K), Total Sessions, Total Engagement Clicks, and Avg Clicks Per User.
* **Top N Filtering:** Automated DAX measures calculating the highest-converting marketing channel dynamically.
* **Attribution & Trend Analysis:** Clustered bar charts and continuous line charts visualizing channel distribution and daily user growth over time, bypassing DirectQuery date hierarchy limitations using custom DAX date grouping.
