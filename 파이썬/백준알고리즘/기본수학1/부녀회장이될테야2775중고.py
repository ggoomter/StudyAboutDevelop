# a층의 b호에 살려면 아래층의 1호부터 b호까지 사람들의 수의 합만큼 사람들을 데려와 살아야 한다.
# 비어있는 집은 없고 모든 거주민들이 이 계약조건을 지키고 있다.
# 주어지는 양의정수 k층, n호에 대해 몇명이 살고있는지 출력하라.
# 단, 0층부터 있고 각층에는 1호부터 있으며, 0층 i호에는 i명이 산다.
# 예제 
# 2
# 1
# 3
# 2
# 3
# -> 6
#    10

# 분석 : 내왼쪽호실은 내아랫집 왼쪽의 합과 같다.
t = int(input())

for _ in range(t):
    floor = int(input())
    num = int(input())
    f0 = [x for x in range(1, num+1)]   #0층 사람
    for k in range(floor):
        for i in range(1, num):
            f0[i] += f0[i-1]
        print(f0)  # 프린트문을 추가
    print(f0[-1])