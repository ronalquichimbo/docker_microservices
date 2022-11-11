from pymongo import MongoClient

DB_NAME = 'movies'

connection = MongoClient(f'mongodb://127.0.0.1:27017/{DB_NAME}')
db_client = connection[DB_NAME]
