SELECT * FROM "text_biz_dw"."e_content_meta" limit 10;

-- 1. 이력, 일단위 처리
SELECT * FROM "text_biz_dw"."e_learning_time_proc" WHERE yyyy = '2022' AND mm = '07' AND DD = '31' LIMIT 10; 

SELECT * FROM "text_biz_dw"."e_learning_action_proc" WHERE yyyy = '2022' AND mm = '07' AND DD = '31' LIMIT 10;

SELECT * FROM "text_biz_dw"."e_menu_navi_proc" WHERE yyyy = '2022' AND mm = '07' AND DD = '31' LIMIT 10;

SELECT * FROM "text_biz_dw"."e_member" WHERE yyyy = '2022' AND mm = '07' LIMIT 10;

SELECT * FROM "text_biz_dw"."e_point" WHERE yyyy = '2022' AND mm = '07' LIMIT 10;

SELECT * FROM "text_biz_dw"."e_tablet" WHERE yyyy = '2022' AND mm = '07' LIMIT 10;

SELECT * FROM "text_biz_dw"."e_study" WHERE yyyy = '2022' AND mm = '07' LIMIT 10;

SELECT * FROM "text_biz_dw"."e_media" WHERE yyyy = '2022' AND mm = '07' LIMIT 10;






SELECT * FROM "text_biz_dw"."e_wrong" WHERE yyyy = '2022' AND mm = '07' LIMIT 10;

SELECT * FROM "text_biz_dm"."learning_analytics_user" WHERE yyyy = '2022' AND mm = '07' LIMIT 10;

SELECT * FROM "text_biz_dm"."learning_analytics_content" WHERE yyyy = '2022' AND mm = '07' LIMIT 10;


