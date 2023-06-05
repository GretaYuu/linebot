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
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "中部地區",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "南部地區",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "花東地區",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "離島地區",
            "uri": "https://linecorp.com"
          }
        }]
      }
    }
    return menu3

  @staticmethod
  def generate_areaN_menu():
    areaN_menu = {
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
          "text": "選擇北部地區縣市",
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
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "臺北市",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "新北市",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "基隆市",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "新竹市",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "桃園市",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "新竹縣",
            "uri": "https://linecorp.com"
          }
        }, {
          "type": "button",
          "style": "link",
          "height": "sm",
          "action": {
            "type": "uri",
            "label": "宜蘭縣",
            "uri": "https://linecorp.com"
          }
        }],
        "flex":
        0
      }
    }
    return areaN_menu
