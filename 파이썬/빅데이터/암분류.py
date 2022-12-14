import warnings
warnings.filterwarnings('ignore') # 불필요한 경고 표시 안함

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import platform #한글글꼴
from IPython.display import display

# 폰트설정
plt.rc('font', family='Malgun Gothic')      #맑은 고딕
# 넘파이 부동소수점 출력 시 정밀도
np.set_printoptions(suppress=True, precision=4) 
# 판다스 부동소수점 출력 시 정밀도
pd.options.display.float_format = '{:.4f}'.format
# 데이터 프레임에서 모든 필드 출력
pd.set_option("display.max_columns", None)
# 그래프 기본글꼴 설정
plt.rcParams["font.size"] = 14
# 난수 시드
random_seed = 123


from sklearn.datasets import load_breast_cancer
cancer = load_breast_cancer()   # 사이킷런의 함수호출만으로 위스콘신 유방암 데이터 로드
#print(cancer.DESCR)

# 판다스의 데이터 프레임으로 변환
columns = [
    '반지름_평균', '텍스처_평균', '둘레길이_평균', '면적_평균',
    '평활도_평균', '콤팩트도_평균', '오목면_평균',
    '오목점_평균', '대칭성_평균', '프랙탈도_평균',
    '반지름_표준편차', '텍스처_표준편차', '둘레길이_표준편차',
    '면적_표준편차', '평활도_표준편차',
    '콤팩트도_표준편차', '오목면_표준편차', '오목점_표준편차',
    '대칭성_표준편차', '프랙탈도_표준편차',
    '반지름_최대', '텍스처_최대', '둘레길이_최대', '면적_최대',
    '평활도_최대', '콤팩트도_최대', '오목면_최대', '오목점_최대',
    '대칭성_최대', '프랙탈도_최대'
]
df = pd.DataFrame(cancer.data, columns=columns)
y = pd.Series(cancer.target)    #0과1인것을 세기위해서 넘파이포맷을 판다스의 시리즈객체로 변환
# 데이터 확인
display(df[20:25])  #입력데이터
print(y[20:25])     #출력데이터

# 데이터 통계 확인
print(df.shape)         # 입력데이터의 행과열의 수.  (569, 30)은 필드수가 30개인 데이터가 569개 존재
print()
print(y.value_counts)   #정답데이터의 1과 0의 건수




# 산점도로 확인.
df0 = df[y==0]
df1 = df[y==1]
plt.figure(figsize=(6,6))    # 그래프의 크기를 설정
plt.scatter(df0['반지름_평균'], df0['텍스처_평균'], marker='x', c='b', label='악성')    #목적변수값이 0인 산점도
plt.scatter(df1['반지름_평균'], df1['텍스처_평균'], marker='s', c='k', label='양성')    #목적변수값이 1인 산점도
plt.grid()  #그리드 표시
plt.xlabel('반지름_평균')   # x축 레이블 표시
plt.ylabel('텍스처_평균')   # y축 레이블 표시
plt.legend()    # 범례그리기
#plt.show()      # 화면에 전체 그래프 출력

# 입력데이터를 두개의 필드로만 줄이기
input_columns = ['반지름_평균', '텍스처_평균']
x = df[input_columns]

# 학습데이터와 검증데이터로 분할 (상하분할)
from sklearn.model_selection import train_test_split
x_traain, x_test, y_train, y_test = train_test_split(x, y, train_size=0.7, test_size=0.3, random_state=random_seed)

# 알고리즘 선택
from sklearn.linear_model import LogisticRegression         # 로지스틱 회귀 선택 (분류임)
algorithm = LogisticRegression(random_state=random_seed)    # 알고리즘 초기화

# 학습   핵심은 fit함수
algorithm.fit(x_traain, y_train)
#print(algorithm.get_params())

# 예측   핵심은 predict함수
y_pred = algorithm.predict(x_test)
print(y_pred)
print("예측끝")


# 평가
y_test10 = y_test[:10].values   # 정답데이터를 앞에서 10건 추려냄
print(y_test10)
y_pred10 = y_pred[:10]   # 예측데이터를 앞에서 10건 추려냄
print(y_pred10)

# 정답을 맞힌 건수 세기
w1 = (y_test10 == y_pred10)
print(w1)
w2 = w1.sum()
print(w2)

# 정확도 계산하기  score함수
score = algorithm.score(x_test, y_test)
print(f'score : {score : .04f}')