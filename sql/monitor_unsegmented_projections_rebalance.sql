SELECT session_id, projection_name, refresh_status, refresh_method, refresh_phase
 FROM projection_refreshes
 WHERE refresh_method = 'rebalance'
 AND is_executing; 
