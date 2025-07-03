--- The dbo.KMS Sql Case Study data was imported to sql server using import wizard

select * from dbo.[KMS Sql Case Study]
-------------------------------------------------------------------------
--- PROJECT ANALYSIS FOR CASE SCENERIO 1
-------------------------------------------------------------------------
---Question 1: Which product category had the highest sales?

select Product_Category, sum(Sales) AS Highest_total_Sales                                 
from [KMS Sql Case Study]
GROUP BY Product_Category
order by Highest_total_Sales desc
-----------------------------------------------------------------

---Question 2: What are the Top 3 and Bottom 3 regions in terms of sales?

---TOP 3
SELECT TOP 3 Region, Sum(Sales) as[Total Sales], 'Top 3' as [RANK TYPE]
from [KMS Sql Case Study]
group by Region
order by [Total Sales] desc

--- BOTTOM 3
SELECT TOP 3 Region, Sum(Sales) as[Total Sales], 'BOTTOM 3' as [RANK TYPE]
from [KMS Sql Case Study]
group by Region
order by [Total Sales] ASC
-------------------------------------------------------------------------

--- Question 3: What were the total sales of appliances in Ontario?

select REGION, Product_Sub_Category, SUM(sales) as [Total sales]
from [KMS Sql Case Study]
WHERE Product_Sub_Category = 'Appliances' 
AND Region = 'ONTARIO'
GROUP BY REGION, Product_Sub_Category
-------------------------------------------------------------------------

---Question 4:Advise the management of KMS on what to do to increase the revenue from the bottom 
--10 customers

select TOP 10 Order_Quantity, sum(Sales) as Revenue ,Discount, Profit, Unit_Price,Shipping_Cost, Customer_Name, Province, Region, Customer_Segment, Product_Category,Product_Sub_Category, Product_Name, Product_Container, Product_Base_Margin, Ship_Date
FROM [KMS Sql Case Study]
GROUP  BY Order_Quantity,Discount, Profit, Unit_Price,Shipping_Cost, Customer_Name, Province, Region, Customer_Segment, Product_Category,Product_Sub_Category, Product_Name, Product_Container, Product_Base_Margin, Ship_Date
ORDER BY Revenue ASC

select TOP 10 Order_ID, Order_Quantity, sum(Sales) as Revenue ,Discount, Profit, Unit_Price,Shipping_Cost, Customer_Name, Province, Region, Customer_Segment, Product_Category,Product_Sub_Category, Product_Name, Product_Container, Product_Base_Margin, Ship_Date
FROM [KMS Sql Case Study]
GROUP  BY Order_ID, Order_Quantity,Discount, Profit, Unit_Price,Shipping_Cost, Customer_Name, Province, Region, Customer_Segment, Product_Category,Product_Sub_Category, Product_Name, Product_Container, Product_Base_Margin, Ship_Date
ORDER BY Revenue DESC

--- FOR EFFECTIVE ANALYSIS, I COMPARED THE HIGHEST REVENUE CONTRIBUTORS TO THE LOWEST.
--- KEY INSIGHTS ARE:

---DISCOUNT IN PRICE DOESNT MATTER AS BOTH THE HIGHEST AND LOWEST PEOPLE THAT CONTRIBUTE TO THE REVENUE ARE BOTH IN THE SAME DISCOUNT BRACKET.
--- CUSTOMER WITH LOW CONTRIBUTIONS TO THE REVENUE OFTEN PURCHASE LOW PERFORMING PRODUCTS SUCH AS OFFICE SUPPLIES AS EXPECTED.
--- CUSTOMER WITH LOW CONTRIBUTIONS TO THE REVENUE OFTEN PURCHASE ONLY SINGLE OR VERY LITTLE QUANITIES, HENCE LOW REVENUE TURNOUTS.

--- RECOMENDATIONS
--- STOP OFFERING DISCOUNTS TO PRODUCTS, AS IT DOESNT HAVE AN SIGNIFICANT EFFECT ON THE REVENUE. INSTEAD, SELL AT A MORE PROFITABLE MARGIN.
----- ADVERTISE THE BENEFITS OF BULK PURCHSE TO THE CUSTOMERS WITH LOW REVENUE CONTRIBUION
---- TRY TO UPSELL THESE CUSTOMER MORE TECHNILOGY PRODUCTS, INSTEAD OF OFFICE SUPPLIES.

---------------------------------------------------------------------------------------------------------------------------------
--- Qestion 5: KMS incurred the most shipping cost using which shipping method?

SELECT Ship_Mode, sum(Shipping_Cost) as [Most expensive]
 FROM [KMS Sql Case Study]
 group by Ship_Mode
 order by [Most expensive] desc

 -------------------------------------------------------------------------
--- PROJECT ANALYSIS FOR CASE SCENERIO 2
-------------------------------------------------------------------------
--- Queston 6: Who are the most valuable customers, and what products or services do they typically 
purchase?

select Customer_Name, Product_Category, Product_Name, sum(Sales) as Total_Revenue
FROM [KMS Sql Case Study]
GROUP BY Customer_Name, Product_Category,Product_Name
ORDER BY Total_Revenue DESC

-------------------------------------------------------------------------

---Question 7: Which small business customer had the highest sales? 

select top 1 Customer_Name, Customer_Segment, sum(Sales) as [Highest sales per small business ]
FROM [KMS Sql Case Study]
where Customer_Segment = 'Small Business'
group by Customer_Segment, Customer_Name
order by [Highest sales per small business ] desc

-------------------------------------------------------------------------

---Question 8:Which Corporate Customer placed the most number of orders in 2009 – 2012? 

select TOP 1  Customer_Name, COUNT(DISTINCT Order_ID) AS NUMBER_OF_Order 
FROM [KMS Sql Case Study]
where Customer_Segment = 'corporate' 
AND YEAR(Ship_Date) between 2009 and 2012
group by Customer_Name
ORDER BY NUMBER_OF_Order DESC
-------------------------------------------------------------------------
---Question 9: Which consumer customer was the most profitable one? 

SELECT top 1  Customer_name, customer_segment, sum(profit) as total_profit
FROM [KMS Sql Case Study]
where Customer_Segment = 'consumer'
group by Customer_name, customer_segment
order by total_profit desc
----------------------------------------------------------------------------
--- Question 10: Which customer returned items, and what segment do they belong to?
---Used sql inner join to insert data FROM order STATUS TABLE INTO KMS TABLE

select O.Order_id, Customer_Name, K.order_id, Customer_Segment from [KMS Sql Case Study] AS K
inner join Dbo.Order_Status AS O
on O.Order_id =  K.order_id
----------------------------------------------------------------------------
---Question 11: If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company
---appropriately spent shipping costs based on the Order Priority? Explain your answer 

SELECT Ship_Mode, sum(Shipping_Cost) as [Most expensive]
 FROM [KMS Sql Case Study]
 group by Ship_Mode
 order by [Most expensive] desc

 ---According to this query, delivery truck happens to be the most expensive KMS incurred cost on,
 --- but, if i am to assume, it is the most economical, then:
 
 SELECT Ship_Mode,Shipping_Cost, order_priority, count(Order_ID) as [total order id]
 FROM [KMS Sql Case Study]
 group by Ship_Mode, order_priority,Shipping_Cost
 order by  [total order id] desc
 -------------------------------------------------------------------------------------------------------------
 ---key insights
 --- According to this, the country used regular air the most for shipping their goods, though delivery truck is was spent more money on.
 ---Also, regular air was used for more of the critical deliveries, alongside express air. 
 --So, the company didnt take into consideration order priority in shipping cost.







  















