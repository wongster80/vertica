SELECT anchor_table_schema, anchor_table_name, io_type, MAX(query_start_timestamp) last_request_timestamp FROM projection_usage GROUP BY 1, 2, 3 ORDER BY 4 DESC;
