SELECT node_name, session_id, session_start_timestamp, description
 FROM system_sessions
 WHERE session_type = 'REBALANCE_CLUSTER'
 AND is_active;
