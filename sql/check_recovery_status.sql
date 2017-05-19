select node_name, historical_completed, historical_total, is_running from recovery_status where historical_completed > 1;

select * from projection_recoveries;

