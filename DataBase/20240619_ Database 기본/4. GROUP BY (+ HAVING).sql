-- GROUP BY (+ HAVING)
-- 컬럼에서 동일한 값을 가지는 로우를 그룹화 한다.
-- 엑셀의 피벗테이블과 매우 유사한 기능을 수행.
-- GROUP BY가 사용된 쿼리의 SELECT 선언부에는 GROUP BY에 사용된 컬럼과 그룹 함수만 선언 가능! (기타 컬럼이 선언될 경우 에러 발생)
-- GROUP BY 이후 HAVING을 활용하여 GROUP BY 출력 결과에 대한 조건을 지정할 수 있다.

-- SELECT * -- 736,370
-- FROM "text_biz_dm"."learning_analytics_content"
-- WHERE 1 = 1    
--     AND CONCAT(yyyy, mm) = '202208' -- 49,605
--     AND subject_name = '수학'  -- 16,057
--     AND grade BETWEEN 1 AND 6  -- 13,594

SELECT 
    subject_name, grade    -- 차시학습 ncode
    , COUNT(*) AS "차시학습 개수"
    , COUNT(study_count) AS "차시학습 개수"
    , SUM(study_count) AS "학습진행 횟수"
    , SUM(study_completed_count) AS "학습완료 개수"
    , SUM(study_notcompleted_count) AS "학습미완료 개수"
    , ROUND(SUM(CAST(study_completed_count AS DOUBLE)) / SUM(CAST(study_count AS DOUBLE)) * 100, 2) AS "학습완료율"
FROM "text_biz_dm"."learning_analytics_content"
WHERE 1 = 1    
    AND CONCAT(yyyy, mm) = '202208'
    AND subject_name = '수학' -- 수학 외 다른 subject_name 전체 조회조건
    AND grade BETWEEN 1 AND 6 
GROUP BY subject_name, grade -- 그룹바이 뒤에는 유니크한값을 기준으로 계산을 한다. 어떻게? 
HAVING ROUND(SUM(CAST(study_completed_count AS DOUBLE)) / SUM(CAST(study_count AS DOUBLE)) * 100, 2) < 95
ORDER BY grade ASC -- 기준값이 되는 컬럼을 오름차순 DESC OR 내림차순 ASC
;

