from flask import Flask, request, jsonify
from collections import namedtuple
import json
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Load JSON response data
def load_responses(file):
    with open(file) as response_file:
        print(f"Loaded '{file}' successfully!")
        return json.load(response_file)

# Store JSON response data
response_data = load_responses("lib/responses.json")

# Convenience tuple for returning responses
Response = namedtuple('Response', 'bot_response response_type')


def generate_response(user_input: str) -> Response:

    for response in response_data:
        if user_input in response.get('patterns', []):
            return Response(response['responses'][0], response.get('intent', "unknown"))

    return Response("Could not understand.", "unknown")


@app.route('/')
def index():
    return '<h1>Home Page</h1>'


@app.route('/api')
def api():
    user_input = request.args.get('input')
    user_input = user_input.strip('"')
    response = generate_response(user_input)

    json_response = {
        'input': user_input,
        'response': response.bot_response,
        'response_type': response.response_type
    }

    return jsonify(json_response)


if __name__ == '__main__':
    app.run()
