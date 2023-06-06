class MenuGenerator:

  @staticmethod
  def generate_another_menu3():
    menu3 = {
      "type": "bubble",
      "body": {
        "type":
        "box",
        "layout":
        "vertical",
        "contents": [{
          "type": "text",
          "weight": "bold",
          "size": "xl",
          "text": "美食地區選單"
        }, {
          "type":
          "box",
          "layout":
          "vertical",
          "margin":
          "lg",
          "spacing":
          "sm",
          "contents": [{
            "type":
            "box",
            "layout":
            "baseline",
            "spacing":
            "sm",
            "contents": [{
              "type": "text",
              "text": "Place",
              "color": "#aaaaaa",
              "size": "sm",
              "flex": 1
            }, {
              "type": "text",
              "text": "FLEX MESSAGE SIMULATOR   製作",
              "wrap": True,
              "color": "#666666",
              "size": "sm",
              "flex": 5
            }]
          }]
        }]
      },
      "footer": {
        "type":
        "box",
        "layout":
        "vertical",
        "spacing":
        "sm",
        "contents": [{
          "type": "button",
          "action": {
            "type": "postback",
            "label": "北部地區",
            "data": "areaN"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "中部地區",
            "data": "areaC"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "南部地區",
            "data": "areaS"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "花東及離島地區",
            "data": "areaE"
          }
        }]
      }
    }
    return menu3

  @staticmethod
  def generate_areaN_menu():
    areaN = {
      "type": "bubble",
      "body": {
        "type":
        "box",
        "layout":
        "vertical",
        "contents": [{
          "type": "text",
          "weight": "bold",
          "size": "xl",
          "text": "選擇北部縣市"
        }, {
          "type":
          "box",
          "layout":
          "vertical",
          "margin":
          "lg",
          "spacing":
          "sm",
          "contents": [{
            "type":
            "box",
            "layout":
            "baseline",
            "spacing":
            "sm",
            "contents": [{
              "type": "text",
              "text": "Place",
              "color": "#aaaaaa",
              "size": "sm",
              "flex": 1
            }, {
              "type": "text",
              "text": "FLEX MESSAGE SIMULATOR   製作",
              "wrap": True,
              "color": "#666666",
              "size": "sm",
              "flex": 5
            }]
          }]
        }]
      },
      "footer": {
        "type":
        "box",
        "layout":
        "vertical",
        "spacing":
        "sm",
        "contents": [{
          "type": "button",
          "action": {
            "type": "postback",
            "label": "台北市",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "新北市",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "基隆市",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "新竹市",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "桃園市",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "新竹縣",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "宜蘭縣",
            "data": "food_type"
          }
        }],
        "flex":
        0
      }
    }
    return areaN

  @staticmethod
  def generate_areaC_menu():
    areaC = {
      "type": "bubble",
      "hero": {
        "type": "image",
        "url":
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.lobby0800.com.tw%2Fcemetery-introduction.html&psig=AOvVaw3yLt0SNDpHpdhvLjGAgW9Z&ust=1685979649413000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMCY0-L5qf8CFQAAAAAdAAAAABAK",
        "size": "full",
        "aspectRatio": "20:13",
        "aspectMode": "cover",
        "action": {
          "type": "uri",
          "uri": "http://linecorp.com/"
        }
      },
      "body": {
        "type":
        "box",
        "layout":
        "vertical",
        "contents": [{
          "type": "text",
          "text": "選擇中部地區縣市",
          "weight": "bold",
          "size": "xl"
        }]
      },
      "footer": {
        "type":
        "box",
        "layout":
        "vertical",
        "spacing":
        "sm",
        "contents": [{
          "type": "button",
          "action": {
            "type": "postback",
            "label": "苗栗縣",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "臺中市",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "彰化縣",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "南投縣",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "雲林縣",
            "data": "food_type"
          }
        }],
        "flex":
        0
      }
    }
    return areaC

  @staticmethod
  def generate_areaS_menu():
    areaS = {
      "type": "bubble",
      "hero": {
        "type": "image",
        "url":
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.lobby0800.com.tw%2Fcemetery-introduction.html&psig=AOvVaw3yLt0SNDpHpdhvLjGAgW9Z&ust=1685979649413000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMCY0-L5qf8CFQAAAAAdAAAAABAK",
        "size": "full",
        "aspectRatio": "20:13",
        "aspectMode": "cover",
        "action": {
          "type": "uri",
          "uri": "http://linecorp.com/"
        }
      },
      "body": {
        "type":
        "box",
        "layout":
        "vertical",
        "contents": [{
          "type": "text",
          "text": "選擇南部地區縣市",
          "weight": "bold",
          "size": "xl"
        }]
      },
      "footer": {
        "type":
        "box",
        "layout":
        "vertical",
        "spacing":
        "sm",
        "contents": [{
          "type": "button",
          "action": {
            "type": "postback",
            "label": "高雄市",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "臺南市",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "嘉義市",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "嘉義縣",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "屏東縣",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "澎湖縣",
            "data": "food_type"
          }
        }],
        "flex":
        0
      }
    }
    return areaS

  @staticmethod
  def generate_areaE_menu():
    areaE = {
      "type": "bubble",
      "hero": {
        "type": "image",
        "url":
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.lobby0800.com.tw%2Fcemetery-introduction.html&psig=AOvVaw3yLt0SNDpHpdhvLjGAgW9Z&ust=1685979649413000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMCY0-L5qf8CFQAAAAAdAAAAABAK",
        "size": "full",
        "aspectRatio": "20:13",
        "aspectMode": "cover",
        "action": {
          "type": "uri",
          "uri": "http://linecorp.com/"
        }
      },
      "body": {
        "type":
        "box",
        "layout":
        "vertical",
        "contents": [{
          "type": "text",
          "text": "選擇東部及離島地區縣市",
          "weight": "bold",
          "size": "xl"
        }]
      },
      "footer": {
        "type":
        "box",
        "layout":
        "vertical",
        "spacing":
        "sm",
        "contents": [{
          "type": "button",
          "action": {
            "type": "postback",
            "label": "花蓮縣",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "臺東縣",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "金門縣",
            "data": "food_type"
          }
        }, {
          "type": "button",
          "action": {
            "type": "postback",
            "label": "連江縣",
            "data": "food_type"
          }
        }],
        "flex":
        0
      }
    }
    return areaE

  @staticmethod
  def food_type_menu():
    food_type = {
      "type": "bubble",
      "body": {
        "type":
        "box",
        "layout":
        "vertical",
        "contents": [{
          "type": "text",
          "weight": "bold",
          "size": "xl",
          "text": "美食類別選單"
        }, {
          "type":
          "box",
          "layout":
          "vertical",
          "margin":
          "lg",
          "spacing":
          "sm",
          "contents": [{
            "type":
            "box",
            "layout":
            "baseline",
            "spacing":
            "sm",
            "contents": [{
              "type": "text",
              "text": "Place",
              "color": "#aaaaaa",
              "size": "sm",
              "flex": 1
            }, {
              "type": "text",
              "text": "FLEX MESSAGE SIMULATOR   製作",
              "wrap": True,
              "color": "#666666",
              "size": "sm",
              "flex": 5
            }]
          }]
        }]
      },
      "footer": {
        "type":
        "box",
        "layout":
        "vertical",
        "spacing":
        "sm",
        "contents": [{
          "type": "button",
          "action": {
            "type": "uri",
            "label": "鍋類",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "action": {
            "type": "uri",
            "label": "日式",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "action": {
            "type": "uri",
            "label": "燒肉",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "action": {
            "type": "uri",
            "label": "早午餐",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "action": {
            "type": "uri",
            "label": "甜點類",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "韓式",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "餐酒館/酒吧",
            "uri": "https://linecorp.com"
          }
        }],
        "flex":
        0
      }
    }
    return food_type
