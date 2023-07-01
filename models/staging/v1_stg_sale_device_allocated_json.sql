-- your_model_name.sql
with
    eventlogs_sale_device_allocated_json as (
        select
            entityid as _id,
            lastmodifiedtimestamp as updated_at,
            json_extract_scalar(json, '$.DeviceId') as deviceid,
            json_value(json, '$.DeviceId') as deviceid2
        from `{{ source('z-terraform-1001-dev', 'v1_eventsourcing') }}`
        where eventtypeid = 2
    ),

    eventsequences_sale_device_allocated_json as (
        select
            *, row_number() over (partition by _id order by updated_at desc) as sequence
        from eventlogs_sale_device_allocated_json
    )

select distinct * except (sequence)
from eventsequences_sale_device_allocated_json as s
where sequence = 1
