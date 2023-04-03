create database task15
use task15

--table creation
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

--1. Auto-commit and Auto-rollback transactions.
insert into students values(1022,'Krishna','MCA',2019)

--auto roll back
insert into students values(1022,'Krishna','MCA',2019)

--primary key violated so rolledback


--2. Implicit transactions
set implicit_transactions on
update students set sname='Shrikanth' where sid=1001
select @@TRANCOUNT AS OpenTransactions 
--before committing the trancount is 1,after committing its 0
commit tran
update students set sname='Dharshan' where sid=1002
commit tran
select @@TRANCOUNT AS OpenTransactions 
set implicit_transactions off

--checking whether the implicit mode is on or not
select iif(@@options & 2=2,
'Implicit transactions on',
'Implicit Transactions is OFF') 
as implicit_transaction_chk

--3. Explicit transactions
--a. Only Commit - insert statement
begin tran
insert into students values(1023,'Saradha','MCA',2019)
commit tran
select * from students 

--b. Only Rollback - update statement
begin tran
update students set sname='srikanth' where sid=1001
rollback tran

--c. Savepoint - commit update and insert statements, rollback delete statement
begin tran
--inserting the value
update students set sname='kishu' where sid=1029
select * from students

--updating the same value
insert into students values(1030,'Madhav','MCA',2019)
commit tran
select * from students

--setting the savepoint 
save transaction insert1
delete from students where sid=1030


select * from students
rollback tran insert1
select * from students


