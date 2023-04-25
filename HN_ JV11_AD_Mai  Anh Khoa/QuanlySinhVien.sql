-- ========================  ĐÁNH GIÁ CHẤT LƯỢNG KIẾN THỨC THỰC HÀNH CƠ BẢN MODULE 04 –MYSQL– HACKATHON 01-JV11 ========================

-- ========================== CREATE DATABASE ==========================
create database `Test2`;
use `Test2`;

-- ========================== CREATE TABLE ==========================
create table Subjects (
SubjectID int(4) primary key, 
SubjectName nvarchar(50)
);

create table Classes (
ClassID int(4) primary key,
ClassName nvarchar(50)
);

create table Students (
StudentID int(4) primary key,
StudentName nvarchar(50),
Age int (4),
Email nvarchar(100) 
);

create table ClassStudent (
StudentID int(4),
ClassID int(4),
foreign key (StudentID) references Students(StudentID),
foreign key (ClassID) references Classes(ClassID)
);

create table Marks (
Mark int,
SubjectID int,
StudentID int,
foreign key (SubjectID) references Subjects(SubjectID),
foreign key (StudentID) references Students(StudentID)
);

-- ========================== INSERT INTO TABLE ==========================
insert into Students values 
(1, "Nguyen Quang An", 18, "an@yahoo.com"),
(2, "Nguyen Cong Vinh", 20, "vinh@gmail.com"),
(3, "Nguyen Van Quyen", 19, "quyen"),
(4, "Pham Thanh Binh", 25, "binh@com"),
(5, "Nguyen Van Tai Em", 30, "taiem@sport.vn");

insert into Classes values 
(1, "C0706L"),
(2, "C0708G");

insert into ClassStudent values 
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 2);

insert into Subjects values 
(1, "SQL"),
(2, "Java"),
(3, "C"),
(4, "Visual Basic");


insert into Marks values 
(8, 1, 1),
(4, 2, 1),
(9, 1, 1),
(7, 1, 3),
(3, 1, 4),
(5, 2, 5),
(8, 3, 3),
(1, 3, 5),
(3, 2, 4);

-- ========================== QUERY TABLE ==========================
-- 1. Hien thi danh sach tat ca cac hoc vien:
select * from students;

--  2. Hien thi danh sach tat ca cac mon hoc:
select * from subjects;

--  3. Tinh diem trung binh:
select avg(Mark) as Average from Marks;

--  4. Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat:
select Subjects.SubjectID, Subjects.SubjectName, Marks.Mark from Subjects 
join Marks on Subjects.SubjectID = Marks.SubjectID 
where  Marks.Mark = (select max(Mark) from Marks);

--  5. Danh so thu tu cua diem theo chieu giam:
select rank() over (order by Mark desc) as `STT`, Mark from Marks;

--  6. Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max):
alter table Subjects modify SubjectName nvarchar(8000);

--  7. Cap nhat them dong chu « Day la mon hoc « vao truoc cac ban ghi tren cot SubjectName trong bang Subjects:
update Subjects set SubjectName = concat("Day la mon hoc", " ", SubjectName); 

--  8. Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50:
alter table Students add constraint CHK_Students_Age check (Age between 15 and 50);

--  9. Loai bo tat ca quan he giua cac bang:
alter table  Classstudent drop foreign key classstudent_ibfk_1, drop foreign key classstudent_ibfk_2;
alter table  Marks drop foreign key marks_ibfk_1, drop foreign key marks_ibfk_2;

--  10.  Xoa hoc vien co StudentID la 1:
delete from students where StudentID = 1;

--  11.  Trong bang Students them mot column Status co kieu du lieu la Bit va co gia tri Default la 1:
alter table students add column `Status` bit default 1;

-- 12. Cap nhap gia tri Status trong bang Student thanh 0:
update students set `Status` = 0;

-- ============================================================== END ==============================================================

