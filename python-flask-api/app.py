from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/generate-onboarding', methods=['POST'])
def add_book():
    parameters = request.json
    companyResources = parameters["companyResources"]
    employeeResources = parameters["employeeResources"]
    requirements = parameters["requirements"]


    return jsonify(companyResources,employeeResources,requirements), 201

if __name__ == '__main__':
    app.run(debug=True)