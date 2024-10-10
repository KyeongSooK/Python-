20240619_

-- e_learning_time_proc
-- -> 이력, 일단위 처리
--  -> -> data 혹은 timestamp

-- e_study, e_media, e_test
-- -> 이력, 월단위 처리
--  -> -> data 혹은 timestamp

-- e_content_meta, e_member
-- -> 코드(메타데이터), 월단위 처리
--  -> -> 처리기준 = 전체 데이터

-- -- e_media 4c "text_biz_dw".e_media 3c "text_biz_dw"."e_media" 2c 속도 테스트. 정확하진 않음.

-- 1. 데이터베이스.테이블별 전체 카운트

SELECT COUNT(*) -- 252,541,483
FROM e_learning_time_proc

SELECT COUNT(*) -- 157,786,423
FROM e_study

-- e_media 4c "text_biz_dw".e_media 3c "text_biz_dw"."e_media" 2c
SELECT COUNT(*) -- 146,720,305 
FROM "text_biz_dw"."e_media"

SELECT COUNT(*) -- 88,990,301
FROM "text_biz_dw"."e_test"

SELECT COUNT(*) -- 2,158,784
FROM "text_biz_dw"."e_content_meta"

SELECT COUNT(*) -- 10,551,272
FROM "text_biz_dw"."e_member"

-- 2. 안에 컬럼들 확인 오래걸리니 LIMIT 10; 제한으로

SELECT * FROM e_learning_time_proc LIMIT 10

SELECT * FROM e_study LIMIT 10 -- 157,786,423

SELECT * FROM "text_biz_dw"."e_media" LIMIT 10 -- 146,720,305 

SELECT * FROM "text_biz_dw"."e_test" LIMIT 10 -- 88,990,301

SELECT * FROM "text_biz_dw"."e_content_meta" LIMIT 10 -- 2,158,784

SELECT * FROM "text_biz_dw"."e_member" LIMIT 10 -- 10,551,272

-- 3. 컬럼 이해

SELECT * FROM "text_biz_dw"."e_learning_time_proc" ORDER BY userid DESC LIMIT 1000

SELECT * FROM "text_biz_dw"."e_study" ORDER BY userid ASC LIMIT 100 -- 157,786,423

SELECT * 
FROM "text_biz_dw"."e_study" 
ORDER BY userid ASC, datestamp[active] ASC 
LIMIT 100;

-- es부분에서 에러많이남 feat.gptbrother -- district 쓰는방법?
SELECT  
    elt.userid AS elt_userid, 
    elt.mcode AS elt_mcode,
    elt.learning_seq,
    elt.learning_time,
    elt.start_timestamp,
    elt.end_timestamp,
    elt.menu_id,
    elt.menu_name,
    elt.yyyy AS elt_yyyy,
    elt.mm AS elt_mm,
    elt.dd AS elt_dd,
    es.userid AS es_userid,
    es.mcode AS es_mcode,
    es.datestamp[active],
    es.latest_compl,
    es.restart_count,
    es.system_learning,
    es.caliper_learning,
    es.subcontent,
    es.first_startdt,
    es.credate,
    es.enddate,
    es.datestamp AS es_datestamp,
    es.before_reset_study,
    es.reset_study,
    es.reset_first,
    es.reset_last,
    es.reset_last_yn,
    es.yyyy AS es_yyyy,
    es.mm AS es_mm
FROM 
    "text_biz_dw"."e_learning_time_proc" elt
LEFT JOIN 
    "text_biz_dw"."e_study" es
ON 
    elt.userid = es.userid AND elt.mcode = es.mcode
WHERE 
    CONCAT(elt.yyyy, elt.mm, elt.dd) = '20221201'
ORDER BY 
    elt.userid ASC, elt.learning_seq ASC
LIMIT 10
;

-- 1.datestamp[active] 처럼 SELECT 조회가 안되는 열(컬럼)이 있다.
-- 조회 안되는 컬럼 es.latest_compl es.restart_count,

SELECT datestamp[active] AS active_datestamp
FROM "text_biz_dw"."e_study"
ORDER BY userid ASC
LIMIT 100;

SELECT USER_ID
        system_learning,
        caliper_learning
FROM "text_biz_dw"."e_study"
WHERE USER_ID = '00002c49-27e3-49f8-b4f1-88ce5c2ac89e'
ORDER BY userid ASC
-- 이건 왜안됨??


-- 4. null이 없는 조건 조회 = 유니크한 값 몇개(얼마)?
-- DISTINCT pk값의 중복값을 제거해서 총 몇명의 회원이 있는지 알수 있다.

SELECT count(DISTINCT userid) FROM "text_biz_dw"."e_learning_time_proc" WHERE userid = userid -- 291139 >> ORDER BY userid DESC 252541483머지..

SELECT count(*) FROM "text_biz_dw"."e_learning_time_proc" -- 252541483





