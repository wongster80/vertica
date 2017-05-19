SELECT '-- Setting configuration parameters';
SELECT 'SELECT set_config_parameter(''ClientAuthentication'', ''' || current_value || ''');' FROM configuration_parameters WHERE parameter_name = 'ClientAuthentication' ORDER BY 1;
SELECT DISTINCT 'SELECT set_config_parameter(''MaxPartitionCount'', ''' || current_value || ''');' FROM configuration_parameters WHERE parameter_name = 'MaxPartitionCount' ORDER BY 1;
SELECT DISTINCT 'SELECT set_config_parameter(''ContainersPerProjectionLimit'', ''' || current_value || ''');' FROM configuration_parameters WHERE parameter_name = 'ContainersPerProjectionLimit' ORDER BY 1;

