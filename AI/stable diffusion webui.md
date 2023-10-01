### 설정 저장
ui-config.json
**txt2img/Prompt/value** 긍정키워드  “masterpiece, best quality”
**txt2img/Negative prompt/value** 부정키워드
**txt2img/Sampling steps/value** 샘플단계숫자
**txt2img/Width/value** 너비
**txt2img/Height/value** 높이
**txt2img/CFG Scale/value** CFG Scale


# 모델
\\models\\Stable-diffusion 경로에 넣으면 된다.

### CFG(classifier-free guidance) 스케일
프롬프트를 충실히 이해하는 정도
- 높을수록 AI
- 스케일이 높을수록 입력한 값에 더 충실하게 하려고 하지만 이미지가 왜곡될 가능성이 높아진다. 이전 단계의 이미지를 세게 변형하기 때문. 반대로 낮을수록 입력과는 멀어질수 있지만 이미지의 품질은 향상된다.
- 사전에 훈련하지 않은것을 생성하게 하려거나 여러개념을 결합하고싶으면 CFG 스케일을 올릴 필요가 있다.


## 샘플링 스텝
- 이미지의 크기가 작거나 간단한 프롬프트나 이미지를 사용할 때: 10 ~ 20
- 이미지의 크기가 중간이거나 복잡한 프롬프트나 이미지를 사용할 때: 20 ~ 40
- 이미지의 크기가 크거나 매우 복잡한 프롬프트나 이미지를 사용할 때: 40 ~ 80

### VAE
Variational Autoencorder
쉽게 이미지를 부드럽고 선명하게 보정처리
- \\models\\VAE 안에 넣어주면된다.
- 예제
	- **vae-ft-mse-840000-ema** 실사그림체
	- **kl-f8-anime2** 만화그림체

# 한글패치방법
https://flatsun.tistory.com/3578