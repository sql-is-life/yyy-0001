SELECT *
FROM `z-terraform-1001-dev.yyy_0001_0_dev.v2_raw_music_song_published`

-- Example of using PARTITIONTIME
-- WHERE TIMESTAMP_TRUNC(_PARTITIONTIME, DAY) = TIMESTAMP("2023-07-02")
