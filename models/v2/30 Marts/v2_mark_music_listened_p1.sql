SELECT SongId as SongId,
        count(SongId) as Count_Song_Played
FROM {{ ref('v2_int_music_song_listened') }} as msl
GROUP BY msl.SongId