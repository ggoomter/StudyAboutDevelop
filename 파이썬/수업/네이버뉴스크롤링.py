import requests
from lxml import html

url = "https://news.naver.com"
headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0'}
html_req = requests.get(url, headers=headers)

# fromString 은 문서의 내용을 html구조로 해석
tree = html.fromstring(html_req.content)    #인코딩하지 않은 그대로의 문서수집
                                            # .text는 자동으로 인코딩해서 수집
# codec can't encode character 

#xpath규칙에 맞는 부분을 추출
#  슬러쉬2개 : 문서전체,   슬러쉬하나 : 아랫단계,  
#  태그명[@속성="값"]
#titles = tree.xpath('//div[@class="hdline_article_tit"]/a/text()')
titles = tree.xpath('//html/body/div[2]/div/section[1]/div[2]/div/div[1]/div[7]/div[2]/div[2]/ul/li/div/a/span/text()')
print(titles)


results = []
for title in titles:
    title_clean = title.replace("\n", " ").replace("\t", " ").replace("\r", " ").strip()
    results.append(title_clean)
print(len(results))
print(results)

#/html/body/div[2]/div/section[1]/div[2]/div/div[1]/div[7]/div[2]/div[2]/ul/li[1]/div/a/span
#/html/body/div[2]/div/section[1]/div[2]/div/div[1]/div[7]/div[2]/div[2]/ul/li[2]/div/a/span