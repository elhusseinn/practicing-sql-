create table student (
SID int primary key,
Name varchar(20) not null,
GPA float,
hours int
);

create table friend(
SID1 int references student(SID),
SID2 int references student (SID)

);

create table course(
CID int primary key,
Title varchar(50)
);

create table enrolled(
SID int references student(SID),
CID int references course(CID)
);

create table graduate(
SID int references student(SID),
GPA float,
GradDate int
);
go
create procedure addStudent @SID int, @name varchar(20),
@GPA float, @hours int
as
insert into student values(@SID, @name, @GPA, @hours);


exec addStudent 20190106, 'elhussein', 2.9 ,54
exec addStudent 20190107, 'ahmed', 3.59 ,54
exec addStudent 20190108, 'awad', 2.89 ,54
exec addStudent 20190109, 'peter', 2.0 ,54
exec addStudent 20190110, 'waheed', 3.49 ,54
exec addStudent 20190111, 'menna', 1.9 ,54
exec addStudent 20190112, 'issac', 2.89 ,54
exec addStudent 20190113, 'david', 2.93 ,54
drop procedure addStudent
select * from student

go
create procedure countStudents @count int output
as
select @count = count(*)
from student;
go
declare @count int
exec countStudents @count output
print @count 