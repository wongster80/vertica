SELECT TM.projection_name, TM.node_name, TM.operation_start_timestamp
 FROM tuple_mover_operations TM
 JOIN system_sessions
 USING (session_id)
 WHERE system_sessions.is_active
 AND session_type = 'REBALANCE_CLUSTER'
 AND operation_status = 'Running';
