from flask import Flask, jsonify, request
from flask_jwt import jwt_required, current_identity
from werkzeug.security import generate_password_hash, check_password_hash
from auth import jwt
from db import db_client
import sys

class User(object):
    def __init__(self, id, username):
        self.id = id
        self.username = username


def authenticate(username, password):
   
    result = db_client.users.find_one({'username': username})
    if not result is None:
        clave = check_password_hash(result['password'],password)
        if clave:
            
            return User(str(result['_id']), result['username'])
    return None
     
app = Flask(__name__)
app.config['SECRET_KEY'] = 'tesis_devsecops'

jwt.authentication_callback = authenticate
jwt.init_app(app)


@app.route('/me')
@jwt_required()
def me():
    user_data = {'id': current_identity['id'], 'username': current_identity['username']}

    return jsonify(user_data)

@app.route('/users', methods=['POST'])
def create_user():
    #recibiendo datos
    username= request.json['username']
    password= request.json['password']
    # email = request.json['email']
    if username and password:
        hashed_password = generate_password_hash(password)
        result = db_client.users.find_one({'username': username})
        print('enter getJSONReuslt',result, flush=True)
        if result is None:     
            id = db_client.users.insert(
                {
                    'username': username,
                    'password': hashed_password
                    # 'email': email
                }
            )
            respose= {
                'id': str(id),
                'username': username,
                'password': hashed_password,
                # 'email':email,
                'registrado':'registrado'
            }
            return respose
        else:
            return {'username': "Ya existe"}

    else:
        return not_found()
        
    return {'message': "received"}
