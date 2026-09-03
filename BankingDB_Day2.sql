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

DROP TABLE Customers;

DESC Customers;

ALTER TABLE Customers DROP Column AccountCreationDate, DROP Column Balance;

ALTER TABLE Customers Add column Date_Of_Birth Date;


INSERT INTO Customers
(CustomersID, FirstName, LastName, Email, Phone, Date_Of_Birth)
VALUES
(101, 'rohit', 'sharma', 'rohit@gmail.com', '9854103256', '1999-08-10');

-- UPDATE Phone COLUMN IN CUSTOMERS TABLE
-- UPDATE Phone Column in Customers Table

-- set SQL_SAFE_UPDATES =0; THIS Query is use to update data with codes 
UPDATE Customers SET Phone=9309144203 WHERE CUstomersID=101;

UPDATE Customers set Email="rahul_sharma@gmail.com" Where CustomersID=101;

SELECT * FROM Customers;

DESC Customers;

SHOW Table Status;


-- Add New Column in Table
-- ALTER TABLE Customers
-- Add AccountCreationDate DATE;



-- Drop Table Customers
DROP TABLE Customers;

-- INSERT RECORDS IN Accounts Table 
INSERT INTO Accounts Values(201,"Savings",25000.00,101);

CREATE TABLE Accounts(
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

ALTER TABLE Accounts Add Column CustomersID INT;

DROP TABLE Accounts;

SELECT * FROM Accounts;

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

SHOW Tables;

SELECT * FROM Customers;

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
ALTER TABLE Accounts
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

-- Constraints in sql 
-- DATE : 31 aug 2026
-- 1> NOT NULL  : NULL Value or blank values are not allowed 

CREATE TABLE Persons(
ID int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255) NOT NULL,
age int
);

DROP TABLE Persons;

DESC Persons;

-- ADD Null Constraints To 'AGE' Column --

ALTER TABLE Persons 
Modify column age int not null ;
INSERT INTO Persons VALUES(1,"Ganar","Vansh",20);

SELECT FirstName,LastName,
Concat(FirstName," ",LastName) 
as "Employee Name"  FROM Persons;

ALTER TABLE Persons
ADD Column Email Varchar(200);

ALTER TABLE Persons 
MODIFY Email Varchar(200) UNIQUE;

INSERT INTO Persons VALUES(2,"Saxena","Rajeev",23,"rajeev_sasena@gmail.com"),
(3,"Kapoor","jay",26,"kapoor_jay@gmail.com"),
(4,"Ganatra","Bhavin",23,"ganatra_bhavin12@gmail.com");

SELECT * FROM Persons;

ALTER TABLE Persons modify column ID int Primary key;

desc Persons;

-- CHECK() constraints on 'age' column --

ALTER TABLE Persons add constraint Persons_chk check(age>18);

SELECT * FROM Persons;

INSERT INTO Persons VALUES(5,'Gandhi','Rahul',55,'gandhi_rahul154@gmail.com');

# Error Code: 3819. Check constraint 'Persons_chk' is violated.	0.000 sec
INSERT INTO Persons VALUES(6,'Gandhi','Rahul',14,'gandhi_rahul154@gmail.com');

# DATE : 01-SEP-2026
-- Default Constraint in SQL --
-- DEFAULT :  Assigns a default value to a column if no value is provided.
-- When No Value is Specified during an INSERT Operation --

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATE DEFAULT (CURRENT_DATE),
    City VARCHAR(50)
);

DROP TABLE Employee;
ALTER TABLE Employee Modify Column JoiningDate DATE DEFAULT "2026/09/01";
INSERT INTO Employee VALUES (101,"Vansh","Computer",8000,"2026/09/01","Nagpur");

DESC Employee;

SELECT * FROM Employee;

ALTER TABLE Employee modify column Salary DECIMAL DEFAULT 20000;

INSERT INTO Employee(EmployeeID,EmployeeName,Department,JoiningDate,City) VALUES (102,"RAJ","IT","2026/09/01","pune");
SELECT * FROM Employee;

INSERT INTO Employee(EmployeeID,EmployeeName,Department,Salary,City) VALUES (3,"Priya Patil","HR",45000,"Pune"),
(4,"Amit Kumar","Finance",60000,"Delhi"),
(5,"Sneha Joshi","IT",55000,"Nagpur"),
(6,"Rohan Verma","Marketing",48000,"Mumbai");

ALTER TABLE Employee ALTER City SET DEFAULT "Nagpur";

desc Employee;

INSERT INTO Employee(EmployeeID,EmployeeName,Department,Salary) VALUES (7,"Neha Sing","Digital Marketing",52000);

SELECT * FROM Employee;


-- DELETE THE entire row with specific condition of "EmployeeID" is 7 of table 
-- DELETE FROM Employee where EmployeeID=7;

DELETE FROM Employee WHERE EmployeeID=102;

# FORIGIN KEY 
-- A Forigin Key is Used To Create a RelationShip Between Two Table --
-- IT Ensure That a Value in one Table must exist in another table --

# PARENT TABLE
CREATE TABLE Department(
DepartmentID INT Primary Key,
DepartmentName Varchar(50)
);

INSERT INTO Department(DepartmentID,DepartmentName) VALUES (101,"IT"),(102,"HR"),(103,"Finance");

SELECT * FROM Department;

# CREATING NOW CHIlD Table 

CREATE TABLE Employee_Child(
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(100),
DepartmentID INT,

FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID)
);

# CREATE TABLE Manager (ManagerID) VARCHAR(200) PRIMARY KEY, ManagerName Varchar(100) NOT NULL, FORIGIN KEY (ManagerID) REFERENCE Manager (ManagerID) );

CREATE TABLE Manager(
ManagerID Varchar(200) Primary Key,
ManagerName Varchar(100) NOT NULL 
);

DROP TABLE Employee_Child;

CREATE TABLE Employee_Child(
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(100),
DepartmentID INT,
ManagerID Varchar(100),

FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID),

FOREIGN KEY (ManagerID)
REFERENCES Manager(ManagerID)
);

SHOW TABLES;

DESC Employee_Child;

