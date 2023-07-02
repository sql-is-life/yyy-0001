-- v2_int_music_song_listened.sql
with
    eventlogs_music_song_listened_json_extracted as (
        select
            entityid as _id,
            lastmodifiedtimestamp as updated_at,
            CAST(json_value(json, '$.SongId') as INT) as SongId,
            CAST(json_value(json, '$.DeviceId') as INT) as DeviceId,
            CAST(json_value(json, '$.SongCompletedTime') as INT) as SongCompletedTime,
            SAFE_CAST(TIMESTAMP(json_value(json, '$.OccurredAt')) as DATETIME) as OccurredAt
        from {{ ref('v2_stg_music_song_listened') }}
    ),

    eventlogs_music_song_listened_rolled_up as (
        select
            *, row_number() over (partition by _id order by updated_at desc) as sequence
        from eventlogs_music_song_listened_json_extracted
    )

select distinct * except (sequence)
from eventlogs_music_song_listened_rolled_up as s
where sequence = 1


/*
This DBT model represents an intermediate view of our dataset.

Objective:
It aims to remove any duplicate records in our data, maintaining the uniqueness of each row. The uniqueness is determined based on the combination of all fields. If two rows have exactly the same values in all fields, one of them is considered as a duplicate and removed from this view.

Partitioning:
The data in this model is partitioned on BigQuery using the _PARTITIONTIME pseudo column. The granularity of the partition is one day, meaning that the data is divided into separate partitions for each day. This partitioning strategy optimizes queries that filter by date, as BigQuery only needs to scan the relevant partition(s) instead of the entire table.
*/
