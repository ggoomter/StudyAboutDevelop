/* snake_case 스네이크 케이스
 * PascalCase 파스칼케이스
 * camelCase 카멜케이스
 */
/* 원본이 의미가 있는단어끼리_로 연결되었다면 카멜케이스는 시작하는 알파벳을 대문자로 바꾼다.*/
/* 왜 스크립트 단에서는 카멜케이스를 쓰고 db단에서는 대문자와 언더바를 쓸까 -> 자바스크립트의 변수이름을 어떻게 지을지는 자유. 그러나 거의 모든 메이저 라이브러리와 핵심 API는 카멜케이스를 사용한다*/
/* INICAP : 각 단어의 첫글자를 대문자로, 나머지는 소문자로 변환하여 반환한다.  공백과 알파벳을 제외한 문자가 구분자가 된다.*/

WITH T AS(
	SELECT 'SKT_FAKER' AS val FROM DUAL
	UNION ALL
	SELECT 'SKT_BANGI_THE_JUNGLE' FROM DUAL
	UNION ALL
	SELECT 'ABCD_가나다라_1234_xyz' FROM DUAL
	UNION ALL
	SELECT 'a_bc_1_22_333' FROM DUAL
	UNION ALL
	SELECT 'A_bC_3_45_678' FROM DUAL
	UNION ALL
	SELECT 'XY_3Z_1_004' FROM DUAL
	UNION ALL
	SELECT 'XY3___z_100_0__4' FROM DUAL
	UNION ALL
	SELECT '_AB_cd100_0__4' FROM DUAL
)
--SELECT val
--	, INITCAP(val)	/*첫글자 대문자로 변경*/
--	, REPLACE(val, '_')	/* 언더바 제거*/
--	, REPLACE(INITCAP('i'||val),'_')	/*첫글자는 소문자로 변경하기위해 아무글자를 앞에 더해줌*/
--	, SUBSTR( REPLACE(INITCAP('i'||val),'_'),2)	/*더한 첫글자를 뺀 2번째글자부터 자르기*/
--FROM T;


/* 그런데 제일처음에 언더바로 시작하는건 거르지 못하는걸 발견해서 처리 */
SELECT val
	, CASE SUBSTR(val, 2,1)
      WHEN '_' THEN CONCAT(UPPER(SUBSTR(val, 1, 1)), SUBSTR(REPLACE(INITCAP(val), '_'),2))	/*첫글자는 대문자로 하나만 자르고, 뒤는 카멜케이스형태*/
      ELSE SUBSTR(REPLACE(INITCAP('i'||val),'_'),2)
      END AS "카멜케이스"
  FROM T;