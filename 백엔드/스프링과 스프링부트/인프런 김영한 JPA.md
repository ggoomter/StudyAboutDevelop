인프런 김영한을 들으면서 추가로 공부한것 같이
- D:\DEVELOPE\김영한스프링부트jpa\jpashop-v20210728  에 소스풀고 인텔리제이로 로딩
- gradle-wrapper.properties  에서 그래들버전 7.6
- 자바버전 17로 변경
- 파일에서 찾기로 javax 를 jakarta로 수정
- .TaskSelectionException: Task 'run' not found in root project  에러
	- finished with non-zero exit value 1
	- 지정된 JRE를 사용할 수 없음
	- SDK로 semeru-11 이 계속 설치됨
	- 와... 2시간걸렸다. 오른쪽 상단 run버튼 옆에 있던 편집에서 위와 같이 되어있었음

### 이론
- JPA에서 가장 중요한것은 '객체와 관계형 데이터베이스 테이블이 어떻게 매핑되는 지를 이해하는 것'
- JPA의 목적은 객체지향프로그래밍과 관계형 데이터베이스 사이의 패러다임 불일치를 해결하는 것이기 때문에
- 연관관계 매핑을 할때 생각해야 할것은 크게 3가지
	- 방향
	- 연관관계의 주인
	- 다중성
- 데이터베이스의 테이블은 한쪽에만 FK가 있고 그것으로 서로 조인이 가능하다.
  객체는 참조용 필드가 있는 쪽에서만 다른 객체를 참조하는 것이 가능하다.
  한쪽에만 있으면 단방향관계, 
  두객체 모두가 각각 참조용 필드를 갖고있으면 양방향관계라고 한다.
  엄밀하게는 양방향관계는 없고 두객체가 단방향참조를 각각 가져서 양방향 관계처럼 사용하는 것이다.
- User Entity인 경우 굉장히 많은 엔티티와 연관관계를 가지는데 관계가 있는 모든엔티티에 양방향 관계로 설정하면 복잡성이 너무 증가한다. 기본적으로 단방향 매핑으로 하고 역방향 객체 탐색이 꼭 필요할 경우 추가하자.
  
### tips
- devtools 의존성 추가하면 캐시같은거 안쓰고 새로 쓴다.
	- 잘깔렸으면 로그에 [ restartedMain] 이렇게 뜬다.
	- 그런데 타임리프 바뀌면 바로 반영되는데 아니라 인텔리제이 build 메뉴에서 그 파일만 recompile 해주면된다. 서버사이드 렌더링이 때문에
- ctrl shift t : 인텔리제이에서 test파일 생성
- tdd 탭 했을때 //given //when //then 주석 까지 생기면서 단위테스트 함수 만들어지기
	- 인텔리제이 template / Live Templates에서 만들어준것
- ctrl alt v  : 사랑하는단축키 변수명 뽑는거라는데 잘 안됨
- JPA에서 쿼리 파라미터 로그에 남기기
	- org.hibernate.type : trace로 주면된다.
	- 아예 매핑된걸 보려면 외부 라이브러리 쓰면된다. spring-boot-data-source-decorator
- 스프링부트가 지원하지 않는, 미리 세팅을 안맞춰놓은 애들은 의존성 가져올때 버전 적어줘야한다.



### 수업
- h2
	- 개발, 테스트용도의 매우 가벼운 db. 웹화면 제공
	- C:\Program Files (x86)\H2
	- 설치폴더의 bin으로 가서 h2.bat 실행하면 웹화면 뜸
	- 앞의주소만 localhost로 변경
	- JDBC URL 에 jdbc:h2:~/jpashop  로 바꾸고 연결 누르면 들어가지고 db 폴더 만들어짐
	- 연결끊기 버튼 누른다음 jdbc:h2:tcp://localhost/~/jpashop  이것으로 접속
	- db파일 생성을 위해서 localhost로 접속했고 다음부터는 네트워크로 접속하는것임
	- 실행하던 콘솔을 끄면 db가 꺼지게 된다.
	- 앞으로 접속은 localhost:8082 로 하면된다.
- JPA와 DB설정
	- application.yaml 에 설정같은거 어디서 공부하나요?
		- 스프링부트 공식사이트 Projects / SpringBoot  / Learn / 레퍼런스 도큐먼트
- Repository
	- Entity(DTO같은역할)를 찾아주는애 DAO같은 개념
	- 그놈안에서 EntityManager를 통해 정의되어있는 함수로 crud작업
	- EntityManager를 통해 이루어지는 작업은 모두 Transaction안에서 이루어져야한다.  @Transactional 넣자.
	- 그런데 트랜잭션이 Test에 있으면  Rollback을 한다.
	- 만약 테스트에서도 트랜잭션 결과 반영하고 싶다면 @Rollback(false)
	- 같은 영속성 컨텍스트내에 있으면 pk가 같으면 같은놈으로 인식한다.
- Entity
	-  @Inheritance(strategy = InheritanceType.3가지중 하나)  상속받을때
		- 싱글테이블 = 항테이블에 다 때려박기
		- 테이블퍼클래스 = 각각 테이블로
		- 조인드 = 정규화된 스타일

## 연관관계의 주인(중요)
Team : Member = 1:n 관계일때
멤버가 팀을 참조한다. Member가 Team의 pk를 fk로 가지게 된다.
Member가 fk를 가지고 있으므로 연관관계의 주인이 된다.
결론적으로는 FK를 관리하는쪽(N쪽)이 연관관계의 주인이 된다. 무조건!!
상식적으로 연관관계의 주인은 당연히 1쪽이 되어야할것 같은데 그 반대다.
그 이유는 우리가 기존에 알고있던것은 '테이블' 에서의 연관관계이며
지금 다루고 있는것은 객체(Entity)에서의 연관관계이기 때문이다.
엔터티에서는 1쪽, N쪽 둘다 FK를 관리할 수 있기 때문에 정하기 나름

게시글을 다른게시판으로 이동하려고 할때
post객체에서 setBoard를 쓸것이고 Post에 board를 fk로 두고있으므로 Post가 연관관계의 주인이다.
그럴때 Post에서 Board를 수정할때만 fk를 수정하겠다 라고 정한것이다.


**@JoinColumn은 본인이 외래키를 관리하며 상대 테이블의 pk를 명시해주는 역할을 한다.(조인할때 사용)
```java
  class Memeber{
	    @Id
	    @GeneratedValue
	    private Long id;
	    
	    @ManyToOne
	    @JoinColumn(name = "TEAM_ID")    //JoinColumn을 선언한쪽이 주인.  현재 엔티티 테이블에 생성될 외래키 컬럼의 이름이지 대상테이블의 컬럼명이 아니다.
	    private Team team;
  }
```
@mappedBy는 연관관계의 주인이 아닌쪽의 Class에서 사용한다.**
```java
@Entity
public class Team {

    @Id
    @GeneratedValue
    private Long id;

	@OneToMany(mappedBy = "team")    //Member의 team필드가 연관관계의 주인이며 Team은 그 관계를 받아들이는 쪽
    private List<Member> members = new ArrayList<>();
}
```

- @Entity
	- DTO 같은 역할
	- @ManyToOne
	- @JoinColumn(name = "order_id")
	- @Embedded = 사용자가 직접 정의한 데이터 타입을 내장으로 포함
- 🎯 연관관계별 @JoinColumn 사용
※ @OneToOne : @JoinColumn을 사용하는 Entity가 연관관계의 주인, 즉 FK를 가진다.
※ @ManyToOne : @JoinColumn을 사용하는 Entity가 연관관계의 주인, 즉 FK를 가진다.
※ @OneToMany : @JoinColumn을 사용하는 Entity의 반대 Entity가 연관관계의 주인, 즉 FK를 가진다.
※ @ManyToMany : @JoinColumn을 사용하는 Join Table(Entity)가 연관관계의 주인, 즉 FK를 가진다.

Enum은 Ordinal과 String이 있는데 꼭 String
사용할때는 @Enumerated를 넣어줘야한다.