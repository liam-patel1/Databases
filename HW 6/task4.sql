-- 1

SELECT cust_name
FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.bill_total > 450
AND headwaiter = (SELECT staff_no FROM restStaff WHERE first_name = "Charles");

-- 2

SELECT first_name, surname
FROM restStaff
WHERE staff_no = (SELECT headwaiter
                  FROM restStaff
                  INNER JOIN restBill
                  ON restBill.waiter_no = restStaff.staff_no
                  WHERE bill_date = "160111" 
                  AND cust_name LIKE "Nerida %");

-- 3

SELECT MIN(cust_name)
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4

SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (SELECT waiter_no
                       FROM restBill);

-- 5

SELECT cust_name, first_name, surname, restRest_table.room_name
FROM restBill
INNER JOIN restRest_table
ON restBill.table_no = restRest_table.table_no
INNER JOIN restRoom_management
ON restRoom_management.room_name = restRest_table.room_name
INNER JOIN restStaff
ON restStaff.staff_no = restRoom_management.headwaiter
WHERE bill_total = (SELECT MAX(bill_total) FROM restBill)
AND restBill.bill_date = restRoom_management.room_date;