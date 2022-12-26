# 인풋
  # 입력횟수
  # H층수, W각층마다 방의수, N몇번째 손님인지

# 생각
  # 손님이 머무르는 층수는 N % H
  # 손님이 머무르는 방은 그 층에서 (N // H) + 1
  # 그런데 만약 머물층수가 0으로 나오면 꼭대기 H층에 있도록

T = int(input())

for i in range(T):
    h, w, n = map(int, input().split( ))
    floor = -1
    ho = -1
    floor = n % h

    if floor == 0:
      floor = h * 100
      ho = n // h
    else:
      floor = (n % h) * 100
      ho = (n // h) + 1
      
    print(floor + ho)