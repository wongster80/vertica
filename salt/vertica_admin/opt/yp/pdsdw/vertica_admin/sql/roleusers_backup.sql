------------------------------------------------------------
-- Role Users
------------------------------------------------------------
SELECT '-- Create Role Users';
SELECT 'CREATE USER ' || v_catalog.users.user_name  || ' RESOURCE POOL ' || v_catalog.users.resource_pool ||  ' ;'
FROM v_catalog.users 
WHERE v_catalog.users.resource_pool NOT IN ('adhoc_query')
-- GROUP BY v_catalog.users.user_name, v_catalog.users.resource_pool
ORDER BY v_catalog.users.user_name;
