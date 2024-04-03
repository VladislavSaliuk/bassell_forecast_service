import pandas as pd
from flask import Flask, request, jsonify
from flask_cors import CORS
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from datetime import datetime
import sqlalchemy
from pymysql import connect

app = Flask(__name__)


def predict_weather(date_str):
    data_base = connect(host = 'localhost', user = 'root', passwd = 'Krimkodeks1_', database = 'weather_data')
    query = "select * from data"
    data = pd.read_sql(query,data_base)
    data['history_date'] = pd.to_datetime(data['history_date'])
    data['year'] = data['history_date'].dt.year
    data['month'] = data['history_date'].dt.month
    data['day'] = data['history_date'].dt.day
    data['hour'] = data['history_date'].dt.hour

    X = data[['year', 'month', 'day', 'hour']]
    y_temp = data['temperature']
    y_prec = data['precipitation']
    y_humidity = data['humidity']

    X_train, X_test, y_temp_train, y_temp_test, y_prec_train, y_prec_test, y_humidity_train, y_humidity_test = train_test_split(X, y_temp, y_prec, y_humidity , test_size=0.3, random_state=42)

    model_temp = LinearRegression()
    model_temp.fit(X_train, y_temp_train)

    model_prec = LinearRegression()
    model_prec.fit(X_train, y_prec_train)

    model_humidity = LinearRegression()
    model_humidity.fit(X_train, y_humidity_train)

    date = datetime.strptime(date_str, "%Y-%m-%d")
    year = date.year
    month = date.month
    day = date.day
    hour = 7

    predictable_data = pd.DataFrame({'year': [year], 'month': [month], 'day': [day], 'hour': [hour]})
    predicted_temperature = model_temp.predict(predictable_data)[0]
    predicted_precipitation = model_prec.predict(predictable_data)[0]
    predicted_humidity  = model_humidity.predict(predictable_data)[0]

    print(date)
    print("Predicted temperature for " + date_str + ":", predicted_temperature)
    print("Predicted precipitation for " + date_str + ":", predicted_precipitation)
    print("Predicted humidity for " + date_str + ":", predicted_humidity)
    print("Weather prediction generated successfully.")

    prediction_data = {'date' : date_str ,'temperature': predicted_temperature, 'precipitation': predicted_precipitation, 'humidity' : predicted_humidity}
    return jsonify(prediction_data)  

@app.route('/predict_weather', methods=['GET', 'POST'])  
def predict_weather_route():
    date_str = request.args.get('date')
    return predict_weather(date_str)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
