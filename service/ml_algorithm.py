import pandas as pd
import requests
from flask import Flask, request, jsonify
from flask_cors import CORS
import json
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from datetime import datetime

app = Flask(__name__)

def predict_weather(date_str):

    data = pd.read_csv("data.csv")
    data['date'] = pd.to_datetime(data['date'])
    data['year'] = data['date'].dt.year
    data['month'] = data['date'].dt.month
    data['day'] = data['date'].dt.day
    data['hour'] = data['date'].dt.hour

    X = data[['year', 'month', 'day', 'hour']]
    y_temp = data['temperature']
    y_prec = data['precipitation']

    X_train, X_test, y_temp_train, y_temp_test, y_prec_train, y_prec_test = train_test_split(X, y_temp, y_prec, test_size=0.3, random_state=42)

   
    model_temp = LinearRegression()
    model_temp.fit(X_train, y_temp_train)

    model_prec = LinearRegression()
    model_prec.fit(X_train, y_prec_train)

    date = datetime.strptime(date_str, "%Y-%m-%d")
    year = date.year
    month = date.month
    day = date.day
    hour = 7

    predictable_data = pd.DataFrame({'year': [year], 'month': [month], 'day': [day], 'hour': [hour]})
    predicted_temperature = model_temp.predict(predictable_data)[0]
    predicted_precipitation = model_prec.predict(predictable_data)[0]

    print(date)
    print("Predicted temperature for " + date_str + ":", predicted_temperature)
    print("Predicted precipitation for " + date_str + ":", predicted_precipitation)

@app.route('/predict_weather')
def predict_weather_route():
    date_str = request.args.get('date')
    predict_weather(date_str)
    return "Weather prediction generated successfully."

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')