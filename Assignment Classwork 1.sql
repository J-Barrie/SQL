--Write a statement that creates a database called 'World'
Create database World

--In the database created above, create a table countries with the following columns: 
--countryID, countryName, CountryCapital and regionID. Ensure the countryID 
Create table Countries(
				countryID int unique,
				countryName nvarchar(250),
				CountryCapital nvarchar(250),
				regionID int)

--Write an SQL statement to check that the above table has been created.
Select * from Countries

--Insert 7 rows into the countries table.
insert into Countries
			VALUES (1, 'France', 'Paris', 1)
insert into Countries
			VALUES (2, 'Spain', 'Madrid', 1)
insert into Countries
			VALUES (3, 'Germany', 'Berlin', 1)
insert into Countries
			VALUES (4, 'Portugal', 'Lisbon', 1)
insert into Countries
			VALUES (5, 'Italy', 'Rome', 1)
insert into Countries
			VALUES (6, 'Netherlands', 'Amsterdam', 1)
insert into Countries
			VALUES (7, 'Belgium', 'Brussels', 1)

--Write an SQL query to select the first 3 columns in the countries table,
--and order their values by countryName in ascending order.
Select top 3 * from Countries order by countryName

-- Write an SQL query to add column GDP to countries table
alter table countries
add GDP money

--Create a database for an imaginary social media platform called Flexa. 
--Include a query in your SQL statement to check that the database does not already exist.
IF DB_ID('Flexa') IS NOT NULL
   print 'db exists'
   else Create Database Flexa

--Using the database created in 5 above, create a table Flexa_user with the following columns:
--user_id, username, encrypted_password, email, and date_joined. Ensure the user_id colum is made the primary key. 

Create table Flexa_user(
			user_idenity int PRIMARY KEY,
			username nvarchar(50),
			encrypted_password nvarchar(50),
			email nvarchar(250),
			date_joined date)

--Check the table was created

select * from Flexa_user

--Add 3 new columns to the Flexa_user table.
--Select all the tables in the Flexa_user table and order the values by username in descending order.

alter table Flexa_user
add gender text

alter table Flexa_user
add DOB date

alter table Flexa_user
add colour varchar

select * from Flexa_user order by username DESC

--Change the data type of the username column in the Flexa_user table. 
--Note: If you used VARCHAR when creating the table, change the data type to CHAR, and vice-versa.
ALTER TABLE Flexa_user
ALTER COLUMN username nchar(50);

ALTER TABLE Flexa_user
ALTER COLUMN encrypted_password nchar(50);

ALTER TABLE Flexa_user
ALTER COLUMN email nchar(250);

--Create a table in the Flexa database and call it post. It should contain the following columns:
--post_id, user_id, post text, and posted_on. Make post_id column the primary key. 
--Note: posted_on column is a date column. This is the date a user creates a post.
Create table post(
			post_id int primary key,
			user_identity int,
			post_text varchar(max),
			posted_on date)

Select * from post

--In the Flexa database, create a table with the name follower. It should contain the following columns:
--user_id, follower_id. follower_id column should be made the primary key.
--Delete the follower table from the Flexa database.

Create table follower(
				user_identity int,
				follower_id int primary key)

Select * from follower

DROP TABLE follower