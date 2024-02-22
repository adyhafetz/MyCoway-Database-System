-- COLUMN FUNCTION

-- 1. Retrieve the total quantity of each Coway sold.
SELECT CWY_SRL_NO, SUM(BUY_QTY) AS 'TOTAL_QUANTITY'
FROM BUY
GROUP BY CWY_SRL_NO;

-- 2. Display the most and the least expensive coway price
SELECT MAX(CWY_PRICE) AS "MOST_EXPENSIVE_COWAY", MIN(CWY_PRICE) AS "LEAST_EXPENSIVE_COWAY"
FROM COWAY;

-- 3. Count how many customers have purchased each Coway
SELECT W.CWY_SRL_NO, COUNT(B.CUST_IC) AS 'CUSTOMER_COUNT'
FROM COWAY W, BUY B
WHERE W.CWY_SRL_NO = B.CWY_SRL_NO
GROUP BY W.CWY_SRL_NO;