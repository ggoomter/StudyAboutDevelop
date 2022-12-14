from selenium import webdriver
import chromedriver_autoinstaller
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
import json
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
import time
import pandas as pd   # to use csv
import numpy as np
import csv
import base64

# 크롬 드라이버와 주소 불러오기

login_url = 'https://www.dreamspon.com/member/login.html'
list_url = 'https://www.dreamspon.com/scholarship/list.html'
detail_url = 'https://www.dreamspon.com/scholarship/view.html'

# 옵션설정
options = Options()
options.headless = True
# options.add_argument('headless')
options.add_argument("window-size=1920,1200")
# 사람처럼 보이게 하는 옵션들
options.add_argument("disable-gpu")   # 가속 사용 x
options.add_argument("lang=ko_KR")    # 가짜 플러그인 탑재
options.add_argument('user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36')  # user-agent 이름 설정
print("옵션 설정끝")

# 드라이버 설정
#driver = webdriver.Chrome("C:/Users/human/Documents/crawling/chromedriver")    # 직접 로딩. 브라우저창 보임
chromedriver_autoinstaller.install()        # 하드코딩 아닌 자동로딩
driver = webdriver.Chrome(options=options)  # 브라우저 창 안보임
driver.get(login_url)
# driver.implicitly_wait(3)   #찾으려는 element가 로드될때까지 기다림. 단위는 seconds

# 자동 로그인
# driver.find_element_by_xpath('//*[@id="mbr_id"]').send_keys('ggoomter@gmail.com')
# driver.find_element_by_xpath('//*[@id="pwd_in"]').send_keys('00700070')
#xpath로 선택.  이외에도 find_element_by_id, find_element_by_name 등이 있다.
driver.find_element_by_xpath('//*[@id="mbr_id"]').send_keys('sallyzmk@gmail.com')
driver.find_element_by_xpath('//*[@id="pwd_in"]').send_keys('humanedu')
driver.find_element_by_xpath('//*[@id="loginForm"]/div[1]/input').click()
# 리디렉션한 횟수가 너무 많습니다.
# post결과를 크롤링 하고 리다이렉션되는 페이지가 접근불가한 상황이면 404에러를 발생한다.
# post방식일때 request의 세션에 업데이트해주는 방식을 써줘야하는듯

# 검색 결과가 렌더링 될 때까지 잠시 대기
# time.sleep(2)

# 로그인후 쿠키정보
# _cookies = driver.get_cookies()
# cookie_dict = {}
# for cookie in _cookies:
#     cookie_dict[cookie['name']] = cookie['value']


# 로그인화면에서 로그인버튼을 눌렀을때 실행할 js 분석해보면
# login_proc_url = '/process/checkuser.html';
#  data: {
# 	mode:'login',
# 	userid:id,
# 	idsaveCheck:idsaveCheck,
# 	autoLogin:autoLogin,
# 	pageReferer:pageReferer,
# 	userpw:pw
# },
# d이후에 data.pageLink로 이동


session = requests.Session()
headers = {'User-Agent': 'Mozila/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36(KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62'}
# headers = {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}
session.headers.update(headers)


# 로그인후 리스트 크롤링
# response = session.get(list_url);  # 드림스폰 전체일반장학금 리스트
# soup = BeautifulSoup(response.text, 'lxml');

print("로그인 완료후 세션 얻어옴")


# 로그인후 디테일 크롤링. 뷰티풀솝으로 가져오면 백단에서 넘어온 데이터 비어있음
# for idx in range(500, 5810):
#     print(str(idx)+"글 시작")
#     response = requests.get(detail_url, params="idx="+str(idx));  # 드림스폰 전체일반장학금 디테일.  idx=154~5809
#     #print(response.url)  #전달되는 url확인.  https://www.dreamspon.com/scholarship/view.html?idx=155
#     html = response.text                        # get으로 받은 값을 text형태로 바꿈
#     soup = BeautifulSoup(html, 'html.parser') # 뷰티풀솝에 있는 여러기능을 이용할 수 있도록 html형식으로 파싱
#     elements = soup.select('.scholarship04')
#     for ele in elements:
#         print(ele.text.strip())
        
# 로그인후 디테일 크롤링 셀레니움으로 가져오도록 수정
results = []
for idx in range(5790, 5792):
    request_url = detail_url+"?idx="+str(idx)
    #print("요청url : "+request_url)
    response = driver.get(request_url);  # 드림스폰 전체일반장학금 디테일.  idx=154~5809
    #print(response.url)  #전달되는 url확인.  https://www.dreamspon.com/scholarship/view.html?idx=155
    soup = BeautifulSoup(driver.page_source, 'html.parser')
    elements = soup.select('.scholarship04 > dd > p')  # html그대로 다 가져옴
    
    results.append('*****'+str(idx)+'번 글*****')
    for ele in elements:
        if (ele.text == "" or ele.text == " "):
            results.append("공백 걸러냄")
        else:
            results.append(ele.text)    #html에서 text만 가져옴
    
# 이전방식과 최신방식, 중간방식의 html구조와 타이틀이 다른것을 발견
# 최신리스트의 css형식 //*[@id="tab1s"]/dl/dd/p[번호]/span/strong
# elements = soup.select('.scholarship04 > dd > p > span > strong')  # 최신것만 이 형식임
# 신청기간   # 선발인원     # 장학혜택   # 접수방법    # 지원대상    # 신청자격    # 장학금문의 
# 이전리스트의 css형식  // .scholarship04 > dt
        # 1. 모집기간, 2. 선발인원 및 장학혜택,  3. 접수방법  4. 공통서류   5.선발대상   6. 거주조건   7. 성적조건   8. 소득조건 
        # 9. 계열조건  10. 특수조건  11. 제외 대상 및 기타사항
# .tab_menu(탭메뉴) > #t_content(장학정보탭) > .scholarship04 > dd

# numpy와 판다스로 저장

arr = np.array(results, dtype=object)
df = pd.DataFrame(arr)  #헤더컬럼넣고싶으면 여기에
print(df)


# f =  open('C:/Users/human/Documents/crawling/test.csv', 'w', newline='', encoding='utf-8')
# newline=''를 넣어야 작성후 한줄바꾸기가 없어진다.   주지않으면 writerow이후 줄바꿈이 자동시행
# delimiter를 빼면 한글자 한글자 마다 컴마가 들어감
# csv.writer 로 저장하니까 글자 하나가 하나의 셀에 들어감
# writer = csv.writer(f) #공백생기는 문제는 csv.writer를 윈도우에서 사용할때 발생. 윈도우는 \n을 \r\n으로 치환하기 때문에 결과적으로 \r\r\n이 되기때문
# writer.writerow(fields) 
# writer.writerows(df)
# f.close()

# csv로 저장
print("csv로 저장하겠습니다.")
fields = ['aaaa', 'bbb', 'cc']
df.to_csv('C:/Users/human/Documents/crawling/test2.csv', index=False, mode='w', encoding='utf-8-sig', quoting=csv.QUOTE_MINIMAL, doublequote=False, header=None)
# to_csv 함수의 인자들
# https://pandas.pydata.org/pandas-docs/version/0.25.1/reference/api/pandas.DataFrame.to_csv.html
    # sep : 필드 딜리미터. 디폴트는 ','
    # na_rep : 빈값 표현. 디폴트는 ''
    # quoting : csv모듈의 옵션상수. 디폴트는 csv.QUOTE_MINIMAL
    # quotechar : 한문장 끝날때마다 앞뒤에 붙을 문자하나. 디폴트는 '"'
    # doublequote : 구문분석 여부. 불린. 디폴트는 True. 필드안에서 quotechar 쓸건지
    # escapechar : 적절한 경우 이스케이프 하는데 사용될 문자하나. 디폴트는 None
    

print("csv로 저장 완료")


# 드라이버 종료
driver.quit()


