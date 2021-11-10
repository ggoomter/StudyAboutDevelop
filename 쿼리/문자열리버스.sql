/* 계층형 쿼리 예제*/
WITH DATA AS
(
    SELECT '1' COL1 , NULL COL2, 'A' COL3 FROM DUAL
    UNION ALL
    SELECT '2' COL1 , '1' COL2, 'B' COL3 FROM DUAL
    UNION ALL
    SELECT '3' COL1 , '1' COL2, 'C' COL3 FROM DUAL
    UNION ALL
    SELECT '4' COL1 , '2' COL2, 'D' COL3 FROM DUAL
    UNION ALL
    SELECT '5' COL1 , '3' COL2, 'X' COL3 FROM DUAL
)
SELECT *
  FROM DATA
 START WITH COL2 IS NULL
 CONNECT BY PRIOR COL1 = COL2;
 --ORDER SIBLINGS BY COL3 DESC;
 /* 1 NULL A
    2  1   B
    4  2   D
    3  1   C /*한계층을 LEAF까지 파고 나서 다음계층을 하는구나. 한번에 한문장씩 실행.
*/


WITH STRINGS AS
(SELECT 'hello' ORIGINAL from dual
 UNION ALL
 select '12345' ORIGINAL from dual
 UNION ALL select 'this is a sentance.' from dual
 UNION ALL
 SELECT '한글 테스트' ORIGINAL FROM DUAL
 UNION ALL
 SELECT 'すみません' ORIGINAL FROM DUAL
)


/* 1. 단순 reverse함수. 한글, 일본어 번역 안된다. */
--SELECT REVERSE(ORIGINAL) FROM strings;


/*2. */
/* 모든행에 대해서 할거니까 START WITH 필요없다.
자기자신의 남은 길이를 하나씩 줄여가며 재귀 반복
sys_connect_by_path : 루트에서 부터 경로 반환. 이전 레벨의 결과를 살리기 위해서 사용*/
--SELECT LEVEL
--     , ORIGINAL
--     , replace(   sys_connect_by_path(substr(ORIGINAL, level*-1, 1), 'X'), 'X') rev_str   /*경로사이사이마다 아무거나(현재는 X)를 넣어줬다가 다시 제거.  */
--  FROM STRINGS
-- WHERE 1=1
--   --AND CONNECT_BY_ISLEAF = 1
--connect by prior ORIGINAL = ORIGINAL      --PRIO 자기 = 자기 AND PRIOR SYS_GUID() IS NOT NULL은 공식같은것.
--and prior sys_guid() is not null  --반복되지 않는 값을 반환하는 매우 값싼 함수.  이전행을 고유하게 만들고 무한루프를 방지한다. 16바이트의 고유식별자를 반환한다.
--and level <= length(ORIGINAL);


/*2. */
/* 이해
*/
--SELECT LEVEL
--     , ORIGINAL
--     , substr(ORIGINAL, level*-1, 1) rev_str   /*한글자씩 자르기 */
--     , sys_connect_by_path(substr(ORIGINAL, level*-1, 1), ',')
--     ,  replace(   sys_connect_by_path(substr(ORIGINAL, level*-1, 1), 'X'), 'X')
--  FROM STRINGS
-- WHERE 1=1
--   --AND CONNECT_BY_ISLEAF = 1
--connect by prior ORIGINAL = ORIGINAL      --PRIO 자기 = 자기 AND PRIOR SYS_GUID() IS NOT NULL은 공식같은것.
--and prior sys_guid() is not null  --반복되지 않는 값을 반환하는 매우 값싼 함수.  이전행을 고유하게 만들고 무한루프를 방지한다. 16바이트의 고유식별자를 반환한다.
--and level <= length(ORIGINAL);


/* 피봇으로 해보자. 언피봇은 컬럼명과 데이터영역이 열에서 행으로 바뀐다. GROUP BY  와 집계함수, DECODE를 사용하는것을 대체해서 코드가 간결해진다.
어? 저걸 보고 GROUP BY  로 하는게 더 간편할거라는 생각이듬*/

--    SELECT LEVEL
--         , ORIGINAL
--         , substr(ORIGINAL, level*-1, 1) rev_str   /*한글자씩 자르기 */
--      FROM STRINGS
--     WHERE 1=1
--       --AND CONNECT_BY_ISLEAF = 1
--    connect by prior ORIGINAL = ORIGINAL      --PRIO 자기 = 자기 AND PRIOR SYS_GUID() IS NOT NULL은 공식같은것.
--    and prior sys_guid() is not null  --반복되지 않는 값을 반환하는 매우 값싼 함수.  이전행을 고유하게 만들고 무한루프를 방지한다. 16바이트의 고유식별자를 반환한다.
--    and level <= length(ORIGINAL);
--


SELECT MAX(A.LV)
               , A.ORIGINAL
                , LISTAGG( A.rev_str,'') WITHIN GROUP (ORDER BY A.LV) 역순
FROM (
        SELECT LEVEL LV
         , ORIGINAL
         , substr(ORIGINAL, level*-1, 1) rev_str   /*한글자씩 자르기 */
      FROM STRINGS
     WHERE 1=1
       --AND CONNECT_BY_ISLEAF = 1
    connect by prior ORIGINAL = ORIGINAL      --PRIO 자기 = 자기 AND PRIOR SYS_GUID() IS NOT NULL은 공식같은것.
    and prior sys_guid() is not null  --반복되지 않는 값을 반환하는 매우 값싼 함수.  이전행을 고유하게 만들고 무한루프를 방지한다. 16바이트의 고유식별자를 반환한다.
    and level <= length(ORIGINAL)
)  A
GROUP BY A.ORIGINAL;
