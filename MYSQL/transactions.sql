

-- A transaction is a sequence of one or more SQL statements that are executed as a single unit. A transaction has four key properties, known as ACID:

-- Atomicity: All or nothing.
-- Consistency: Valid state before and after.
-- Isolation: Transactions do not interfere.
-- Durability: Changes persist after commit.

-- SET autocommit=0;

-- START TRANSACTION;

-- UPDATE student SET age = age+1 WHERE id=15;
-- UPDATE student SET age=age+5 WHERE id=105;

-- ROLLBACK;

SELECT * FROM student; 

-- Best Practices
-- Always use transactions when performing multiple related operations.
-- Disable autocommit when working with critical data updates.
-- Rollback if any step in your transaction fails.
-- Test your transactions thoroughly before running them on production data.

SET autocommit=1;
