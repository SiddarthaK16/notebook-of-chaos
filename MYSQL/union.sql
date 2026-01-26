SELECT email ,address FROM emp_personal
UNION
SELECT first_name , last_name FROM employees;

-- When UNION Works
-- Same number of columns in all SELECT statements.
-- Compatible data types in corresponding columns.
-- Columns will be matched by position, not by name.

-- Use UNION if:

-- You want a clean list without duplicates.
-- Use UNION ALL if:

-- You want performance and don’t care about duplicates.
-- Or you expect duplicate values and want to preserve them.