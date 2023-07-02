-- v2_int_music_song_published.sql
with
    eventlogs_music_song_published_json_extracted as (
        select
            entityid as _id,
            lastmodifiedtimestamp as updated_at,
            CAST(json_value(json, '$.SongId') as INT64) as SongId,
            CAST(json_value(json, '$.SongDetails.ArtistName') as STRING) as ArtistName,
            CAST(json_value(json, '$.SongDetails.SongName') as STRING) as SongName,
            CAST(json_value(json, '$.SongDetails.AlbumName') as STRING) as AlbumName,
            CAST(json_value(json, '$.SongDetails.SongLength') as STRING) as SongLength,
            CAST(json_value(json, '$.SongDetails.SongSizeMb') as NUMERIC) as SongSizeMb,
            SAFE_CAST(TIMESTAMP(json_value(json, '$.OccurredAt')) as DATETIME) as OccurredAt
        from {{ ref('v2_stg_music_song_published') }}
    ),

    eventlogs_music_song_published_rolled_up as (
        select
            *, row_number() over (partition by _id order by updated_at desc) as sequence
        from eventlogs_music_song_published_json_extracted
    )

select distinct * except (sequence)
from eventlogs_music_song_published_rolled_up as s
where sequence = 1


/*
This DBT model represents an intermediate view of our dataset.

Objective:
Rollup data using row_number

Partitioning:
The data in this model is partitioned on BigQuery using the _PARTITIONTIME pseudo column. The granularity of the partition is one day, meaning that the data is divided into separate partitions for each day. This partitioning strategy optimizes queries that filter by date, as BigQuery only needs to scan the relevant partition(s) instead of the entire table.
*/
