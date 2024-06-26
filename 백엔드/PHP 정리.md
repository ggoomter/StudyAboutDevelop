### 환경설정
- cmd 에서 버전 확인 php -v
- xampp
C:\xampp\apache\conf\httpd.conf 열어서 Define SRVROOT 부분 경로 확인
C:\xampp\php

### PHP기본문법
- PHP문서임을 알리는 시작
```PHP
1. PHP 권장 스타일      : <?php ... ?>
2. HTML 스크립트 스타일 : <script language = "php"> ... </script>
위의 2개는 어떤 상황에서도 정확히 인식되니 위의 2개를 쓰는것을 권장

1. SGML 스타일          : <? ... ?>
2. ASP 스타일           : <% ... %>
```
- 세미콜론을 자동으로 적어주나 습관적으로 적어주도록 하자
- PHP코드를 종료한다는 태그는 생략할 수도 있지만 습관적으로 적어주도록 하자.
- PHP는 **키워드, 클래스, 함수, 사용자함수 이름에서 대소문자를 구분하지 않는다. 변수이름에는 대소문자를 구분한다.**
- PHP의 주석은 3가지가 가능하다.
```PHP
- 한줄주석         // 내용
- 여러줄 주석      /* 내용 */
- 한줄 쉘 스타일   # 내용
```
- echo() 함수는 printf 함수와 같다.  그러나 실제함수가 아니라 언어구조(language construct)라서 인수를 전달할때 괄호를 생략할 수 있다. 그러나 2개이상의 인수를 전달할때는 반드시 괄호가 없어야 한다.
- 문자열 결합 연산자 마침표(.)   echo "안녕하세요" .$username. "님. "
- echo를 사용할때 배열이 아닌 일반 변수는 큰따옴표로 둘러싼 문자열안에 포함시킬 수 있다.
	- 예시 : $name="홍길동";    echo "안녕하세요, $name 입니다! "
- 변수
	- 변수이름은 대소문자를 구분한다.
	- 선언
		- $변수명 = 값;
	- 데이터타입
		- 기본적으로 다이나믹 타입드.   타입확인은 gettype()
		- 기본타입
			- 불리언, 정수, 실수, 문자열, 배열, 객체, 리소스, NULL
	- 큰따옴옴표로 변수이름을 문자열내에서 사용하면 자동치환된다.        작은따옴표는 문자 그대로가 출력된다.
	   예) $x = "John";      echo "Hello $x";
	- PHP만의 이상한 문법이 있는데 $변수명뒤에 바로 다른문자가 오게 되면 그것을 이은 이름의 변수를 찾게 된다. 그렇기 때문에 변수이름을 중괄호로 감싸서 PHP파서가 변수이름을 정확하게 인식할 수 있도록 하자.
		```PHP
		$var = 10;
		echo "변수 \$var에 저장된 값은 {$var}입니다."; // 변수 $var에 저장된 값은 10입니다.
		```
	- 가변변수를 사용하여 변수의 이름을 동적으로 변경할 수 있다.
	- 함수밖에서 선언된 변수를 함수내부에서 접근하고자하면 global 키워드를 함께 사용해야한다.
		- PHP에 내장된 슈퍼글로벌 변수는 스크립트 내부 어디에서든 사용할 수 있다. (글로벌스, 서버, 겟, 포스트, 쿠키, 파일즈, 엔브, 리퀘스트, 세션 )
		- PHP는 모든 전역변수를 $GLOBALS 배열에 저장한다.
- 상수
	- 선언
		- define(상수이름, 값, 대소문자구분여부)
		- const 상수명 = 값;
	- 미리정의된 마법상수
```php
__LINE__ : 파일의 현재 줄번호
__FILE__ : 파일의 전체경로 (include 내부에서 사용할 경우 include된 파일명)
__DIR__ :  파일의 디렉토리 (포함한 파일안에서 사용할 경우 포함된 파일의 디렉토리)
__FUNCTION__ : 함수명
__CLASS__ : 클래스명
__TRAIT__ : 트레이트명
__METHOD__ : 메소드명
__NAMESPACE__ : 네임스페이스명
```
- 배열
	- PHP에서 배열은 맵(키, 밸류) 으로 구성된 순서가 있는 집합
	- 정수, 문자열 외의 타입을 키값으로 사용하면 아래의 규칙대로 자동 형변환이 이루어진다.
		- 불리언은 true는 1로, false는 0으로 자동 타입 변환됩니다.
		- 유효한 숫자로만 이루어진 문자열은 정수나 실수로 자동 타입 변환됩니다.
		- 실수는 소수 부분이 제거되고, 정수로 자동 타입 변환됩니다.
		- NULL은 빈 문자열("")로 자동 타입 변환됩니다.
		- 배열과 객체는 배열의 키값으로 사용할 수 없습니다.
	- 선언
		```php
		$배열명 = array(
		    키 => 밸류,
		    키 => 밸류,
		    키 => 밸류
		)
		```
- 객체
	- 클래스정의
	```php
	class 클래스명 {
		function 생성자함수(){
			할일
		}
}
	```
	- 인스턴스생성
	```php
	$변수명 = new 클래스명;
	echo $변수명->변수명;   //객체의 속성 출력
	```
- 함수
	- 자바스크립트와 문법 같음

---
### PHP에서 MYSQL연결
- PHP에서는 MySQLi 또는 PDO(PHP Data Objects)라는 2가지 중요한 확장을 제공한다.
- i는 improved의 약자
```php
$conn = new mysqli($servername, $username, $password, $database);
```



---
### 웹개발
- $_POST,   $_GET  , $_REQUEST 배열을 사용하여 폼 데이터에 접근할 수 있다.
- 


---
### PHP 프레임워크
1. Laravel
Laravel은 MVC (Model-View-Controller) 아키텍처 패턴을 따르는 강력하고 우아한 PHP 프레임워크입니다. 라우팅, 캐싱, 인증 및 데이터베이스 관리와 같은 웹 애플리케이션을 구축하기 위한 강력한 도구와 기능을 제공합니다. Laravel은 표현적인 구문, 개발자 친화적인 문서 및 크고 활발한 커뮤니티로 유명합니다.

2. Symfony
Symfony는 재사용 가능한 컴포넌트에 중점을 둔 매우 유연하고 확장 가능한 PHP 프레임워크입니다. MVC 패턴을 따르며 라우팅, 폼 처리, 보안 및 테스트와 같은 다양한 기능을 제공합니다. Symfony는 안정성, 성능 및 광범위한 문서로 유명합니다. 대기업에서 널리 사용되며 번들과 확장 프로그램의 강력한 생태계를 갖추고 있습니다.

3. CodeIgniter
CodeIgniter는 배우고 사용하기 쉬운 가벼운 PHP 프레임워크입니다. MVC 패턴을 따르며 작은 규모의 프로젝트에 이상적입니다. CodeIgniter는 웹 개발에 직관적인 접근 방식을 제공하며 데이터베이스 추상화, 폼 유효성 검사 및 세션 관리와 같은 기능을 포함합니다. 학습 곡선이 낮고 간결성과 성능을 선호하는 개발자에게 적합합니다.

4. CakePHP
CakePHP는 성숙하고 기능이 풍부한 PHP 프레임워크로 MVC 패턴을 따릅니다. 개발자가 파일을 구성하는 대신 코드 작성에 집중할 수 있도록 구성보다 규칙을 따르는 접근 방식을 제공합니다. CakePHP는 데이터베이스 액세스, 캐싱, 유효성 검사 및 보안에 대한 내장 기능을 제공합니다. 강력한 커뮤니티와 다양한 플러그인 및 확장 프로그램이 제공됩니다.

5. Zend Framework
Zend Framework는 강력하고 유연한 PHP 프레임워크로 MVC 패턴을 따릅니다. 견고한 웹 애플리케이션을 구축하기 위한 전문적인 컴포넌트 모음을 제공합니다. 라우팅, 캐싱, 인증 및 국제화와 같은 기능을 제공합니다. 성능, 확장성 및 기업 수준의 보안으로 유명합니다.

6. Yii
Yii는 높은 성능의 PHP 프레임워크로 MVC 패턴을 따릅니다. 빠르고 안전하며 효율적으로 설계되었습니다. 데이터베이스 액세스, 캐싱, 인증 및 RESTful API 개발과 같은 기능을 제공합니다. 깔끔하고 우아한 코드베이스를 갖추고 있으며 소규모 및 대규모 애플리케이션 개발에 적합합니다.

7. Slim
Slim은 작은 규모의 RESTful API 및 웹 서비스를 구축하기에 이상적인 가벼운 PHP 마이크로 프레임워크입니다. 개발자가 깨끗하고 효율적인 코드 작성에 집중할 수 있도록 최소한의 기능을 제공합니다. Slim은 라우팅, 미들웨어 지원 및 의존성 주입을 제공합니다. 간결성, 속도 및 사용 편의성으로 유명합니다.

8. Phalcon
Phalcon은 C 확장으로 구현된 풀 스택 PHP 프레임워크입니다. 높은 성능과 낮은 리소스 소비를 제공합니다. Phalcon은 MVC 패턴을 따르며 라우팅, 캐싱, ORM 및 보안과 같은 기능을 제공합니다. 속도, 확장성 및 개발자 친화적인 문서로 유명합니다.

9. FuelPHP
FuelPHP는 유연하고 모듈식인 HMVC (Hierarchical Model-View-Controller) 아키텍처 패턴을 따르는 PHP 프레임워크입니다. 라우팅, 캐싱, 유효성 검사 및 ORM과 같은 기능을 제공합니다. FuelPHP는 간결성, 성능 및 보안에 중점을 둡니다. 학습 곡선이 낮으며 소규모 및 대규모 프로젝트에 적합합니다.

10. Slim
Phalcon은 C 확장으로 구현된 풀 스택 PHP 프레임워크입니다. 높은 성능과 낮은 리소스 소비를 제공합니다. Phalcon은 MVC 패턴을 따르며 라우팅, 캐싱, ORM 및 보안과 같은 기능을 제공합니다. 속도, 확장성 및 개발자 친화적인 문서로 유명합니다.
출처: https://fathory.tistory.com/205 [fathory's blog:티스토리]