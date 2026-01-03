SELECT name , grade FROM student;

-- WHERE CLAUSE

-- SELECT * FROM student WHERE grade="10th" ; 
-- SELECT * FROM student WHERE age>=18 OR grade="10th";
-- SELECT * FROM student WHERE name LIKE "A%" ;  --  like checks name starting with a here and if we use %a we get names ending with a
-- SELECT * FROM student WHERE date_of_birth IS NOT NULL ;

SELECT * FROM student ORDER BY age DESC LIMIT 5;  -- it orders by asc or des and limit lets us control how many we want