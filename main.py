from flask import Flask,request,jsonify
import openai
import base64
app = Flask(__name__)

@app.route('/')
def home():
    return 'Hello, World! This is my Flask app.'

@app.route("/recommend", methods=["POST"])
def recommend():
    monthly_income = request.json["monthly_income"]
    account=request.json["account"]
    spend=request.json["spend"]
    monthly_save=request.json["monthly_save"]
    product_description=request.json["product_description"]
    product_price=request.json["product_price"]
    a="c2stRTBIVUhhSE95c0QxbFIwRXc1WXZUM0JsYmtGSkR1a1VNMUoybEx5dHBPMlVJN3E4"
    openai.api_key = base64.b64decode(a).decode()

# User input prompt with financial information and desired purchase
    user_prompt = "I have a monthly income of "+str(monthly_income) +", I have " +str(account)+ "in my account, I have spent" +str(spend)+", I want to save "+str(monthly_save)+", and I want to buy "+product_description+" with "+str(product_price)+". Should I buy it?"

# Compose a message for the chat API including the user input prompt
    messages = [
        {"role": "system", "content": "You are a recommendation system that helps users make informed decisions about necessary purchases . starting your answer with yes or no and then give them advices with direct and concise style ."},
        {"role": "user", "content": user_prompt}
    ]

    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=messages,
        max_tokens=150  # Limit the response to 150 tokens for a more detailed response if needed
    )

# Get the assistant's response
    assistant_response = response.choices[0].message['content']

# Analyze the response and check if the system recommends a necessary purchase
    if "buy the car" in assistant_response.lower() and "unnecessary" in assistant_response.lower():
        print("You should prioritize necessary purchases. Consider saving for essential items.")
    else:
        print(assistant_response)
    
    return jsonify(assistant_response)
    


if __name__ == '__main__':
    app.run(debug=True)

