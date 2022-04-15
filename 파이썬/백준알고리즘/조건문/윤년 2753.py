# 윤년이면1, 아니면 0을 출력
# 윤년 = (4의 배수 &&  !100의배수 )  || 400의배수

year = int(input())
if(  ((year%4==0) and (year%100!=0)) or year%400==0 ):
    print(1)
else:
    print(0)