-- Why Use Stored Procedures?
-- To avoid repeating the same SQL logic in multiple places
-- To improve performance by reducing network traffic
-- To encapsulate complex business logic inside the database



DELIMITER //
CREATE PROCEDURE get_employee_by_id(IN emp_id INT)
BEGIN
     SELECT * FROM employees where employee_id=emp_id;
     SELECT first_name FROM employees ; 
END  //

DELIMITER ;

CALL get_employee_by_id (3);

DROP PROCEDURE IF EXISTS get_emp_by_id;