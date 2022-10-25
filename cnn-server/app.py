#!/ur/bin/env python

from flask import (
    Flask,
    jsonify
)

app = Flask(__name__)


@app.route("/")
def index():
    return jsonify({"ping": "pong"})


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
