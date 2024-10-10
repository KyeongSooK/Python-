-- memberstatus : memberstatus_codename
-- 00 : 학습생(대기)
-- 01 : 학습생(준) -> 무료체험
-- 02 : 학습생(일반)
-- 03 : 학습생(준) -> 유료체험
-- 08 : 학습생(1년간미활동삭제)
-- 11 : 학습생(정)
-- 33 : 학습생(준) -> 강의취소
-- 44 : 학습생(만료)
-- 55 : 학습생(정_이월)
-- 66 : 학습생(미납_중지)
-- 77 : 학습생(만료_중학이관)
-- 88 : 학습생(탈퇴)
-- 99 : 학습생(준) -> 무료체험전

SELECT COUNT(*) -- 2,469,122
FROM "text_biz_dm"."learning_analytics_user"
-- 1 = 0 데이터는 안끌어오고 데이터 정보 컬럼타입 순서 정보만 -- 끌어올려고
WHERE 1 = 1  -- 없어도 됨 반드시 참 들여쓰기 (개행)을 맞추기 위해. 
    AND yyyy = '2022' -- 1,900,633
    AND mm = '08' -- 181,853
    AND gender != 'X' -- 165,057
    AND grade_codename IN ('키즈', '초1', '초2', '초3', '초4', '초5', '초6')  -- 156344
    AND memberstatus_change LIKE '-%' -- 11438
    AND postalcode IS NOT NULL -- 10678
;


-------------------------------------------------------------------------------------------------
--** 위아래 같은 문구
-- 조건을 지정한다.
-- 조건식이 True(참) 인 로우만 필터하기 위한 과정.
-- 연산자를 활용하여 조건식을 작성.

SELECT *
FROM "text_biz_dw"."e_test"
WHERE
    credate BETWEEN CAST('2022-08-01' AS TIMESTAMP)  -- credate 날짜 구간을 조회하는 방법
                AND CAST('2022-08-02' AS TIMESTAMP)
;


SELECT *
FROM "text_biz_dw"."e_test"
WHERE "datestamp[active]" = CAST('2022-08-01' AS DATE)
;

-------------------------------------------------------------------------------------------------

SELECT COUNT(*) -- 16,225,616
FROM "text_biz_dw"."e_learning_time_proc"
WHERE 1 = 1
    AND yyyy = '2022'
    AND mm = '08'
    -- AND mcode IS NULL -- 178263
    -- AND (mcode IS NULL OR LENGTH(TRIM(mcode)) < 1)
    AND LENGTH(TRIM(mcode)) < 1 -- 166856 TRIM 좌우여백 지우는고 NULL // ' ' 이런건 P27족 참고
LIMIT 10;
-- 아무런 관심없는 문자는 위에 소스로 알수 있다. 스트링을하여 조회하는 조건으로 사용할수 있다.
-- 수치형 날짜형은 integer증가값이 똑같기때문에 0을 제외하곤 NULL값은 없다.

-- LENGTH(TRIM(column)) < 1의 원리
SELECT LENGTH('     '), LENGTH(TRIM('     '));

-- LENGTH(TRIM(mcode)) < 1 과 비슷한 표현
mcode NOT LIKE '_%'
