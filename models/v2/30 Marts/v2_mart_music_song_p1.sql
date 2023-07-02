-- CQRS Style Project 1 with LEFT OUTER JOIN
SELECT      msp.SongId,
            msp.ArtistName,
            msp.AlbumName,
            msp.SongName,
            msp.SongLength,
            msp.SongSizeMb,
            msp.OccurredAt as Published_Date,
            msr.OccurredAt as Removed_Date
FROM {{ ref('v2_int_music_song_published') }} AS msp
      LEFT OUTER JOIN  {{ ref('v2_int_music_song_removed') }} AS msr ON msp._id = msr._id