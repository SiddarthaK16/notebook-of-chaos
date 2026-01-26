SELECT first_name , last_name , CONCAT(first_name , " " , last_name) FROM employees;  -- output is first_name last_name
SELECT now();  -- get current date and time (2026-01-26 22:51:48)
SELECT first_name , LENGTH(first_name) as len FROM employees;   -- Output: 5
SELECT ROUND(salary , 1) FROM employees; -- rounds of to , after numbers
SELECT ROUND(datediff(NOW(),hire_date)/365 , 2)  as years FROM employees; -- differences between NOW() and hire_date

