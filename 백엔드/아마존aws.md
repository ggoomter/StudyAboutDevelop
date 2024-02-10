

# aws
200개가 넘는 서비스가 있다.
12개의 AWS Certified 자격증이 있다.
![aws자격증](../이미지/aws자격증.PNG)
기초(Foundational)레벨에는 Cloud Practitioner
그 위에 Associate레벨
그 위에 Professional레벨과 Specialty레벨

---
# 학습
udemy 유료강의. AWS Certified Cloud Practitioner CLF-C01 시험     강사 : Stephane Maarek

# 계정생성
https://portal.aws.amazon.com/billing/signup#/start/email
2022년 5월9일에 만들어뒀던 ggoomterHuman@gmail.com  xxxx3#  사용해서 학습.
카드, 핸드폰, 이메일 등 실제유저 확인한다.

### 강의자료 다운로드
https://courses.datacumulus.com/downloads/certified-cloud-practitioner-zb2/

### 웹사이트 구동원리
알고있어서 정리안함
서버 : CPU, RAM, 하드, DB
      라우터, 스위치, DNS

### 전통적인 서비스
서버 구매,  창고나 방, 거실 등에 설치,  소프트웨어적 설치, 전기세 지불,   쿨링시스템,   유지보수 인원,
추가나 교체시 오랜 시간(주문, 연결, 배포),   확장의 어려움(시간, 공간),  문제발생시 대응할 모니터링 팀,
정전, 지진, 화재 등에 대한 보험

### 클라우딩 컴퓨팅
컴퓨팅 파워, 데이터베이스 스토리지 , 어플리케이션, 기타 IT 리소스를 온디멘드로 제공하는 것
핵심은 온디멘드. 필요할때 얻는 것. 요청한만큼만 비용지불. 사용이 끝나면 비용지불도 끝
정확한 유형과 크기를 프로비저닝 할수 있다.  //사용자의 요구에 맞게 시스템 자원을 할당, 배치, 배포해 두었다가 필요 시 시스템을 즉시 사용할 수 있는 상태로 미리 준비해 두는 것
Gmail, Dropbox, Netflix 등이 클라우드 서비스

Private Cloud : rackspace
Public Cloud : MS Azure, Google Cloud, AWS
Hybrid Cloud : 자체인프라와 Public의 혼용

- 5가지 특징
1. On-demand self service
2. Broad network access
3. Multi-tenancy and resource pooling
4. Rapid elasticity and scalabiliy
5. Measured service

- 6가지 장점
1. Trade capital expense(CAPEX) for operational expense(OPEX)
2. benefit from massive economies of scale
3. Stop guessing capacity
4. Increase speed and agility
5. Stop spending money running and maintaining data centers
6. Go global in minutes

- 유형   as a Service의 단축어인 aaS는 고정.  IPS로 기억하자.
![aws유형](../이미지/aws유형.PNG)
0. On-premises
1. Infrastructure as a Service (**IaaS**)   서비스형 인프라
    네트워킹, 컴퓨터, db저장공간을 원시형태로 제공
    레고를 조립하듯 높은 유연성
    예) EC2,  GCP, Azure, 
2. Platform as a Service (**PaaS**) 서비스형 플랫폼
    기본인프라를 관리할 필요가 없음
    배포와 애플리케이션 관리(데이터와 애플리케이션)에만 집중
    예) Elastic Beanstalk,  Heroku, GCP, Windows Azure
3. Software as a Service (**SaaS**) 서비스형 소프트웨어
    서비스제공업체가 완전히 운영하고 관리
    클라우드를 통해서 가입만 하고 설치 없이 바로 쓰는것
    예) Rekognition,   Gmail, Dropbox, Zoom

## 비용
3가지 기본가격이지만 모두 종량제(컴퓨팅 시간, 스토리지 양, 네트워크가 나갈때만)
시간의경과, 1년에 1번, 정액 같은 보기는 아님.

## AWS의 역사
2002년 Amazon.com 내부에서 시작. 
아마존의 인프라는 그들의 핵심 역량 중 하나였고 우리가 아니라 다른사람들을 위해 서비스로 출시하면 어떨까?
2004년 첫번째 서비스인 SQS출시
2006년 SQS, S3, EC2
2019년 가트너의 시장조사에 따르면 세계1위 리더이고 시장점유율 47%. 2등인 Microsoft는 22%


### AWS 인스트럭터
https://infrastructure.aws/
- **리전** : 데이터 센터의 집합. 세계각지에 구역을 나눈 이름. ue-east-1,  eu-west-3 같은것들
       대부분의 서비스들은 그 리전에 국한된다.
       선택기준 : 상황에 따라 다르다. (법률, 지연시간, 해당서비스가 그 리전에서 지원하는지, 요금)
- **가용영역** : 리전내에 존재. 대부분 3개를 가지고있고 최소는 2, 최대는 6.   
            시드니의 리전은 ap-southeast-2 인데   거기에 가용영역은 ap-southeast-2a, ap-southeast-2b, ap-southeast-2c
            각각의 가용영역은 여분의 **전원을 갖춘 네트워킹**, **통신기능을 갖춘 데이터 센터**로 이루어져있다.
            각각의 가용영역들이 재난발생에 대비해 서로 분리되어 있다.
- **엣지로케이션** : 전송지점. 216개가 넘는 포인트들이 있다.

### 스코프
글로벌서비스 : IAM(Identity and Access Management), Route 53(DNS service), CloudFront(CDN), WAF(Web Application Firewall)
리전스코프 : 대부분의 AWS서비스.  EC2, Elastic Beanstalk, Lambda, Rekognition

## 콘솔
- 오른쪽위 리전선택기 (가장 서비스하기에 가까운 지역 선택)
  - Global로 돼있을때는 리전을 선택할 필요가 없다는 말. 규칙이라기 보다는 예외
  - 어느 리전의 콘솔을 보느냐에 따라 컨텐츠가 다르다.
- 12시방향 검색창
- 왼쪽위 New EC2 Experience 토글스위치를 통해 과거의 GUI로 변환할 수 있음

### 공동책임모델
AWS클라우드에서 보안에 대한 책임분배를 정의하는 것
- 쉽게말해서 인프라 자체에 대한 책임은 AWS, 인프라 사용에 대한 책임은 개발자
- AWS의 책임 = SECURITY OF THE CLOUD. 인프라스트럭쳐, 구성과 취약성 분석 서비스, 규정 준수, 하드웨어의 결함 교체, 직원의 데이터 접근 금지
- 개발자의 책임 = SECURITY IN THE CLOUD, 데이터 백업과 스냅샷,  유저,그룹,역할,책임 관리와 모니터링,   MFA적용,  키 자주 교체,  IAM사용해서 적합한 권한 적용했는지 확인,  엑세스패턴분석,  계정권한검토
- 그리고 이용목적제한방침에 동의해야함. 불법적, 공격적, 유해한 콘텐츠, 보안위반, 네트워크 남용, 이메일이나 다른유형의 메세지 남용 안됨.

- EC2 스토리지를 위한 공동책임모델
    EC2를 사용할때의 위험을 이해해야한다.
    하드웨어에 결함이 생기면 드라이브를 잃게 되거나
    인스턴스 스토어가 있는 EC2인스턴스를 중지시키면 데이터를 잃게됨
---

> ec2, mysql, github, putty 연동
https://victorydntmd.tistory.com/338

리눅스 폴더 삭제 rm -rf 폴더명




## 용어 
- AMI : Amazon Machine Image.   OS, WAS, 앱이 포함된 템플릿
- IAM : Identify and Access Management.  AWS에서 생성 및 관리하고 있는 모든 서비스를 안전하게 제어하기 위한 계정 관리 서비스
- SCP : Secure Copy Protocol. 리눅스 운영체제에서 사용하는 파일전송 프로토콜.
- VPC : Virtual Private Cloud. 가상네트워크제공. 
        EC2등 서비스자원을 생성하면 기본적으로 생성되며, 사용자별로 VPC에 할당되어 서비스가 이루어진다.
- RDS : Relational Database Service. 
- GPL : General Public License
- AZ : Availability Zone.  가용영역
- MFA : Multi-Factor Authorization. 인증할때 여러 매체를 활용하는 인증방식.
- S3 : Simple Storage Service. 아마존 스토리지 관리를 위한 대표적인 서비스.

### api
https://docs.aws.amazon.com/




# EC2
> Elastic Compute Cloud. 쉽게말해서 아마존으로부터 컴퓨터를 한대 빌리는것.(호스팅) 가상서버
> 아마존에서 가장 인기있는 서비스
- 7가지 유형이 있다. 범용, 컴퓨팅 최적화(C로 시작), 스토리지 최적화(R X Z 로 시작) 등
- [스프링을 aws에 배포](https://jiwontip.tistory.com/45?category=367314)
- [스프링부트를 amazon linux에 배포](https://victorydntmd.tistory.com/338)
- ec2는 여러 서비스가 합쳐진 큰 서비스다.
  가상머신렌탈, 가상드라이브에 저장, 일래스틱 로드밸런서, 오토스케일링그룹
  운영체제, CPU, RAM, EBS, 네트워킹 설정, 방화벽 규칙설정, 부트스트랩 스크립트
//부트스트랩은 처음시작할때 한번만 실행. 부팅작업을 자동화. 
- 구매 옵션
  - 온디맨드 : 1분 지나고부터 초당비용청구. 높은가격. 설결제없음. 장기약정 필요없음.  연속적인 단기 워크로드에 적합
      예) 언제든지 리조트에 방문. 원할때 전체요금 지불.
  - 예약 : 온디맨드보다 70%이상의 비용절감. 특정 속성을 저장할 수 있다. 리전, 인스턴스유형, OS 등.   1년혹은 3년.   전체선결제, 부분선결제, 선결제 없음에 따라 할인율 차등적용. 안정적인 상태로 운영되는 애플리케이션에 적합
      예) 아주 오랜기간 리조트에 머무르기로 미리계획. 많은 할인받음
  - 세이빙 플랜 : 장기로 사용할수록 한일률 높음. 시간당 10달러를 1년이나 3년동안 약정. 
      예) 리조트에서 일정금액을 지출하기로 약속하고 금액내이면 방을 바꿀수도 있음. 좋은 방이면 기간이 줄겠지.
  - 스팟 인스턴스 : 가장 파격적인 할인. 온디맨드의 90% 정도 할인 되지만,  지불하고자 정해놓은 가격보다 비용이 높아지면 인스턴스가 갑자기 중단될 수 있다. 서비스가 중단되어도 복구가능한 워크로드에 적합
      예) 호텔이 제공하는 마감할인. 빈객실에 고객을 끌어오기위해. 나보다 더 낮은 가격에 비용지불하는사람이 있으면 내가 쫓겨날수도있음
  - 전용 호스트 : 실제물리서버자체를 예약하기때문에 가장 비쌈. 소켓당, 코어당, vm소프트웨어 라이센스당 청구. 규정준수 요구사항이 있거나 기존의 서버 결합 소프트웨어 라이센스를 사용해야할 경우 적합
      예) 리조트 건물 전체를 예약
  - 전용 인스턴스 : 고유한 인스턴스를 가진 전용 하드웨어에서 실행되지만 물리적 서버와 다른점은 같은 계정의 다른 인스턴스와 하드웨어를 공유할수 있고 배치를 쓸 수 없다.
  - 용량 예약 : 시간약정이 없는 온디맨드. 할인은 없음. 실행하지 않더라도 용량이 부과됨.  특정한 AZ에 위치하는 단기의 연속적인 워크로드에 적합.
      예) 객실을 예약하고싶은데 숙박여부는 확실하지 않음. 그렇지만 원할때는 머무를 수 있음. 숙박여부와 관계없이 전체가격 지불

1. 아마존 회원가입(무료계정) 전화로 인증번호 4개 치는게 빠름
2. 오른쪽 위 서버 위치 한국으로 옮기기
3. 서비스 검색창에서 ec2 (즐겨찾기도)
4. Instance탭
Launch instance
가상머신(인스턴스) 시작
(//계정만들자 마자 바로는 안됨)
    0. 이름과 태그 선택
    1. Instance type은
    freetier만 선택 체크하고 기본 t2.micro.   
    1기가메모리, EBS Only, 낮은 네트워크

    /** EC2명명규칙 
    //t2는 서비스 유형. micro는 성능.
    //t2.micro는 vCPU1개
    예를들어 m5.2xlarge
    m:인스턴스클래스
        e로 시작하면 범용? General?
        c로 시작하면 Compute 고성능
        m은 메모리최적화
        s는 Storage최적화
    5:인스턴스세대
    2xlarge : 인스턴스 클래스의 크기

    

    1. AMI(인스턴스 구성을 가진 템플릿) 선택
    기본이미지(운영체제) 선택
    제일 익숙한걸로. 그런게 없으면 제일 보편적인 우분투
        **레드햇, 페도라, centOS계열, amazon linux는 yum사용**
        **데비안, 우분트 계열은 apt-get 사용**
    2. 넥스트하다보면 디폴트 크기는 8기가인데 30기가 까지 무료로 늘릴수있음.
    3. 시작하기 누르면 기존키페어 선택또는 키페어 생성 창
    ssh로 접속하려면 필요하다.
        (이미 받은 키가 있으면 그거 선택하면 됨)
        받은키가 없으면 새 키페어 생성. 
        암호는 .RSA
        텍스트치고 '키페어 다운로드' 하면 .pem 파일 받음.(퍼블릭키)
        2022년에 보니까 이제 ppk바로 다운로드 생겼네.
        (Mac, Linux, Windows 10 이면 .pem)
        (Windows7,8은 Putty에 사용될 .ppk)
        기억하기 쉬운곳에 저장하고 인스턴스 시작.
        비밀번호 대신 이 키페어 파일을 쓸것이고 절대로 잊어버리면 안된다.
    4. putty로 접속해보기. 퍼블릭 dns와 ppk파일 연동해서.
       계정 : ubuntu / 키를 받았기 때문에 비번 필요없음

    ### putty
    SSH접속 프로그램이며 .pem파일을 못읽기 때문에 .ppk파일로 변환하는 작업 해줘야함.
    1. [다운로드](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
    2. puttygen.exe실행
    3. RSA선택후 load후 키 선택
    4. save private key 경고창 예
    5. putty.exe 실행
    세션의 host에 ip주소넣고
    Connection-SSH-Auth 탭에 방금만든 ppk파일 로드하고 Open
    EC2인스턴스가 우분투일 경우 아이디는 ubuntu

5. Security groups(보안그룹) 설정
//첫번째로 생성하는 보안그룹은 콘솔이 생성한 launch-wizard-1
Allow SSH traffic from Anywhere
Allow HTTP traffic from the internet 체크

6. Configure storage
8GiB gp2 그대로 두기
프르티어 30기가 SSD까지 허용됨.
Advanced가서 설정들 확인

7. Advanced details
쭉 아래로 가면 User data영역이 있는데
EC2 인스턴스에 스크립트(명령어)를 전달한다.
```linux
#!/bin/bash
# Use this for your user data
# install httpd(Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
```
#### 보안그룹  #### Security Groups
> EC2 인스턴스의 방화벽
> 포트로의 접근을 통제, 인증된 ip인지 검사, 인바운드 아웃바운드 네트워크 통제(인스턴스 안팎의 트래픽 제어)
- 0.0.0.0/0 은 전체 IP를 뜻함
- 리전과 VPC와 결합되어있다.
- SSH를 위한 별도의 보안그룹을 생성하는 것이 좋다.
- (**중요**)타임아웃으로 앱에 접근할수 없다면 100% EC2 보안그룹의 문제다.
  만약 보안그룹이 확실하게 돼있는데도 불구하고 계속 타임아웃이면 회사 방화벽이나 개인 방화벽이 연결차단하고 있는 것
- 로드밸런서를 쓰면 보안그룹의 다른 보안그룹을 참조한다.
- launch-wizard-1이 ec2인스턴스를 처음만들때 디폴트 보안그룹을 생성한다.

### AMI
> Amazon Machine Image
> 소프트웨어 구성이 결정되어진 템플릿(운영체제, CPU, RAM, 런타임, 용량 등)
> 현재 서버의 하드웨어, 소프트웨어설정, 어플리케이션 등 모든것을 그대로 사용하기 위해서 사용
> 위에서 계속 봤던 EC2를 생성했을때도 사실 아마존 AMI를 통해서 인스턴스 생성을 했었다.
- 설치 및 설정이 완료된 EC2인스턴스를 신속하게 생성해야할때, 오토스케일링 등으로 자동화할때, EC2인스턴스를 다른 리젼으로 이전해야 할때, 상용 솔루션을 사용해야 할때 사용
- AWS에서는 비어있는 EC2인스턴스에 직접 OS를 설치할 수 없기 때문에 AMI를 이용해 OS가 이미 설치된 인스턴스를 생성한다.
- 운영체제만 설치된 컴퓨터를 대여할 수도 있고, 운영체제와 함께 특정 런타임이 설치된 컴퓨터를 대여할 수도있다. 사용용도에맞게 쓰면된다.
인스턴스를 설치하고 부팅하는데 필요한 모든것을 '패키지'화한 환경이라고 보면된다. 부팅시간이 훨씬 빨라진다.
- 아마존이 커스터마이징해놓은 EC2인스턴스가 있고 사용자지정 AMI를 만들 수도 있다. 커스터마이징 해놓은것을 AWS마켓플레이스에서 사고팔수도 있다.
- AMI를 만들면 EBS 스냅샷을 생성한다.
- AMI에서 인스턴스를 바로 시작가능. 
- 배포단위

<AMI 프로세스>
1. ec2인스턴스 만들고 커스터마이징
    //ec2인스턴스가 있어야 AMI를 만들수있다는 말이다.
2. ec2인스턴스 중지. data integrity를 위해서
3. AMI 생성.  이것은 또한 EBS 스냅샷을 할것이다.
4. 다른 AMI에서 인스턴스 실행할수 있게됨

<AMI 실습>
//잘 돌아가는 인스턴스 있을때
1. 우클릭 - Image and templates - Create image -정보넣고 이미지 생성 으로 AMI생성
2. 좌측메뉴 Images - AMIs 에 보면 만들어진 AMI확인가능
3. 생성한 AMI는 나중에 인스턴스를 새로 생성할때 My AMIs에서 사용할 수 있다.



### EC2 Image Builder
AMI를 자동으로 생성, 유지, 검증, 테스트 할수 있어야 한다.
서비스 자체는 무료라서 기본 리소스 비용만 지불하면 된다.
즉, AMI를 통해 생성한 ec2인스턴스 비용, AMI스토리지 비용은 지불해야한다.
<실습>
EC2 Image Builder - Image pipelines - Create image pipeline
Build schedule 설정
choose Recipe
image name은 Amazon Linux 2 x86
Components
Test 구성요소 설정
어떤 ec2인스턴스 유형에 대해 생성할지 정하기
IAM설정 //보여주는 설명 잘보고 검색
AWS infrastructure에 instance type은 t2.microt선택
배포설정
create pipeline  주황색 버튼
생성됐으면 Actions - Run pipeline

ec2열어서 cmd에서 확인
    aws --version
    java --version 


#### EC2 Instance Store
> EC2는 네트워크 드라이브지만 제한된 성능이다.
  고성능을 위해서는 물리적인 디스크(EC2 Instance Store)를 사용한다.
- 버퍼, 캐시, 스크래치 데이터 용으로 사용한다.
  장기 스토리지는 EBS가 적절
- EC2 Instance Stroe를 종료하면 스토리지도 종료된다.

#### EFS
> Elastic File System(엘라스틱 파일 시스템 : 관리형 **네트워크 파일 시스템**)
- 장점
    이 시스템을 한번에 수백개의 EC2인스턴스에 마운트 가능
    //EBS볼륨은 한번에 하나의 EC2 인스턴스에만 마운트 가능
    1개의 가용영역에 한정되지 않음
- 단점
    - EBS에 비해 3배가량 비쌈   //단 사용량에 따라만 지불하지 요금제는 없음
- 유의
    - Linux EC2 인스턴스에서만 사용가능
- 비용최적화
    파일접근주기에 따라 비용최적화 과정을 거친다.
    EFS-IA 스토리지 클래스는 EFS 표준 스토리지 클래스보다 92% 저렴
    이 작업은 자동으로 일어난다.


#### Amazon FSx
> AWS에서 타사의 고성능 파일 시스템을 얻는 관리형 서비스
- 종류
for Lustre, for Windows File Server, for NetApp ONTAP
- 윈도우 파일 서버를 위한 FSx
    - 윈도우 파일 서버에 설계한 완전 관리형
    - 신뢰성과 확장성이 높은 윈도우 기본 파일 공유 시스템
    - SMB 프로토콜, 윈도우 NTFS지원
- Lustre를 위한 FSx
    - 고성능 컴퓨팅을 위한 완전 관리형, 고성능, 확장가능한 파일 공유 시스템
    - Linux와 cluster의 합
- 실습은 어려워서 건너뛴다고 함



### 프로토콜
- 22 : SSH
- 21 : FTP(File Transfer Protocol)
- 22 : SFTP(Secure FTP)
- 80 : HTTP
- 443 : HTTPS
- 3389 : RDP(Remote Desktop Protocol) : 윈도우 인스턴스

#### SSH
> Secure Shell
> 리눅스 인스턴스에서 명령어로 서버에 직접 명령내리는 프로토콜
- 윈도우10이하면 putty사용해야함. 윈도우10이상에서는 putty해도 되고 그냥 ssh를 해도된다.
- EC2 Instance Connect를 쓰면 터미널이나 putty가 아니라 웹에서 ssh접속가능하다. 그러나 Amazon Linux2에서만 가능하다.
  - 인스턴스 선택후 상단의 Connect버튼 /  EC2 Instance Connect탭 / Connect버튼
  - 이것을 쓰면 키를 관리할 필요가 없다. 이미 인증, 인가는 되었고 내부에서 ssh를 사용한다.
  - whoami  ,   ping google.com  같은걸로 테스트 해보자.
  - aws configure 명령어로 키, 리전 등을 입력하려고 하면 매우 매우 매우 안좋은 방법이다. 그럼 계정상의 누구라도 다시 ec2 인스턴스 커넥트 등을 통해 접속하여 자격증명을 얻어낼수 있기 때문
    즉, 해서는 안된다는 말이다. 대신 IAM을 사용해라.
    aws iam list-users    //이 EC2 인스턴스에 연결된 IAM리스트가 보인다.
- .pem 또는 .ppk(푸티에서 사용) 파일명에 공백이 있으면 안된다.
- 사용법
  - ssh 유저명@퍼블릭아이피주소
  - 예) ssh ec2-user@3.250.26.200
  - The authenticity of host '아이피주소' can't be established
    뜨면 응답으로 yes를 입력
  - Too many authentication failures 경고 뜨면 응답으로 yes를 입력
  - 이 경고를 안뜨게 하려면 다운받았던 .pem파일을 명령에 참고해줘야 한다.
    - 파일위치에 터미널을 이동
    - ls로 .pem파일 확인한다음
    - ssh -i 파일명.pem 유저명@퍼블릭아이피주소
    - 보호되지 않은 프라이빗키파일 오류뜸
    - 권한변경명령 : chmod 0400 파일명.pem
    - 나갈려면 logout
    - 인스턴스 껐다켜면 ip주소 바뀌는것에 유의.
- 윈도우10에서 사용법
  - 파워쉘에서 ssh 쳤을때 usage 블라블라 나와야됨
  - .pem파일있는곳으로 이동
  - ssh -i .\파일명.pem ec2-user@퍼블릭아이피주소
    - 호스트인증을 할수 없다. yes입력
    - 만약 권한 문제 생기면 탐색기에서 .pem파일 우클릭 - 속성 - 보안 - 고급 - 권한변경


#### ec2의 가격정책
1년동안 매일 24시간 매달750시간(24시간*31일 =744) 프리티어는 무료.
예약 인스턴스는 1년동안 미리 선금지불하면 최대 75% 할인
온디맨드는 쓰는만큼 탄력적으로 돈내는거
업로드는 공짜. 나갈때 돈나감.  한달동안 1기가까지는 무료

8. 실행
보통 10초, 늦어도 1분안에 실행된다.

9. 테스트
인스턴스 대쉬보드에서
퍼블릭 ip주소 복사해서 쳐보면 처음에 설정했떤 첫페이지 나온다. hell world 프라이빗 아이피
//https가 아니라 http프로토콜로 해야되는것 확인
//그러나 인스턴스를 새로시작하면 퍼블릭 ip주소가 바뀐다.

<인스턴스 생성후 설정 변경하는 법>
1. 네트워크및 보안 탭
해당인스턴스와 연결된 보안그룹에 가서 inbound규칙 열어주기
최소한으로 열어주려면 사용할 http서버와 ssh 20포트 2개 열어주면 된다.
적당히 열려면 http(all ipv4), https(all ipv4), ssh(22), mysql, oracle 등

5. 왼쪽 사이드바에 탄력적 ip찾아서 할당
작업 - 탄력적 ip주소 연결(릴리즈는 해제/삭제)
이제 서버(컴퓨터)만 받은것이다. 여기에 웹서비스가 가능하도록 설정해야한다.
아래 putty에서부터 제대로 다뤄보자.

6. 인스턴스 껐다 켜면 ip주소가 바뀐다. 안바뀌게 하고싶으면 탄력적ip설정
인스턴스 id클릭해서 오른쪽위 '연결' 버튼 누르면 우리가 받은 리눅스 서버에 접속하는 여러가지 방법들이 나옴. 웹에서 접속할수도 있음.
따로 프로그램으로 접속하려면 putty같은 ssh클라이언트 깔아야됨. putty를 사용하기위해 아래 마저 해주면됨.

### putty
폰트, 포트 등 설정을 바꿨으면 현재 상태 그대로 저장해야지 저장안하면 다음에 켰을대 또 디폴트다.
https://mozi.tistory.com/191
1. putty 설치 https://victorydntmd.tistory.com/338
2. puttyGen 실행  load 로 .pem 가지고오고 Save privateKey 버튼 클릭
3. putty실행
    HostName에 탄력적ip 주소 넣고  port는 디폴트인 22  connectionType은 SSH
    Connection- SSH - Auth  찾아보기에서 방금만든 .ppk 불러오기
    Session탭에 이름넣고 저장한다음 open
    처음 계정  : 우분투 서버일때는 ubuntu, 아마존 리눅스일때는 ec2-user
3. 접속했으면 sudo apt update;(우분투)
    sudo apt-get upgrade;(우분투)
    sudo yum update;      //현재 깔수있는 프로그램 리스트를 업데이트
4. 자바 설치 https://kitty-geno.tistory.com/25
    설치가능한 버전 확인 : sudo yum list | grep jdk
    오픈jdk는 1.8버전이 최신이네.. sudo yum install java-1.8.0-oepnjdk
    is this ok 물어보면 y 입력
    java -version 으로 확인

5.  환경변수 설정
    which java   하면 /usr/bin/java 나옴
    readlink -f /usr/bin/java
    위의 readlink명령어로 나온경로가 JAVA_HOME에 등록될 경로다.
    /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-1.amzn2.0.2.x86_64/jre/bin/java 가 나오는데 _64까지 복사하자.
    sudo vim /etc/profile    shift g (맨마지막으로이동)
            export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-1.amzn2.0.2.x86_64
            export PATH=$PATH:$JAVA_HOME/bin
            export CLASSPATH=$JAVA_HOME/jre/lib:$JAVA_HOME/lib/tools.jar

6.  깃 설치
    sudo yum install -y git
    git --version

7.  배포하기
    ~경로에서 mkdir apps
    cd apps/
    git clone 깃주소
    cd 프로젝트명
    ll

8.  빌드하기
    sudo chmod 777 ./gradlew
    ./gradlew build
        실패. invalid source release: 11
        11버전으로 바꾸는법 : https://lemontia.tistory.com/941
        ```
        /usr/bin/java 가 /etc/alternatives/... 를 가르키는 것을 볼 수 있다.
        가르키는 이유는 yum 방식을 통해 java를 설치하게 되면 버젼 관리 대상으로 들어가기 때문이다.
        리눅스에서는 버전관리를 위한 명령어를 제공하는데 그것이 바로 alternatives 라는 명령어이다.
        업무적으로 JDK 버전을 바꾸어 줘야하는 상황이 오면 일일히 $JAVA_HOME, java, javac, javadoc, jar … 등 손이 가는 데가 많다.
        alternatives --config java
        sudo alternatives --config javac
        이후 /etc/profile 이나 / .bash_profile 에서 $JAVA_HOME을 새로 설정
        하고 변경내역 저장 : source /etc/profile

        테스트에서 에러 나서 테스트 제외하고 빌드하는법
        ./gradlew build -x test
        ```
    cd build/libs/
    ll

9.  타임존 변경
    sudo rm /etc/localtime
    sudo ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime
    date 로 확인


10. 서버실행
    SpringBoot는 톰캣 서버가 내장되어있으므로 jar파일(빌드된 파일)만 실행시켜주면 됨
    만들어진 jar파일을 var/www/ 에 넣어줘야한다.
    cp 복사할곳
    java -jar 파일명.jar   이렇게 하면 세션이 끊어지면(cmd창을 끄면) 서버의 가동도 끊기기 때문에 백엔드에서 동작하도록
    nohup java -jar 파일명.jar &

11. 웹에서 접속
    동적ip와 포트번호 잘쳐주고 inbound설정해줬으면 들어가짐.


## EBS
> Elastic Block Store
- 인스턴스가 실행중인 동안 연결가능한 네트워크 드라이브
인스턴스가 종료된 후에도 데이터를 지속할 수 있다.
- 네트워크상에서 꽂았다 뺐다 할수있는 USB스틱이라고 생각하면 된다.
다른점은 물리적으로 연결되는게 아니라 네트워크상으로 연결되는 것이다.
- EC2나 RDS의 디스크가 바로 이 EBS다.
- (**중요**) 특히 RDS를 사용할때 조심해야 하는 것은 처음 서버를 생성할 때 auto backup이 활성화되어있기 때문의 과금의 요소가 됨.
    CCP레벨에서는 1개의 EBS는 1개의 EC2 인스턴스에만 마운트 가능
    어소시에이트레벨에서는 일부 EBS는 다중 연결 가능(Multi-Attach)
<요금>
    무료 등급에서는 매달 30GB
    1GB의 스냅샷 무료.   추가되는 스냅샷 1GB당 0.05불의 추가비용
가용영역에 lock되어있어서 us-east-la 에서 쓰던것을 us-east-lb 에서 연결할 수 없다.
<설치>
//용량과 IOPS(초당전송수)를 지정
//종료시 삭제 속성(Delete on Termination)이 있다. 디폴트는 false
현재 가용영역과 같은 것(인스턴스 네트워크탭에서 Availability zone) 선택 해야하는것에 유의
생성이 끝나면 연결. 상태가 Available이 되면 Actions버튼에서 Attach volume

<접근, 수정>
인스턴스 클릭하고 아래 Storage탭으로 이동해서 볼륨아이디선택
또는 왼쪽 Elastic Block Store 의 Volumes탭 선택


### EBS Snapshots
원하는시점의 상태를 백업하는 것
EBS Volume이 나중에 삭제되더라도 해당 백업을 통해 복구가능
스냅샷을 위해 볼륨을 분리할 필요는 없지만 권장
복구에도 쓸 수 있고, 여러 가용영역과 리전간 복제에도 사용가능
EBS Snapshot Archive 특성을 이용하면 또 다른 스토리지 티어인 아카이브 티어로 옮길 수 있다. 비용이 75%나 저렴하다.
대신 스냅샷을 복구하는데 24~72시간이 든다. 그러니 중요도가 높지않은 것에 사용


<생성>
Actions버튼 - Create Snapshot
왼쪽메뉴 Elastic Block Store탭 - Snapshots
다른리전으로 옮기려면 생성된 인스턴스 우클릭 - Copy snapshot
볼륨자체를 재생성할수도있다. Actions버튼 - Create volume from snapshot

##### Recycle Bin
윈도우의 휴지통같은 휴지통 기능이 있다.
Retention기간동안 복원할수있도록 완전삭제 하지 않는다.
Snapshots인스턴스의 아래 Strage tier를 보면 
delete snapshot하면 



## ec2에 깃헙 장고 프로젝트 올리기
참고 : https://nerogarret.tistory.com/46
readme.md파일 안만들면 로컬리파지터리 그대로 리모트로 올리기 쉽다.
ubuntu로 ec2까지 만들고 putty로 연결.
mkdir srv
sudo chown -R ubuntu:ubuntu /srv/
git clone [레포지토리 주소]
WSGI(Web Server Gateway Interface) server를 설치해야한다.
    가상환경 세팅      sudo apt-get install python3-venv
    가상환경 만들기    python3 -m venv myvenv
    가상환경 활성화 가상환경만든 위 풀더에서 source myvenv/bin/activate

로컬의 프로젝트 폴더 들어가서 
 패키지백업 : pip freeze > requirements.txt
 하면 현재 환경의 의존 라이브러리들이 저 파일에 써진다.

우분투에서
 패키지설치 : pip3 install -r requirements.txt
 

python3 manage.py runserver 0:8080
퍼블릭dns주소:8080 접속해도 아직 로딩만 되고 페이지 안뜸

1. setting.py의 ALLOWED_HOSTS = ['*']

2. ec2의 보안탭의 인바운드 규칙 tcp 8080 추가해주고
https연결 안되기 때문에 http로 바꾸고 ip주소:8080 해주면 접속된다.

3. 로그를 보면 400에러뜨면서 http만 제공되는데 hpps로 접속하려고 하고있다고함. https접속되게 하려면 SSL인증서 다운받고 nginx(웹서버)나 uWSGI(WAS)에 적용 해야되는데 너무 어려움. 현재는 주소에 https로 시작하는것을 http로 바꾸면 접속된다.

//(**중요**)백그라운드로 실행하려면 
실행법 : nohup 명령어 &
종료하는법 : ps -ef | grep 포함문자열
			kill -9 번호



---

- 프로세스의 pid확인
 리눅스에서는 ps -ef | grep 프로세스이름    ps -eo command | grep ]$ | sort
 윈도우 cmd에서는 tasklist | findstr "프로세스이름"
- 프로세스 죽이기
kill -9 프로세스번호

- 단일 파일을 로컬에서 원격지로 보내기
 scp [옵션] [파일명] [원격지_id]@[원격지_ip]:[받는 위치]
예)  scp testfile2 root@192.168.159.129:/tmp/testclient




---
##### <스프링부트가 아니라 스프링이나 jsp로 한 경우 - 시작>
톰캣설치. 스프링부트로 했다면 내장톰캣이라서 설치 필요없다.
<wget 설치 방법>
1. 다운받기 wget 주소.tar.gz		//톰캣에서 링크주소 복사. https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz
2. 압축풀기 tar -zvxf 압축파일이름.tar.gz
3. 압축풀린곳의 bin폴더밑의 startup.sh파일 실행
설치위치는 /home/ubuntu/apache-tomcat-9.0.55다.


<apt-get 설치방법. 안됨 >
    sudo apt-get install tomcat9			//톰캣9 설치
    sudo /usr/share/tomcat9/bin/version.sh  //버전확인
    sudo ufw allow 8080/tcp					//uncomplicated firewall에 8080포트 등록
    sudo service tomcat9 start				//톰캣 실행


자기 ip복사해서 브라우저에서 주소:8080 으로 접속해서 톰캣 첫화면 뜨는지 확인.
안뜨면 inbound 사용자정의 8080 추가

netstat안돼서 설치. sudo apt install net-tools
netstat -npl	//톰캣 서버 실행중인지 확인


톰캣 고양이 화면 뜨는걸 완료했으면 앞으로 할일은 ftp로 프로젝트 파일을 WAS(톰캣)에 올리는것과
데이터베이스도 내컴퓨터에있던것을 서버에 구축하는것이다.
# war업로드
1. 파일질라 클라이언트 다운로드
2. 키 추가 (설정 - sftp - 가지고있는 .pem파일 추가)
3. 새사이트 추가 (sftp, 키추가, 사용자는 ubuntu)
4. 톰캣 폴더의 webapps 폴더안에 war파일 갖다놓고
5. 브라우저에서 ip주소:8080/war파일이름  치면 접속됨
---
### 기본 리눅스 명령어
ls = list   현재 위치에서 파일이나 폴더의 리스트를 보여준다.
cd = Change Directory   현재 경로를 이동한다.
. = 현재경로
.. = 부모
경로사이의 / = 경로사이의 구분자
pwd = present Working Directory.   현재위치
sudo = 루트관리자 권한으로 실ㄴ행해라
yum = 리눅스의 설치명령어
~ = 홈경로			//home/ec2-user
/ = 루트경로
mkdir = make directory의 약자. 폴더생성
chomod = 권한 변경
whoami = 접속계정확인
붙여넣기는 ctrl v 가 아니라 shift insert

//리눅스 권한은 rwx 의 순서.
x = 1. 실행권한
w = 2. 쓰기권한
r = 4. 읽기권한
[소유자][그룹][아무나]


### 스프링부트 아마존리눅스에 배포
인스턴스 만들고
1. sudo yum install -y git
1. sudo amazon-linux-extras install java-openjdk11
1. java -version으로 확인
1. 홈경로에서 폴더만들고 이동  mkdir apps   cd apps
1. 깃클론  git clone 깃주소
1. 권한부여 chmod 777 gradlew
1. 빌드  ./gradlew bootjar  
        //  ./build/libs 디렉터리에 실행파일 생긴다.
        // 80% 에서 멈춘다면 8080포트 열어주자.
1. 실행  ./gradlew bootRun
        //빌드때 만든 jar를   java -jar 로 직접실행해도된다.
1. 백그라운드에서 cmd창 꺼도 계속 실행되게 하려면 nohup ./gradlew bootRun &

//팁 : 80포트는 권한문제로 server.port = 80 으로 해줘도 빌드시 에러터짐. 권한이 없어서 그럼.
     그래서 80포트로 오면 8080으로 가게 포트포워딩 해주는 방식 사용
     sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080


---
위의거 다 했으면 jenkins 로 자동 배포 해볼수 있고
docker 도 공부해볼수 있다.
### jenkins
https://ywook.tistory.com/33
https://blog.nachal.com/1633
1. 만든 EC2에서 새 키 페어 생성하고 키 페어 다운로드




## RDS
Relational Database Service
자동백업(오토백업. 자동 스냅샷)을 하지않도록 유의해야한다. 100만원넘게 나온다.
아마존에서 디비를 운영하는 2가지 방법이 있다. EC2인스턴스에 직접 설치, 운영하는방법과  RDS를 이용한 인스턴스 생성.
DB와 어플리케이션을 한서버에 설치해야하는 특별한 제약이 없는한 2번째방법이 좋다.
1. 서비스 - RDS - 데이터베이스 생성 버튼 클릭
    Region(지역) 선택
    db엔진 선택
    db인스턴스 크기 선택(프리티어)
    db식별자 설정   //AWS 의 DB 식별자는 실제 DB 스키마 이름이 아니다.
    마스터계정 설정
    스토리지 설정
    **아래로 내리다가 퍼블릭 어세스 꼭 '예'로 설정**
    **추가구성 - 데이터베이스 옵션 - 초기데이터베이스 이름이 실제 물리적 스키마 이름임**
    **추가구성 - 백업 - 자동백업 활성화가 디폴트인데 반드시 꼭 해제 해줘야함. 요금폭탄의 원인**
    최종관리자 아이디, 비밀번호 까먹지 않기.
2. 생성했으면 dbeaver로 접속해보자.(생성하는데 좀 시간걸림. 너무많이 걸린다싶으면 새로고침)
Hostname에 엔드포인트 전체 복사해서 입력
오라클이라면 ServiceName 에 orcl(19라면)
MySql이라면 ServiceName 비워둠
Role은 Normal로 아까만들었던 계정으로 접속하면됨.
Username은 RDS생성할때 입력했던 마스터 계정
(**중요**)윈도우에서는 테이블명 대소문자 안가리는데 리눅스 기반에서는 가린다.

3. root계정말고 다른계정을 쓴다면 user생성하고 권한주고
주의해야할점은 localhost뿐만아니라 %에도 줘야한다는 점이다.
사용하는 보안그룹(default) 의 inbound 위치 everywhere 추가

human_suwon.naver.com
비번 xxxx3#

오라클root 아이디 : ggoomter
비번 :하던대로



#### IAM
> Identity and Access Management
- 사용자를 생성하고 그룹에 배치하기 때문에 '글로벌 서비스'에 해당
- **루트계정은 오직 계정을 만들때만 사용되어야 한다.*
  - 그러므로 aws를 접속하면 가장 먼저 할일을 IAM콘솔에 들어가서 계정을 만드는 일이다.
  - 그룹만들고 권한 부여하고 
  - 비번 등 설정하고 Download.csv 다운  //사용자들의 자격증명정보
  - 대쉬보드에서 AWS Account에 보면 Id와 Alias가 있다.
  - 개인용 Sign-in URL을 별도로 주기도하고,  로그인할때 IAM user 선택해서 id나 별칭 입력해서 들어올 수도 있다.
  - 로그인시는 3가지정보(id나별칭, username, 비번)이 필요
- 그룹으로 묶을수있다.  그룹에는 다른그룹은 못들어가고 사용자만 배치할 수 있다.  개발팀, 운영팀 같이
  - 그룹에 포함되지 않은 사용자는 당연히 있을 수 있다.
  - 한명이 서로다른 그룹에 속할 수도 있다.
- 목적 : Permissions(권한)
- AWS는 최소권한의 원칙을 적용한다. 꼭 필요한 이상의 권한을 주지 않는다.

    ##### IAM의 구조
    - JSON형태
    - SID : Statement 에 대한 id
    - Effect : 해당 Statement에 대한 접근을 Allow할지 Deny할지
    - Principal : 이 정책이 적용될 account/user/role
    - Action : 이 정책이 허용하고 거부할 액션들
    - Resource : 이 정책이 적용될 리소스 리스트
    
    ##### IAM 실습
    여러가지 권한줘보고 뺏고 접속하고 기능 실행해보기
    IAM 역할
    IAM 왼쪽 사이드에 보면 Roles가 있다. 여러역할중 aws Service만 알면된다.
    IAM Security Tools에는 2가지가 있는데 IAM Credential Report는 acoount-level에 해당하고
    IAM Access Advisor는 user-level에 해당한다.
    ##### IAM MFA (Multi Factor Authentication)
    보안을 높이기 위한 2가지.  비밀번호 정책, 다요소인증
    ##### MFA 실습
    IAM콘솔에서 Access management / Account settings / Change password policy
    root계정일때는 로그인후 오른쪽위 계정이름 / My Security Credentials / MFA
    Authy = 폰의 QR코드로 인증
    그 하드웨어를 절대 잊어버리면 안된다.

##### AWS 접속
이때까지 웹으로만 접속했지만 사실 3가지가 있다.
1. AWS 콘솔
2. CLI
3. SDK

####  엑세스키
엑세스 키 아이디는 유저네임과 같고
시크릿 엑세스 키는 패스워드와 같다.
절대 엑세스키를 공유하지마라.

### CLI
- AWS서비스를 쉘의 커맨드 라인을 통한 명령어로 상호작용 할수 있게 해주는 툴
- 리소스를 관리하는 스크립트를 관리해 자동화 할 수 있다.
- 콘솔대신 사용한다.
- 윈도우에 설치하려면 그냥 구글이나 aws콭솔에서 CLI검색해서 .msi받으면 됨.  2버전이 사용법은 같으나 성능향상
- 설치확인 aws --version
- <실습>
  - IAM유저로 접속후 Security credentials들어가서 Access key 생성 , 다운로드
  - aws configure
  - aws iam list-users
  
#### CloudShell 
- 이 서비스는 모든 리전에서 사용가능한것이 아니기 때문에 한국이라면 아시아태평양(뭄바이), 아시아태평양(도쿄) 활용
- 화면의 종옆에 있는 프롬프트창 아이콘
- 글자크기, 테마 등 조정가능
- 파일 업로드, 다운로드 가능

#### 자격증명보고
- Credential report - Download Report
- IAM관리 - Access management - Users - Access Advisor 에서 4시간동안의 활동내역 볼 수 있다.

#### VPC (가상사설망)
- Vitual Private Cloud. 가상 사설 클라우드. 가상의 데이터센터
- 회사의 네트워크를 보안상의 이유로 분리하고싶다면 기존 인터넷 선공사 다시하고 내부선 다 뜯어고치며 다시 전용선을 깔아줘야한다. 이를위해 가상의 망 VPN을 사용하게 된다. VPN은 실제로 같은 네트워크상에 있지만 논리적으로 다른네트워크 인것처럼 동작한다.
- VPC는 원칙적으로 PUBLIC 인터넷에서 접근이 불가능한것이 특징
- 목적 자체가 외부와 격리된 네트워크를 만드는 것이다.
- aws내부에 있다 하더라도 원칙적으로는 내부의 다른 서비스들과 서로 통신안된다.
- E2C는 VPC안에 있어서 원칙적으로는 퍼블릭 인터넷으로 접근 불가능하지만 인터넷 게이트웨이를 통해서 가능하도록 했다.
- VPC가 엇다면 EC2인스턴스들이 서로 거미줄처럼 연결되어 시스템의 복잡도를 매우 끌어올리고 하나의 인스턴스만 추가돼도 모든 인스턴스를 수정해야한다.
- 리전단위로 구성되며 다양한 서브넷을 구성할 수 있다.

#### 서브넷 # SUBNET
- VPC의 하위 단위로 VPC에 할당된 IP를 더 작은 단위로 분할한 개념
- 하나의 서브넷은 하나의 가용영역안에 위치
- 계정을 만들면 각 가용영역별로 기본 서브넷이 있는 기본 VPC를 준다.
- 퍼블릭서브넷과 프라이빗서브넷이 있다.

## 예산설정
계정 - My Billing Dashboard
IAM계정으로 저길 들어가려면 먼저 루트계정으로 접속해 IAM User and Role Access to Billing Information에서 Activate IAM Access에 체크해줘야한다.
- Billing Console > Budgets > Create budget - 예산잡기 - 알림설정
- Add Action

#### Beanstalk (EB) 실패
- 서버에서 개발된 웹 애플리케이션 및 서비스를 간편하게 배포하고 조정할 수 있는 서비스
- AWS 상에 코드을 업로드하기만 하면 용량 프로비저닝, 로드 밸런싱, Auto Scaling, 애플리케이션 상태 모니터링에 대한 정보를 자동으로 처리해주는 서비스
1. 프로젝트 준비 :  장고프로젝트가 담긴 깃헙 리파지토리
1. 아마존 계정준비
aws회원가입
서울로 리전 변경
aws 계정에 IAM사용자를 추가하여 자격증명(Credential) 발급
>    - aws 콘솔에 로그인 한 뒤 상단 nav의 username을 누르시면 dropdown 메뉴가 나옵니다. 여기서 ‘내 보안 자격증명’ 클릭
- 사용자이름 seoulHuman   엑세스키(프로그래밍방식) 체크 다음
- 그룹생성
  beanstalk검색하고 AWSElasticBeanstalkFullAccess 해라는데 없어서 제일위에꺼

     - 새 액세스 키 만들기. credentials.csv라는 파일이 자동 다운로드
2. beanstalk생성하고 로컬 zip파일 업로드
3. 그냥 이렇게만 하면 502 에러뜬다.
4. https://testdriven.io/blog/django-elastic-beanstalk/ 시키는대로 하다가 django.config 파일의 경로가 달라서 맞춰줌
5. EB CLI설치
pip install awsebcli --upgrade --user
환경변수 PATH 등록 C:\Users\human\AppData\Roaming\Python\Python39\Scripts
eb --version 으로 깔린거 확인
eb init -p python-3.6 앱이름
credentials aws-access-id 랑 넣으라고 함
csv의 3번째와 4번째

---
<샘플 정보>
ggoomter
human_suwon@naver.com  xxxx3#   328314143063
ggoomter2@gmail.com  xxxx3#   177318059854 2022년 5월9일 ec2, rds 삭제
name human_tester
(ip주소 54.180.120.40)gradle

