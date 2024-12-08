CREATE VIEW samsBills
AS SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restBill
INNER JOIN restStaff
ON restStaff.staff_no = restBill.waiter_no
WHERE first_name = 'Sam'
AND surname = 'Pitt';

SELECT *
FROM samsBills
WHERE bill_total > 400;

CREATE VIEW roomTotals (room_name, total_sum)
AS SELECT room_name SUM(bill_total)

DROP VIEW SamsBills;
DROP VIEW roomTotals;