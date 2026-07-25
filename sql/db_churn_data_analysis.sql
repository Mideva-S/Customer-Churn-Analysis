CREATE DATABASE db_churn;

SELECT * 
FROM stg_Churn;

-- CUSTOMERS BY GENDER
SELECT 
	Gender,
	COUNT(Gender) AS total_count,
	COUNT(Gender) * 100/ (SELECT COUNT(*) FROM stg_Churn) AS Pct_gender
FROM stg_Churn
GROUP BY Gender;

-- CONTRACTS
SELECT 
	Contract,
	COUNT(Contract) AS total_count,
	COUNT(Contract) * 100/ (SELECT COUNT(*) FROM stg_Churn) AS Pct_contract
FROM stg_Churn
GROUP BY Contract;

-- CUSTOMER STATUS AND REVENUE
SELECT 
	Customer_Status,
	COUNT(Customer_Status) AS total_count,
	COUNT(Customer_Status) * 100/ (SELECT COUNT(*) FROM stg_Churn) AS Pct_customer_status,
	SUM(total_revenue) AS total_revenue,
	ROUND(SUM(total_revenue)/ (SELECT SUM(total_revenue) FROM stg_Churn)* 100, 2) AS Pct_revenue
FROM stg_Churn
GROUP BY Customer_Status;

-- CUSTOMER COMPOSITION BY STATE
SELECT 
	State,
	COUNT(State) AS total_count,
	COUNT(State) * 100/ (SELECT COUNT(*) FROM stg_Churn) AS Pct_state
FROM stg_Churn
GROUP BY State
ORDER BY Pct_state DESC;

-- CUSTOMER'S INTERNET TYPE
SELECT 
	DISTINCT Internet_Type
FROM stg_Churn
WHERE Internet_Type IS NOT NULL;