CREATE TABLE
  yyy_0001_0_dev.v2_raw_music_song_published( `ID` STRING NOT NULL,
    `EventTypeID` INT64,
    `EventType` STRING,
    `EntityID` INT64,
    `JSON` JSON,
    `lastmodifiedtimestamp` TIMESTAMP )
PARTITION BY
  DATE_TRUNC(_PARTITIONTIME, DAY)
CLUSTER BY lastmodifiedtimestamp, EntityID
OPTIONS(
    require_partition_filter = FALSE );

-- depending on data access patten might need cluster by EntityID, lastmodifiedtimestamp
-- partition_expiration_days = 7

CREATE TABLE
  yyy_0001_0_dev.v2_raw_music_song_removed( `ID` STRING NOT NULL,
    `EventTypeID` INT64,
    `EventType` STRING,
    `EntityID` INT64,
    `JSON` JSON,
    `lastmodifiedtimestamp` TIMESTAMP )
PARTITION BY
  DATE_TRUNC(_PARTITIONTIME, DAY)
CLUSTER BY lastmodifiedtimestamp, EntityID
OPTIONS(
    require_partition_filter = FALSE );

-- depending on data access patten might need cluster by EntityID, lastmodifiedtimestamp
-- partition_expiration_days = 7

CREATE TABLE
  yyy_0001_0_dev.v2_raw_music_song_listened( `ID` STRING NOT NULL,
    `EventTypeID` INT64,
    `EventType` STRING,
    `EntityID` INT64,
    `JSON` JSON,
    `lastmodifiedtimestamp` TIMESTAMP )
PARTITION BY
  DATE_TRUNC(_PARTITIONTIME, DAY)
CLUSTER BY lastmodifiedtimestamp, EntityID
OPTIONS(
    require_partition_filter = FALSE )

-- depending on data access patten might need cluster by EntityID, lastmodifiedtimestamp
-- partition_expiration_days = 7
