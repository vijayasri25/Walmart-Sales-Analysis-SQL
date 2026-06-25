# import walmart_sales.csv data

use walmart_db;

show tables;

#
select * from walmart_sales;
select count(*) from walmart_sales;  #count-total no of rows

#Basic -Total Sales,Average Sales
#Total Sales
select sum(Weekly_Sales) as Total_sales from walmart_sales;
#Average Sales
select avg(Weekly_Sales) as Average_sales from walmart_sales;

#Store Performance - 
#Sales by Store
select Store, sum(Weekly_Sales) as Total_sales from walmart_sales group by Store;
#Top 5 Stores
select Store, sum(Weekly_Sales) as Total_sales 
from walmart_sales 
group by Store
order by Total_sales desc limit 5;
#Bottom 5 Stores
select Store, sum(Weekly_Sales) as Total_sales 
from walmart_sales 
group by Store
order by Total_sales asc limit 5;

#Time Analysis
#Monthly Sales Trend
select month(date), sum(Weekly_Sales) as sales
from walmart_sales 
group by month(date);

#Yearly Sales
select year(date), sum(Weekly_Sales) as sales
from walmart_sales 
group by year(date);

#Business Insight
#Holiday vs Non-Holiday
select Holiday_Flag, sum(Weekly_Sales) as sales
from walmart_sales 
group by Holiday_Flag;

#Store + Holiday Impact
select Store,Holiday_Flag, sum(Weekly_Sales) as sales
from walmart_sales 
group by Store,Holiday_Flag;

