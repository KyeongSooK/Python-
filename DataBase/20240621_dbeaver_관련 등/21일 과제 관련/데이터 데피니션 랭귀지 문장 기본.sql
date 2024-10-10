-- 데이터 데피니션 랭귀지 문장 기본

select * from actor;

--테이블 만들기 dvdrental 안에 테이블 만들기
create table temp0 (col_0 int); -- 실행 선언할 table temp0 as () as가 hide

create table temp1 (); -- 컬럼없이 () 그냥 해도 되나 빈값이 나오므로 위에같이 컬럼과 type를 같이 설정

-- 원본이 되는 테이블의 정보를 가져온다
select * from actor where 1=0; -- 컬럼의 있는 속성 type의 대한 속성정보도 가져옴

create table actor_backup as
select * from actor where 1=0; -- 컬럼의 있는 속성 type의 대한 속성정보도 가져옴

-- where 조건이 모든값이 참인 전체데이터를 가져온상태
create table actor_backup_v2 as
select * 
from actor; -- 컬럼의 있는 속성 type의 대한 속성정보도 가져옴

-- * 순서대로 보기 좋게 하는게 좋다 위는 그게 아님


-- 데이터베이스 위치에서 봤을때 중간에 테이블이라는 단계가 있고 테이블안에 컬럼 > 컬럼일 추가 수정.....~@#$$@$
-- 테이블 수정을 하는건데 add 컬럼을 하는거 리네임 컬럼을 .... 선행하는 컬럼의 이름을

create table temp3 (
	col0 VARCHAR
	, col1 INT
	, col2 TIMESTAMP
);

-- 위에꺼 rename
alter table temp3 rename to temp_3;

-- table 안에있는걸 수정  
alter table temp_3 add column idx int;

-- 컬럼명을 바꿔주기
alter table temp_3 rename col0 to col_0;

-- col2 를 삭제
alter table temp_3 drop column col2;

-- 지금 쿼리 위치에서 alter table 컬럼을 수정할 행위할 할때
-- 컬럼의 순서나 위치는 안바뀌고 type만 바뀌고 table 위치가 바꾸게 되는 현상이 됨

-- 수치형을 문자형으로 바꾼다 int4가 
alter table temp_3 alter column col1 type varchar;

-- tmp_3 삭제를 하겠다 하면 안내문구 나옴
drop table temp_3;


-------------------------------------------------------------------------------


CREATE TABLE temp0 (
    col0 VARCHAR 
    , col1 INT
    , col2 TIMESTAMP
);

ALTER TABLE temp0 ADD COLUMN col3 CHAR(10);

ALTER TABLE temp0 DROP COLUMN col3;

ALTER TABLE temp0 RENAME COLUMN col0 TO TEXT;

ALTER TABLE temp0 RENAME TO temp1;

ALTER TABLE temp1 ALTER COLUMN col1 TYPE FLOAT;

DROP TABLE temp1;

----------##########----------

--CREATE TABLE today_study (
--    today CHAR(8)
--    , summary VARCHAR
--    , note VARCHAR
--);
--
--ALTER TABLE today_study ADD COLUMN idx INT;

-- 테이블에다가 values 밑에 밸류값으로 주겠다.
INSERT INTO today_study (  
    today
    , summary
    , note
    , idx
) VALUES (
    '20240509'
    , '오리엔테이션'
    , '   '
    , 1
);

-- 입력의 value (위) 받는 정보 그대로 values 로써 하나씩 insert 가능하다.
-- 데이터 insert 할때 하나의 row 행 으로 insert 된다.
-- 맞춰서 , , , , 밑에는 4개의 파라미터 인자 로 생각한다.
INSERT INTO today_study 
    (today, summary, note, idx) 
VALUES 
    ('20240509', '관련직무', '   ', 2)
    , ('20240509', '환경구성', '   ', 3)
    , ('20240619', '데이터의 위치', '     ', 3)
    , ('20240619', '데이터의 종류', '     ', 3)
;

-- today_study 가지고와서 
-- 밑에 말고 backup은 true인조건
-- 데이터의 구조만 선언
CREATE TABLE today_study_bak AS
SELECT * 
FROM today_study 
WHERE 0=1;

-- 복사
-- coulmn values 직접 설정말고 
-- today_study 문장을 today_study_bak 여기로 넣어준다.
-- today_study 데이터를 today_study_bak에서 사용할수 있다.
INSERT INTO today_study_bak
SELECT *
FROM today_study;

-- insert 할때 주의할점
-- 테이블 선언이 되어있어야한다.
-- insert into 원래는 컬럼설정하고 그에 값을 줘야한다. 그런데 들어가야할 값이 실제 데이터에 값과 갯수, 컬럼이 같으면
-- 컬럼명은 생략이 가능하다
-- , , , , insert 가 defalut이나 select되는 부분의 갯수 컬럼이 같으면 한번에 가능 하다 복사 부분

----------##########----------
-- 스페이스 3칸
-- 스페이스 3칸 의 값을 null로 바꿔준다.
UPDATE today_study
SET note = null
WHERE note = '   ';
-- 찾아서 넣는게 아니고 
-- 조건문으로 바꿀 대상을 찾는다

-- 조건을 주지않으면 어떻게 되나?
--
update today_study 
SET note = null; 
--WHERE note = '   '; -- 조건을 빼면
--insert delete drop update 경고문은 읽고 실행해야된다.
update today_study 
SET note = '     '
where today = '20240619'

-- !! DELETE 
-- DROP은 테이블은 사라지고 DELETE는 테이블의 데이터만 사라진다.
-- 스페이스 5칸
-- 스페이스 5칸 의 값을 null로 바꿔준다.
DELETE FROM today_study
WHERE note = '     ';

DELETE FROM today_study_bak;

DROP TABLE today_study;

insert into today_study_bak 
values ('20240621', '  ',  '  ', 1)

----------##########----------

DELETE FROM today_study;

TRUNCATE TABLE today_study_bak; -- drop 이랑 차이 확인 ROW단위 가 아니다 또그러네?????!!

--------------------------------------- TRUNCATE 오류 다시 확인.

select * from actor;

select * from film;

-- actor film 를 정규화한 테이블
select * from film_actor;

-- 역정규화 한다면?

-- acount와 roll 계정 권한이라는 주제로




----------##########----------

-- 제약조건 및 FK를 적용한 테이블 생성
-- ACCOUNT, ROLE, ACCOUNT_ROLE

CREATE TABLE account (
    user_id SERIAL PRIMARY KEY -- userid 
    , user_name VARCHAR (50) UNIQUE NOT NULL  -- UNIQUE NOT null =PK 지만 다르다.
    , PASSWORD VARCHAR (50) NOT NULL
    , email VARCHAR (500) UNIQUE NOT NULL
    , created_on TIMESTAMP NOT NULL
    , last_login TIMESTAMP
);

-- 권한의 종류들만 들어간다 
CREATE TABLE ROLE (
    role_id SERIAL PRIMARY KEY
    , role_name VARCHAR (255) UNIQUE NOT NULL
);

-- 즉 누가 어느정도의 권한이 있는지 확인하는 테이블
CREATE TABLE account_role (
    user_id INTEGER NOT NULL
    , role_id INTEGER NOT NULL
    , grant_date TIMESTAMP WITHOUT TIME ZONE     -- TIMESTAMP 타임존을 빼겟다는 방식
    , PRIMARY KEY (user_id, role_id)             -- 2개의 컬럼이 PK 을 같이 보였을때 한유저에 두개이상을 보유할수 없는 조건
    , CONSTRAINT ACCOUNT_ROLE_ROLE_ID_FKEY FOREIGN KEY (role_id) -- ACCOUNT_ROLE_ROLE_ID_FKEY 제약조건의 명칭 제일믿은 액션
        REFERENCES ROLE (role_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
    , CONSTRAINT ACCOUNT_ROLE_USER_ID_FKEY FOREIGN KEY (user_id)
        REFERENCES ACCOUNT (user_id) MATCH SIMPLE ON
        UPDATE NO ACTION ON DELETE NO ACTION
);

SELECT * FROM account;

SELECT * FROM account_role;

SELECT * FROM ROLE;

----------##########----------
-- FK 테스트

-- account row 1 추가
INSERT INTO account 
VALUES (
		1
		, '김경수'
		, '2345'
		, 'KyeongSooKim@chunjae.co.kr'
		, CURRENT_TIMESTAMP
		, null
	);

SELECT * FROM ACCOUNT;

-- ROLE 데이터에 데이터 넣어 권한 주기
INSERT INTO ROLE 
values
	  (1, '강사')
	, (2, '학생')
	, (3, '매니저')
	, (4, '외부인')
;

SELECT * FROM ROLE;

-- 유저에 
INSERT INTO ACCOUNT_ROLE 
VALUES (
	1, 2, CURRENT_TIMESTAMP); -- account 1번을 role 2번을 준다

-- 1이 있는데 1을 만들면 pk값에서 유니크한값을 위반되어 안됨. >> 이런건 python에서 try except 문으로 처리한다.
INSERT INTO account 
VALUES (
		2
		, '김영주'
		, '1234'
		, '????@chunjae.co.kr'
		, CURRENT_TIMESTAMP
		, null
	);

INSERT INTO account 
VALUES (
		3
		, '강지완'
		, '1234'
		, '?????@chunjae.co.kr'
		, CURRENT_TIMESTAMP
		, null
	);


INSERT INTO ACCOUNT_ROLE 
VALUES (
	2, 1, CURRENT_TIMESTAMP); -- account 2번을 role 1번권한을 준다 

-- 참조변환을 위배 될때 예시
INSERT INTO ACCOUNT_ROLE 
VALUES (
	3, 1, CURRENT_TIMESTAMP);

delete from account_role
where user_id = 3;

-- 3번강사를 4번으로? 3번강사를 지울꺼다.
delete from account -- 오류는 account_role에 권한부터 지워야 한다 먼저 권한을 지우면 삭제 가능하다.
where user_id = 3;

SELECT * FROM ACCOUNT_ROLE;

INSERT INTO ACCOUNT_ROLE VALUES (2, 1, CURRENT_TIMESTAMP);

SELECT * FROM ACCOUNT;

SELECT * FROM ACCOUNT_ROLE;

SELECT * FROM ROLE;




















