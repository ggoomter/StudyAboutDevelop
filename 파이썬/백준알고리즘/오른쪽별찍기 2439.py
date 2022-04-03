N = int(input())
# 지정된 길이만큼    *은 i개를 오른쪽에 찍고. 남은부분은 왼쪽에 공백으로 찍기
for i in range(1, N+1):
    print(" "*(N-i) + "*"*i)