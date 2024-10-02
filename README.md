# Retail Data Pipeline & Analysis Project
This project encompasses a comprehensive data engineering pipeline designed to process and analyze retail sales data. The pipeline integrates data from three CSV files into a staging layer in Hive, where it is transformed and modeled into a data warehouse using a star schema. The processed data provides insights into sales trends, customer behavior, and product performance, which are further analyzed using Hive queries and visualized through Power BI.

<img src="Dataflow.jpg">


## Tech Stack & Tools

- **Infrastructure:** VMware Workstation & Apache Hadoop
- **Data Sources:** CSV files
- **Staging Layer:** Hive (Denormalized format)
- **Data Warehouse:** Hive (Star Schema format)
- **Data Processing:** Apache Hive & PySpark
- **ETL:** Jupyter & Pyspark
- **Data Analysis:** Hive Queries
- **Data Visualization:** Power BI

## Pipeline Overview
The Retail Data Pipeline processes retail sales data extracted from three separate CSV files. The data is first ingested into a Hive table in a denormalized format, serving as the staging layer.

Next, the data undergoes transformations and modeling before being loaded into a data warehouse (DWH) structured in a star schema format within a separate Hive database.

Finally, comprehensive data analysis is conducted using Hive queries, and the results are visualized in Power BI to provide key insights into sales trends, customer behavior, and product performance.

## Data Extraction from CSV Files

In this project, retail sales data is extracted from three separate CSV files. Each file contains valuable information needed for our analysis.

The data is loaded into a **Hive table** in a denormalized format, which serves as a staging area for further processing.

## Transformation and Loading into the Data Warehouse

Once extracted, the data undergoes several transformation steps to ensure it is clean and ready for analysis. These transformations include:

- Standardizing data formats
- Calculating important metrics
- Removing duplicate records
- Structuring the data into a star schema for better query performance

After transformation, the data is loaded into a **Hive data warehouse**, which is designed to support complex queries and facilitate reporting and visualization in **Power BI**.


## Star Schema Overview

The Star Schema employed in our data warehouse enables efficient and straightforward queries across various dimensions related to retail sales. This design facilitates insightful analysis of sales performance, product categories, customer segments, and order fulfillment processes.

### Fact Table:

- **FactOrders:** Contains information about sales, including the total sales amount for each order. This table serves as the central point of our schema, allowing for detailed sales analysis.

### Dimension Tables:

- **DimProduct:** Contains information about products, including categories and subcategories. This dimension helps analyze sales performance by product type and facilitates inventory management.

- **DimCustomer:** Holds customer information, including demographics and segments. This allows for segmentation analysis, enabling targeted marketing and customer relationship management.

- **DimLocation:** Provides details about the location where orders were placed, including country, city, and region. This dimension supports geographical sales analysis and helps identify regional trends.

- **DimShip:** Details how orders have been shipped to customers, including various shipping modes. This dimension is crucial for understanding shipping performance and customer satisfaction.

- **DimDate:** Offers a comprehensive view of order dates and shipping dates, organized by day, month, quarter, and year. This facilitates time-series analysis and trend identification in sales patterns.

The relationships between these tables create a robust framework for analyzing retail sales data, providing insights into product performance, customer behavior, and order fulfillment efficiency. This star schema serves as the backbone of our data-driven decision-making processes and is integral to generating analytical reports in **Power BI**.

