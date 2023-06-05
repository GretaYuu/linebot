from pymongo import MongoClient

def connect_to_mongodb():
   # 取得 MongoDB 連線 URI
  username = config.get('mongodb', 'username')
  password = config.get('mongodb', 'password')
  clustername = config.get('mongodb', 'clustername')
  dbUri = f"mongodb+srv://{username}:{password}@{clustername}/?retryWrites=true&w=majority"
    
    # 連接 MongoDB Atlas
    client = os.environ.get("")
  
    # 返回 MongoClient 物件
    return client