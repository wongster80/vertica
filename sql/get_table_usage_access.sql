SELECT anchor_table_schema, anchor_table_name, MAX(query_start_timestamp)::timestamp(0) last_request_timestamp FROM projection_usage WHERE io_type = 'input' GROUP BY 1, 2 ORDER BY 1, 2, 3 DESC LIMIT 10;

