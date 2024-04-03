from flask import Flask, jsonify, request

app = Flask(__name__)

# Route to add a new book
@app.route('/generate-onboarding', methods=['POST'])
def add_book():
    parameters = request.json
    # Here comes the rag and rest of the backend
    return jsonify("Marc ist ein gut bestückter 🍆 und aussehender Mann!!!😍"), 201

if __name__ == '__main__':
    app.run(debug=True)