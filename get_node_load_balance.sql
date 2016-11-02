--  return the number of requests, as well as the percent of total requests per node

SELECT a.node_name, 
       a.requests, 
       ROUND((a.requests / b.total_requests) * 100, 2.0) AS percent
FROM   (SELECT node_name, 
               COUNT(*) AS requests 
        FROM   v_monitor.query_requests 
        GROUP  BY node_name) a 
       CROSS JOIN (SELECT COUNT(*) AS total_requests 
                   FROM   v_monitor.query_requests) b 
ORDER  BY percent DESC;
