Part4-1
### Ch01. 학습 전 기초사항
#### 01. 소개
강사 : 강현호(martin)
대본 읽고있는데 똑같은 말 또했는데 편집을 안했네 2분경

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

#### 03. 실습을 위한 프로젝트 셋팅
인텔리제이에서 빨리세팅. Sprint Initializr
그룹 : 패키지명. 도메인의 역순
아티펙트 : 프로젝트의 이름
gradle
jar
jdk 8버전
의존성 : Lombok, Spring Web, Sprint Data JPA, H2 Database