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
select dept, yearofcompletion, stu_count from (
select dept, [2019],[2020],[2021],[2022] from 
(select sid,dept,yearofcompletion from Students)
as Table2
pivot (count(sid) for [yearofcompletion] in ([2019],[2020],[2021],[2022]))
as PTable2)P2
unpivot
(
stu_count for [yearofcompletion] in ([2019],[2020],[2021],[2022])) 
as UTable2


--2.Library management DB
create database library

use library

--librarian table
create table librarian(lib_id int primary key,lib_name varchar(20))

--authors table
create table authors
(authorid int primary key,
authorname varchar(20) unique not null)

--publications table
create table publications
(pid int primary key,
pname varchar(25) unique not null)

--sections(category table)
create table sections
(sectionid int primary key,
sname varchar(15) not null)

--books table
create table books(bookid varchar(5) primary key,
bookname varchar(15) unique not null,
authorid int references authors(authorid) on update cascade not null,
publicationsid int references publications(pid) on update cascade not null ,
edition varchar(10) not null,
sectionid int references sections(sectionid) on update cascade not null)

--for the students
create table student(student_id varchar(6) primary key,
student_name varchar(20)not null,
dept varchar(20)not null)


--lib_activities table
create table lib_activities 
(
activity_id int primary key identity(1,1) ,
student_id varchar(6) references student(student_id) on delete cascade,
librarian_id int references librarian(lib_id) on delete set null on update cascade,
book_id varchar(5) references books(bookid) on delete cascade on update cascade,
bought_date datetime not null,
due_date date not null,
submitted_date date,
fine smallmoney,
)