
from flask import (
    jsonify,
    request
)
import flask

import pickle
from flask_cors import cross_origin
from werkzeug.utils import secure_filename
import unittest
import os

from  .net.net import prediction

def allowed_files(filename: str):
    ALLOWED_EXTENSIONS = {
        'png',
        'jpg',
        'jpeg',
        'JPEG'
    }
    return '.' in filename and \
        filename.rsplit('.', 1)[1].lower()\
        in ALLOWED_EXTENSIONS

def create_routes(app: flask.app.Flask) -> None:
    
    @app.route("/history_values", methods=["GET"])
    def history_values():
        return jsonify({
            "message": "hello test"
        })
    
    
    @app.route("/train", methods=["POST"])
    @cross_origin(origin='127.0.0.1', headers=['Content- Type',
        'Authorization'])
    def convolution():
        try:
            files = request.files.get('img')
            filename = secure_filename(files.filename)
            try:
                if not allowed_files(filename):
                    return jsonify({
                        "message":"Error trying to receive the image",
                        "type":"ERROR"})
                
                files.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
                
                file_path = f"temp/image/{filename}"
                print(file_path)
                
                """here is whenever the prediction take relevance
                """
                print(prediction(x=file_path))
                return jsonify(prediction(x=file_path))
            except Exception as e:
                print(str(e))
                return jsonify({
                    "message": "error"
                })
        except Exception as e:
            print(str(e))
            return jsonify({
                "message":"Error trying to receive the image",
                "type":"ERROR"})
