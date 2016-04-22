SELECT /*+(estimated_raw_size)*/
       pj.anchor_table_schema,
       pj.used_compressed_gb,
       pj.used_compressed_gb * la.ratio AS raw_estimate_gb
FROM   (SELECT ps.anchor_table_schema,
               SUM(used_bytes) / ( 1024^3 ) AS used_compressed_gb
        FROM   v_catalog.projections p
               JOIN v_monitor.projection_storage ps
                 ON ps.projection_id = p.projection_id
        WHERE  p.is_super_projection = 't'
        GROUP  BY ps.anchor_table_schema) pj
       CROSS JOIN (SELECT (SELECT database_size_bytes
                           FROM   v_catalog.license_audits
                           ORDER  BY audit_start_timestamp DESC
                           LIMIT  1) / (SELECT SUM(used_bytes)
                                        FROM   V_MONITOR.projection_storage) AS ratio) la
ORDER  BY pj.used_compressed_gb DESC;
