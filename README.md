# AdventureWorks Sales Analytics

## SQL Server + Power BI Business Intelligence Project

An end-to-end sales analytics solution transforming transactional data into business insights using SQL Server, T-SQL, Power Query, DAX, and Power BI.

![AdventureWorks Executive Dashboard](Screenshots/05_BI_Dashboard 2013.png)


---

## Project Overview

This project demonstrates an end-to-end business intelligence workflow, starting with a transactional sales database and transforming it into an interactive executive dashboard.

The analysis combines SQL-based business analysis with data modeling and Power BI reporting to provide insights into:

- Sales performance
- Customer contribution
- Product performance
- Territory performance
- Monthly sales trends
- Year-over-year performance
- Executive-level KPIs

The project focuses on translating transactional data into information that can support business monitoring and decision-making.

## Business Objective

The objective was to analyze AdventureWorks sales data and build a reporting solution that enables decision-makers to quickly understand revenue performance, customer activity, product contribution, territory performance, and sales trends.

Key business questions included:

- How much revenue is being generated?
- How many orders and products are involved?
- Which customers contribute the most revenue?
- Which products and categories perform best?
- Which territories generate the highest sales?
- How does sales performance change over time?
- How can transactional data be transformed into an executive-level reporting solution?

- ## Technology Stack

| Technology | Purpose |
|---|---|
| Microsoft SQL Server Express | Database environment |
| SQL Server Management Studio (SSMS) | Database exploration and SQL analysis |
| T-SQL | Data querying and business analysis |
| Power Query | Data transformation |
| Power BI | Data modeling, visualization and reporting |
| DAX | Analytical measures and calculations |
| GitHub | Version control and portfolio documentation |

## Dataset

The project uses the Microsoft AdventureWorks sample database, a transactional database containing sales, customer, product, and territory information.

### Main Tables Used

- `Sales.SalesOrderHeader` — order-level information
- `Sales.SalesOrderDetail` — individual sales transactions
- `Sales.Customer` — customer records
- `Sales.SalesTerritory` — sales territory information
- `Person.Person` — customer names and personal information
- `Production.Product` — product information
- `Production.ProductSubcategory` — product subcategories
- `Production.ProductCategory` — product categories

The dataset was imported into SQL Server Express and explored using SQL Server Management Studio (SSMS) before being transformed into an analytical model for Power BI.

## Project Workflow

The project followed an end-to-end analytics workflow:

```text
AdventureWorks Database
        ↓
SQL Server Express
        ↓
SQL Server Management Studio
        ↓
Data Exploration & Validation
        ↓
Business-Oriented SQL Analysis
        ↓
Power Query Transformations
        ↓
Data Modeling
        ↓
DAX Measures
        ↓
Power BI Dashboard
        ↓
Business Insights & Decision Support
```
## Database Exploration

The initial stage focused on understanding the structure and quality of the transactional database.

Activities included:

- Exploring database schemas and tables
- Inspecting columns and data types
- Understanding relationships between sales, customers, products, and territories
- Reviewing transaction dates and sales periods
- Checking record volumes and data consistency
- Identifying the appropriate tables for analytical reporting
- Understanding the difference between order-level and transaction-level data

SQL Server Management Studio was used as the primary environment for database exploration and analysis.
