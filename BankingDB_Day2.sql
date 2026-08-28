-- LAB 2 --

USE BANKINGDB;

CREATE TABLE Customers
(
CustomersID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(20)
);

-- Add New Column in Table
ALTER TABLE Customers
Add AccountCreationDate DATE;

-- Drop Table Customers
DROP TABLE Customers;

CREATE TABLE Accounts(
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

CREATE TABLE Transactions(
TransactionID INT,
TransactionDate DATE,
Amount DECIMAL(10,2),
TransactionType VARCHAR(20)
);

CREATE TABLE Branches(
BranchID INT,
BranchName VARCHAR(100),
BranchAddress VARCHAR(200),
BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches(
AssignmentDate date

);

CREATE TABLE Loans(
LoanID INT,
LoanAmount DECIMAL(10,2),
IntrestRate DECIMAL(5,2),
StartDate DATE,
EndDate date
);

-- Structuring of Table
desc Accounts;

SHOW Tables;

# MODIFY THE TABLE STRUCTURE BY USING ALTER COMMAND
/* 
1> Add New Colimns 
2> Modify Existing Columns
3> Rename Columns
4> Add Constraints
5> Remove Constraints
*/

-- Change DataType Of Existing Column --
AlTER TABLE Customers MODIFY Phone INT;

DESC Customers;

ALTER TABLE Customers ADD COLUMN Balance bigint;

--  Add Minimum Balance Constraints --
ALTER TABLE Customers
ADD constraint Chk_MinBalance
CHECK(Balance>=5000);

-- DROP "AccountBranches" TABLE --
-- Syntax: DROP TABLE <Table_Name>; --
DROP TABLE AccountBranches;

Desc Customers;

-- Add Primary Key Constraints To "CustomerID" in Customer Table --

ALTER TABLE Customers
ADD primary key(CustomersID);

-- Add unique Constraints to "Phone" of Customers Table --
Alter TABLE Customers
ADD unique(Phone);

