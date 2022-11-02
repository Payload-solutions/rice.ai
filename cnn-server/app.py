#!/usr/bin/env python

from flask import (
    Flask,
    jsonify
)

from random import randint

app = Flask(__name__)


@app.route("/")
def index():
    return jsonify(
        {"ping": "pong",
         "value": 3500
         })


@app.route("/testing_values")
def testing_values():
    return jsonify({
        "first_values": [randint(1, 100) for _ in range(15)],
        "second_values": [randint(1, 100) for _ in range(15)]
    })


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
