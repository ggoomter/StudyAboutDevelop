--����. ��ҹ��� �����Ѵ�.
���� �����ͺ��̽� �̸� : orcl
��Ʈ : 1521
SYS 	: ����Ŭ db������, super USER.  DATA dictionary �� ����������. ���� ��� sys1234
SYSTEM 	: SYS�� ���������� DB�� ������ ������ ����. ���� ��� sys1234
SCOTT 	: ����Ŭ���� �����ϴ� ���� ����� ����. 		�⺻ ��� : tiger
ggoomter	: ���� �ַ� ���� ����
		

<�����ڷ� ����>
���� id ġ�°�����  sys as sysdba


<��й�ȣ ���� Ǫ�°�. ���� 180��>
1. �����ڷ� ����
connect SYS as sysdba
2. ������� Ȯ��
select * from dba_profiles where profile = 'DEFAULT';
3. ������� �������� ����
alter profile default limit password_life_time unlimited;
4. ���� �� ����
alter user ������ account unlock;


<��� ����>
alter user ������ identified by �����;


