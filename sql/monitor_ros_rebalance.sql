SELECT CASE
     WHEN (is_destroyed ) THEN 'deleted'
     ELSE 'created'
     END AS container, projection_name, SUM(row_count) AS rows_processed, COUNT(*) n_containers
  FROM vs_rebalance_separated_storage_containers
  GROUP BY  1, 2
  ORDER BY 1, 2;
