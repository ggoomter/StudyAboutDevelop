count = int(input())
datalist = []
for _ in range(count):  # 전체 반복 횟수
    scores = list(map(int,input().split())) #각 행마다 모든 숫자들을 구분
    avg = sum(scores[1:])/scores[0]
    
    cnt = 0
    for i in scores[1:]:
        if i>avg:
            cnt +=1
    pct = (cnt/scores[0])*100   # 갯수로 나누고 퍼센트로 보이게
    print('%.3f' %pct + '%')