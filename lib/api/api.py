from flask import Flask, request, jsonify
import sys
sys.path.append('D:\\bassell_forecast_service\\lib')
from prediction_model.predictor import predict_weather


app = Flask(__name__)

@app.route('/predict_weather', methods=['GET', 'POST'])
def predict_weather_route():
    time_str = request.args.get('time')
    date_str = request.args.get('date')
    return jsonify(predict_weather(time_str, date_str))

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
