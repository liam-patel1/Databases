-- 1

SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = "Bob Crow";

-- 2

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE "% Smith"
ORDER BY cust_name DESC;

-- 3

SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% C%';


-- 4

SELECT DISTINCT headwaiters.first_name, headwaiters.surname
FROM restStaff
INNER JOIN restStaff headwaiters
ON headwaiters.staff_no = restStaff.headwaiter
WHERE headwaiters.staff_no = restStaff.headwaiter;

-- 5

SELECT *
FROM restBill
WHERE bill_date LIKE "1602__";

-- 6

SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date LIKE "15____"
ORDER BY bill_date ASC;