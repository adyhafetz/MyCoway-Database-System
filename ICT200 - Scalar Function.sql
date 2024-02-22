-- SCALAR FUNCTION

-- 1. Coway manufactured from supplier who has supplier ID 1001 will receive discount 5%. Display the Coway serial number, coway category, old price alongside with the new price
SELECT CWY_SRL_NO, CWY_CATEGORY, CWY_PRICE AS 'OLD_CWY_PRICE', ROUND(CWY_PRICE - (CWY_PRICE*0.05), 2) AS 'NEW_CWY_PRICE'
FROM COWAY
WHERE SPL_ID = 1001;

-- 2. Invoice will expire in two years after it is issued. Display the invoice number, the date issued and the expected expiry date for every invoice.
SELECT INV_NO, INV_DATE,ADDDATE(INV_DATE,INTERVAL 2 YEAR) AS "EXPIRY_DATE"
FROM INVOICE;

-- 3. Display the birth day, birth month and birth year for each customer based on their IC number
SELECT CUST_IC, SUBSTR(CUST_IC, 5,2) AS 'BIRTH_DAY', SUBSTR(CUST_IC, 3,2) AS 'BIRTH_MONTH', SUBSTR(CUST_IC, 1,2) AS 'BIRTH_YEAR'
FROM CUSTOMER;

-- 4. Display customers' information with their full address.
SELECT CUST_IC, CUST_NAME, CUST_TEL, CONCAT(CUST_ADD, ', ', CUST_PCODE, ', ', CUST_CITY, ', ', CUST_STATE) AS 'FULL_ADDRESS'
FROM CUSTOMER;

-- 5. Display invoice number and invoice date where the invoice is issued in 2020
SELECT INV_NO, INV_DATE
FROM INVOICE
WHERE YEAR(INV_DATE) = '2020';

