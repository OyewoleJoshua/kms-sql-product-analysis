# KMS SQL Case Study – Sales & Customer Analytics

This project analyzes sales, customer behavior, and shipping Operations for KMS. The goal is to provide actionable insights that improve customer targeting, product strategy, and shipping efficiency using structured SQL queries.

## Project Overview

Using the KMS Sales dataset imported into SQL Server, I answered real-world business questions related to sales performance, customer segmentation, order profitability, and shipping costs. This case study simulates how data analytics can support smarter business decisions in a retail setting.


##  Business Questions Answered

### 📌 Case Scenario 1 – Revenue & Shipping Insights
1. Highest-selling product category  
2. Top 3 and Bottom 3 sales regions  
3. Total sales of appliances in Ontario  
4. Bottom 10 customers – why their revenue is low & how to improve it  
5. Shipping method with the highest cost  

### 📌 Case Scenario 2 – Customer Value & Segment Insights
6. Most valuable customers and products they purchase  
7. Highest-spending small business customer  
8. Corporate customer with most orders (2009–2012)  
9. Most profitable consumer customer  
10. Customers who returned products and their segments  
11. Was shipping cost aligned with order priority?


##  Key Insights

- Discounts didn't significantly impact revenue – both high and low revenue customers fell within the same discount brackets.
- Low-value customers tend to buy low-performing products (e.g., Office Supplies) and in small quantities.
- Shipping cost decisions didn’t align with order priority — more expensive methods were sometimes used for low-priority orders.
- Technology products and bulk purchases contributed more to revenue and profit margins.

## Recommendations

- Stop offering broad discounts — focus on maintaining healthier margins.
- Promote bulk purchasing among low-revenue customers.
- Upsell high-value product categories like Technology to customers buying low-impact items.
- Re-evaluate shipping policies — ensure priority orders use faster shipping and low-priority orders use more economical methods.

##  Tools Used

- SQL Server  
- SQL (T-SQL) Queries  
- Data Import Wizard (SQL Server)  
- Joins, Aggregations, Filtering, Sorting, Grouping

##  Let's Connect

I'm always open to collaborations or consulting in data analytics, *product insights*, and *growth strategy* for fintech and retail businesses.

📧 Oyewjoshua@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/joshuaoluwafemioyewole)

##  Dataset Summary
### Source: Imported via SQL Server Import Wizard  
### Tables Used:
- [KMS_Sql_Case_Study.csv](https://github.com/OyewoleJoshua/kms-sql-product-analysis/blob/main/KMS_Sql_Case_Study.csv) – Main dataset for all business questions.
-  [Order_Status.csv](https://github.com/OyewoleJoshua/kms-sql-product-analysis/blob/main/Order_Status.csv) – Used to identify returned orders.
-  [SQLQuery1.sql](https://github.com/OyewoleJoshua/kms-sql-product-analysis/blob/main/SQLQuery1.sql)  - Lines of code for sql.
 ```  SQL
    select * from dbo.[KMS Sql Case Study]
```
   
