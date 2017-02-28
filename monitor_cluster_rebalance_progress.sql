SELECT rebalance_method Rebalance_method, Status, COUNT(*) AS Count
 FROM ( SELECT rebalance_method,
        CASE
        WHEN (
        separated_percent = 100
    AND transferred_percent = 100
        ) THEN 'Completed'
        WHEN (
               separated_percent <> 0
               and separated_percent <> 100
              )
           OR (
              transferred_percent <> 0
              AND transferred_percent <> 100
              ) THEN 'In Progress'
              ELSE 'Queued'
              END AS  Status
        FROM rebalance_projection_status
        WHERE is_latest
      ) AS tab
 GROUP BY 1, 2
 ORDER BY 1, 2;
