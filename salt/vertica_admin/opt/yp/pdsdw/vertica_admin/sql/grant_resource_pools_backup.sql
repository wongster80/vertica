------------------------------------------------------------
-- Grant resource pools to role/users
------------------------------------------------------------
SELECT '-- Grant resource pools to role/users';
SELECT 'GRANT ' || privileges_description || ' ON RESOURCE POOL ' || object_name  || ' TO ' || grantee ||  ';'
FROM grants
WHERE object_name NOT IN ('v_internal','v_catalog','v_monitor','TxtIndex','v_txtindex') AND object_type = 'RESOURCEPOOL' AND privileges_description !~ '\*'
-- AND grantee != 'vertica'
ORDER BY object_name;

------------------------------------------------------------
-- Set users resource pool
------------------------------------------------------------
SELECT '-- Set users resource pool';
SELECT 'ALTER USER ' || user_name || ' RESOURCE POOL ' || resource_pool || ';'
FROM v_catalog.users
WHERE user_name NOT IN ('dbadmin') AND all_roles != ''
ORDER BY 1;
