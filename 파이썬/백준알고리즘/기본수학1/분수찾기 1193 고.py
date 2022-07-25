# 1/1   1/2   1/3   1/4   1/5   ...
# 2/1   2/2   2/3   2/4   2/5   ...
# 3/1   3/2   3/3   3/4   3/5   ...
# 무한히 큰 배열에 다음과같은 분수들이 적혀있다.
# 오른쪽 하나, 밑쪽 하나 순서로 차례대로 순서가 증가할때 x번째 분수를 구하는 프로그램 작성.
# 예) 1  ->  1/1
# 예) 3  ->  2/1
# 풀이 : 지그재그로 대각선이 하나씩 생긴다.
# 짝수번째 대각선일때는 왼쪽밑으로. 분자증가, 분모감소
# 홀수번째 대각선일때를 오른쪽위로. 분모증가, 분자감소
# 대각선의 갯수는 1, 2, 3, 4...  시작지점은 1/n

import sys

targetNum = int(sys.stdin.readline())
fractionList = []

num = 0     #이번대각선에서의 몇번째
count = 0   #이놈 이전까지의 총갯수

# 대각선 하나
while count < targetNum:
    num += 1
    count += num
count -= num

if num % 2 == 0:  #짝수
    i = targetNum - count
    j = num - i + 1
else : # 홀수
    i = num - (targetNum - count) + 1
    j = targetNum - count
print(f"{i}/{j}")   # 파이썬의  fstring 포매팅