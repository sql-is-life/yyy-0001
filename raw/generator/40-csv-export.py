import csv
import json
from datetime import datetime

# Data to be written
data = [
    {
        "DeviceId": 5,
        "DeviceDetails": {
            "DevicePrice": "$500",
            "DeviceTypeName": "MusicMaker3000",
            "DeviceTypeId": "1",
            "SerialNumber": "123567890"
        },
        "OccurredAt": "2018-04-05T12:00:00"
    },
    {
        "DeviceId": 55,
        "DeviceDetails": {
            "DevicePrice": "$600",
            "DeviceTypeName": "MusicMaker3000",
            "DeviceTypeId": "1",
            "SerialNumber": "123567890"
        },
        "OccurredAt": "2018-04-05T12:00:00"
    }
]

# Get the current UTC time in the format yyyymmddhhmmss
current_utc_time = datetime.utcnow().strftime('%Y%m%d%H%M%S')

# Create a file with the name bigquery-import-<current_utc_datetime>.csv
filename = f'bigquery-import-{current_utc_time}.csv'

# Write the data to the CSV file
with open(filename, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['ID', 'EventType', 'JSON', 'lastmodifiedtimestamp'])

    # Write each row
    for i, json_obj in enumerate(data, 1):
        json_str = json.dumps(json_obj)
        writer.writerow([i, 'Logistic.DevicePurchased', json_str, datetime.utcnow().isoformat()])
