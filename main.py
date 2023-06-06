# 匯入相關套件
from flask import Flask, request, abort
from linebot import (LineBotApi, WebhookHandler)
from linebot.exceptions import InvalidSignatureError
from linebot.models import (
  MessageEvent,
  TextMessage,
  TextSendMessage,
  FlexSendMessage,
)
import os
import mongo
from MenuGenerator import MenuGenerator

app = Flask(__name__)

# 新版replit金鑰密碼類要放在secrets
token = os.environ.get("CHANNEL_ACCESS_TOKEN")
secret = os.environ.get("CHANNEL_SECRET")
line_bot_api = LineBotApi(token)
handler = WebhookHandler(secret)


@app.route('/callback', methods=['POST'])
def callback():
  # 取得 Line Messaging API 事件
  #events = request.get_json(force=True)['events']
  events = request.get_json()['events']

  city_logic_mapping = {
    '台北市': location_taipei_city,
    #'高雄市': location_kaohsiung_city,
    #'台中市': location_taichung_city,
    # 其他城市與對應的處理邏輯
  }

  def handle_query():
    event = request.get_json(force=True)['events'][0]  # 獲取事件物件
    location = event['postback']['data']
    print(location)
    result = query_location(location)
    return result
    # 將結果組成回覆訊息回傳給使用者
    # ...

  def query_location(location):
    # 執行資料庫查詢
    results = collection.find({'Region': '臺北市'}).limit(5)
    print(results)
    return results

  # 迭代處理每個事件
  for event in events:
    if event['type'] == 'message' and event['message']['type'] == 'text':
      user_message = event['message']['text']
      #print('收到使用者輸入: ', user_message)
      if user_message == '開始使用':
        # print("判斷式沒錯")
        reply_token = event['replyToken']
        btntp = {
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
              "text": "按鈕樣版1"
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
                  "text": "FLEX MESSAGE SIMULATOR   設計",
                  "wrap": True,
                  "color": "#666666",
                  "size": "sm",
                  "flex": 5
                }]
              }, {
                "type":
                "box",
                "layout":
                "baseline",
                "spacing":
                "sm",
                "contents": [{
                  "type": "text",
                  "text": "Time",
                  "color": "#aaaaaa",
                  "size": "sm",
                  "flex": 1
                }, {
                  "type": "text",
                  "text": "10:00 - 23:00",
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
            "contents": [
              {
                "type": "button",
                "style": "link",
                "height": "sm",
                "action": {
                  "type": "postback",
                  "label": "查景點",
                  "data": "menu2"
                }
              },
              {
                "type": "button",
                "style": "link",
                "height": "sm",
                "action": {
                  "type": "postback",
                  "label": "找美食",  #目前找美食的按鈕按下去後，控制台會返回500錯誤但程式依然可繼續執行
                  "data": "menu3"
                }
              }
            ],
            "flex":
            0
          }
        }

        # 判斷回覆令牌是否存在，進行回覆
        # alt_text特殊情況替代文字(包括預覽文字)
        if reply_token:
          print("replyToken")
          line_bot_api.reply_message(
            event['replyToken'],
            FlexSendMessage(alt_text='開始選單', contents=btntp))
    #景點2
    elif event['type'] == 'postback':
      data = event['postback']['data']
      if data == 'menu2':
        reply_token = event['replyToken']
        # 建立景點地區選單的 JSON
        another_menu = {
          "type":
          "carousel",
          "contents": [{
            "type": "bubble",
            "header": {
              "type":
              "box",
              "layout":
              "vertical",
              "contents": [{
                "type": "image",
                "url":
                "https://lh3.googleusercontent.com/Ul1S7hbqOqUG-Z-5CtmuksZJjJ8_v-cbDvAIWkgMhZbVFpJSnrV4NIbd3Y-yvZjhyIiBVLAlpRyk9GywBFFfV5AeqQLEpMpTYaPtV4ibTwdYiJ8BKt_PGNOakYZxIZbJh-YEJHM0CM5_TZCyts-s8Mz_7pFABMeQiQ-8FLnYTqIoaYK8-0mpqBQmEP3E70c1W7DznvJxPGcI1KNr_x-cLex42-S1mWF0h3fp3nRkQL06vF91zAvT9mYPD37K-KvRA55BvFeLg9R8jsK1fmCfk8LIE7onJhzL3MP-eMydfArwa27qvBQImUKgmuTH63s-sSqURKEbvV3GygYDHkyVaGlzX3aqYL-NyJB09EWRhP8PYTuVE_6wVTZ66tPIjJfSHw5dDNNjUCMjlRRnsXtZw7CddKgH0u-1fSI8s8AEvtpVWYAqBBUZR-gy767aWm55HxFztkFcqkgWxHMsPinorejFkPhCg68DqksumUh5lBUc5C5PAXr6HfXigzOGnBlemds8mDXdzKeceiTW0Q1MbhcNEacpvHacub93Ka2z9IZgmmqM5Ih6t9HDxUt6tiONln2ogM1Jnsl4cPieWXGssHxuiZa6bL_ErSgvX_axSyF9K9Oy0SiLvmqo_dey9ilPqSKAioo7faHTBYMLaccZ-yt4KEbJzKZhUty_5yMGX9V4Y3tKZUuWAA2xp0o1Ajxspp4nbjanMtU0ZW_WVQPJvRsUahjjt-FUAX9jKqjKpBdzdmkWLoTUDVWtN0g7hz5IaEl5PyM5q3bY6lWUl4rBvVCtb2szWqCBSgdpsJgbuaP64p1f-Fz6e6-B1sevFzYEfPACnDDTWLkTyEsi4xWf-Utb-U6HXhTPtCix1NKem7JiKfbGCHOgc7uuPKvPiASJRatwa1WG3qOwnwQlXlkMn4YtmKd4FH78SUgh4FBgdzrwR2HsOrjMtw6iKwUm0hECjD6XmYjliJWAmKjzNsEoOBIZ2fO8-l93UpQO5fNe3x60jLROOMaPzbv3In6MyfQrz4KiPkWdKsdiHvxDg0nmLGwIEjA=w650-h748-s-no?authuser=0",
                "size": "5xl"
              }]
            },
            "hero": {
              "type":
              "box",
              "layout":
              "vertical",
              "contents": [{
                "type": "text",
                "text": "向右滑查看更多縣市",
                "align": "center"
              }],
              "position":
              "relative"
            },
            "body": {
              "type": "box",
              "layout": "vertical",
              "contents": []
            }
          }, {
            "type": "bubble",
            "header": {
              "type": "box",
              "layout": "vertical",
              "contents": [{
                "type": "text",
                "text": "北部",
                "size": "xl"
              }]
            },
            "hero": {
              "type":
              "box",
              "layout":
              "vertical",
              "contents": [{
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "台北市",
                  "data": "hello"
                }
              }, {
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "新北市",
                  "data": "hello"
                }
              }, {
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "基隆市",
                  "data": "hello"
                }
              }, {
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "桃園縣",
                  "data": "hello"
                }
              }]
            },
            "body": {
              "type": "box",
              "layout": "vertical",
              "contents": []
            }
          }, {
            "type": "bubble",
            "header": {
              "type": "box",
              "layout": "vertical",
              "contents": [{
                "type": "text",
                "text": "中部",
                "size": "xl"
              }]
            },
            "hero": {
              "type":
              "box",
              "layout":
              "vertical",
              "contents": [{
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "台中市",
                  "data": "hello"
                }
              }, {
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "南投縣",
                  "data": "hello"
                }
              }, {
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "彰化縣",
                  "data": "hello"
                }
              }]
            },
            "body": {
              "type": "box",
              "layout": "vertical",
              "contents": []
            }
          }]
        }

        # 處理各個城市的邏輯
        line_bot_api.reply_message(
          reply_token, FlexSendMessage(alt_text='景點地區選單',
                                       contents=another_menu))
      
      elif data == 'menu3':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        another_menu3 = generator.generate_another_menu3()

        # 使用美食選單 JSON
        line_bot_api.reply_message(
            reply_token,
            FlexSendMessage(alt_text='美食地區選單', contents=another_menu3))
        
      elif data == 'areaN':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        areaN_menu = generator.generate_areaN_menu()
        line_bot_api.reply_message(
            reply_token,
            FlexSendMessage(alt_text='北部地區選單', contents=areaN_menu))
      elif data == 'food_type':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        food_type = generator.food_type_menu()
        line_bot_api.reply_message(
        reply_token,
        FlexSendMessage(alt_text='食物類型選單', contents=food_type))
      
          
      elif data == 'areaC':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        areaC_menu = generator.generate_areaC_menu()
        line_bot_api.reply_message(
            reply_token,
            FlexSendMessage(alt_text='中部地區選單', contents=areaC_menu))
      elif data == 'food_type':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        food_type = generator.food_type_menu()
        line_bot_api.reply_message(
        reply_token,
        FlexSendMessage(alt_text='食物類型選單', contents=food_type))
        
      elif data == 'areaS':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        areaS_menu = generator.generate_areaS_menu()
        line_bot_api.reply_message(
            reply_token,
            FlexSendMessage(alt_text='南部地區選單', contents=areaS_menu))
      elif data == 'food_type':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        food_type = generator.food_type_menu()
        line_bot_api.reply_message(
        reply_token,
        FlexSendMessage(alt_text='食物類型選單', contents=food_type))
        
      elif data == 'areaE':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        areaE_menu = generator.generate_areaS_menu()
        line_bot_api.reply_message(
            reply_token,
            FlexSendMessage(alt_text='花東及離島地區選單', contents=areaE_menu))
      elif data == 'food_type':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        food_type = generator.food_type_menu()
        line_bot_api.reply_message(
        reply_token,
        FlexSendMessage(alt_text='食物類型選單', contents=food_type))
        
    else:
        print("又失敗")

    return 'OK'



def location_taipei_city():
  print("測試")

  # 使用 Flask 框架的內建伺服器來啟動應用程式


if __name__ == "__main__":
  app.run(host='0.0.0.0', port=8080)
  client, db = mongo.connect_to_mongodb()
  collection = db["attractions"]
