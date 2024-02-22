-- SIMPLE QUERY

-- 1. Display customers' information who stayed in Selangor or managed by agent with agent ID of 20216354
SELECT CUST_IC, CUST_NAME, CUST_TEL, CUST_ADD, CUST_PCODE, CUST_CITY, CUST_STATE
FROM CUSTOMER
WHERE CUST_STATE = 'Selangor' 
OR AGN_ID = 20216354
ORDER BY AGN_ID ASC;

-- 2. Retrieve invoice with supplier ID of 1003. the invoice number, invoice date and supplier ID.
SELECT INV_NO, INV_DATE, SPL_ID
FROM INVOICE
WHERE SPL_ID = 1003;

-- 3. Display information of customers who have start letter 'A' in their name.
SELECT CUST_IC, CUST_NAME, CUST_TEL, CUST_ADD, CUST_PCODE, CUST_CITY, CUST_STATE
FROM CUSTOMER
WHERE CUST_NAME LIKE 'A%';

-- 4.  Shows all the invoice's information which are supplier ID is not 1003 and 1004;
SELECT INV_NO,CUST_IC,AGN_ID,SPL_ID,INV_DATE
FROM INVOICE
WHERE SPL_ID <> 1003 AND SPL_ID <> 1004;

-- 5. Display the category of Coway
SELECT DISTINCT(CWY_CATEGORY)
FROM COWAY;