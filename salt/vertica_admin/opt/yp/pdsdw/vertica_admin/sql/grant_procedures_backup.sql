------------------------------------------------------------
-- Grant procedure / UDx / UDF  to role/users
------------------------------------------------------------
SELECT '-- Grant procedure / UDx / UDF to role/users';
SELECT 'GRANT ' || privileges_description || ' ON ALL FUNCTIONS IN SCHEMA ' || object_schema  || ' TO ' || grantee ||  ';'
FROM grants
WHERE grantee NOT IN ('vertica') AND object_type = 'PROCEDURE' AND privileges_description !~ '\*'
-- AND grantee != 'vertica'
ORDER BY grantee;
