
- 언리얼 표준 Coding Standard를 따라라. https://docs.unrealengine.com/latest/INT/Programming/Development/CodingStandard/



<강의>
[공식 학습](https://docs.unrealengine.com/4.26/ko/)
근데 공식문서가 언리얼버전만큼 최신화가 빨리 안된다. 언리얼엔진은 버전별로 바뀐부분이 꽤나 있기 때문에 막히는부분이 많다.


# 클래스
### 생성
콘텐츠 브라우저 우클릭 - 새C++ 클래스 - 부모클래스 선택 - 이름정하고 클래스 생성버튼
콘텐츠 브라우저 소스 - C++클래스 - 프로젝트명 - 클래스 리스트 보인다.
클래스를 열어보면 기본생성자, BeginPlay함수, Tick함수가 생성되어있다.
    - Tick :  Actor가 활성화되어있는시간동안 일정프레임마다 한번씩 호출되는 함수. 주로 게임의 로직을 구현

<빌드>
- vscode의 솔루션탐색기에서 빌드
- 언리얼엔진 상단의 컴파일

<로그>
UE_LOG(LogTemp, Log, TEXT("출력할문자열")) 라는 매크로 함수 사용
예) UE_LOG()
보는법 : 창 - 개발자툴 - 출력로그

## 변수
언리얼엔진의 C++클래스에서 변수를 만들고 사용하기 위해서는 클래스의 헤더 파일에서

<선언>
UPROPERTY() //언리얼엔진에 이런 프로퍼티가 있음을 알림
변수타입 이름;

### 데이터타입
bool, short int, long, double, String
플랫폼마다 다른 길이를 고정하기 위해서 int8, int16, int32, int64를 제공한다.

언리얼에서는 여러가지 String타입을 제공한다.
FString은 오리지널 C++의  std::string와 유사하게 동작한다.
    "" 로 못넣고 TEXT()매크로를 사용해야한다.

### 접근지정자
public, protected, private
원래 C++에서는 자바처럼 안쓰고 윗줄에 따로 적고 끝에는 콜론을 달아줘야한다. 그럼 다음 지정자가 등장할때까지 해당지정자를 따르게된다.
https://www.youtube.com/watch?v=SGrH9vZUWDk&list=PLYQHfkihy4Axdf9EKKbgIlRppRmCoj1rv&index=7&ab_channel=%EB%B2%A0%EB%A5%B4%EC%9D%98%EA%B2%8C%EC%9E%84%EA%B0%9C%EB%B0%9C%EC%9C%A0%ED%8A%9C%EB%B8%8C
9분