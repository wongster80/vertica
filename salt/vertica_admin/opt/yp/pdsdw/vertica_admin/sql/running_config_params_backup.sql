------------------------------------------------------------
-- Set backed up running configuration parameters
------------------------------------------------------------
SELECT '-- Set backed up running configuration parameters';
-- SELECT 'SELECT set_configuration_parameter(''' || parameter_name || ''',''' || current_value  || ''');'
SELECT 'ALTER DATABASE bi SET ' || parameter_name || ' = ''' || current_value  || ''';'
FROM configuration_parameters where current_value != default_value
ORDER BY parameter_name;


