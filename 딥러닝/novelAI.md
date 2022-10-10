https://arca.live/b/aiart

# 노벨AI
2022년 10월 8일 유출
익명의 유저가 NAI를 해킹해서 이미지 생성 '모델'을 유포함.
유료 구독모델을 사용하지않고 직접 돌릴수있게 됨
50기가 정도되는데 쓰는건 저기서 5기가 정도되는 모델 하나
animefull-final-pruned의 model.ckpt
http://localhost:9000/
http://127.0.0.1:7860/ 


### 스테이블 디퓨전
영국의 스타트업 기업 스테빌리티가 만든 인공지능 그림 창작 소프트웨어.
사용자가 원하는 그림의 설명을 입력하면 AI가 그림을 그려준다.
오픈소스로 공개되어 있어 상업적으로 사용가능
https://github.com/norhu1130/stable-diffusion-webui
[공식깃헙사이트](https://github.com/AUTOMATIC1111/stable-diffusion-webui.git)



# 그림체
유명한것중에   작품명_(Style)   이렇게 프롬프트에 넣으면된다.
예) 몰루 (blue_archive_(Style))
Guilty_Gear_(Style)
Dragon_Ball_(Style)

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
포트포워딩후 방화벽 열어주기

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
      1. 업그레이드. https://arca.live/b/aiart/60216616
      bWFnbmV0Oj94dD11cm46YnRpaDo0ZTY2NDc3ZWM3YzBiYWVmNjcwOTg3MjdjYTM3Y2M1YzQzZmVjNTRjJmRuPVN0YWJsZS1EaWZmdXNpb24tV2ViVUktOGFjYzkwMSZ0cj11ZHAlM2ElMmYlMmZ0cmFja2VyLm9wZW5iaXR0b3JyZW50LmNvbSUzYTY5NjklMmZhbm5vdW5jZSZ0cj11ZHAlM2ElMmYlMmZ0cmFja2VyLnRvcnJlbnQuZXUub3JnJTNhNDUxJTJmYW5ub3VuY2UmdHI9dWRwJTNhJTJmJTJmdHJhY2tlci5kbGVyLm9yZyUzYTY5NjklMmZhbm5vdW5jZQ==
      base64로 디코딩하면 
      - magnet:?xt=urn:btih:4e66477ec7c0baef67098727ca37cc5c43fec54c&dn=Stable-Diffusion-WebUI-8acc901&tr=udp%3a%2f%2ftracker.openbittorrent.com%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.torrent.eu.org%3a451%2fannounce&tr=udp%3a%2f%2ftracker.dler.org%3a6969%2fannounce
      - 받은후 webui-user.bat실행
      파이썬 찾을수 없다고 나옴. 
      깔끔하게 파이썬, 깃 다시 환경변수 넣으면서 재설치
      RuntimeError: Couldn't determine Stable Diffusion's hash: 69ae4b35e0a0f6ee1af8bb9a5d0016ccb27e36dc.
Command: "git" -C repositories\stable-diffusion rev-parse HEAD
      - 외장하드 권한문제라고 함 c드라이브로 옮기면 깔끔하게 되지만 지금외장하드로 하는법
      https://arca.live/b/aiart/60308488
      \를 /로 바꿔서
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


