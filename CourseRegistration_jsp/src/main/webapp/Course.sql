drop table course_tbl
drop table lecturer_tbl

create table course_tbl(
	id varchar2(5) not null primary key,
	name varchar2(40),
	credit number(6),
	lecturer varchar2(10),
	week number(2),
	start_hour number(4),
	end_end number(4)
);


create table lecturer_tbl(
	idx number(6) not null primary key,
	name varchar2(10),
	major varchar2(25),
	field varchar2(25)
)

insert all
into course_tbl values('10001', '프로그래밍', 2, '1', 1, 0900, 1100)
into course_tbl values('10002', '객체지향 프로그래밍', 2, '2', 2, 0900, 1200)
into course_tbl values('10003', '자료구조', 3, '4', 3, 0900, 1200)
into course_tbl values('10004', '알고리즘', 3, '4', 4, 0900, 1200)
into course_tbl values('20001', '시스템 프로그래밍', 2, '5', 1, 1300, 1600)
into course_tbl values('20002', '운영체제', 3, '5', 2, 1500, 1800)
into course_tbl values('20003', '오토마타와 컴파일러', 3, '5', 3, 1330, 1630)
into course_tbl values('30001', '소프트웨어 공학', 2, '3', 4, 1330, 1530)
into course_tbl values('30002', '시스템 분석 및 설계', 3, '3', 5, 0900, 1200)
into course_tbl values('40001', '데이터베이스', 3, '2', 5, 1300, 1600)

into lecturer_tbl values(1,'김교수','소프트웨어공학','알고리즘')
into lecturer_tbl values(2,'이교수','소프트웨어공학','인공지능')
into lecturer_tbl values(3,'박교수','소프트웨어공학','소프트웨어 공학')
into lecturer_tbl values(4,'우교수','소프트웨어공학','알고리즘')
into lecturer_tbl values(5,'최교수','응용컴퓨터공학','임베디드 시스템')
into lecturer_tbl values(6,'강교수','응용컴퓨터공학','멀티미디어')
into lecturer_tbl values(7,'황교수','모바일시스템공학','네트워크')

select * from dual;

select * from course_tbl

select * from course_tbl where id='10001'

select credit from course_tbl where id='10001'

select * from course_tbl where id='10001'

select id, c.name, credit, l.name, case week when 1 then '월' when 2 then '화' when 3 then '수' when 4 then '목' when 5 then '금' when 6 then '토' end week, lpad(start_hour, 4, 0), lpad(end_end,4,0) from course_tbl c, lecturer_tbl l where c.lecturer = l.idx


select * from lecturer_tbl

select idx, name from lecturer_tbl

select count(name) from course_tbl

delete course_tbl where id = 1

select * from course_tbl