> Procedural Language extension to SQL
- 오라클에서 SQL을 절차적 언어같이 쓸수있도록 한 언어.
- 블록구조로 이루어지며 PL/SQL 자신이 컴파일엔진을 포함하고 있다.
- 서버 프로세서는 PL/SQL블록을 받아서 SQL와 Procedural을 나눠서 SQL은 Sql Statement Executer 로 보낸다.
- DBeaver 에서는 그냥 쿼리형식이 아니고  procedures 탭에서 new 로 생성해야 먹힌다.아니면 오류 코드: ORA-06575
설명: 패키지 또는 함수 %s 은 부적당한 상태입니다
원인: SQL 문은 유효하지 않은 상태의 PL / SQL 함수를 참조합니다. Oracle은 함수 컴파일을 시도했지만 오류를 감지했습니다.
조치: 구문 오류 또는 참조 된 오브젝트에 대한 권한이 잘못 지정되었거나 누락되었는지 SQL 문 및 PL / SQL 함수를 점검하십시오 d에러뜬
- 종류
  - Procedure
  - Function
  - Trigger
- 장점
    - 변수사용가능
    - 제어문 사용가능
    - 예외처리 가능
    - BLOCK구조로 다수의 SQL문을 한번에 처리 + 
      실행계획을 최초의 한번할때만 검사해서 수행속도 향상
- 단점
    - 한번에 하나의 명령문만 사용가능하기 때문에 트래픽 증가
    - 형상관리 못한다.
    - 유지보수 힘들다.
- 문법
    1. DECLARE (선언부. Variable, Constant, Cursor, Exception 정의)
    2. BEGIN (필수. 실행부 시작)
      - INTO : 쿼리결과를 변수에 대입
      - 대입은 :=
      - DBMS_OUTPUT.PUT_LINE    DBMS에 결과값 출력
      하려면 SET SERVEROUTPUT ON; 해줘야한다.
    3. EXCEPTION
    4. END (필수. 실행부 끝)

- 예제1
```SQL
DECLARE
   vs_emp_name VARCHAR2(80);
BEGIN
   SELECT emp_name
   INTO vs_emp_name
   FROM employees
   WHERE employee_id = 100;

 DBMS_OUTPUT.PUT_LINE('찾아온 이름은... ' || vs_emp_name);

END;
```

- 예제2
deptno로 dname을 출력하는 사용자정의 함수 작성하기
```SQL
show serveroutput;
set serveroutput on;
create 또는 replace 프로시저명(v_deptno dept.deptno%type)
return dept.dname%type
is
    v_dname dept.dname%type;
begin
    select dname
    into v_dname
    from dept
    where deptno=v_deptno;

    return v_dname;
exception
    when others then
        dbms_output.put_line(sqlcode || sqlerrm);
        return 0;
end;
/
select empno, ename, deptno, 프로시저명(deptno) from emp;
또는
EXECUTE 프로시저명(파라미터);

```
