SELECT * FROM PortfolioProject..SupermarketSales

--Change date column to date data type from text 
ALTER TABLE PortfolioProject..[supermarketSales ]
alter column date DATE

--Revenue and profit of every product line 

SELECT [Product line], SUM([Quantity])AS NumProductsSold, round(sum(total), 2)As TotalRevenue, ROUND(SUM([gross income]), 2) AS TotalProfit
FROM PortfolioProject..SupermarketSales 
GROUP BY [Product line]
ORDER BY NumProductsSold desc

-- Most expensive product line
SELECT [Product line], AVG(cogs) AS CostOfGoods
from PortfolioProject..SuperMarketSales
group by [Product line]
order by 2 desc

--Disrtribution of every product

SELECT 
[Product line],SUM([Quantity])AS NumProductsSold, 
ROUND(SUM([Quantity])/(select sum(Quantity)FROM PortfolioProject..SupermarketSales )*100, 2)AS DistributionOfProduct
FROM PortfolioProject..SupermarketSales
GROUP BY [Product line]

--Average Rating for the products
SELECT 
[Product line],round(AVG(Rating), 2) AS AvgRating
FROM PortfolioProject..SupermarketSales
Group by [Product line]
order by 2 desc


--BEST performing branch 

SELECT [Branch], SUM([Quantity])AS NumProductsSold, round(sum(total), 2)As TotalRevenue, ROUND(SUM([gross income]), 2) AS TotalProfit
FROM PortfolioProject..SupermarketSales
GROUP BY [Branch]
ORDER BY TotalProfit desc

--Best Performing City 
SELECT city, SUM([Quantity])AS NumProductsSold, round(sum(total), 2)As TotalRevenue, ROUND(SUM([gross income]), 2) AS TotalProfit
FROM PortfolioProject..SupermarketSales
GROUP BY city

--Most used Payment method
SELECT Payment, count(payment)AS CountPayment, AVG(total) AvgPurchase
FROM PortfolioProject..SuperMarketSales
group by Payment

--Payments made by each type of payment method
SELECT Payment, sum(Total)AS TotalPayment
FROM PortfolioProject..SuperMarketSales
group by Payment

--count of producst by gender purchase
select [Product line], Gender, COUNT(gender) AS GenderCount
FROM PortfolioProject..SupermarketSales
group by  Gender, [Product line]

--purchases by gender
SELECT gender, round(SUM(total),2) as TotalPurchase, round(avg(total), 2) AS AvgPurchase
FROM PortfolioProject..SuperMarketSales
GROUP BY Gender

-- Finding out which day of the week has the most sales
SELECT datename(weekday,date) AS DayofWeek, sum(Total) AS Total
FROM PortfolioProject..SuperMarketSales
group by datename(weekday,date)
order by Total desc

-- Finding out which month of the yearhas the most sales
SELECT datename(month,date) AS DayofWeek, sum(Total) AS Total
FROM PortfolioProject..SuperMarketSales
group by datename(month,date)
order by Total