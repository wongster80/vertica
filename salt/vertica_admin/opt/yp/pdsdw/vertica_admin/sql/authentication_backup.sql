------------------------------------------------------------
-- Create authentications
------------------------------------------------------------
SELECT '-- Create authentications';
SELECT    'CREATE AUTHENTICATION ' || auth_name || ' METHOD ' || '''' || auth_method || ''' ' || auth_host_type || ' '  
          || CASE WHEN auth_host_address = '' THEN ' ' ELSE  '''' || auth_host_address || '''' END
          || ' ;' 
FROM client_auth -- WHERE is_auth_enabled = 'True'
ORDER BY auth_name;

------------------------------------------------------------
-- Set LDAP authentication strings
------------------------------------------------------------
SELECT '-- Set LDAP authentication string';
SELECT 'ALTER AUTHENTICATION ' || auth_name || ' SET ' || auth_parameter_name || '=''' || auth_parameter_value || ''''
       || ' ;'
FROM client_auth_params WHERE auth_name ILIKE '%ldap%'
ORDER BY auth_name;

