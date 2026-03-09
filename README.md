# Data Architecture Overview

This project simulates the data architecture of a typical e-commerce analytics system.

The system follows a modern data pipeline:

Operational Database (OLTP) → ETL Pipeline → Data Warehouse → Business Intelligence

1. **OLTP Layer**
   - Handles real-time transactional data
   - Optimized for inserts, updates, and operational queries

2. **ETL Layer**
   - Extracts data from operational sources
   - Cleans and transforms data
   - Loads structured data into the analytical warehouse

3. **Data Warehouse Layer**
   - Uses dimensional modeling (Star Schema)
   - Optimized for analytical queries and reporting

4. **Business Intelligence Layer**
   - Enables dashboards and business analytics tools (e.g., Power BI)

This architecture separates operational workloads from analytical workloads, improving both system performance and analytical efficiency.

---

# Data Pipeline Flow

The end-to-end pipeline implemented in this project follows these steps:

1. Transaction data is generated and stored in the **OLTP database**.
2. SSIS extracts the transactional data from SQL Server and CSV files.
3. Data is transformed using multiple SSIS components:
   - Data Conversion
   - Derived Column
   - Conditional Split
4. Processed data is loaded into the **Data Warehouse** using a Star Schema.
5. The warehouse can then be connected to **BI tools for reporting and analytics**.

This pipeline demonstrates how raw transactional data can be converted into structured analytical datasets.

---

# Business Analytics Use Cases

The Data Warehouse enables several analytical use cases for an e-commerce platform.

### Revenue Analysis

Business analysts can analyze:

- Total revenue by product
- Revenue trends over time
- Top-performing sellers

### Customer Behavior Analysis

The warehouse can support analysis such as:

- Buyer purchase frequency
- High-value customers
- Customer transaction patterns

### Sales Performance Monitoring

Using the fact table and date dimension, analysts can easily generate reports such as:

- Monthly sales trends
- Daily transaction volume
- Product performance metrics

These insights help organizations make **data-driven business decisions**.

---

# Example Analytical Queries

The Data Warehouse enables efficient analytical queries such as:

- Total revenue per product
- Monthly sales trends
- Top customers by purchase value

Example query:

```sql
SELECT 
    d.YearOfTransaction,
    SUM(f.Quantity) AS TotalSales
FROM FactTransaction f
JOIN DimDate d
ON f.TransactionDate = d.TransactionDate
GROUP BY d.YearOfTransaction
ORDER BY d.YearOfTransaction;
