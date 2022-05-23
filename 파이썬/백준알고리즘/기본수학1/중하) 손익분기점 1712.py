# A : 고정비
# B : 개당 가변비
# C : 개당 노트북가격
# 손익분기점을 구해보시오. bep
# A + B*N

# A,B,C = map(int,input().split())
# N = 1
# while(True):
#     if(B>C):
#         N = -1
#         break
#     income = C * N
#     expense = A + B*N
#     profit = income-expense
#     if( profit > 0):
#         break;
#     N+=1
# print(N)


A, B, C = map(int, input().split())
if B >= C:  #개당드는돈이 개당이익보다 많으면
    print(-1)
else:
    #이익 = (C-B)*N - A
    #이므로 이익+A = (C-B)*N     N = (이익+A)/(C-B)
    print(int(A//(C-B)+1))  #0이될때가 손익분기점. 1을 더하면무조건 이익