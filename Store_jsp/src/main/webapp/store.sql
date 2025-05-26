drop table sale_tbl_003;
drop table goods_tbl_003;
drop table store_tbl_003;


create table goods_tbl_003(
	goods_cd varchar2(6) primary key,
	goods_nm varchar2(30),
	goods_price number(8),
	cost number(8),
	in_date date
);

create table store_tbl_003(
	store_cd varchar2(5) primary key,
	store_nm varchar2(20),
	store_fg varchar2(1)
);

create table sale_tbl_003(
	sale_no varchar2(5) primary key,
	sale_ymd date not null,
	sale_fg varchar2(1) not null,
	store_cd varchar2(5) references store_tbl_003(store_cd),
	goods_cd varchar2(6) references goods_tbl_003(goods_cd),
	sale_cnt number(3),
	pay_type varchar2(2)
);


insert all
into goods_tbl_003 values('110001','라면',1050,750,'20190302')
into goods_tbl_003 values('110002','빵',1300,800,'20190302')
into goods_tbl_003 values('110003','과자',2000,1700,'20190302')
into goods_tbl_003 values('110004','탄산음료',900,750,'20190302')
into goods_tbl_003 values('110005','삼각김밥',750,300,'20190302')
into goods_tbl_003 values('110006','초콜릿',1500,1300,'20190302')
into goods_tbl_003 values('110007','우유',850,600,'20190302')

into store_tbl_003 values('A001', '이태원점', '0')
into store_tbl_003 values('A002', '한남점', '0')
into store_tbl_003 values('A003', '도원점', '0')
into store_tbl_003 values('B001', '혜화점', '1')
into store_tbl_003 values('C001', '방배점', '1')
into store_tbl_003 values('D001', '사당점', '0')
into store_tbl_003 values('D002', '흑석점', '1')
into store_tbl_003 values('E001', '금호점', '0')

into sale_tbl_003 values('0001','20190325','1','A001','110001',2,'02')
into sale_tbl_003 values('0002','20190325','1','B001','110003',2,'02')
into sale_tbl_003 values('0003','20190325','1','D001','110003',1,'01')
into sale_tbl_003 values('0004','20190325','1','A001','110006',5,'02')
into sale_tbl_003 values('0005','20190325','1','C001','110003',2,'02')
into sale_tbl_003 values('0006','20190325','2','C001','110003',2,'02')
into sale_tbl_003 values('0007','20190325','1','A002','110005',4,'02')
into sale_tbl_003 values('0008','20190325','1','A003','110004',4,'02')
into sale_tbl_003 values('0009','20190325','1','B001','110001',2,'01')
into sale_tbl_003 values('0010','20190325','1','A002','110006',1,'02')

select * from dual;

select goods_cd, goods_nm, '\'||to_char(goods_price, '999,999'), '\'||to_char(cost, '999,999'), to_char(in_date, 'yyyy-mm-dd') from goods_tbl_003



create sequence sale_num start with 11;
select to_char(sale_num.nextval, 'fm0000'), sysdate
from dual;

create sequence goods_num start with 110008;
select to_char(goods_num.nextval, 'fm000000'), to_char(sysdate,'999,999') from dual;

select st.store_nm, to_char(sum(case when pay_type = '01' then sl.sale_cnt * g.goods_price else 0 end), '999,999')||'원' 현금매출, to_char(sum(case when pay_type = '02' then sl.sale_cnt * g.goods_price else 0 end), '999,999')||'원' 카드매출, to_char(sum(sl.sale_cnt * g.goods_price),'999,999')||'원' 총매출 from goods_tbl_003 g, store_tbl_003 st, sale_tbl_003 sl where sl.goods_cd = g.goods_cd and sl.store_cd = st.store_cd group by st.store_nm order by 4 desc;

select distinct sale_fg from sale_tbl_003


select * from goods_tbl_003 where goods_cd = 110001


select distinct sale_fg, case when sale_fg = '1' then '판매' else '판매취소' end from sale_tbl_003 order by 1
select store_cd, store_nm from store_tbl_003
select goods_cd, goods_nm from goods_tbl_003

select distinct pay_type, case when pay_type = '01' then '현금' else '카드' end from sale_tbl_003


select  from sale_tbl_003 sl, store_tbl_003 st, goods_tbl_003 g where sl.store_cd = st.store_cd and sl.goods_cd = g.goods_cd
select  from sale_tbl_003 sl, store_tbl_003 st, goods_tbl_003 g where sl.store_cd = st.store_cd and sl.goods_cd = g.goods_cd
select  from sale_tbl_003 sl, store_tbl_003 st, goods_tbl_003 g where sl.store_cd = st.store_cd and sl.goods_cd = g.goods_cd

select * from sale_tbl_003

select * from goods_tbl_003

select * from store_tbl_003

update goods_tbl_003 set goods_nm = '노재혁', goods_price = '2', cost = '2' where goods_cd = '110008'

select case when sl.sale_fg = '1' then '판매' else '판매취소' end sale_fg, sl.sale_no, sl.sale_ymd, g.goods_nm, sl.sale_cnt, g.goods_price, case when sl.pay_type = '01' then '현금' else '카드' end pay_type from sale_tbl_003 sl join store_tbl_003 st on sl.store_cd = st.store_cd join goods_tbl_003 g on g.goods_cd = sl.goods_cd where st.store_cd = 'A001'

SELECT CASE WHEN sl.sale_fg = '1' THEN '판매' ELSE '판매취소' END sale_fg, sl.sale_no, sl.sale_ymd, g.goods_nm, sl.sale_cnt, g.goods_price, CASE WHEN sl.pay_type = '01' THEN '현금' ELSE '카드' END AS pay_type
FROM sale_tbl_003 sl
JOIN store_tbl_003 st ON sl.store_cd = st.store_cd
JOIN goods_tbl_003 g ON g.goods_cd = sl.goods_cd
WHERE st.store_cd = 'A001';


select st.store_cd, st.store_nm, to_char(sum(case when pay_type = '01' then sl.sale_cnt * g.goods_price else 0 end), '999,999')||'원' 현금매출, to_char(sum(case when pay_type = '02' then sl.sale_cnt * g.goods_price else 0 end), '999,999')||'원' 카드매출, to_char(sum(sl.sale_cnt * g.goods_price),'999,999')||'원' 총매출 from goods_tbl_003 g, store_tbl_003 st, sale_tbl_003 sl where sl.goods_cd = g.goods_cd and sl.store_cd = st.store_cd group by st.store_cd, st.store_nm order by 4 desc