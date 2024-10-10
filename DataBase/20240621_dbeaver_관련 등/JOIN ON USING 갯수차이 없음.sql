SELECT * FROM "text_biz_dw"."e_test"

SELECT * FROM "text_biz_dw"."e_media" LIMIT 10 -- 146,720,305

-- 두개의 컬럼이 동일해야한다.
-- USING은 
SELECT mcode, userid
FROM    (
        SELECT mcode, userid
        FROM "text_biz_dw"."e_test"
        WHERE concat(YYYY,MM) = '202212'
) AS es
INNER JOIN (
            SELECT mcode, userid
            FROM "text_biz_dw"."e_media"
            WHERE concat(YYYY,MM) = '202212'
        ) AS em
    USING(mcode, userid) -- 컬럼을 통째로 붙일때 USING
;

----

SELECT 
    es.mcode AS es_mcode, 
    es.userid AS es_userid, 
    em.mcode AS em_mcode, 
    em.userid AS em_userid
FROM (
        SELECT mcode, userid
        FROM "text_biz_dw"."e_test"
        WHERE concat(YYYY,MM) = '202212'
    ) AS es
INNER JOIN (
            SELECT mcode, userid
            FROM "text_biz_dw"."e_media"
            WHERE concat(YYYY,MM) = '202212'
        ) AS em
ON es.mcode = em.mcode AND es.userid = em.userid
;
---------------------- sub쿼리 사용방법
----- using on 값은 같다.

SELECT COUNT(*) AS record_count -- 3656680
FROM (
    SELECT 
        es.mcode AS es_mcode, 
        es.userid AS es_userid, 
        em.mcode AS em_mcode, 
        em.userid AS em_userid
    FROM (
            SELECT mcode, userid
            FROM "text_biz_dw"."e_test"
            WHERE concat(YYYY,MM) = '202212'
        ) AS es
    INNER JOIN (
                SELECT mcode, userid
                FROM "text_biz_dw"."e_media"
                WHERE concat(YYYY,MM) = '202212'
            ) AS em
    ON es.mcode = em.mcode AND es.userid = em.userid
) AS joined_results;

SELECT COUNT(*) AS record_count -- 3656680
FROM (
    SELECT mcode, userid
FROM    (
        SELECT mcode, userid
        FROM "text_biz_dw"."e_test"
        WHERE concat(YYYY,MM) = '202212'
) AS es
INNER JOIN (
            SELECT mcode, userid
            FROM "text_biz_dw"."e_media"
            WHERE concat(YYYY,MM) = '202212'
        ) AS em
    USING(mcode, userid) -- 컬럼을 통째로 붙일때 USING
) AS joined_results
;


