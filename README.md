# E-Commerce Database

## About the Project
This project simulates the complete data lifecycle within an e-commerce system. The architecture is divided into two main phases:
1. Building a normalized operational database (OLTP) to manage and process daily transaction activities.
2. Designing a Data Warehouse using a Star Schema and building an automated ETL pipeline to serve Business Intelligence (BI) and analytical purposes.

## Implementation Process
1. **Building the Operational Database (OLTP):**
- Data Modeling: Designed the QLGD database with a robust Entity-Relationship Diagram (ERD), consisting of 4 main tables: NGUOIDUNG (Users), HANGHOA (Products), GIAODICH (Transactions), and CHITIETGD (Transaction Details).
- Query Optimization (T-SQL): * Authored complex JOIN queries to identify the top 5 sellers with the highest annual revenue.
  - Developed a Stored Procedure incorporating conditional logic (IF NOT EXISTS) to calculate and retrieve the total revenue for specific products.
  - Created a User-Defined Function (UDF) to filter and return a list of customers based on a specific total transaction value threshold.
  
  <img width="1206" height="492" alt="Screenshot 2026-03-06 004429" src="https://github.com/user-attachments/assets/4ea46044-b4ce-484d-9214-ab1281c1233c" />

2. **Building the Data Warehouse & ETL Pipeline:**
- Dimensional Modeling (Star Schema): Constructed a dedicated SALES database for analytics, featuring a central fact table (FactTransaction) and supporting dimension tables (DimDate, DimBuyer).
  
<img width="779" height="191" alt="Screenshot 2026-03-06 004506" src="https://github.com/user-attachments/assets/2d7410bd-7892-49dc-a747-6b9649cd347f" />

- ETL Pipeline Development with SSIS:
  - Extract: Extracted raw data from heterogeneous sources, including CSV files (Flat File Source) and SQL databases (OLE DB Source).
  - Transform: Applied advanced SSIS transformations such as Data Conversion, Derived Column (extracting date/time attributes), and Conditional Split (segmenting users into buyers/sellers).
  - Load & SCD: Loaded transformed data into the Data Warehouse utilizing the Slowly Changing Dimension (SCD) component. Configured TransactionID as the Business Key to automatically track and manage historical data changes.
    
<img width="815" height="393" alt="Screenshot 2026-03-06 004538" src="https://github.com/user-attachments/assets/0e67abc7-d006-4e7d-920c-e55312a54d2a" />

