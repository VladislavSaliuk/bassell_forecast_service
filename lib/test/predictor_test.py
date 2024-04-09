import unittest
import sys
from datetime import datetime
from sklearn.linear_model import LinearRegression
sys.path.append('D:\\bassell_forecast_service\\lib')
from prediction_model.predictor import train_model, predict_weather

class TestPredictionModel(unittest.TestCase):

    def test_train_model(self):
        model_temp, model_prec, model_humidity = train_model()

        self.assertIsInstance(model_temp, LinearRegression)
        self.assertIsInstance(model_prec, LinearRegression)
        self.assertIsInstance(model_humidity, LinearRegression)

    def test_predict_weather(self):
    
        time_str = '12:00'
        date_str = '2024-04-01'

        prediction_data = predict_weather(time_str, date_str)
        self.assertIsInstance(prediction_data, dict)
        self.assertIn('date', prediction_data)
        self.assertIn('time', prediction_data)
        self.assertIn('temperature', prediction_data)
        self.assertIn('precipitation', prediction_data)
        self.assertIn('humidity', prediction_data)

        self.assertIsInstance(prediction_data['date'], str)
        self.assertIsInstance(prediction_data['time'], str)
        self.assertIsInstance(prediction_data['temperature'], str)
        self.assertIsInstance(prediction_data['precipitation'], str)
        self.assertIsInstance(prediction_data['humidity'], str)

        self.assertAlmostEqual(float(prediction_data['temperature']), 10.63190138799962, delta=1.0)
        self.assertAlmostEqual(float(prediction_data['precipitation']), 0.07653821860199983, delta=1.0)
        self.assertAlmostEqual(float(prediction_data['humidity']), 74.96923255868842, delta=1.0)

if __name__ == '__main__':
    unittest.main()
