import sys


## 첫줄은 테스트케이스의 갯수
## 다음줄은 각각 두정수 A와 B
## 각 테스트케이스마다 A+B를 한줄에 하나씩 순서대로 출력

inp = int(input())
for i in range(inp):
        a,b = map(int, sys.stdin.readline().split())
        print(a+b)