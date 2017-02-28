SELECT projection_name, rebalance_method, separated_percent, transferred_percent
 FROM rebalance_projection_status
 WHERE rebalance_method = 'ELASTIC_CLUSTER'
 AND (
 separated_percent <> 0
 AND separated_percent <> 100
 )
 OR (
 transferred_percent <> 0
 AND transferred_percent <> 100
 )
 AND is_latest;
