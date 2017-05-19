------------------------------------------------------------
-- Grant schemas to role/users
------------------------------------------------------------
SELECT '-- Grant schemas to role/users';
SELECT 'GRANT ' || privileges_description || ' ON SCHEMA ' || object_name  || ' TO ' || grantee ||  ';'
FROM grants
WHERE object_name NOT IN ('v_internal','v_catalog','v_monitor','TxtIndex','v_txtindex') AND object_name NOT LIKE 'v_%' AND object_name NOT LIKE '%_scheduler' AND object_type = 'SCHEMA'
AND privileges_description !~ '\*'
-- AND grantee != 'vertica'
ORDER BY object_name;
