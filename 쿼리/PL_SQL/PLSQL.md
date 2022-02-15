> Procedural Language extension to SQL
- SQL을 절차적 언어같이 쓸수있도록 한 언어.
- 서버 프로세서는 PL/SQL블록을 받아서 SQL와 Procedural을 나눠서 SQL은 Sql Statement Executer 로 보낸다.

- 장점
    - 변수사용가능
    - 제어문 사용가능
    - 예외처리 가능
- 단점
    - 한번에 하나의 명령문만 사용가능하기 때문에 트래픽 증가
    - 형상관리 못한다.
    - 유지보수 힘들다.
- 문법
    1. DECLARE
    2. BEGIN (필수)
      - INTO : 쿼리결과를 변수에 대입
      - 대입은 :=
      - DBMS_OUTPUT.PUT_LINE    DBMS에 결과값 출력
      하려면 SET SERVEROUTPUT ON; 해줘야한다.
    3. EXCEPTION
    4. END (필수)

- 예제
【예제 】
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
