------------------------------------------------------------
-- Grant users to Roles
------------------------------------------------------------
SELECT '-- Grant users to roles';
SELECT 'GRANT ' || object_name  || ' TO ' || grantee ||  ';'
FROM grants
WHERE object_type = 'ROLE'
AND privileges_description !~ '\*'
-- AND grantee != 'vertica'
ORDER BY object_name;

------------------------------------------------------------
-- Set users default roles
------------------------------------------------------------
SELECT '-- Set users default roles';
SELECT 'ALTER USER ' || user_name || ' DEFAULT ROLE ' || default_roles || ';'
FROM v_catalog.users
WHERE user_name NOT IN ('dbadmin') AND all_roles != ''
ORDER BY 1;
