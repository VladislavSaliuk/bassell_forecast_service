import unittest
import requests

class TestAPI(unittest.TestCase):

    def test_predict_weather_route(self):
        url = 'http://192.168.88.38:5000/predict_weather'
        params = {'time': '12:00', 'date': '2024-04-01'}
        response = requests.get(url, params=params)

        self.assertEqual(response.status_code, 200)
        data = response.json()
        self.assertIn('temperature', data)
        self.assertIn('precipitation', data)
        self.assertIn('humidity', data)

if __name__ == '__main__':
    unittest.main()
