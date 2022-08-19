Part4-1
### Ch01. 학습 전 기초사항
#### 01. 소개
강사 : 강현호(martin)
대본 읽고있는데 똑같은 말 또했는데 편집을 안했네 2분경
강의노트 : https://github.com/freeism/fast-campus-jpa/commits/main

#### 02. JPA소개
ORM : 추상적
JPA : 구체적
Hibernate : JPA의 구현체중 하나
Spring Data JPA : 스프링에서 Hibernate를 쓰기쉽게 한번더 감싼것. 좀더 객체지향적

Lock
Transaction
Entity : 인터페이스
Repository
Query
2019년부터 JPA를 Jakarta라는 이름으로 변경하기로 했다고한다.

ORM : Obejct Relation Mapping
객체지향적프로그래밍의 기본단위인 객체

#### 03. 스프링부트 프로젝트생성
1. 인텔리제이에서 빨리세팅
Spring Initializr
그룹 : 패키지명. 도메인의 역순
아티펙트 : 프로젝트의 이름
gradle
jar
jdk 8버전
의존성 : Lombok, Spring Web, Sprint Data JPA, H2 Database

2. hello world요청받아서 "hello-world"문자열 리턴하는 RestController만들고 junit으로 WebMvcTest

#### 04. Lombok 알아보기
아는것들임. @NonNull, noargument 이런것들 배움

#### 05. H2 DB 및 로그 설정
- 자바기반의 경량화된 관계형 데이터베이스. 
파일로 저장할수도, 메모리로 저장할수도.
프로젝트 초기 또는 프로젝트 배포후 junit테스트용으로 주로사용
- application.properties 보다 application.yml은 계층적 구조를 보다 더 잘드러낸다.
  - 의존성넣고
  - h2 console enable 설정해주고
  - 브라우저에서 localhost:포트/h2-console   하면 db접속화면 나온다. dbeaver대용으로 쓸수있다.
  - 인텔리제이는 Database 툴이 있고 sts에서도 플러그인으로 직접 db접속할수있다.

### Ch02. SpringData JPA 기초보기
#### 01. Repository Interface 계층 살펴보기
