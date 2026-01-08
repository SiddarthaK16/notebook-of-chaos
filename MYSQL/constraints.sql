CREATE TABLE accounts (
    id INT,
    balance DECIMAL(10,2) CONSTRAINT negBal_chk CHECK (balance >= 0)
);

INSERT INTO accounts VALUES(5,-76);

SELECT VERSION()