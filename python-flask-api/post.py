import requests

# Define the base URL of your Flask API
base_url = 'http://127.0.0.1:5000/'

# Data for the new book
new_onboarding = {"a": "10", "b": "10"}

# Make a POST request to add a new book
response = requests.post(f'{base_url}/generate-onboarding', json=new_onboarding)

# Check if the request was successful
if response.status_code == 201:
    print("New Onboarding added successfully:")
    print(response.json())
else:
    print(f"Error: {response.status_code}")