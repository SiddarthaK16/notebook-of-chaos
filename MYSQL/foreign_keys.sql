
CREATE DATABASE school;


USE school;


CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,  
    class_name VARCHAR(50) NOT NULL           
);

-- Create a table to store student details
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,  
    student_name VARCHAR(100) NOT NULL,
    class_id INT,                                

    -- Foreign key constraint linking students.class_id to classes.class_id
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
        ON UPDATE CASCADE    -- If class_id in 'classes' changes, update it here automatically
        ON DELETE SET NULL   -- If a class is deleted, set class_id in students to NULL
);


INSERT INTO classes (class_name) 
VALUES 
('Mathematics'),
('Science'),
('History');


INSERT INTO students (student_name, class_id) 
VALUES 
('Alice', 1),  
('Bob', 2),     
('Charlie', 1);  

SELECT * FROM students;


SELECT * FROM classes;

-- Delete the class with class_id = 2 (Science)
-- Due to ON DELETE SET NULL, Bob's class_id will become NULL
DELETE FROM classes WHERE class_id = 2;

SHOW CREATE TABLE students;  -- shows foreign keys in table


-- Alternatives
-- ON DELETE CASCADE: Deletes the child rows when the parent row is deleted.
-- ON DELETE RESTRICT: Prevents deletion if any child rows exist.
-- ON DELETE NO ACTION: Same as RESTRICT in MySQL.
-- ON DELETE SET DEFAULT: Not supported in MySQL (but available in some other DBMSs).