-- 1

SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = "Bob Crow";

-- 2

SELECT DISTINCT cust_name
FROM restBill;

-- 3

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% C%';

-- 4

SELECT head

