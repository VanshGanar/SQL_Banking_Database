CREATE DATABASE n325db;

-- to display database --
show databases;

-- to select the database
USE n325db;

-- Command to create Table 

CREATE TABLE IF NOT exists Employee(
Emp_id int,
Emp_name varchar(20),
Salary double,
hiring_date date
);

-- describe the table --
desc employee;
describe employee;

-- INSERT Records in Table --
INSERT INTO Employee(Emp_id,Emp_Name,hiring_date) VALUES(1,"Vansh","2026-08-27");

-- TO Display / Retrieve All Records of Column Table --
SELECT * FROM Employee;

-- To Display Records OF Specific Column From Table --
SELECT Emp_Name FROM Employee;
