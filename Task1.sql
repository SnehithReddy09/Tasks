create database college;
use college;

/*Mentor table*/
create table mentor(mentor_id INTEGER,mentor_name varchar(20));
insert into mentor values(101,'a'),(102,'b'),(103,'c'),(104,'d'),(105,'e');
alter table mentor ADD constraint primary key(mentor_id);

/*Users table*/
create table users(user_id INTEGER,user_name varchar(20),mentor_id INTEGER,Foreign key(mentor_id) references mentor(mentor_id));
insert into users values(1,'ab',101),(2,'bc',101),(3,'cd',105),(4,'de',104),(5,'ef',102);

/*Courses table*/
create table courses(course_id INTEGER primary key,course_name varchar(20));
insert into courses values(12,'java'),(13,'dbms'),(14,'c++'),(15,'sql'),(16,'python');
alter table users ADD constraint primary key(user_id);

/*student_activated_courses table*/
create table student_activated_courses(course_id INTEGER,user_id INTEGER,  Foreign key(course_id) references courses(course_id),Foreign Key(user_id) references users(user_id));
insert into student_activated_courses values(12,1),(12,2),(12,5),(15,2),(14,4),(16,3),(13,4);

/*company_drives table*/
create table company_drives(user_id INTEGER, Foreign key(user_id) references users(user_id), company_name varchar(20));
insert into company_drives values(1,'chubb'),(1,'tcs'),(1,'dxc'),(2,'amazon'),(4,'wipro'),(4,'tcs'),(5,'chubb'),(3,'chubb'),(3,'tcs');

/*topics table*/
create table topics(topic_name varchar(20) primary key,total_questions INTEGER);
insert into topics values('Numbers',500),('Company',145),('Basic',246),('DP',14),('Strings',200);

/*attendance table*/
create table attendance(user_id INTEGER,Foreign key(user_id) references users(user_id),attendance_percentage INTEGER);
insert into attendance values(1,99),(2,79),(3,69),(4,87),(5,60);

/*tasks table*/
create table tasks(user_id INTEGER, foreign key(user_id) references users(user_id),topic_name varchar(20),foreign key(topic_name) references topics(topic_name),total_task_completed INTEGER);
insert into tasks values(1,'Numbers',50),(1,'Basic',22),(2,'DP',9),(3,'Strings',99),(4,'Strings',22),(4,'Basic',60),(5,'Numbers',22);
SELECT * from tasks;

/*codekata table*/
create table codekata(user_id INTEGER, foreign key(user_id) references users(user_id),topic_name varchar(20), foreign key(topic_name) references topics(topic_name),programme_name varchar(20));
insert into codekata values(1,'Basic','sumof nos'),(1,'Basic','addition'),(2,'Numbers','Factorial'),(2,'Numbers','GCD'),(2,'Strings','Concat'),(3,'Numbers','Multiply'),(3,'Company','Inheritance'),(3,'Company','Override'),(4,'Numbers','Division'),(4,'Numbers','digit sum'),(5,'DP','Longest subsequence');
select * from codekata;

/*queries*/

select topic_name,count(*) from codekata where topic_name='Numbers' Group by(topic_name);
select user_id,count(*) as Companies_attended from company_drives Group By(user_id);
select a.user_id,b.course_name from student_activated_courses as a JOIN courses as b ON a.course_id=b.course_id;
select mentor_name from mentor;
select a.mentor_name,count(*) as Assigned_total from mentor as a JOIN users as b ON a.mentor_id=b.mentor_id group by(a.mentor_name) order by(a.mentor_id);
