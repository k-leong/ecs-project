from flask import Flask, render_template
import requests
import boto3

app = Flask(__name__)

# Initialize DynamoDB client
# dynamodb = boto3.resource('dynamodb')
# table_name = 'VisitorCounter'
# table = dynamodb.Table(table_name)

# Function to fetch random dog image
def fetch_random_dog_image():
    response = requests.get('https://dog.ceo/api/breeds/image/random')
    data = response.json()
    return data['message']

# Function to increment visitor count
# def increment_visitor_count():
#     table.update_item(
#         Key={'id': 0},
#         UpdateExpression='ADD visitor_count :incr',
#         ExpressionAttributeValues={':incr': 1}
#     )

# Function to get current visitor count
# def get_visitor_count():
#     response = table.get_item(
#         Key={'id': 0},
#         AttributesToGet=[
#         'visitor_count',
#         ]
#     )
#     item = response.get('Item')
#     return item.get('visitor_count', 0) if item else 0

@app.route('/')
def index():
    # Fetch random dog image
    dog_image = fetch_random_dog_image()

    # Increment visitor count
    # increment_visitor_count()

    # Get current visitor count
    # visitor_count = get_visitor_count()

    # return render_template('index.html', dog_image=dog_image, visitor_count=visitor_count)
    return render_template('index.html', dog_image=dog_image)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
