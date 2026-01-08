SELECT current_date(); -- YYYY-MM-DD
SELECT current_time();  -- HH/MIN/SEC
SELECT current_timestamp();  -- both date and time
SELECT now(); -- Same as timestamp()
SELECT LOCALTIME;
SELECT LOCALTIMESTAMP;  -- same as now , shows time and date of server location not clients

ALTER TABLE student
ADD COLUMN date_joined DATETIME DEFAULT CURRENT_TIMESTAMP;

SELECT * FROM student;
INSERT INTO student (id,age,date_joined)
VALUES (16,19,NOW());

-- Best Practices
-- Use CURRENT_TIMESTAMP for record timestamps.
-- Use NOW() in queries to filter records by current time.
-- Avoid relying on system time for business logic; prefer database time for consistency.
-- Previous Lesson

