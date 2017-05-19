------------------------------------------------------------
-- Set configuration parameters
------------------------------------------------------------
SELECT '-- Set configuration parameters';
-- SELECT 'SELECT set_configuration_parameter(''' || parameter_name || ''',''' || current_value  || ''');'
SELECT 'ALTER DATABASE bi SET ' || parameter_name || ' = ''' || current_value  || ''';'
FROM configuration_parameters
ORDER BY parameter_name;


