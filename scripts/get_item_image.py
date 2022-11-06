import requests
from bs4 import BeautifulSoup

base_url = 'https://www.starbucks.com.sg'
url = 'https://www.starbucks.com.sg/menu/beverages'

headers = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) '
                  'Chrome/107.0.0.0 Safari/537.36',
}

res = requests.get(url, headers=headers, timeout=10)
soup = BeautifulSoup(res.text, 'html.parser')

category_content = soup.find_all(attrs={'class': 'col-md-4 col-6'})

flag = 0
for sections in category_content:
    if flag == 0:
        flag = flag + 1
        continue
    # analyze content
    drink = sections.find_all(name='a')
    # print(drink)
    if len(drink) >= 2:
        img_url = base_url + str(drink[0].get('style')).split("'")[1]
        img_url = img_url.replace(" ", "%20")
        print(img_url)
        drink_name = drink[1].text
        print(drink_name)
        drink_name = drink_name.replace(" ", "_")
        drink_name = drink_name.replace("™", '')
        drink_name = drink_name.replace("®", '')
        # save img
        req = requests.get(img_url, headers=headers)
        with open('./output_img/' + drink_name + '.jpg', 'wb') as f:
            f.write(req.content)



