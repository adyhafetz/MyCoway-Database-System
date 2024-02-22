-- SUBQUERIES

-- 1. Retrieve agent ID and agent name who have dont have any customer.
SELECT AGN_ID, AGN_NAME
FROM AGENT
WHERE AGN_ID NOT IN (SELECT AGN_ID 
					 FROM CUSTOMER);

-- 2. Retrieve customers name who have purchased the most expensive Coway.
SELECT C.CUST_NAME
FROM CUSTOMER C, BUY B, COWAY W
WHERE C.CUST_IC = B.CUST_IC
AND B.CWY_SRL_NO = W.CWY_SRL_NO
AND CWY_PRICE = (SELECT MAX(CWY_PRICE) 
				 FROM COWAY);


-- 3. Calculate and display average total price for all customers.
SELECT ROUND(AVG(TOTAL_PRICE), 2)
FROM (SELECT B.CUST_IC, SUM(CWY_PRICE * BUY_QTY) AS 'TOTAL_PRICE'
	  FROM BUY B, COWAY W
	  WHERE B.CWY_SRL_NO = W.CWY_SRL_NO
      GROUP BY B.CUST_IC) AS TOTAL;
      
-- 4. Display customers' IC number, customers' name who have the total price more than average price
SELECT C.CUST_IC, CUST_NAME, SUM(CWY_PRICE * BUY_QTY) AS 'TOTAL_PRICE'
FROM CUSTOMER C, BUY B, COWAY W
WHERE C.CUST_IC = B.CUST_IC
AND B.CWY_SRL_NO = W.CWY_SRL_NO
GROUP BY C.CUST_IC, CUST_NAME
HAVING TOTAL_PRICE > (SELECT AVG(TOTAL_PRICE)
					  FROM (SELECT B.CUST_IC, SUM(CWY_PRICE * BUY_QTY) AS 'TOTAL_PRICE'
							FROM BUY B, COWAY W
							WHERE B.CWY_SRL_NO = W.CWY_SRL_NO
							GROUP BY B.CUST_IC) AS TOTAL);