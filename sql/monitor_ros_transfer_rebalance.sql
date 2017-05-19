SELECT projection_name, 
          from_node_name, 
          to_node_name, 
          SUM (row_count) rows_transfered, sum(size_in_bytes) bytes_transferred
 FROM vs_rebalance_transferred_storage_containers
 GROUP BY 1, 2, 3
 ORDER BY 1, 2, 3;
