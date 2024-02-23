https://arca.live/b/aiart

# 노벨AI
2022년 10월 8일 유출
익명의 유저가 NAI를 해킹해서 이미지 생성 '모델'을 유포함.
유료 구독모델을 사용하지않고 직접 돌릴수있게 됨
50기가 정도되는데 쓰는건 저기서 5기가 정도되는 모델 하나
animefull-final-pruned의 model.ckpt
http://localhost:9000/
http://127.0.0.1:7860/ 
픽시브에 있는 그림을 무단으로가져와 학습했다는 사실이 밝혀짐


- [유출스토리](https://arca.live/b/live/60468393)
- novelAI를 해킹해서 만든 NyaAI
- 그것을 또 해킹해서 만든 Nyaai
- 


### 스테이블 디퓨전 ### Stable Diffusion(SD)
> 영국의 스타트업 기업 스테빌리티가 만든 인공지능 그림 창작 소프트웨어.
사용자가 원하는 그림의 설명을 입력하면 AI가 그림을 그려준다.
> 전형적인 Text-to-Image 작업을 위한 모델
  컴퓨터비전 분야와 자연어처리분야가 결합된 작업
> 오픈소스로 공개되어 있어 상업적으로 사용가능
각 회사들이 그것을 활용해 인공지능 만들고 있고 그중의 하나가 노벨ai인것
- 잉크가 물에 diffuse된다면 최초의 한 점에서 퍼져나가다가 평형상태에 도달하게되고, 다시 시작시점으로 되돌릴수는 없다. 그러나 스테이블 디퓨전의 목표는 시작지점으로 되돌아가는 계산법을 학습하는것을 목표로 하고 있다.
- 원리
이미지도 결국 숫자의 배열일뿐이다.
그래서 숫자배열은 조건부의 행렬연산의 연속을 통해 노이즈 이미지로 바꿀 수 있다.  그렇다면 반대로 노이즈 이미지에서 리버스 펑션을 통해 시작 이미지로 되돌릴수도있다. 그것이 무에서 유를 창조하게 되는 것이다. input으로 들어왔던 text가 어떤 latent space에 속하는지에 따라 어떤 연산을 하게 되는지가 달라진다.

https://github.com/norhu1130/stable-diffusion-webui
[공식깃헙사이트](https://github.com/AUTOMATIC1111/stable-diffusion-webui.git)
latent Diffusion Model이 혁신. 학습속도 급격한 향상
아마존 클라우드에서 60만달러 들여서 학습
Danbooru 에서 이미지 긴빠이 쳤다고함.

##### 보조모델
###### lora
###### ControlNet 자세잡아주는것
###### vae
###### embedding
###### hyper network

### Web UI
유출본 사람들 때문에 트래픽이 많아지자 그들을 보조해주고 그 이유로 공식 디코사이트에서 밴당함

## 프롬프트
- 자기가 학습한 언어(영어)의 규칙에 따라 앞쪽에 있는것을 더 중요하게 생각한다.

# Mid Journey
미국 항공우주국(NASA) 엔지니어 출신인 데이비드 홀츠가 개발한 ‘AI 화가’ 프로그램이다. 디스코드에서 사용하는 프로그램으로, 로그인만으로 비교적 쉽게 사용할 수 있다.
최소 10달러부터 시작하는 월간 회원권을 구매해야 사용 가능하다.

# DALL-E 2
오픈AI에서 개발한 이미지 생성 AI로 높은 해상도(달리1보다 4배 향상됐다고 한다), 사실적이고 세밀한 이미지 생성이 특징


### 복호화
aHR0cHM6Ly9raW9za2xvdWQueHl6L2QvNjM0YTVhOTQ4MDNiNzkwNjZjMDQ3ZDRiLVlQV1MzNElLRU1BQVdTU1hONFdYSVpDTEdOV1dHUUtT
https://www.base64decode.org/
https://kioskloud.xyz/d/634a5a94803b79066c047d4b-YPWS34IKEMAAWSSXN4WXIZCLGNWWGQKS

# 그림체
유명한것중에   작품명_(Style)   이렇게 프롬프트에 넣으면된다.
예) 몰루 (blue_archive_(Style))
Guilty_Gear_(Style)
Dragon_Ball_(Style)
monochrome
retro artstyle
1980s (style)
pixel art


### 그림 스타일
2D
Cartoon
8-bit
16-bit
Graphic Novel
Visual Novel
Street Art
Fantasy
Realistic
Photo
Hard Edge Painting
Mural
Mosaic
Hydrodipped
Modern Art
Concept Art
Digital Art
CGI
Anaglyph
Comic Book
Lithography

## 이미지 업스케일링
Waifu 2x
http://waifu2x.udp.jp/index.ko.html


# 노하우
추론단계 25에서 28로 증가
안내척도 11
네거티브 프롬프트에 lowers, bad anatomy, bad hands, error
단어 잇는것보다 문장이 더 잘나옴
한글보다 영어가 훨씬 잘나옴

### 외부접속
Launch.py열어서 
commandline_args = os.environ.get부분 2번째 파라미터에 "--listen"추가
COMMANDLINE_ARGS
포트포워딩후 방화벽 열어주기

# 중요태그
[태그생성기](https://novelai.app/)
- nsfw
Not safe for work의 약자.  18금여부를 결정한다.  야한걸 그리고싶으면 넣어야한다. 안넣고싶으면 밴태그에 넣는게 좋다.
- masterpiece, best quality
국밥태그. 뺄일이 거의없다. 심지어 많이 넣을수록 효과가 좋아진다.
- (finely detailed eyes and detailed face:1.3), (detailed:1.3), (realistic:0.8),
화풍을 결정. 이것을 맞춰과는것이 화룡정점.


# 키워드
pose variation
hyper realistic
AS 역할
sharp focus
whide shot
oil on canvas
colorful
cinematic
close up portrait
portrait of 누구
highly detailed
by 작가이름
ultra realistic illustraion
orange theme
water color(medium)  //수체화
looking up from below


## 작품 사이트
[렉시카](https://lexica.art/)


# 설치
1. 토렌트로 novelAI다운
2. https://arca.live/b/aiart/60218306?mode=best&p=1
   1. https://arca.live/b/aiart/60186343
   2. https://arca.live/b/aiart/60217379
      이건 vae.pt 를 지원하지 않고 
      1. 업그레이드. **https://arca.live/b/aiart/60216616**
      bWFnbmV0Oj94dD11cm46YnRpaDo0ZTY2NDc3ZWM3YzBiYWVmNjcwOTg3MjdjYTM3Y2M1YzQzZmVjNTRjJmRuPVN0YWJsZS1EaWZmdXNpb24tV2ViVUktOGFjYzkwMSZ0cj11ZHAlM2ElMmYlMmZ0cmFja2VyLm9wZW5iaXR0b3JyZW50LmNvbSUzYTY5NjklMmZhbm5vdW5jZSZ0cj11ZHAlM2ElMmYlMmZ0cmFja2VyLnRvcnJlbnQuZXUub3JnJTNhNDUxJTJmYW5ub3VuY2UmdHI9dWRwJTNhJTJmJTJmdHJhY2tlci5kbGVyLm9yZyUzYTY5NjklMmZhbm5vdW5jZQ==
      base64로 디코딩하면 
      - magnet:?xt=urn:btih:4e66477ec7c0baef67098727ca37cc5c43fec54c&dn=Stable-Diffusion-WebUI-8acc901&tr=udp%3a%2f%2ftracker.openbittorrent.com%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.torrent.eu.org%3a451%2fannounce&tr=udp%3a%2f%2ftracker.dler.org%3a6969%2fannounce
      - 받은후 webui-user.bat실행
      파이썬 찾을수 없다고 나옴. 
      깔끔하게 파이썬, 깃 다시 환경변수 넣으면서 재설치
      clip다음 install 
      RuntimeError: Couldn't determine Stable Diffusion's hash: 69ae4b35e0a0f6ee1af8bb9a5d0016ccb27e36dc.
Command: "git" -C repositories\stable-diffusion rev-parse HEAD
      - 외장하드 권한문제라고 함 c드라이브로 옮기면 깔끔하게 되지만 지금외장하드로 하는법
      https://arca.live/b/aiart/60308488
      \를 /로 바꿔서
      RuntimeError: Couldn't clone Stable Diffusion.
Command: "git" clone "https://github.com/CompVis/stable-diffusion.git" "repositories\stable-diffusion"
      미니콘다 다운로드  C:\Users\ggoom\miniconda3
      - http://127.0.0.1:7860/  접속
      - nai와 똑같이 뽑아내기 위한 설정 https://arca.live/b/aiart/60369133
      - 
   3. https://arca.live/b/aiart/60216616


2.1로 하는법 실패
   python --version 잘됨    3.10.5
   conda --version 잘됨     4.13.0
   CUDA가 그래픽카드 지원을 안해서 그렇다고 함
2.2로 하는법 성공
    드라이버 root폴더에 설치하라고 경고했지만 그냥 진행
    2.1보다 훨씬 시간 오래 걸림
    conda activate H:\stable-diffusion-ui-win64\stable-diffusion-ui\stable-diffusion\env
    Start Stable Diffusion UI.cmd 를 눌러서 작동
        Model : 콤보박스 기본값을 아까옮긴 nai ckpt명으로
        Output format은 png로
   a photograph of an astronaut riding a horse 넣고 10시8분

    Stable Diffusion has stopped
   The server is still starting up..
   cmd끄고 재시작 한 3번

5. 웹브라우저 열고 주소창에 http://localhost:9000/
6. 실행되면 퀄리티 올리기
https://arca.live/b/aiart/60182179?mode=best&p=1

automatic ui의 tx2img탭에
Negative prompt: nsfw, lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry

Steps: 28, Sampler: Euler a, CFG scale: 11, Size: 512x768

- 집컴퓨터 그래픽카드에서 팬 돌리는 소리 처음들어봄

- 에러 Torch is not able to use GPU
  - webui-user.bat파일 열어서  commandline_args = 뒤에 --skip-torch-cuda-test 추가



- repository문제
  - 크롬은 안되고 웨일에서 https://kioskloud.xyz/d/63429269ef0b1103aa6dc681-3IHL2TRTTV2TCRSPPJSGIVCXMJ4XKNTP
- pip install
  - pip install --upgrade pip

vram확인 : 실행창에서 dxdiag

git --exec-path 하면
C:/Program Files/Git/mingw64/libexec/git-core
나옴 거기뒤에 git.exe 추가

webui-user-xformers(RTX-1xxx이상).bat을 편집으로 열고  --skip-torch-cuda-test 추가

여전히 Couldn't determine Stable Diffusion's hash: 45bf9a6264b3507473e02cc3f9aa36559f24aca2.
git rev-parse HEAD 하면 나오는 최신 해쉬로 아래의 해쉬 나옴
f49c08ea566385db339c6628f65c3a121033f67c
launch.py열어서 stable_diffusion_commit_hash = os.environ.get('STABLE_DIFFUSION_COMMIT_HASH', "69ae4b35e0a0f6ee1af8bb9a5d0016ccb27e36dc")

if result.returncode != 0 and result.returncode != 1:
이렇게 바꿔줌!!! 와! 한 20시간썼다.


## webui 기본설정 변경하기
https://arca.live/b/aiart/60208694

- Denoising strength
원본을 얼마나 많이 변형하느냐.
0에 가까울수록 원본이미지 유지
1에 가까울수록 이미지보다는 프롬프트에 의존


### 검은화면
모델을 선택안해서 인줄알았는데
내 그래픽카드 클래스보다 높은 래밸의 배치를 돌려서
1660정도면 저사양용


## 공부
https://arca.live/b/aiart/61139678?category=%EA%B3%B5%EC%A7%80&p=1
- 가장인간적인 미래
