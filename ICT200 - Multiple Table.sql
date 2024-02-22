-- MULTIPLE TABLE

-- 1. Retrieve customer who's invoice date later than 2023-07-01 and display their customer IC, customer name, invoice number and invoice date
SELECT C.CUST_IC, CUST_NAME, INV_NO, INV_DATE
FROM CUSTOMER C, INVOICE I
WHERE C.CUST_IC = I.CUST_IC
AND INV_DATE > '2023-07-01'
ORDER BY INV_DATE DESC;

-- 2. Display the supplier inforamtion who deal with agents from eastern region
SELECT DISTINCT S.SPL_ID, SPL_TEL, SPL_ADD, SPL_PCODE, SPL_CITY, SPL_STATE
FROM SUPPLIER S, AGENT A
WHERE S.SPL_ID = A.SPL_ID
AND AGN_AREA = 'Eastern Region';

-- 3. List the names of customers, the serial numbers, category and quantities of coway they purchased
SELECT C.CUST_NAME, W.CWY_SRL_NO, CWY_CATEGORY, BUY_QTY
FROM CUSTOMER C, BUY B, COWAY W
WHERE C.CUST_IC = B.CUST_IC
AND B.CWY_SRL_NO = W.CWY_SRL_NO
AND CWY_CATEGORY IN ('Air Purifier', 'Water Purifier');

-- 4. Retrieve agent who have made sales and display their agent ID, agent names and their total sales amount sorted in ascending order.
SELECT A.AGN_ID, AGN_NAME, SUM(W.CWY_PRICE * B.BUY_QTY) AS 'TOTAL_SALES'
FROM AGENT A, INVOICE I, BUY B, COWAY W
WHERE A.AGN_ID = I.AGN_ID
AND I.CUST_IC = B.CUST_IC
AND B.CWY_SRL_NO = W.CWY_SRL_NO
GROUP BY A.AGN_ID, AGN_NAME
ORDER BY TOTAL_SALES ASC;

-- 5. Display customer IC, customer name along with their total price sorted in ascending order.
SELECT C.CUST_IC, CUST_NAME, SUM(CWY_PRICE * BUY_QTY) AS 'TOTAL_PRICE'
FROM CUSTOMER C, BUY B, COWAY W
WHERE C.CUST_IC = B.CUST_IC
AND B.CWY_SRL_NO = W.CWY_SRL_NO
GROUP BY CUST_IC, CUST_NAME
ORDER BY CUST_IC ASC;