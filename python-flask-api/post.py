import requests

# Define the base URL of your Flask API
base_url = "http://127.0.0.1:5000/"

new_onboarding = {
    "companyResources": [
        "https://www.uni-mannheim.de/studium/im-studium/pruefungen/pruefung-ablegen/pruefungstermine/",
        "https://www.uni-mannheim.de/it/support/speedtest/",
    ],
    "employeeResources": ["https://www.uni-mannheim.de/it/support/speedtest/"],
    "requirements": [
        "Include a showcase of employees",
        "Make sure web skills like HTML, CSS and Javascript are covered",
    ],
}

# Make a POST request to generate the onboarding
response = requests.post(f"{base_url}/generate-onboarding", json=new_onboarding)

# Check if the request was successful
if response.status_code == 201:
    print("New Onboarding raged successfully:")
    print(response.json())
else:
    print(f"Error: {response.status_code}")
