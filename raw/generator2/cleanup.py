import pandas as pd
import uuid
import datetime

# Read the raw.csv file
data = pd.read_csv('raw.csv')

# Loop over each row in the DataFrame
for i, row in data.iterrows():
    # Generate a GUID for the ID
    data.at[i, 'ID'] = str(uuid.uuid4())
    # Generate a UTC timestamp in SQL format
    data.at[i, 'lastmodifiedtimestamp'] = datetime.datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S')

# Generate a timestamp for the filename
timestamp = datetime.datetime.now().strftime('%Y%m%d_%H%M%S')
filename = f'updated_raw_{timestamp}.csv'

# Write the updated DataFrame to a new CSV file
data.to_csv(filename, index=False)
