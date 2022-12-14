# 데이터 받아오기
1. 
http://data.nsdi.go.kr
행정구역 받기
구글에서 서울 행정구역 다운로드 등 치면된다.
http://www.gisdeveloper.co.kr/?p=2332
시도,  시군구,   읍면동,  리 등의 데이터를 .SHP 파일로 다운받을 수 있다.
.dbf,   .prj,   .shp,   .shx  4개가 압축된 파일을 받는다.

2.  QGIS
구글에서 QGIS 검색후 윈도우용으로 설치
https://qgis.org/ko/site/

3. 데이터 가져오기
압축파일 드래그앤드랍
레이어 우클릭 - 속성테이블 확인
동그란거에 i표시있는 개체 식별 버튼 클릭

레이어 - 레이어추가 - 벡터레이어추가
- 인코딩 설정 : 우선순위는 utf-8, cp949, euckr
- 다운받은 4개의 파일 전체 선택해서 열기
- 추가 - 확인
- 한글깨진것 확인 : 객체식별(i아이콘모양).  원하는 지역 누르고 오른쪽 식별결과 보기

4. 필요한 데이터만 뽑기
- 왼쪽밑 레이어 우클릭 - 필터 설정 - EMD_CD클릭후 LIKE 쿼리문 완성시키기
  //지역코드는 구글에서 법정동코드 검색해서 찾으면된다.
- 필터안된건 체크해제
네모에 커서표시 단일선택으로 선택후 제거
연필 아이콘으로 편집 토글로 변경은 계속 안됨


- 우클릭 내보내기 - 객체를 다른이름으로 저장
  좌표계를 기본좌표계 EPSG로 변경


4. 최적화
mapshaper.org
Simplify 버튼 클릭하고 단순화 정도 조절

5. 데이터 확인
geojson.io


---
# json형태 분석
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "SIG_CD": 11110,
        "SIG_ENG_NM": "Jongno-gu",
        "SIG_KOR_NM": "종로구"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                127.00864326221884,
                37.580468252047105
              ],
              [
                127.00871274905404,
                37.58045116513156
              ],
              [
                127.00876564011087,
                37.580443107078565
              ],
      //이렇게 9340줄까지 이어지다가
              [
                127.00864326221884,
                37.580468252047105
              ]
            ]
          ]
        ]
      }
    },
    {
      "type": "Feature",


---
# 카카오맵 api사용
1. 구글에서 카카오맵 api사용 검색해서 공식 사이트 들어가기
2. 토큰 받기
3. 주소 등록
4. 샘플코드 적용 후 확인
4. 다각형에 이벤트등록하기2 참조
  // 카카오공식사이트의 예제는 areas배열안에 { name, path},{ name, path},{ name, path}
var areas = [
    {
        name : '용산구',
        path : [
            new kakao.maps.LatLng(37.5548768201904, 126.96966524449994),
            new kakao.maps.LatLng(37.55308718044556, 126.97642899633566),
          ]
    }, {
        name : '중구',
        path : [
            new kakao.maps.LatLng(37.544062989758594, 127.00854659142894),
            new kakao.maps.LatLng(37.54385947805103, 127.00727818360471),
5. 블로그 https://jjjayyy.tistory.com/9
6. displayArea의 coordinates의 배열이 문제
  들여쓰기 해서 제대로 분석해서 고침


## shapefile
> 지리정보시스템 소프트웨어를 위한 지리공간벡터데이터형식
	
	shp, shx, dbf 3개의 확장 포맷을 통틀어 shapefile이라고 한다.
		.shp : 기하학정보.   점 선 면 중 하나의 속성을 갖는다.    예) 대한민국최신행정구역.shp
		.shx : 기하학 정보의 인덱스
		.dbf : 속성정보
		.sbn : 공간 인덱스
	SHP파일은 ESRI사의 GIS프로그램 ArcView에 사용되는 용도로 만들어진 포맷이지만 거의 모든 GIS프로그램에서 표준으로 사용되고 있다.
	사용하려면 QGIS툴을 이용해야한다.  자유오픈소스지리정보시스템 https://qgis.org/ko/site/
  https://docs.qgis.org/3.10/ko/docs/index.html
		설치위치 :  C:\Program Files\QGIS 3.28.0\
		
		플러그인 - 플러그인 관리 및 설치 - TMS for Korea
		불러오기
			메뉴 - 레이어 - 레이어추가 - 벡터레이어 추가
			또는
			드래그랜 드랍
		필터링
			선택후 - 레이어 - 필터링
