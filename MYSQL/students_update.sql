
-- UPDATE student SET grade="X" WHERE grade="10th";
 -- SELECT * FROM student; 
--  UPDATE student SET age=18;
-- UPDATE student
-- SET age = 17, grade = '10th'
-- WHERE id = 3;
UPDATE student
SET age = age + 1
WHERE age < 18;