create database task11
use task11
create table students(sid int primary key,sname varchar(25),dept varchar(10),yearofcompletion int)
insert into students values
(1001,'Srikanth','BBA',2023),
(1002,'Darshan','BCA',2023),
(1003,'Dhana','BBA',2022),
(1004,'Selva','BCA',2020),
(1005,'Arun','MCA',2019),
(1006,'Raja','MCOM',2018),
(1007,'Ramesh','BCA',2021),
(1008,'Suresh','BCA',2022),
(1009,'Sukran','BBA',2021),
(1010,'Ragavi','BBA',2023),
(1011,'Ranga','BCA',2021),
(1012,'Dhina','BBA',2023),
(1013,'Sara','BBA',2023),
(1014,'Caesar','BBA',2023),
(1015,'Cindy','BCA',2023),
(1016,'Umesh','MCA',2023),
(1017,'Thilaga','MCOM',2023),
(1018,'Emily','MCA',2021),
(1019,'Johny','MCOM',2024),
(1020,'Kishan','MCA',2021)

--1. Show the working of PIVOT and UNPIVOT by creating a table students(sid,sname,department,yearofcompletion) with 20 recordsNote: Simplify the table to show the number of students in each department and categorize them based on yearofcompletion
select yearofcompletion,BBA,BCA,MCOM,MCA,MBA from
(select sid,dept,yearofcompletion from students) as table1
pivot(
count(sid) for dept in(BBA,BCA,MCOM,MCA,MBA)
) as table2

--2.Library management DB
create database library

create table librarian(lib_id int primary key,lib_name varchar(20))

create table books(bookid varchar(5) primary key,bookname varchar(15) unique,authorid int,publicationsid varchar(20) ,edition varchar(10),sectionid int)

create table authors(authorid int primary key,authorname varchar(20))

create table publications(pid int, pname varchar(25))

create table sections(sectionid int primary key,sname varchar(15))