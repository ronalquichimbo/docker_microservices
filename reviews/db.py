from pymongo import MongoClient

DB_NAME = 'reviews'

connection = MongoClient(f'mongodb://mongodb:27017/{DB_NAME}')
db_client = connection[DB_NAME]
