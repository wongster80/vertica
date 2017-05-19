------------------------------------------------------------
-- Roles
------------------------------------------------------------
SELECT '-- Create Roles';
SELECT 'CREATE ROLE ' || name || ' ;' AS TXT_CR
FROM v_catalog.roles
WHERE name NOT IN ('public','dbadmin','pseudosuperuser','dbduser')
ORDER BY 1;

