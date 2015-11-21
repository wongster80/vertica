------------------------------------------------------------
-- Users
------------------------------------------------------------
SELECT '-- Create Users';
SELECT 'CREATE USER ' || user_name  || ' RESOURCE POOL ' || resource_pool ||  ' ;'
FROM v_catalog.users
WHERE user_name NOT IN ('dbadmin')
ORDER BY 1;
