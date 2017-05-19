------------------------------------------------------------
-- Users
------------------------------------------------------------
SELECT '-- Create Users';
SELECT 'CREATE USER ' || v_catalog.users.user_name  || ' RESOURCE POOL ' || v_catalog.users.resource_pool ||  ' ;'
FROM v_catalog.users 
LEFT JOIN user_client_auth ON v_catalog.users.user_name = user_client_auth.user_name
WHERE user_client_auth.auth_name ~ 'ldap' AND v_catalog.users.resource_pool IN ('adhoc_query')
GROUP BY v_catalog.users.user_name, v_catalog.users.resource_pool
ORDER BY v_catalog.users.user_name;
