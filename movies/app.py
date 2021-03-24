from bson import ObjectId
from bson.errors import InvalidId
from flask import Flask, request, jsonify
from flask_jwt import jwt_required, current_identity

from auth import jwt
from db import db_client

app = Flask(__name__)
app.config['SECRET_KEY'] = 'tesis_devsecops'
jwt.init_app(app)


@app.route('/movies/')
def movies_list():
    results = db_client.movies.find()
    movies = []
    for result in results:
        movies.append({
            'id': str(result['_id']),
            'title': result['title']
        })
    return jsonify(movies)


@app.route('/movies/<string:movie_id>')
def movie_detail(movie_id):
    try:
        result = db_client.movies.find_one({'_id': ObjectId(movie_id)})
    except InvalidId:
        result = None
    if result is None:
        return jsonify({'error': 'Movie not found'}), 404
    movie = {
            'id': str(result['_id']),
            'title': result['title'],
            'description': result['description'],
            'rating': result['rating'],
            'reviews': result['reviews']
        }
    return jsonify(movie)


@app.route('/movies/<string:movie_id>/rating', methods=['POST'])
def update_movie_rating(movie_id):
    data = request.json
    movie = db_client.movies.find_one({'_id': ObjectId(movie_id)})
    if movie is None:
        return jsonify({'error': 'Movie not found'}), 404
    movie['reviews'] += 1
    new_rating = movie['rating'] + data['rating']
    db_client.movies.update_one(
        {'_id': ObjectId(movie_id)},
        {'$set': {'rating': new_rating, 'reviews': movie['reviews']}})
    return '', 201


@app.route('/movies', methods=['POST'])
@jwt_required()
def create_movies():
    #recibiendo datos   
    if not request is None:     
        id = db_client.movies.insert(
            {
                'title': request.json['title'],
                'description': request.json['description'],
                'rating': request.json['rating'],
                'reviews': request.json['reviews']
            }
        )
        respose= {
            'id': str(id),            
            'registrado':'registrado pelicula'
        }
        return respose
    else:
        return not_found()
        
    return {'message': "received"}

