# 인풋 : 첫째줄 : 시작시각(시 분)
#       두번재줄 : 요리에필요한시간(분)
# 아웃풋 : 오븐구이가 끝나는 시각



# A,B = map(int, input().split())
# C = int(input())
# if((B+C)>60):
#     A += (B+C)//60
#     B = (B+C)%60
#     print(A,B)
# else:
#     print(A, B+C)


A,B = map(int, input().split()) #시작시간, 시작분
C = int(input())    # C요리시간 0부터 1000
plusHour = (B+C)//60
plusMin = (B+C)%60
if(plusHour+A >= 24):    ##24가 되면 0으로 초기화 해야한다.
    print(plusHour+A-24,plusMin)
else:
    print(A+plusHour, plusMin)