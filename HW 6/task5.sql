-- 1

SELECT first_name, surname, bill_date, COUNT(bill_no)
FROM restBill
INNER JOIN restStaff
ON restBill.waiter_no = restStaff.staff_no
GROUP BY waiter_no, bill_date
HAVING COUNT(bill_no) > 1;

-- 2

SELECT room_name, COUNT(no_of_seats)
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3

SELECT room_name, SUM(bill_total)
FROM restBill
INNER JOIN restRest_table
ON restBill.table_no = restRest_table.table_no
GROUP BY room_name;

-- 4

SELECT head.first_name, head.surname, SUM(bill_total)
FROM restBill
INNER JOIN restStaff waiter
ON waiter.staff_no = restBill.waiter_no
INNER JOIN restStaff head
ON head.staff_no = waiter.headwaiter
GROUP BY head.staff_no
ORDER BY SUM(bill_total) DESC;

-- 5

SELECT cust_name, AVG(bill_total)
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6

SELECT first_name, surname, COUNT(bill_no)
FROM restBill
INNER JOIN restStaff
ON restBill.waiter_no = restStaff.staff_no
GROUP BY waiter_no, bill_date
HAVING COUNT(bill_no) > 2;