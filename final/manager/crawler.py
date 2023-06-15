import requests as req
from bs4 import BeautifulSoup
import json

title = ['生肖', '事業運', '財運', '愛情運', '幸運色', '幸運數字', '事業貴人', '開運方位']
informations = []
header = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36'}
urllist = ['https://www.smxs.com/shengxiaoriyun/shu',
            'https://www.smxs.com/shengxiaoriyun/niu',
            'https://www.smxs.com/shengxiaoriyun/hu',
            'https://www.smxs.com/shengxiaoriyun/tu',
            'https://www.smxs.com/shengxiaoriyun/long',
            'https://www.smxs.com/shengxiaoriyun/she',
            'https://www.smxs.com/shengxiaoriyun/ma',
            'https://www.smxs.com/shengxiaoriyun/yang',
            'https://www.smxs.com/shengxiaoriyun/hou',
            'https://www.smxs.com/shengxiaoriyun/ji',
            'https://www.smxs.com/shengxiaoriyun/gou',
            'https://www.smxs.com/shengxiaoriyun/zhu']
for url in urllist:
    information = []

    r = req.get(url, headers=header)
    r.encoding = 'utf-8'
    soup = BeautifulSoup(r.text, 'html.parser')

    # 生肖名字
    sxname = 'div.sxname'
    sxname_articles = soup.select(sxname)
    for art in sxname_articles:
        information.append(art.text)

    # 事業運/財運/愛情運
    work = 'div.ysdesc'
    work_articles = soup.select(work)
    for art in work_articles:
        a = art.text
        b = ""
        for i in a:
            if i != " " and i != "\n" and i != "\r":
                b += i
        information.append(b)

    # 開幸資訊
    luck = 'div.kyitem div.kyzhi'
    luck_articles = soup.select(luck)
    for art in luck_articles:
        information.append(art.text)

    informations.append(information)


headers = {"Content-type": "application/json", "Accept": "application/json"}
url = "https://api.zhconvert.org/convert"
params = {
    "converter": "Taiwan",
    "text": json.dumps(informations, ensure_ascii=False)
}
session = req.Session()
response = session.get(url, headers=headers, params=params)
file_path = r'C:\\xampp\\htdocs\\term_project\\news.json'

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(response.json()["data"]["text"])
