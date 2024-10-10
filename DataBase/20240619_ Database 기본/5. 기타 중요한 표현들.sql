-- 기타 중요한 표현들

SELECT 
    gender
    , CASE
        WHEN gender = 'M' THEN 'male'
        WHEN gender = 'F' THEN 'female'
        ELSE 'no_data'
      END AS "성별"
FROM "text_biz_dm"."learning_analytics_user"
LIMIT 50
;
