try:
    import avro.schema
    print("The Avro module is installed correctly.")
except ModuleNotFoundError:
    print("The Avro module is not installed.")
