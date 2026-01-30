SELECT department , sum(salary) AS total  
FROM employees
-- GROUP BY department,is_active having avg_salary>60000.00   -- having clause
GROUP BY department,is_active WITH rollup   -- average of all averages