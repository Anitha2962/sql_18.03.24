create database WORKER_DATA


CREATE TABLE Worker(WORKER_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
FIRST_NAME char(25),
LAST_NAME char(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25));

INSERT INTO Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
values('Monika','Arora',100000,'2014-02-20 09:00:00','HR');
INSERT INTO Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
values
('Niharika','Varma',80000,'2014-06-11 09:00:00','Admin');
INSERT INTO Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
values
('Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
('Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
('Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
('Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
('Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),
('Geethika','Chauhan',90000,'2014-04-11 09:00:00','Admin');

create table Title(WORKER_REF_ID INT,
WORKER_TITILE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID)ON DELETE CASCADE);

INSERT INTO Title(WORKER_REF_ID,WORKER_TITILE,AFFECTED_FROM)
VALUES(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst.Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00'),
(3,'Lead','2016-06-11 00:00:00');

CREATE table Bonus(WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)REFERENCES Worker(WORKER_ID) ON DELETE CASCADE);

 INSERT INTO Bonus(WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE)
  VALUES
  (1,5000,'2016-02-20 00:00:00'),
  (2,3000,'2016-06-11 00:00:00'),
  (3,4000,'2016-02-20 00:00:00'),
  (1,4500,'2016-02-20 00:00:00'),
  (2,3500,'2016-06-11 00:00:00');

  select * from worker;
    FROM bonus
    WHERE NOT EXISTS (
    SELECT 1
    FROM title
    WHERE title.WORKER_REF_ID= bonus.WORKER_REF_ID
);
   
29) SELECT CURRENT_TIMESTAMP;  
30) SELECT TOP 3* FROM Worker
31) SELECT DISTINCT SALARY
    FROM 
    (SELECT DISTINCT TOP 5 SALARY 
    FROM WORKER
    ORDER BY SALARY DESC)
    AS TOP_SALARIES ORDER BY SALARY ASC;

32) SELECT MAX(SALARY) AS SECOND_HIGHEST_SALARY
    FROM WORKER
    WHERE SALARY<(SELECT MAX(SALARY)FROM WORKER);

37) SELECT * FROM Worker
    UNION ALL
    SELECT TOP 4 * FROM Worker
38) SELECT * FROM Bonus INNER JOIN Title
    ON Bonus.WORKER_REF_ID=Title.WORKER_REF_ID;

40) SELECT WORKER_TITILE,COUNT(*) AS NUM_PEOPLE
    FROM Title
    GROUP BY WORKER_TITILE
    HAVING COUNT(*)<5;

41) SELECT WORKER_TITILE FROM Title;

42) SELECT * FROM Worker WHERE WORKER_ID=8;

43)  SELECT * FROM Worker WHERE WORKER_ID=1;

44) SELECT TOP 5 * FROM Worker ORDER BY WORKER_ID DESC;

46) SELECT TOP 3  SALARY FROM WORKER 
    ORDER BY SALARY DESC;

47) SELECT TOP 3  SALARY FROM WORKER 
    ORDER BY SALARY ASC;

49) SELECT Worker.WORKER_ID,SUM(SALARY) FROM WORKER
    GROUP BY WORKER_ID


	---INDEX---
	create index IX_WORKER_TITILE ON TITLE (WORKER_TITILE ASC);

    sp_helpindex  TITLE

	drop index title.IX_WORKER_TITILE

	CREATE INDEX IX_WORKER_TITLE ON TITLE (WORKER_TITILE ASC);
	sp_helpindex title
		
---non clusterd index--
create clustered index IX_worker_salary_deparment on worker(salary asc,department desc)

create nonclustered indexIX_worker_salary_deparment on worker(salary asc,department desc)

---VIEW--
   create view vw_selectBonusWITHTitle
   AS
   SELECT * FROM Bonus INNER JOIN Title
    ON Bonus.WORKER_REF_ID=Title.WORKER_REF_ID;


	select * from vw_selectBonusWITHTitle
	create procedure sp_getalldata
	as
	begin
	select * from worker;
	end;
	exec sp_getalldata;

	update Worker
	set FIRST_NAME='anu'
	where first_name='vipul'
	select * from Worker
	select * from Title
	select avg(salary) from Worker
	select * from Worker where salary>(select avg(salary) from Worker);
	select * from worker where salary=(select max(salary) from Worker);
