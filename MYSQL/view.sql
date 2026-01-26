CREATE VIEW public_employees AS     -- view is like a table but not table
SELECT first_name  , department , salary ,  ROUND(datediff(NOW(),hire_date)/365 , 2)  as years FROM employees;

SELECT * FROM public_employees WHERE years>5.0;

-- Why Use Views?
-- To simplify complex queries by giving them a name.
-- To hide sensitive columns from users.
-- To show only specific rows/columns from a table.
-- To reuse common query logic across your app or reports.

DROP VIEW public_employees;

-- Notes
-- Views don’t store data. If the underlying table changes, the view reflects that automatically.
-- Not all views are updatable. Simple views usually are (like those selecting from one table without grouping or joins), but complex ones may not allow INSERT, UPDATE, or DELETE.
-- Views can make your queries cleaner and easier to maintain.