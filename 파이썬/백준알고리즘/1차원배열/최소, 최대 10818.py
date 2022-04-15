# 첫째줄에는 정수의 갯수
# 둘째줄에는 N개의 정수.  공백으로 구분하여
# 정수 N개의 최솟값과 최댓값을 공백으로 구분해 출력하여라

N = int(input())
arr = list(map(int, input().split()))
max = arr[0]
min = arr[0]
for i in arr:
    if (i>max):
        max = i
    if(i<min):
        min = i
print(min, max)


# 메모리 149440 KB
# 시간 492 ms
