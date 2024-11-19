-- 1 

SELECT first_name, surname
FROM restStaff
INNER JOIN restBill
ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.cust_name = "Tanya Singh";

-- 2

SELECT room_date
FROM restRoom_management
INNER JOIN restStaff 
ON restStaff.staff_no = restRoom_management.headwaiter
WHERE restStaff.first_name = "Charles"
AND restRoom_management.room_name = "Green"
AND restRoom_management.room_date LIKE "1602__";

-- 3

SELECT first_name, surname
FROM restStaff
WHERE headwaiter = (SELECT headwaiter
                  FROM restStaff
                  WHERE first_name = "Zoe"
                  AND surname = "Ball");

-- 4

SELECT cust_name, bill_total, restStaff.first_name, restStaff.surname
FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
ORDER BY bill_total DESC;

-- 5

SELECT first_name, surname
FROM restStaff
INNER JOIN restBill
ON restBill.waiter_no = restStaff.staff_no
WHERE bill_no = 14 
OR bill_no = 17;

-- 6

SELECT first_name, surname
FROM restStaff
INNER JOIN restRoom_management
ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.staff_no = restRoom_management.headwaiter
AND restRoom_management.room_date = 160312
AND restRoom_management.room_name = "Blue";