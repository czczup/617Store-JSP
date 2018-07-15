import requests
from bs4 import BeautifulSoup
import MySQLdb
import random
import os

url_pool = {
    "https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-14234872789.136.4564295bWkLamZ&id=546408734932&rn=ce4ddb0ad73d90b885fc06b11913ca40&abbucket=6":[499,499],
    "https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-14234872789.148.4564295bWkLamZ&id=566793113225&rn=ce4ddb0ad73d90b885fc06b11913ca40&abbucket=6":[599,599],
    "https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-14234872789.152.4564295bWkLamZ&id=565690575582&rn=ce4ddb0ad73d90b885fc06b11913ca40&abbucket=6":[699,559],
    "https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-14234872789.180.4564295bWkLamZ&id=521216553937&rn=ce4ddb0ad73d90b885fc06b11913ca40&abbucket=6":[799,639],
    "https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-14234872789.220.4564295bWkLamZ&id=537943994423&rn=ce4ddb0ad73d90b885fc06b11913ca40&abbucket=6":[799,559],
}

db = MySQLdb.connect("localhost", "root", "123456", "617Store", charset='utf8')
cursor = db.cursor()

commodity_id = 75

for url,price in url_pool.items():
    r = requests.get(url)
    r.encoding = r.apparent_encoding
    soup = BeautifulSoup(r.text,"html.parser")

    print("商品名称")
    title = soup.find('div',{'class':"tb-detail-hd"}).h1.get_text().strip()
    title = title.replace("Nike","").replace("耐克官方","").strip()

    print("商品简介")
    quick_review = soup.find('div',{'class':"tb-detail-hd"}).p.get_text().strip()
    print(quick_review)

    tags = quick_review.split()

    print("商品价格")
    print(price)

    print("五张商品主图")
    images = soup.find(id="J_UlThumb").findAll("img")
    image_list = []
    for image in images:
        src = image.get("src")
        pos = src.rfind("_")
        src = src[:pos]
        image_list.append(src)
        print(src)
        if len(image_list) == 5:
            break

    attr_without_image = soup.find('div',{'class':"tb-sku"}).find('dt').get_text()
    print(attr_without_image)
    values_without_image_list = []
    values_without_image = soup.find('div',{'class':"tb-sku"}).find('ul').findAll('li')
    for value in values_without_image:
        values_without_image_list.append(value.find('span').get_text())
    print(values_without_image_list)

    attr_with_image = soup.find('div',{'class':"tb-sku"}).find('dl',{"class":"tm-img-prop"}).find('dt').get_text()
    print(attr_with_image)

    dic = {}
    values_with_image = soup.find('div',{'class':"tb-sku"}).findAll('li')
    for value in values_with_image:
        temp = value.find('a').get("style")
        key = value.find('span').get_text()
        if temp!=None:
            url = temp.split("url(")[1].split(") center")[0]
            pos = url.rfind("_")
            url = url[:pos]
            dic[key] = url
    print(dic)

    """ 插入commodity表 """
    sql = "INSERT INTO commodity (id,title,original_price,discount_price,quick_review,overview,sale_volume) VALUES (%s,%s,%s,%s,%s,%s,%s)"
    cursor.execute(sql,[commodity_id,title,price[0],price[1],quick_review,"/images/commodity/%d/overview.jpg" %commodity_id,random.randint(1000,5000)])
    db.commit()

    """ 插入tag表 """
    for tag in tags:
        sql = "INSERT INTO tag (tag,commodity_id,quantity) VALUES (%s,%s,%s)"
        cursor.execute(sql, [tag,commodity_id,random.randint(0, 100)])
    db.commit()

    """ 查询无图属性信息 """
    sql = "SELECT id FROM attribute WHERE attribute.attribute=%s"
    cursor.execute(sql, [attr_without_image])
    data = cursor.fetchone()
    if data != None:
        attr_1_id = data[0]
    else:
        sql = "INSERT INTO attribute (attribute,image_flag) VALUES (%s,%s)"
        cursor.execute(sql,[attr_without_image,0])
        sql = "SELECT LAST_INSERT_ID()"
        cursor.execute(sql)
        attr_1_id = cursor.fetchone()[0]
        db.commit()

    """ 插入parameter表 无图属性 """
    for value in values_without_image_list:
        sql = "INSERT INTO parameter (commodity_id,attribute_id,value) VALUES(%s,%s,%s)"
        cursor.execute(sql,[commodity_id,attr_1_id,value])
    db.commit()

    """ 查询有图属性信息 """
    sql = "SELECT id FROM attribute WHERE attribute.attribute=%s"
    cursor.execute(sql, [attr_with_image])
    data = cursor.fetchone()
    if data!=None:
        attr_2_id = data[0]
    else:
        sql = "INSERT INTO attribute (attribute,image_flag) VALUES (%s,%s)"
        cursor.execute(sql, [attr_with_image, 1])
        sql = "SELECT LAST_INSERT_ID()"
        cursor.execute(sql)
        attr_2_id = cursor.fetchone()[0]
        db.commit()

    """ 插入parameter表 有图属性 """
    image_id = 1
    for attr,image in dic.items():
        sql = "INSERT INTO parameter (commodity_id,attribute_id,value) VALUES(%s,%s,%s)"
        cursor.execute(sql, [commodity_id, attr_2_id, attr])
        sql = "SELECT LAST_INSERT_ID()"
        cursor.execute(sql)
        parameter_id = cursor.fetchone()[0]
        sql = "INSERT INTO image (image,commodity_id,parameter_id) VALUES(%s,%s,%s)"
        cursor.execute(sql, ["/images/commodity/%d/%d.jpg"%(commodity_id,image_id), commodity_id, parameter_id])

        """ 保存图片到本地文件夹 """
        image_root = "./images/commodity/%d/" %commodity_id
        print(image_root)
        image_path = "./images/commodity/%d/%d.jpg" %(commodity_id,image_id)
        if not os.path.exists(image_root):
            os.mkdir(image_root)
        if not os.path.exists(image_path):
            r = requests.get("http:"+image)
            with open(image_path, 'wb') as f:
                f.write(r.content)
                f.close()
                print("文件保存成功")
        else:
            print("文件已存在")
        image_id += 1
    db.commit()

    """ 插入image表 商品主图 """
    image_id = 97
    for image in image_list:
        sql = "INSERT INTO image (image,commodity_id) VALUES(%s,%s)"
        cursor.execute(sql, ["/images/commodity/%d/%c.jpg"%(commodity_id,chr(image_id)), commodity_id])

        """ 保存图片到本地文件夹 """
        image_root = "./images/commodity/%d/" %commodity_id
        print(image_root)
        image_path = "./images/commodity/%d/%c.jpg" %(commodity_id,chr(image_id))
        if not os.path.exists(image_root):
            os.mkdir(image_root)
        if not os.path.exists(image_path):
            r = requests.get("http:"+image)
            with open(image_path, 'wb') as f:
                f.write(r.content)
                f.close()
                print("文件保存成功")
        else:
            print("文件已存在")
        image_id += 1
    db.commit()
    commodity_id += 1



