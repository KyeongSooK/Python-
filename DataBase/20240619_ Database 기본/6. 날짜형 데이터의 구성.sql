-- 날짜형 데이터의 구성
SELECT NOW() AS "현재"
    , YEAR(NOW()) AS "연" -- NOW를 기준으로 어디로 이동 무언가로 찾아간다.ex) 연으로 이동
    , QUARTER(NOW()) AS "분기"
    , MONTH(NOW()) AS "월"
    , WEEK(NOW()) AS "주"
    , DAY(NOW()) AS "일"
    , HOUR(NOW()) AS "시"
    , MINUTE(NOW()) AS "분"
    , SECOND(NOW()) AS "초"
    , MILLISECOND(NOW()) AS "밀리초"
; -- server cli 환경에서 이용할뗀 꼭 필요하다. 에디터에서는 상관없다. 그냥쓰기

SELECT NOW()  -- EX) 스캔이 걸려있는 작업들을 실행할때 사용
    , DAY_OF_YEAR(NOW()) AS "연 중 몇번째 일"
    , DAY_OF_WEEK(NOW()) AS "주 중 몇번째 일"
;

-- 날짜형 데이터의 버림 (초기화 기준)
SELECT NOW() AS "현재"  -- 수치형 데이터 초기값은 0 월은 1월의 초기 // 0으로 버린다는 개념이 아니다.
    , DATE_TRUNC('year', NOW())
    , DATE_TRUNC('quarter', NOW())
    , DATE_TRUNC('month', NOW())
    , DATE_TRUNC('week', NOW())
    , DATE_TRUNC('day', NOW())
    , DATE_TRUNC('hour', NOW())
    , DATE_TRUNC('minute', NOW())
    , DATE_TRUNC('second', NOW())
    , DATE_TRUNC('millisecond', NOW())
;

-- 날짜형 데이터의 연산
SELECT NOW() AS "현재"
    , DATE_ADD('year', -1, NOW())  -- 음수값도 뺄수있다 EX) 현재 2024 > 2023
    , DATE_ADD('quarter', -1, NOW())
    , DATE_ADD('month', 1, NOW())
    , DATE_ADD('week', 1, NOW())
    , DATE_ADD('day', 1, NOW())
    , DATE_ADD('hour', 1, NOW())
    , DATE_ADD('minute', 1, NOW())
    , DATE_ADD('second', 1, NOW())
    , DATE_ADD('millisecond', 1, NOW())
;

-- 두 날짜형 데이터의 간격
SELECT NOW() AS "현재"
    , DATE_DIFF('second', DATE_ADD('year', 1, NOW()), NOW())  -- 작은수에서 큰수를 뺀거 // 년도을기준으로 초를 빼는 부분
    -- , DATE_DIFF('quarter', DATE_ADD('quarter', 1, NOW()), NOW())
    -- , DATE_DIFF('month', DATE_ADD('month', 1, NOW()), NOW())
    -- , DATE_DIFF('week', DATE_ADD('week', 1, NOW()), NOW())
    -- , DATE_DIFF('day', DATE_ADD('day', 1, NOW()), NOW())
    -- , DATE_DIFF('hour', DATE_ADD('hour', 1, NOW()), NOW())
    -- , DATE_DIFF('minute', DATE_ADD('minute', 1, NOW()), NOW())
    -- , DATE_DIFF('second', DATE_ADD('second', 1, NOW()), NOW())
    -- , DATE_DIFF('millisecond', DATE_ADD('millisecond', 1, NOW()), NOW())
;

-- 날짜형 데이터의 데이터 타입 변경 (date -> string)
SELECT CURRENT_DATE(), TYPEOF(CURRENT_DATE) -- 데이터 형식을 알려주는 함수
    , DATE_FORMAT(NOW(), '%Y-%m-%d'), TYPEOF(DATE_FORMAT(NOW(), '%Y-%m-%d'))
    -- , DATE_FORMAT(NOW(), '%Y%m%d’)
    -- , DATE_FORMAT(NOW(), '%Y%m’)
    -- , DATE_FORMAT(NOW(), '%H:%i:%s’)
    -- , DATE_FORMAT(NOW(), '%r’)
    -- , DATE_FORMAT(NOW(), '%T’)
;

SELECT CURRENT_DATE, CURRENT_DATE

SELECT NOW()
    --, CONCAT(CURRENT_DATE, CURRENT_TIME) -- STRING이 아니라서 CONCAT 사용안됨.
    , CONCAT(DATE_FORMAT(NOW(), '%Y-%m-%d'), DATE_FORMAT(NOW(), '%H:%i:%s'))
;

-- 날짜형 데이터의 데이터 타입 변경 (string -> date)
SELECT NOW()
    , DATE_PARSE(DATE_FORMAT(NOW(), '%Y-%m-%d'), '%Y-%m-%d') -- DATE_PARSE 문자로 바꾼걸 다시 날짜로 바꾼다
    , DATE_PARSE('2024-06-19', '%Y-%m-%d')-- 직관적이게 바꾸기
    , DATE_PARSE(DATE_FORMAT(NOW(), '%H:%i:%s'), '%H:%i:%s')
;

-- SELECT NOW()
--     , CONCAT(DATE_PARSE(DATE_FORMAT(NOW(), '%Y-%m-%d'), '%Y-%m-%d'), DATE_PARSE(DATE_FORMAT(NOW(), '%H:%i:%s'), '%H:%i:%s’))
-- ;

SELECT NOW(),
    DATE_PARSE(
        CONCAT(
            DATE_FORMAT(NOW(), '%Y-%m-%d'), ' ',
            DATE_FORMAT(NOW(), '%H:%i:%s')
        ),
        '%Y-%m-%d %H:%i:%s'
    ) AS parsed_datetime;


-- 날짜형 데이터의 데이터 타입 변경 CAST
-- DATE_FORMAT 날짜형을 문자형으로 바꿔주는 함수
SELECT NOW()
    --TYPEOF(
    , DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s')
    , CAST(NOW() AS VARCHAR)
    -- , CAST(DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS VARCHAR) -- AS 앞에있는 문장을 뒤에있는 문장으로 사용할 때 
    -- , CAST(NOW() AS VARCHAR)
    -- , CAST(CAST(NOW() AS VARCHAR) AS TIMESTAMP)
;
