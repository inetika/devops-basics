import os
import ipdb

from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, world!"

if __name__ == "__main__":
    ipdb.set_trace()
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))