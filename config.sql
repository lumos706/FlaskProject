-- 数据库语言：PostgreSQL
CREATE TABLE STUDENTS(
	sid char(8) NOT NULL PRIMARY KEY,
	sname varchar(30) NOT NULL,
	grade int NULL);

INSERT INTO STUDENTS VALUES ('22336155','liuwj89',      2022);
INSERT INTO STUDENTS VALUES ('80000575','waqcj',      2022);
INSERT INTO STUDENTS VALUES ('80000668','fiiluommh',      2021);
INSERT INTO STUDENTS VALUES ('80000694','ogvmu',      2023);
INSERT INTO STUDENTS VALUES ('80000759','uxqqbkjn',      2024);
INSERT INTO STUDENTS VALUES ('80000856','ehlycg',      2024);

CREATE TABLE COURSES(
	cid char(5) NOT NULL PRIMARY KEY,
	cname varchar(30) NOT NULL,
	credit int NULL);

INSERT INTO COURSES VALUES ('10001','database',        4);
INSERT INTO COURSES VALUES ('10002','operating system',        4);
INSERT INTO COURSES VALUES ('10003','computer graphics',        2);
INSERT INTO COURSES VALUES ('10004','java',        3);
INSERT INTO COURSES VALUES ('10005','c++',        3);
INSERT INTO COURSES VALUES ('10006','design pattern',        1);
INSERT INTO COURSES VALUES ('10007','uml',        1);
INSERT INTO COURSES VALUES ('10008','data structure',        2);
INSERT INTO COURSES VALUES ('10009','cryptology',        36);
INSERT INTO COURSES VALUES ('10010','software engineering',        5);

CREATE TABLE CHOICES(
	no int NOT NULL PRIMARY KEY,
	sid char(9) NOT NULL,
	cid char(5) NOT NULL,
CONSTRAINT FK_CHOICES_COURSES FOREIGN KEY(cid) REFERENCES COURSES (cid),
CONSTRAINT FK_CHOICES_STUDENTS FOREIGN KEY(sid) REFERENCES STUDENTS (sid));

ALTER TABLE CHOICES
DROP CONSTRAINT IF EXISTS fk_choices_courses;

-- 重新添加带有级联更新和级联删除属性的外键约束
ALTER TABLE CHOICES
ADD CONSTRAINT fk_choices_courses
FOREIGN KEY (cid) REFERENCES COURSES (cid)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 先删除原有的外键约束
ALTER TABLE CHOICES
DROP CONSTRAINT IF EXISTS fk_choices_students;

-- 重新添加带有级联更新和级联删除属性的外键约束
ALTER TABLE CHOICES
ADD CONSTRAINT fk_choices_students
FOREIGN KEY (sid) REFERENCES STUDENTS (sid)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE choices DROP COLUMN no;
ALTER TABLE choices ADD COLUMN no INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY;