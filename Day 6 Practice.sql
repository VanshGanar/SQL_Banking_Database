CREATE DATABASE InstagramDB;

USE InstagramDB;

CREATE TABLE Users(
user_id INT auto_increment Primary Key,
username Varchar(50) NOT NULL UNIQUE,
email Varchar(100) NOT NULL UNIQUE,
first_name Varchar(50),
last_name varchar(50),
created_at TIMESTAMP DEFAULT current_timestamp
);

DESC Users;

-- 2> PROFILE TABLE 
-- One-to-One Relationship with Users

CREATE TABLE Profiles(
profile_id INT auto_increment primary key,
user_id INT unique NOT NULL,
bio VARCHAR(255),
profile_picture Varchar(255),
date_of_birth DATE,

FOREIGN KEY (user_id)
REFERENCES Users(user_id)
ON DELETE CASCADE
);

-- 3> POST TABLE
-- One user can create many Post
-- One-to-Many Relationship

CREATE TABLE Posts(
post_id INT AUTO_INCREMENT primary key,
user_id INT NOT NULL, content TEXT,
image_url Varchar(255),created_date timestamp DEFAULT current_timestamp,

FOREIGN KEY (user_id)
REFERENCES Users(user_id)
ON DELETE cascade
);

-- 4> COMMENT TABLE 
-- Weak Entity 
-- Depends on Users and Post
--

CREATE TABLE Comments(
comment_id INT auto_increment Primary Key,
user_id INT NOT NULL,
post_id INT NOT NULL,
comment_text Varchar(500),
created_date TIMESTAMP DEFAULT current_timestamp,

FOREIGN KEY (user_id)
REFERENCES Users(user_id)
ON DELETE cascade,

FOREIGN KEY (post_id)
REFERENCES Posts(post_id)
);

SHOW Tables;

-- 5> LIKES TABLE
-- Creates Many-to-Many Relationship
-- Between Users and Post

CREATE TABLE Likes(
user_id INT,
post_id INT,
like_date TIMESTAMP DEFAULT current_timestamp,

Primary Key (user_id, post_id),

FOREIGN KEY (user_id)
REFERENCES Users(user_id)
ON DELETE cascade
);

# INSERT DATA :

INSERT INTO Users(username,email,first_name,last_name) VALUES ("Official_vansh312","vansh.ganar@gmail.com","Vansh","Ganar");
INSERT INTO Users(username,email,first_name,last_name) VALUES ("rahul_01","rahul@gmail.com","Rahul","Sharma"),("priya_99","priya@gmail.com","Priya","Patil");

INSERT INTO Profiles(user_id,bio,date_of_birth) VALUES (1,"Data Science Trainer","1995-05-10"),
(2,"Software Developer","1998-08-15"),
(3,"Data Analyst","1992-12-20");

INSERT INTO Posts(user_id,content,image_url) VALUES (1,"Learning SQL Database Relationship","sql.jpg"),
(1,"Today we learned Foreign key ","foreign.jpg"),
(2,"Hello from Instagram Database!","instagram.jpg");

-- INSERT Comments 
INSERT INTO Comments(
user_id, post_id, comment_text) VALUES (2,1,"Great Explaination!"),(3,1,"Very useful topic."),
(1,3,"Welcome to the platform!");

SELECT * FROM Comments;

DESC Comments;

-- INSERT Likes 
INSERT INTO Likes(
user_id, post_id) values(2,1),(3,1),(1,3),(3,3);

SELECT * FROM Likes;


