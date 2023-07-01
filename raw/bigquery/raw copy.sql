CREATE TABLE yyy_0001_0_dev.v1_eventsourcing(
    `ID` STRING NOT NULL,
    `EventTypeID` INT64,
    `EventType` STRING,
    `EntityID` INT64,
    `JSON` JSON,
    `lastmodifiedtimestamp` TIMESTAMP
)
PARTITION BY RANGE_BUCKET(EventTypeID, GENERATE_ARRAY(1, 10000, 1))
CLUSTER BY lastmodifiedtimestamp;

-- Music.SongListened.json
INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v1_eventsourcing` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 7, 'Music.SongListened.json', 1, JSON '{"SongId": 1,"DeviceId": 55,"SongCompletedTime": 100,"OccurredAt": "2021-09-01T12:00:00Z"}',CURRENT_TIMESTAMP());

-- Logistic.DevicePurchased - 5
INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v1_eventsourcing` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 8, 'Logistic.DevicePurchased.json', 5, JSON '{"DeviceId": 5,"DeviceDetails": {"DevicePrice": "$500","DeviceTypeName": "MusicMaker3000","DeviceTypeId": 1,"SerialNumber": "123567890"},"OccurredAt": "2018-04-05T12:00:00"}',CURRENT_TIMESTAMP());

-- Logistic.DevicePurchased - 55
INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v1_eventsourcing` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 8, 'Logistic.DevicePurchased.json', 55, JSON '{"DeviceId":"55","DeviceDetails":{"DevicePrice":"$600","DeviceTypeName":"MusicMaker3000","DeviceTypeId":"1","SerialNumber":"123567891"},"OccurredAt":"2018-04-05T12:00:00"}',CURRENT_TIMESTAMP());

  -- Music.SongPublished.json - 6 - 1

INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v1_eventsourcing` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 6, 'Music.SongPublished.json', 1, JSON '{"SongId":1,"SongDetails":{"ArtistName":"Amy Winehouse","SongName":"Back in Black","AlbumName":"Back in Black","SongLength":"4:15","SongSizeMb":8.5},"OccurredAt":"2018-01-01T12:00:00.000Z"}',CURRENT_TIMESTAMP());  

-- Music.SongRemoved.json - 1
  INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v1_eventsourcing` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 5, 'Music.SongRemoved.json', 1, JSON '{"SongId":1,"OccurredAt":"2022-01-01T12:00:00.000Z"}',CURRENT_TIMESTAMP());

-- Payment.PaymentReceived.json - 2
  INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v1_eventsourcing` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 4, 'Payment.PaymentReceived.json', 2, JSON '{"Payment":{"PaymentId":2,"CustomerId":9,"PaymentAmount":10,"OccurredAt":"2018-09-01T12:00:00Z"}}',CURRENT_TIMESTAMP());

-- Sale.CustomerRegistered.json - 3 - 9
INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v1_eventsourcing` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 3, 'Sale.CustomerRegistered.json', 9, JSON '{"CustomerId":9,"LegalAddress":"1, Waiyaki Way, Nairobi, Kenya","CustomerName":"Benedict Otieno","CustomerPhoneNumber":"07956678902","CustomerEmail":"me@gmail.com","CustomerIdentityNumber":"123456789","CustomerDateOfBirth":"12/12/1990","OccurredAt":"12/12/2020 20:20:01.000"}',CURRENT_TIMESTAMP());

  -- Sale.DeviceAllocated.json - 2 - 5

INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v1_eventsourcing` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 2, 'Sale.DeviceAllocated.json', 5, JSON '{"DeviceId":5,"LocationAllocatedId":8,"SellingAgent":{"AgentId":"db6f72b2-9ffc-47ef-9939-3a7c99ad0546","AgentName":"Travelling Salesman"},"DeviceDetails":{"DevicePrice":"700","DeviceName":"MusicMaker3000","Id":"a4e632d6-a6ae-11ec-86f6-5c80b6f1d1e5"},"OccurredAt":"12/12/2020 20:20:01.000"}',CURRENT_TIMESTAMP());


-- Sale.LocationRegistered.json - 3 - 8

INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v1_eventsourcing` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 3, 'Sale.LocationRegistered.json', 8, JSON '{"DeviceId":5,"LocationAllocatedId":8,"SellingAgent":{"AgentId":"db6f72b2-9ffc-47ef-9939-3a7c99ad0546","AgentName":"Travelling Salesman"},"DeviceDetails":{"DevicePrice":"700","DeviceName":"MusicMaker3000","Id":"a4e632d6-a6ae-11ec-86f6-5c80b6f1d1e5"},"OccurredAt":"12/12/2020 20:20:01.000"}',CURRENT_TIMESTAMP());

