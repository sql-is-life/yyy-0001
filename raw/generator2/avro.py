import csv
import uuid
import pytz
from datetime import datetime
import avro.schema
from avro.datafile import DataFileWriter
from avro.io import DatumWriter

# Prepare Avro schema
schema = avro.schema.parse("""
{
   "namespace": "my.namespace",
   "type": "record",
   "name": "Event",
   "fields" : [
      {"name": "ID", "type": "string"},
      {"name": "EventTypeID", "type": ["null", "int"], "default" : null},
      {"name": "EventType", "type": ["null", "string"], "default" : null},
      {"name": "EntityID", "type": ["null", "int"], "default" : null},
      {"name": "JSON", "type": ["null", "string"], "default" : null},
      {"name": "lastmodifiedtimestamp", "type": "string"}
   ]
}
""")

# Open raw.csv
with open('raw.csv', mode='r') as file:
    csvFile = csv.reader(file)
    headers = next(csvFile)
    # Create Avro file
    with DataFileWriter(open("output.avro", "wb"), DatumWriter(), schema) as writer:
        for row in csvFile:
            # Generate UUID and update ID
            row[0] = str(uuid.uuid4())

            # Get current UTC time in SQL data format and update lastmodifiedtimestamp
            now = datetime.now(pytz.utc)
            sql_format_date = now.strftime('%Y-%m-%d %H:%M:%S')
            row[5] = sql_format_date

            # Create Avro record
            record = dict(zip(headers, row))

            # Write record to Avro file
            writer.append(record)
