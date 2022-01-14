1. 얼마만큼 어디까지 공부해야할까?
https://github.com/kamranahmedse/developer-roadmap
내가 갈곳이 어디고, 내가 지금 어디있는지 네비게이션을 한번 켜봅시다.
우리는 이 끝없는 길에서 이제 첫발을 내딛고 있습니다.
이 많은 길 중 어느길로 가야할지는 자기가 뭘 하려고 하는지에 따라 다르다.
우리는 자바 스프링으로 웹 프로젝트를 만드는것이기 때문에 HTML부터 출발할것이다.

기본골격(철골, 시멘트) : html.  HTML의 본질은 정보.
인테리어(크기, 색깔) : css.     CSS의 본질은 보기좋게.
전기, 수도 : js.               JS의 본질은 반응.


HTML이란?
웹브라우저에서 보여지도록 설계된 문서 -> 웹브라우저에서 보는 문서(화면)
"Hypertext Markup Language"
하이퍼텍스트를 가장 중요한 특징으로 하는 / 마크업이라는 형식을 가진 / 언어.
하이퍼텍스트 : 하이퍼링크가 걸려있는 텍스트
언어란? : 사과라고 하면 사과가 떠오르는것처럼. 링고(일본어)라고 하면 사과가 안떠오르는것 처럼.  서로간의 의사소통에 미리 정해놓은 약속.
마크업언어 : 문서가 화면에 표시되는 '형식과 구조'가 명시된 언어.
//마크다운 : 마크업 언어의 일종.  서식에 글쓰는 흐름이 끊기지 않도록 <div></div>처럼 쓰던 마크업을 좀더 편하게 쓰도록 만든것.
즉 HTML은 다른 웹페이지로 이동할수 있는 형식과 구조가 명시된 언어.
프로그래밍 언어가 아니라 마크업언어. 굉장히 쉬워서 오늘 하루만에 배울수있다. 그러나 매우 중요하다.
공부를 할때는 쉽고 효율이 좋은걸 먼저 배워야 한다.
실습 > a.html만들고 hello world 치고 브라우저에서 띄우기.


<HTML의 구조>
실습 > 각자 아무 웹페이지 들어가서 요소 검사.
헤드(메타정보. 타이틀,  캐릭터셋:문자집합 ASCII, UNICODE 등.   인코딩:문자셋과바이트 매핑규칙. EUC-KR, UTF-8 등).
바디(HEADER, NAV, MAIN, ASIDE, FOOTER).   W3C. 브라우저.
  태그공부 : 콘텐츠를 감싸서 그 정보의 '형식과 구조'를 정의.
  모질라 https://developer.mozilla.org/ko/docs/Web/HTML,
  w3스쿨 https://www.w3schools.com/

  (H1~6, BUTTON, A, IMG 등)
  이상한 태그를 쓰더라도 브라우저는 에러임을 알지만 문서는 읽을수 있도록 자체적으로 처리하고 보여주기는한다. 실행이 안되는거 아니다.
  태그는 본질적으로 BOX형태로 이루어져있다.
    대표적인 BOX TAG : header/nav/footer, main/section/aside, article
    Box는 Block(공간이 충분해도 한줄에 하나)과 Inline(공간이 허용하는한 한줄에 여러개) 디스플레이로 나뉜다.
      Block의 예 : header, footer, p, li, table, div, h1~h6
      Inline의 예 : span, a, img,
검사 : validator.w3.org


### 다른 파일 가져오기(header, footer)
https://www.w3schools.com/howto/howto_html_include.asp
https://seokd.tistory.com/2
https://sjh836.tistory.com/52
1. html import
<link rel="import" href="header.html"> 더이상 지원하지 않음

2. iframe 태그 사용
<iframe src="./header.html"></iframe>
문제 : XSS 공격에 취약, 외부스타일 적용 어려움(특히height, 자동스크롤생김),
  웹크롤링 잘안됨(소스가 숨겨져있어서), 당연히 접근성, 사용성 저하 문제.
  속도 저하

3. jquery 사용 https://drsggg.tistory.com/270
$(document).ready(function(){
    $(#header).load("/header.html");
    $(#footer).load("/footer.html");
});

4. ajax 사용
<body>
     <div data-include-path="footer.html"></div>

    <script>

        window.addEventListener('load', function() {
            var allElements = document.getElementsByTagName('*');
            Array.prototype.forEach.call(allElements, function(el) {
                var includePath = el.dataset.includePath;
                if (includePath) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            el.outerHTML = this.responseText;
                        }
                    };
                    xhttp.open('GET', includePath, true);
                    xhttp.send();
                }
            });
        });

    </script>
</body>
