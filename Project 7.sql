use project_2


## Query most responsive customer segments

-- By Marital Status

SELECT 
    Marital_Status,
    COUNT(*) AS Total_Customers,
    SUM(Response) AS Total_Responders,
    ROUND(100.0 * SUM(Response) / COUNT(*), 2) AS Response_Rate_Percent
FROM 
    marketing_campaign
GROUP BY 
    Marital_Status
ORDER BY 
    Response_Rate_Percent DESC;

-- By Education Level

SELECT 
    Education,
    COUNT(*) AS Total_Customers,
    SUM(Response) AS Total_Responders,
    ROUND(100.0 * SUM(Response) / COUNT(*), 2) AS Response_Rate_Percent
FROM 
    marketing_campaign
GROUP BY 
    Education
ORDER BY 
    Response_Rate_Percent DESC;

-- Calculate average spending and conversion per segment

SELECT 
    Marital_Status,
    Education,
    ROUND(AVG(
        MntWines + MntFruits + MntMeatProducts + 
        MntFishProducts + MntSweetProducts + MntGoldProds
    ), 2) AS Avg_Spending,
    
    ROUND(AVG(Response) * 100, 2) AS Conversion_Rate,
    
    COUNT(*) AS Total_Customers
FROM marketing_campaign
GROUP BY Marital_Status, Education
ORDER BY Conversion_Rate DESC;

-- Find customers with high spending or high engagement.

-- Top 10 spenders
SELECT ID,
       Income,
       (MntWines + MntFruits + MntMeatProducts + 
        MntFishProducts + MntSweetProducts + MntGoldProds) AS Total_Spending
FROM marketing_campaign
ORDER BY Total_Spending DESC
LIMIT 10;


-- Identify which products are most purchased and by whom.

-- Average spending by education level per product
SELECT 
    Education,
    ROUND(AVG(MntWines), 2) AS Avg_Wine,
    ROUND(AVG(MntMeatProducts), 2) AS Avg_Meat,
    ROUND(AVG(MntGoldProds), 2) AS Avg_Gold
FROM marketing_campaign
GROUP BY Education;


-- Analyze if web activity is related to campaign success.

-- Web visits vs campaign response
SELECT 
    Response,
    ROUND(AVG(NumWebVisitsMonth), 2) AS Avg_Web_Visits
FROM marketing_campaign
GROUP BY Response;

-- Track customer loyalty or recency.

-- Average recency by campaign response
SELECT 
    Response,
    ROUND(AVG(Recency), 2) AS Avg_Recency
FROM marketing_campaign
GROUP BY Response;


-- Total Acceptances Per Campaign

SELECT 
    SUM(AcceptedCmp1) AS Campaign1,
    SUM(AcceptedCmp2) AS Campaign2,
    SUM(AcceptedCmp3) AS Campaign3,
    SUM(AcceptedCmp4) AS Campaign4,
    SUM(AcceptedCmp5) AS Campaign5,
    SUM(Response) AS Overall_Response
FROM marketing_campaign;


-- Campaign Acceptance by Education Level

SELECT 
    Education,
    SUM(AcceptedCmp1) AS Cmp1,
    SUM(AcceptedCmp2) AS Cmp2,
    SUM(AcceptedCmp3) AS Cmp3,
    SUM(AcceptedCmp4) AS Cmp4,
    SUM(AcceptedCmp5) AS Cmp5
FROM marketing_campaign
GROUP BY Education;


--  Income vs. Spending Correlation

-- Check if wealthier customers spend more.
SELECT 
    ROUND(Income, -2) AS Income_Bracket,
    ROUND(AVG(MntWines + MntFruits + MntMeatProducts + 
              MntFishProducts + MntSweetProducts + MntGoldProds), 2) AS Avg_Spending
FROM marketing_campaign
WHERE Income IS NOT NULL
GROUP BY ROUND(Income, -2)
ORDER BY Income_Bracket;

--Family Composition & Spending

--Spending by number of children at home

SELECT 
    (Kidhome + Teenhome) AS Total_Kids,
    ROUND(AVG(MntWines + MntFruits + MntMeatProducts + 
              MntFishProducts + MntSweetProducts + MntGoldProds), 2) AS Avg_Spending
FROM marketing_campaign
GROUP BY Total_Kids
ORDER BY Total_Kids;


-- Loyalty Based on Joining Date

-- Convert to year and group
SELECT 
    SUBSTR(Dt_Customer, 1, 4) AS Join_Year,
    COUNT(*) AS Customers_Joined,
    ROUND(AVG(Response) * 100, 2) AS Avg_Conversion_Rate
FROM marketing_campaign
GROUP BY SUBSTR(Dt_Customer, 1, 4)
ORDER BY Join_Year;

-- Multi-Channel Purchasing Behavior

-- Analyze purchase preferences by segment:
SELECT 
    Marital_Status,
    ROUND(AVG(NumWebPurchases), 2) AS Web,
    ROUND(AVG(NumCatalogPurchases), 2) AS Catalog,
    ROUND(AVG(NumStorePurchases), 2) AS Store
FROM marketing_campaign
GROUP BY Marital_Status;