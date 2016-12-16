SELECT /*+(compressed_table_size)*/
       anchor_table_schema,
       anchor_table_name,
       SUM(used_bytes) / ( 1024^3 ) AS used_compressed_gb
FROM   v_monitor.projection_storage
WHERE anchor_table_schema = 'stg' AND
anchor_table_name = 'tmp_gzip_30d_fact_r'
GROUP  BY anchor_table_schema,
          anchor_table_name
ORDER  BY SUM(used_bytes) DESC;
