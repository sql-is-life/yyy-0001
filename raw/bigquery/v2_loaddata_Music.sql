-- Music.SongPublished.json - 6 - 1

INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v2_raw_music_song_published` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 6, 'Music.SongPublished.json', 1, JSON '{"SongId":1,"SongDetails":{"ArtistName":"Amy Winehouse","SongName":"Back in Black","AlbumName":"Back in Black","SongLength":"4:15","SongSizeMb":8.5},"OccurredAt":"2018-01-01T12:00:00.000Z"}',CURRENT_TIMESTAMP());  

-- Music.SongRemoved.json - 1
  INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v2_raw_music_song_removed` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 5, 'Music.SongRemoved.json', 1, JSON '{"SongId":1,"OccurredAt":"2022-01-01T12:00:00.000Z"}',CURRENT_TIMESTAMP());

-- Music.SongListened.json
INSERT INTO
  `z-terraform-1001-dev.yyy_0001_0_dev.v2_raw_music_song_listened` (ID,
    EventTypeID,
    EventType,
    EntityID,
    JSON,
    lastmodifiedtimestamp)
VALUES
  (GENERATE_UUID(), 7, 'Music.SongListened.json', 1, JSON '{"SongId": 1,"DeviceId": 55,"SongCompletedTime": 100,"OccurredAt": "2021-09-01T12:00:00Z"}',CURRENT_TIMESTAMP());
