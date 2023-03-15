create database task1
use task1
CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY money,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
)
insert into Trainees values(1,'Arun','Joseph',20000,'2023/02/23','Ui/Ux Designer')
insert into Trainees values(2,'Arjun','Venkitraman',20000,'2023/02/23','.NET dev')
insert into Trainees values(3,'Divya','Prakash',20000,'2023/02/23','Backend Dev')
insert into Trainees values(4,'Dhana','Prakash',20000,'2023/02/23','AI Dev')
insert into Trainees values(5,'Harishmitha','Kathiravan',20000,'2023/02/23','Front-End Dev')
insert into Trainees values(6,'Harita','Nagarajan',20000,'2023/02/23','Data Analyst')
insert into Trainees values(7,'Hari','Karthi',20000,'2023/02/23','Ui/Ux Designer')
insert into Trainees values(8,'Karthi','Keyan',20000,'2023/02/23','Java Developer')
insert into Trainees values(9,'Harshan','H',20000,'2023/02/23','Database Admin')
insert into Trainees values(10,'Hemanth','H',20000,'2023/02/23','Ui/Ux Designer')
insert into Trainees values(11,'Ranita','Nagarajan',20000,'2023/02/23','Front-end Dev')
insert into Trainees values(12,'Sharon','David',20000,'2023/02/23','C++ Dev')
insert into Trainees values(13,'Selva','Ganapathy',20000,'2023/02/23','Back-End Dev')
insert into Trainees values(14,'Priyadarshan','Manoharan',20000,'2023/02/23','Java Developer')
insert into Trainees values(15,'Vignesh','Vicky',20000,'2023/02/23','Marketing')
insert into Trainees values(16,'Vikram','Vikram',20000,'2023/02/23','Game Developer')
insert into Trainees values(17,'Srikanth','J',20000,'2023/02/23','Gamer')
insert into Trainees values(18,'Yamini','Priya',20000,'2023/02/23','Content Writer')
insert into Trainees values(19,'Siva','Bharath',20000,'2023/02/23','Tester')
insert into Trainees values(20,'Vasanth','Vasanth',20000,'2023/02/23','Python Dev')

--updating the records(salary)
update Trainees set DEPARTMENT='Developer' where Trainee_ID=18

--1.Retrieve all FIRST_NAME STARTING WITH J-T and should differentiate between Uppercase and lowercase(non-case sensitive)
select FIRST_NAME from Trainees where FIRST_NAME like '[j-t]%' 
--Retrieve all FIRST_NAME STARTING WITH J-T and should differentiate between Uppercase and lowercase(case-sensitive)
select FIRST_NAME from Trainees where FIRST_NAME like '[J-T]%' collate SQL_LATIN1_GENERAL_CP1_CS_AS
--2. Retrieve all SALARY BETWEEN 20000 TO 50000
select * from Trainees where SALARY between 20000 and 50000
--3. Retrieve all FIRST_NAME ending with i
select * from Trainees where FIRST_NAME like '%i'
--4. Retrieve all salary without duplications
select distinct SALARY from Trainees
--5. Retrieve all records whose department is Developer and Designer
select * from Trainees where DEPARTMENT='Designer' or DEPARTMENT='Developer'
--6.Retrieve all Trainee_ID less than 5
select Trainee_ID from Trainees where Trainee_ID<5
--7. Limit the records by retrieving the 6 to 15 records
select * from Trainees order by Trainee_ID offset 5 rows fetch next 10 rows only
--8. Retrieve the top 5 records with Ties
select top 5 with ties DEPARTMENT rows  from Trainees order by Trainee_ID
--9.Retrieve the records in descending order based on department column.
select * from Trainees order by DEPARTMENT desc
--10. Retrieve all  last_name with 3rd character as 'a'
select LAST_NAME from Trainees where LAST_NAME like '__a%'