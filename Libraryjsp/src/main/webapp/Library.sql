drop member_tbl_001;
drop member_tbl_001;
drop member_tbl_001;

create table member_tbl_001(
	cust_no number(6) not null primary key,
	cust_name varchar2(20) not null,
	phone varchar2(13) not null,
	address varchar2(60),
	join_date date,
	stat_fg varchar2(2)
);

create table book_tbl_001(
	book_code varchar2(10) not null primary key,
	book_name varchar2(50) not null,
	book_type varchar2(2),
	book_author varchar2(20),
	in_date date,
	stat_fg varchar2(2)
);

create table rental_tbl_001(
	rent_ymd varchar2(8) not null,
	rent_no varchar2(5) not null,
	rent_book varchar2(10) not null,
	rent_rent number(6) not null,
	close_ymd varchar2(8) not null,
	return_ymd varchar2(8),
	return_fg varchar2(2),
	primary key(rent_ymd, rent_no)
);

insert all

into member_tbl_001 values(100001, '김유정', '010-1111-2222', '서울 용산구', '2018-05-01', '0')
into member_tbl_001 values(100002, '김윤경', '010-2222-3333', '서울 동작구', '2018-08-22', '0')
into member_tbl_001 values(100003, '최승필', '010-3333-4444', '서울 강남구', '2018-09-13', '1')
into member_tbl_001 values(100004, '강지현', '010-4444-5555', '서울 송파구', '2018-11-07', '1')
into member_tbl_001 values(100005, '이원석', '010-5555-6666', '서울 성동구', '2019-01-08', '0')
into member_tbl_001 values(100006, '김승현', '010-6666-7777', '서울 광진구', '2019-01-17', '0')

into book_tbl_001 values('A0001', '언어의 온도', 'A', '이기주', '2018-05-01', '1')
into book_tbl_001 values('A0002', '골든아워', 'A', '이국종', '2018-05-01', '1')
into book_tbl_001 values('B0001', '12가지 인생의 법칙', 'B', '피터슨', '2018-06-01', '1')
into book_tbl_001 values('B0002', '당신이 옳다', 'B', '정혜신', '2018-06-01', '0')
into book_tbl_001 values('C0001', '마력의 태동', 'C', '양윤옥', '2018-09-01', '1')
into book_tbl_001 values('C0002', '꽃을 보듯 너를 본다', 'C', '나태주', '2018-09-01', '1')

into rental_tbl_001 values('20190318', '00001', 'A0001', 100001, '20190325', null, '0')
into rental_tbl_001 values('20190318', '00002', 'B0001', 100001, '20190325', null, '0')
into rental_tbl_001 values('20190318', '00003', 'C0001', 100001, '20190325', null, '0')
into rental_tbl_001 values('20190320', '00001', 'B0002', 100005, '20190327', '20190324', '1')
into rental_tbl_001 values('20190322', '00001', 'A0002', 100006, '20190329', null, '0')
into rental_tbl_001 values('20190323', '00001', 'C0002', 100003, '20190330', null, '0')

select * from dual;




select * from member_tbl_001;
