CREATE DATABASE Google;
use Google;

CREATE TABLE Boys(
Boy_ID int UNIQUE,
FirstName Varchar(200) Primary key,
LastName Varchar(200) NOT NULL,
City Varchar(100),
Phone Bigint
);

DROP TABLE Boys;
desc Boys;

ALTER TABLE Boys Modify Column LastName Varchar(200) Not null;

ALTER TABLE Boys Add column Age int;

INSERT INTO Boys VALUES (101,"Vansh","Ganar","Nagpur",9309144203,20);

ALTER TABLE Boys Add Constraint Check(Age>18);
INSERT INTO Boys VALUES (102,"Vaibhav","Ganar","Wardha",9226782341,21);