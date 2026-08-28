CREATE DATABASE BANKINGDB;
USE BANKINGDB;

CREATE TABLE Customers
(
CustomersID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(20)
);
desc Customers;

-- To Add New Column 'Account Creation Date' --> DATE --

ALTER TABLE Customers
Add AccountCreationDate DATE;

INSERT INTO Customers(CustomersID,FirstName,LastName,Email,Phone,AccountCreationDate) VALUES (101,"Vansh","Ganar","vanshh.ganar@email.com",9309144203,"2026-03-11");

-- to retrive data from table 
SELECT * FROM Customers;

SELECT FirstName,Email,AccountCreationDate
FROM Customers;

