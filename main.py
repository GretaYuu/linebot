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
  events = request.get_json(force=True)['events']

  # 迭代處理每個事件
  for event in events:
    if event['type'] == 'message' and event['message']['type'] == 'text':
      user_message = event['message']['text']
      print('收到使用者輸入: ', user_message)
      if user_message == '開始使用':
        print("判斷式沒錯")
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

    elif event['type'] == 'postback':
      data = event['postback']['data']
      if data == 'menu2':
        reply_token = event['replyToken']
        # 建立景點地區選單的 JSON
        another_menu = {
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
              "text": "縣市選擇"
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
              "style": "link",
              "height": "sm",
              "action": {
                "type": "uri",
                "label": "台北市",
                "uri": "https://linecorp.com"
              }
            }, {
              "type": "button",
              "style": "link",
              "height": "sm",
              "action": {
                "type": "uri",
                "label": "高雄市",
                "uri": "https://linecorp.com"
              }
            }, {
              "type": "button",
              "action": {
                "type": "uri",
                "label": "action",
                "uri": "http://linecorp.com/"
              }
            }],
            "flex":
            0
          }
        }

        line_bot_api.reply_message(
          reply_token, FlexSendMessage(alt_text='景點地區選單',
                                       contents=another_menu))
      elif data == 'menu3':
        reply_token = event['replyToken']
        generator = MenuGenerator()
        another_menu3 = generator.generate_another_menu3()
        areaN_menu = generator.generate_areaN_menu()

        # 使用選單 JSON
        line_bot_api.reply_message(
          reply_token,
          FlexSendMessage(alt_text='美食地區選單', contents=another_menu3))
        line_bot_api.reply_message(
          reply_token,
          FlexSendMessage(alt_text='北部地區選單',
                          contents=areaN_menu))  #0606目前北部地區按鈕可按但無該地區縣市返回
  return 'OK'


# 使用 Flask 框架的內建伺服器來啟動應用程式
if __name__ == "__main__":
  app.run(host='0.0.0.0', port=8080)
