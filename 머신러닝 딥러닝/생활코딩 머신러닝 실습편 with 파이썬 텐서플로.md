---
created: 2024-02-22 22:26
tag: 📚독서 국내도서 IT모바일 컴퓨터공학 인공지능
title: 생활코딩 머신러닝 실습편 with 파이썬 텐서플로
author: 이숙번, 이고잉
category: 국내도서
total_page: 320
publish_date: 2021-12-15
cover_url: https://image.yes24.com/goods/105373169/XL
status: 🟩 완료
start_read_date: 2024-02-22
finish_read_date: 2024-02-22
my_rate: 0
book_note: ❌
---

# 생활코딩 머신러닝 실습편 with 파이썬 텐서플로
책은 강의를 거의 그대로 옮겼을 뿐 강의들으면 된다.
강의는 매우 좋다.

### 예제파일
1부 : https://github.com/blackdew/tensorflow1
1,2부통합 :  https://github.com/blackdew/ml-tensorflow
지식지도 : https://seomal.org/
유튜브강의 : https://www.youtube.com/playlist?list=PLl1irxoYh2wyLwJutUZx5Q_QEEDZoXBnz
유튜브 의미지분류 : https://www.youtube.com/playlist?list=PLl1irxoYh2wzOOU9hvJqMYc215wAlxrpp
머신러닝 사전학습되어있어야함 : https://opentutorials.org/course/4548
소스목록 : https://github.com/blackdew/tensorflow1/tree/master
- 내 코랩으로 깃헙 코드 가져오는법
  ```txt
  https://colab.research.google.com/
  이 주소에다가
  깃헙주소 붙여넣고 https://github.com을 github이라고 바꾼다음에 사본떠서 저장하면 내 코랩으로 바로 가져올 수 있다.
  예를들면 https://colab.research.google.com/github/blackdew/tensorflow1/blob/master/practice1-pandas.ipynb 
  ```
- 로컬데이터를 코랩 노트북에서 사용하기
	- 파일을 로컬에 다운로드 한 후 코랩 서버에 업로드 해서 사용하는 법
	- csv로 다운한다음 코랩 화면 왼쪽의 폴더아이콘 -> 업로드 아이콘으로 csv파일 업로드
	- 햄버거 버튼에서 경로 복사 한다음 파이썬 파일경로에 붙여넣으면 된다.

---

- 목적 : 우리가 텐서플로를 이용해서 해결하려고 하는 기계학습의 지도학습의 회귀문제와 분류문제
- 지도학습은 표에서 원인이 되는 독립변수, 결과가 되는 종속변수를 분리하는데서 시작한다.
- 분류와 회귀 문제를 풀기 위한 알고리즘 : 결정트리(decision tree), 랜덤 포레스트(random forest), k-최근접이웃(KNN : k-nearest neighbors), 서포트벡터머신(SVM : support vector machine), 인공신경망(artificail neural networks)
- 딥러닝 : 인공신경망을 깊게 쌓아서 만들었다는 표현으로 '딥러닝'이라는 단어를 오늘날 더 널리 사용한다.
- 딥러닝 라이브러리 : 텐서플로, 파이토치, 카페, 테아노. 이들은 모두 같은 목적으로 서로 경쟁관계
- 실습환경 : 구글 코랩. 주피터 노트북과 같은 역할을 하는 도구. 구글드라이브에서 새로만들기 - 더보기 - Colaboratory
	- 실행버튼 단축키 : ctrl + enter(커서 위치 그대로),   shift + enter(다음줄로 커서이동)
---
## 지도학습의 빅피쳐 (중요)
1. 과거의 데이터 준비(독립변수, 종속변수). 즉, 원인 데이터와 결과 데이터
2. 모델의 구조 만들기(인풋이 누구누구 일때 아웃풋이 누구누구)
3. 데이터로 모델을 학습하며 피팅
4. 모델을 이용(예측)

---


---
## 판다스
표를 다루는 도구
- 소스 : https://github.com/blackdew/tensorflow1/blob/master/practice1-pandas.ipynb

- 실습
	- 파일 읽어오기 : pd.read_csv(경로)
	- 모양확인하기 : 데이터.shape
	- 칼럼 선택하기 : 데이터[['컬럼명1', '컬럼명2]]
	- 칼럼 이름 출력하기 : 데이터.columns
	- 맨위 5개 관측치 출력하기 : 데이터.head()

### 머신러닝
---
#### 첫 번째 딥러닝. 레모네이드 판매 예측
소스 : https://github.com/blackdew/tensorflow1/blob/master/practice2-lemonade.ipynb

모델 만들기    //가장 간단한 형태의 뉴럴넷. 뉴런 하나로 이루어진 두뇌 정도로 심플한 것
```python
X = tf.keras.layers.Input(shape=[1])   # 독립변수의 갯수
Y = tf.keras.layers.Dense(1)(X)        # 종속변수의 갯수
model = tf.keras.models.Model(X, Y)
model.compile(loss='mse')              # mse는 mean square error   Loss로 사용한 값
```

모델을 학습
```python
model.fit(독립, 종속, epochs=1000, verbose=0)   # 전체데이터를 몇번 반복해서 학습할지
model.fit(독립, 종속, epochs=10)
```

모델을 이용
```python
print(model.predict(독립))
print(model.predict([[15]]))
```

###### 손실의 의미
loss는 학습이 얼마나 진행되었는지를 알려주는 것
- 모든 예측과 정답을 비교해서 각각의 차이를 구하고 제곱한다. 그리고 그것의 평균을 구한것이 손실
- ![![머신러닝 딥러닝/#^Table]]평균은 46/4 = 11.5
- 학습을 반복하며 로스값이 줄어드는지 확인. 1보다 작아야 거의 정확한 것. 0이면 항상 정답
- 실습
	- 라이브러리 사용  (텐서플로우, 판다스)
	- 데이터 준비
	- 모델 만들기 (텐서플로의 케라스 사용)
	- 모델 학습 (만든 모델의 fit 함수)
	- 모델 이용
- 코드설명
```python
model.fit(독립, 종속, epochs=10000, verbose=0)   # 출력은 하지 않기
model.fit(독립, 종속, epochs=10)
```

와... 진짜 쉽다. 대단하다. 

---
#### 두번째 딥러닝. 보스턴 집값 예측
- 소스 : https://github.com/blackdew/tensorflow1/blob/master/practice3-boston.ipynb
- 중앙값 : 순서대로 정렬했을때 가장 가운데에 있는 값
- 몇천억씩 받는 사람들 때문에 평균연봉이라고 하면 실제 체감하는 평균 연봉과 상당히 괴리가 있는데 이러한 이상치로 인해 평균이 전체 집단의 대표성을 띠지 못하는 경우에 그 대안으로 사용하는 값이 '중앙값'
- 13개 열에 대한 설명
	- 1번째열 CRIM = 범죄율
	- 4번째열 CAHS = 찰스강 근처면 1 멀면 0
	- 6번째열 RM = 방의 갯수의 평균
	- 13번째 LSTAT = 하위계층의 비율
- 수식과 용어
	- 수식 : y = w1x1 + w2x2 + ..... + w13x13 + b
	- 인공신경망에서 뉴런의 역할을 하는 녀석의 이름이 퍼셉트론(perceptron)
	- 각 w를 부르는 이름이 가중치(weight)
	- b는 편향(bias)
- 예측해보니 천번을 해도, 만번을 해도 25정도로 유지.  아주 만족은 아니지만 꽤 근접. 회구에서 100% 정답을 맞추는건 거의 불가능한 일
---
#### 세번째 딥러닝. 붓꽃(아이리스) 품종 분류
- 붓꽃은 여러 종류가 있고 종류에 따라 꽃의 크기(꽃잎길이, 꽃잎폭, 꽃받침길이, 꽃받침폭)이 다르다.
- 결과(종속변수)의 데이터타입이 숫자면 회귀문제, 범주면 분류문제니까 이건 분류문제
- 소스 = https://github.com/blackdew/tensorflow1/blob/master/practice4-iris.ipynb
- 원핫 인코딩 = one-hoe encoding = 범주형 데이터를 1과 0의 데이터로 바꿔주는 과정
	- 머신러닝 모델을 사용하기 위해서는 모든 범주형 변수를 원핫 인코딩 해야한다.
	- 판다스에서 get_dummies 함수 한줄만 쓰면 데이터내의 범주형 변수들만 골라서 모조리 원핫 인코딩된 결과를 만들어준다.
	- 지금의 문제로 보면 품종이라는 1개의 컬럼에 'setosa', 'virginica', 'versicolor' 3의 값으로 나뉘어지던 것이 품종.setosa, 품종.virginica, 품종.versicolor 3개의 컬럼으로 나뉘어지고 값은 해당한다면 1, 아니면 0이 들어가게 된다.
- 시그모이드(sigmoid)
- 소프트맥스(Softmax)
- 비율을 예측하기 위해 소프트맥스를 사용한다는 것만 알고 있어도 모델을 사용하는데 문제가 없다. 꾸준히 경험이 쌓이다가 이 지식이 아니면 해결이 안되는 상황에 도달하면 그때 자연스럽게 시그모이드와 소프트맥스의 차이점에 대해 알게된다.
- Activation(활성함수)
- 크로프엔트로피
	- loss는 모델이 내놓는 결과가 실제 정답과 차이가 있는지를 알아보기 위한 지표이며 0이면 모든 정답을 맞춘것이고 loss를 작게 만드는 것이 학습의 목표인데
	- 학습이 제대로 되게 하려면 문제 유형에 맞게 손실을 지정해줘야한다. 즉 문제에 따라 loss를 다르게 사용해야 한다는 사실만 알자. 지금은
	- 분류에 사용하는 loss는 크로스엔트로피 이고, 회귀에 사용하는 loss는 mse인 거다.
- 정확도(accuracy)
	- 예측이 정답과 얼마나 정확한가?
	- 올바르게 예측된 데이터 수 나누기 전체 데이터 수
	- 학습이 되어 가는 과정에서는 accuracy가 아니라 loss가 떨어지냐를 봐야한다.
- 정밀도(Precision)
	- 예측한것중 정답의 비율은?
	- 모델이 True로 예측한 데이터 중 실제로 True인 데이터 수
	- 내일 눈이 내릴지 안내릴지에 항상 False로 하면 accuracy는 높음. 높은 정밀도이지만 모델은 전혀 쓸모가 없다.
- 재현율(Recall)
	- 찾아야 할 것중에 실제로 찾은 비율은?
	- 실제로 True인 데이터를 모델이 True로 인식한 데이터의 수
---
### hidden layer
딥러닝. 인공신경망
퍼셉트론 여러개를 연결
- 입력과 출력사이에 한 층을 쌓아서 히든레이어의 모든 값들을 입력으로 하는 하나의 퍼셉트론을 추가해줘야한다.

---
### 데이터를 위한팁 
- 원핫인코딩을 할 때 변수 데이터타입 때문에 발생하는 문제
	- 데이터가 숫자만 있다면 원핫 인코딩 안된다.   .dtypes로 데이터타입 확인해보고 수동으로 변환해줘야함. .astype함수를 통해서 category나 object로 변경
- 데이터 NA값의 처리
	- 평균값으로 처리하는 것이 일반적
- 모델의 성능이 안좋을 때
	- 모델의 구조를 BatchNormalization layer를 사용하여 만든다.