USE schooldb;
SELECT * FROM student;
DELETE FROM student WHERE date_of_birth IS NULL;
SELECT * FROM student;
DELETE FROM student WHERE id=3;
DELETE FROM student;
DROP TABLE student;
SELECT * FROM student;