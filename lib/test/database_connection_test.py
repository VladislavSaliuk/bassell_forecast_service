import unittest
import sys
from unittest.mock import patch
sys.path.append('D:\\bassell_forecast_service\\lib')
from database.database_connection import connect_to_database

class TestDatabaseConnection(unittest.TestCase):

    @patch('database.database_connection.create_engine')
    def test_connect_to_database(self, mock_create_engine):
        mock_engine = mock_create_engine.return_value
        engine = connect_to_database()
        mock_create_engine.assert_called_once_with('mysql+pymysql://root:Krimkodeks1_@localhost/weather_data')
        self.assertEqual(engine, mock_engine)

if __name__ == '__main__':
    unittest.main()
