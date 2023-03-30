create database task13
use task13

--creating department
create table department(dept_name varchar(25) primary key,
building varchar(20),
budget numeric(18,2))

--create course 
create table course(class_id varchar(7) primary key,
name varchar(25),
dept_name varchar(25) references department(dept_name),
credits numeric(5),
description varchar(8000)
)

--creating requisite
create table requisite(class_id varchar(7) references course(class_id),
req_id int,
type varchar(4))

--creating time slot
create table time_slot(time_slot_id int primary key,
days varchar(8),
start_time datetime,
end_time datetime)

--creating section
create table section(class_id varchar(7) references course(class_id),
class_num int primary key,
semester varchar(7),
years int,
room_no varchar(6),
time_slot_id int references time_slot(time_slot_id),
capacity int
)

--creating teaches
create table teaches(user_id int references users(user_id) ,
class_id varchar(7) references course(class_id) ,
class_num int references section(class_num),
semester varchar(7),
years int
)


--creating takes
create table takes(user_id int references users(user_id),
class_id varchar(7) references course(class_id),
class_num  int references section(class_num),
semester varchar(7),
year int,
grade varchar(2))



--creating user
create table users(user_id int primary key,
username varchar(16) ,
password varchar(40))

--creating user_number
create table user_number(user_id int references users(user_id),
number numeric(15,10),
description varchar(15)
)

--creating user_address
create table user_address(user_id int references users(user_id),
address varchar(80),
apt_num varchar(15),
city varchar(25),
state varchar(2),
zip numeric(5,0),
description varchar(15))

--creating user salary
create table user_salary(user_id int references users(user_id),salary numeric(18,2))

--creating user_balance
create table user_balance(user_id int references users(user_id))

--creating user_email
create table user_email(user_id int references users,
email varchar(50) primary key,
description varchar(15))


--role table
create table role(role_id int primary key,
role_name varchar(3),
role_full_name varchar(15))


--user_role
create table user_role (user_id int ,
role_id int references role(role_id) )
 




--creating finaid_main
create table finaid_main (aid_id int primary key,
name varchar(50) ,
category varchar(15))

 --user_finaid_map 

 create table user_finaid_map (user_id  int references users(user_id),
 aid_id int references finaid_main(aid_id),
 semester varchar(7),
 years int,
 offered numeric(18,2),
 accepted numeric(18,2))



--creating hold_main
create table hold_main(user_id int ,
hold_id int primary key not null ,
name varchar(25) unique not null,
description varchar(15),
)

--creating user_hold_map
create table user_hold_map(user_id int references users(user_id),
hold_id int ,
constraint fk_holdid foreign key(hold_id) references hold_main(hold_id)
 )