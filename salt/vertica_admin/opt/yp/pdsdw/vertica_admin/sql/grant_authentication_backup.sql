------------------------------------------------------------
-- Grant authentication to role/users
------------------------------------------------------------
SELECT '-- Grant authentication to role/users';
SELECT 'GRANT AUTHENTICATION ' || object_name  || ' TO ' || grantee ||  ';'
FROM grants
WHERE object_type = 'CLIENTAUTHENTICATION'
-- AND grantee != 'vertica'
ORDER BY object_name;
